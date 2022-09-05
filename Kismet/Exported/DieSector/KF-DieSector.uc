Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-6427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=-3794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3832
   ObjPosY=-6464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=8
   IncrementAmount=0
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=-7594,OverrideDelta=95)
   OutputLinks(0)=(DrawY=-7674,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_53')),LinkDesc="Link 2",DrawY=-7651,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_55')),LinkDesc="Link 3",DrawY=-7628,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_63')),LinkDesc="Link 4",DrawY=-7605,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_64')),LinkDesc="Link 5",DrawY=-7582,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_65')),LinkDesc="Link 6",DrawY=-7559,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_129')),LinkDesc="Link 7",DrawY=-7536,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_141')),LinkDesc="Link 8",DrawY=-7513,OverrideDelta=176)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_16'),DrawX=-8822,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-7712
   DrawWidth=68
   DrawHeight=229
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_20
   InputLinks(0)=(DrawY=-9843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9801,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_325'),DrawX=-9394,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9343,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9294,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-9880
   ObjComment="Turns off all spawners except one at start"
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_20"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_0
   InputLinks(0)=(LinkDesc="In",DrawY=-9542,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_14')),DrawY=-9542,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),PropertyName="Targets",DrawX=-1343,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1384
   ObjPosY=-9576
   DrawWidth=83
   DrawHeight=77
   Name="KFSeqAct_SetTrader_0"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_1
   InputLinks(0)=(LinkDesc="In",DrawY=-9310,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=-9310,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),PropertyName="Targets",DrawX=-1335,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1376
   ObjPosY=-9344
   DrawWidth=83
   DrawHeight=77
   Name="KFSeqAct_SetTrader_1"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFTraderTrigger'KF-DieSector.TheWorld:PersistentLevel.KFTraderTrigger_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1360
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_7
   ValueB=1
   InputLinks(0)=(DrawY=-7518,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-7562,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-7540,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-7518,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-7496,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Switch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-7474,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_8'),DrawX=-9175,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_0'),DrawX=-9150,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-7600
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_7"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_4
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_7'),(LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_0')),DrawY=-7412,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_7'),(LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_0')),DrawY=-7392,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_8'),DrawX=-9749,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9688,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9607,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-7480
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_4"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_5
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),DrawY=-9659,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9638,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9617,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2696
   ObjPosY=-9728
   ObjComment="Wave 2 Arena Selection"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_5"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_8
   VarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-7208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_8"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=1997
   SizeY=2320
   bDrawBox=True
   FillColor=(B=0,G=255,R=217,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-9776
   ObjComment="Trader Selection"
   DrawWidth=1997
   DrawHeight=2320
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=5300
   SizeY=9939
   bDrawBox=True
   FillColor=(B=104,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9880
   ObjPosY=-8424
   ObjComment="Controls zed spawns"
   DrawWidth=5300
   DrawHeight=9939
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=4748
   SizeY=4992
   bDrawBox=True
   FillColor=(B=18,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2992
   ObjPosY=-6864
   ObjComment="Traps"
   DrawWidth=4748
   DrawHeight=4992
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_59',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_3'),(LinkedOp=KFSeqAct_ToggleEx'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_20')),DrawY=-9403,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9382,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9361,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9816
   ObjPosY=-9472
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
   InputLinks(0)=(DrawY=-9427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_253',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_283',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_298',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_299',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_300'),DrawX=-9106,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9055,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9006,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-9464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_44"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=30.000000
   InputLinks(0)=(DrawY=-4835,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4814,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4793,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_22')),DrawY=-4830,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4798,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-4872
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1064
   ObjPosY=-4776
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_28
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=-4776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_28"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=-4830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_28'),DrawX=-1086,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35'),DrawX=-1030,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1120
   ObjPosY=-4864
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=13.200000
   InputLinks(0)=(DrawY=-4987,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4966,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4945,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_49')),DrawY=-4982,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4950,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-5024
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=-4814,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_37')),DrawY=-4814,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=-1982,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_6'),DrawX=-1926,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2016
   ObjPosY=-4848
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2048
   ObjPosY=-4760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1944
   ObjPosY=-4744
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_6"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   VarName="fire_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2352
   ObjPosY=-5000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2368
   ObjPosY=-4752
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_10"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-4834,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-4844,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-4824,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_10'),DrawX=-2339,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2289,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2368
   ObjPosY=-4880
   ObjComment="Fire already in use?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Player_On_Fire_3"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_11'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_21'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_78'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_25'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_26')),DrawY=-4206,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2525,OverrideDelta=83)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2640
   ObjPosY=-4272
   ObjComment="Player_On_Fire_3"
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Player_Off_Fire_3"
   MaxWidth=233
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=1),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_23')),DrawY=-4406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2492,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2608
   ObjPosY=-4472
   ObjComment="Player_Off_Fire_3"
   DrawWidth=136
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_37
   EventName="Player_On_Fire_3"
   InputLinks(0)=(DrawY=-4814,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_77',InputLinkIdx=1)),DrawY=-4814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1670,OverrideDelta=114)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1816
   ObjPosY=-4848
   ObjComment="Player_On_Fire_3"
   DrawWidth=292
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_37"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_325
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-9728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_325"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=-6771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6729,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6750,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_191',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_413'),DrawX=-3978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=-6808
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_7
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48',InputLinkIdx=1)),DrawY=-6795,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6774,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6753,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4360
   ObjPosY=-6864
   ObjComment="Turn off all portal spawns at start"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_7"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_8
   InputLinks(0)=(DrawY=-6402,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-6412,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-6392,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_27'),DrawX=-4051,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4001,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-6448
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_8"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_27
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-6320
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_27"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   VarName="Portal_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4440
   ObjPosY=-6392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_7
   InputLinks(0)=(DrawY=-6078,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-6078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_13'),DrawX=-8838,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3',SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_18'),DrawX=-8782,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-6112
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_7"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-6016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_13"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-6000
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=492
   SizeY=258
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-6136
   ObjComment="PORTAL ACTIVATED"
   DrawWidth=492
   DrawHeight=258
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-6067,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6046,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6025,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_174',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_190'),DrawX=-8610,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8559,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8510,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-6104
   ObjComment="PORTAL SPAWN Bottom Left"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_17
   bReversePlayback=True
   InputLinks(0)=(DrawY=-6658,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6636,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6614,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6592,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6570,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6642,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6586,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_19'),DrawX=-6551,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_332'),LinkDesc="Door1",MinVars=0,DrawX=-6500,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-6696
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_17"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_19
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_5
         AkEvents(0)=(Time=0.038576,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_5"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=288.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_0.InterpTrackAkEvent_5'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-6496
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_19"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-5952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-6648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3856
   ObjPosY=-6320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_8')),DrawY=-6411,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6390,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6369,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4262,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4344
   ObjPosY=-6480
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_1A"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=-6088
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=-6170,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49')),DrawY=-6180,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-6160,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13'),DrawX=-4035,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3985,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=-6216
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
   InputLinks(0)=(DrawY=-6195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6153,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6174,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175'),DrawX=-3818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3856
   ObjPosY=-6232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_49"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=-6155,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6134,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6113,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4246,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4328
   ObjPosY=-6224
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3856
   ObjPosY=-6088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_191
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4216
   ObjPosY=-6640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_191"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_5')),DrawY=-5451,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5430,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5409,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4302,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4384
   ObjPosY=-5520
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
   InputLinks(0)=(DrawY=-5442,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-5452,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5432,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_17'),DrawX=-4123,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4073,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4152
   ObjPosY=-5488
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_5"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_17
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4152
   ObjPosY=-5360
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_17"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-5451,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5430,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5409,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5430,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213'),DrawX=-3890,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3839,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3790,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=-5488
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4112
   ObjPosY=-6648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=509,OverrideDelta=14)
   InputLinks(1)=(DrawY=530,OverrideDelta=35)
   InputLinks(2)=(DrawY=551,OverrideDelta=56)
   OutputLinks(0)=(DrawY=530,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),DrawX=-8426,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8375,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8326,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8464
   ObjPosY=472
   ObjComment="PORTAL SPAWN"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_49
   EventName="Player_Off_Fire_3"
   InputLinks(0)=(DrawY=-4974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1013,OverrideDelta=115)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-5008
   ObjComment="Player_Off_Fire_3"
   DrawWidth=294
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_49"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-3195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3153,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3174,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_391'),DrawX=-8322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-3232
   ObjComment="PORTAL SPAWN"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8368
   ObjPosY=-3096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=-5787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4254,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-5856
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4024
   ObjPosY=-6648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-5771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5729,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5750,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232'),DrawX=-3866,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3815,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3766,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   ObjPosY=-5808
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4128
   ObjPosY=-5680
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_8"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=-5762,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-5772,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5752,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_8'),DrawX=-4099,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4049,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4128
   ObjPosY=-5808
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-5640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_19
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-3112
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_19"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8760
   ObjPosY=-3144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=-3190,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-3190,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=-8694,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_19',SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_14',SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_2'),DrawX=-8638,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-3224
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_28
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=600
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_28"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_20
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_20"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_9
   InputLinks(0)=(DrawY=506,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=506,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_20'),DrawX=-8798,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_28',SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_42',SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_50',SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_12'),DrawX=-8742,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=472
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_9"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
   VarName="Portal_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-5800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_10"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_12
   VarName="Portal_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-5464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_12"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_332
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-6496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_332"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   VarName="Portal_1A"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-6136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_18
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_1A"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8840
   ObjPosY=-5992
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_18"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   Duration=30.000000
   InputLinks(0)=(DrawY=-3395,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3374,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3353,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_10'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_13')),DrawY=-3390,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3358,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1140,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=-3432
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_22
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=-3312
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_22"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_17"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_10
   InputLinks(0)=(DrawY=-3382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3382,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_17'),DrawX=-934,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_22'),DrawX=-878,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-968
   ObjPosY=-3416
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_10"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_35
   EventName="Player_Off_Fire_2"
   InputLinks(0)=(DrawY=-3526,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-829,OverrideDelta=115)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-976
   ObjPosY=-3560
   ObjComment="Player_Off_Fire_2"
   DrawWidth=294
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_35"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_8
   Duration=13.200000
   InputLinks(0)=(DrawY=-3531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3489,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_35')),DrawY=-3526,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3494,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1108,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-3568
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_8"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_3
   InputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-3374,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=-1798,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_51'),DrawX=-1742,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1832
   ObjPosY=-3408
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_3"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1864
   ObjPosY=-3320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_51
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-3296
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_51"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_38
   VarName="fire_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2264
   ObjPosY=-3512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_38"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_52
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2288
   ObjPosY=-3288
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_52"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_19
   InputLinks(0)=(DrawY=-3370,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-3380,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_14')),DrawY=-3360,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_52'),DrawX=-2259,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2209,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2288
   ObjPosY=-3416
   ObjComment="Fire already in use?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_19"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-2899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_308',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_317'),DrawX=-1802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1840
   ObjPosY=-2936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Player_On_Fire_2"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_15'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_17')),DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2509,OverrideDelta=83)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2624
   ObjPosY=-2784
   ObjComment="Player_On_Fire_2"
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_24
   EventName="Player_Off_Fire_2"
   MaxWidth=233
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_12')),DrawY=-2894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2500,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2616
   ObjPosY=-2960
   ObjComment="Player_Off_Fire_2"
   DrawWidth=136
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_24"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Player_On_Fire_2"
   InputLinks(0)=(DrawY=-3382,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_8'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_79',InputLinkIdx=1)),DrawY=-3382,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1478,OverrideDelta=114)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1624
   ObjPosY=-3416
   ObjComment="Player_On_Fire_2"
   DrawWidth=292
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_35
   SizeX=2334
   SizeY=1446
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-5064
   ObjComment="Trap 2"
   Name="SequenceFrameWrapped_35"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_23
   SizeX=2314
   SizeY=1534
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2728
   ObjPosY=-3608
   ObjComment="Trap 3"
   Name="SequenceFrameWrapped_23"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_38
   EventName="Player_On_Fire_1"
   InputLinks(0)=(DrawY=-6566,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46',InputLinkIdx=1)),DrawY=-6566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1574,OverrideDelta=114)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-6600
   ObjComment="Player_On_Fire_1"
   DrawWidth=292
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_38"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="Player_Off_Fire_1"
   MaxWidth=233
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_9')),DrawY=-5982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2396,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-6048
   ObjComment="Player_Off_Fire_1"
   DrawWidth=136
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_18
   EventName="Player_On_Fire_1"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_12'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_26'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_27')),DrawY=-5758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2413,OverrideDelta=83)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-5824
   ObjComment="Player_On_Fire_1"
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_18"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-6091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_315'),DrawX=-1842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1880
   ObjPosY=-6128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_6
   InputLinks(0)=(DrawY=-6594,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-6604,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_20')),DrawY=-6584,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_1'),DrawX=-2331,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2281,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-6640
   ObjComment="Fire already in use?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_6"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-6512
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_26
   VarName="fire_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=-6768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_26"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=-6544
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_4"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2008
   ObjPosY=-6560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=-6614,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_38')),DrawY=-6614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=-1942,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_4'),DrawX=-1886,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-6648
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=13.200000
   InputLinks(0)=(DrawY=-6731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6689,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_27')),DrawY=-6726,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6694,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1204,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1256
   ObjPosY=-6768
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_27
   EventName="Player_Off_Fire_1"
   InputLinks(0)=(DrawY=-6718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-941,OverrideDelta=115)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1088
   ObjPosY=-6752
   ObjComment="Player_Off_Fire_1"
   DrawWidth=294
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_27"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=-1022,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_7'),DrawX=-966,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1056
   ObjPosY=-6584
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1064
   ObjPosY=-6496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-6480
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_7"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=30.000000
   InputLinks(0)=(DrawY=-6555,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6534,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6513,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_21')),DrawY=-6550,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6518,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1204,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1256
   ObjPosY=-6592
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_0
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-2806,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=-2806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_156',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),DrawX=-9062,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-2840
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_0"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_3
   CollisionType=COLLIDE_BlockAllButWeapons
   InputLinks(0)=(DrawY=-9710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9710,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_186',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101'),DrawX=-9126,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-9744
   ObjComment="Collision Blockers"
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_3"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-9648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-9640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_1
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=570,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_9')),DrawY=570,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129'),DrawX=-9134,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=536
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_1"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_186
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_186"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6488
   ObjPosY=-4896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6488
   ObjPosY=-4344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=765
   SizeY=275
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8784
   ObjPosY=-3272
   ObjComment="PORTAL ACTIVATED"
   DrawWidth=765
   DrawHeight=275
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=702
   SizeY=352
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=440
   ObjComment="PORTAL ACTIVATED"
   DrawWidth=702
   DrawHeight=352
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000000,Z=-239.999878),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackAkEvent_0'
      GroupName="Door1"
      GroupColor=(B=0,G=115,R=209,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1472
   ObjPosY=-8264
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-8426,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8404,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8382,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8360,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8338,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8410,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8354,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=-1415,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="Door1",MinVars=0,DrawX=-1364,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1464
   ObjPosY=-8464
   ObjComment="Trader Door 1"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=-8264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_0
   IntValue=2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-7432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_0"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_1
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_16'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_17'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_7')),DrawY=-8364,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_16'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_17'),(LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_7')),DrawY=-8344,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2709,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2648,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-2567,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-8432
   ObjComment="Trader door open/close"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_1"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFTraderTrigger'KF-DieSector.TheWorld:PersistentLevel.KFTraderTrigger_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1368
   ObjPosY=-9248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_9
   Duration=4.000000
   InputLinks(0)=(DrawY=-8203,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8182,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8161,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_26'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_97'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_96'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_95')),DrawY=-8198,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8166,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8988,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-8240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_9"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1384
   ObjPosY=-7952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-8114,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8092,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8070,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8048,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8026,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8098,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8042,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=-1415,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),LinkDesc="Door2",MinVars=0,DrawX=-1364,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1464
   ObjPosY=-8152
   ObjComment="Trader Door 2"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000000,Z=288.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_2.InterpTrackAkEvent_2'
      GroupName="Door2"
      GroupColor=(B=224,G=74,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1472
   ObjPosY=-7952
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_7
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=1)),DrawY=-7724,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=1)),DrawY=-7704,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2405,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2344,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-2263,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2448
   ObjPosY=-7792
   ObjComment="Close all at wave start"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_7"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-7368
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1944
   ObjPosY=-9312
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_5"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_6
   IntValue=7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-9296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_6"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_8
   ValueB=1
   InputLinks(0)=(DrawY=-9406,OverrideDelta=59)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_4')),DrawY=-9450,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9428,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-9406,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-9384,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_6')),DrawY=-9362,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=-2375,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-2350,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2408
   ObjPosY=-9488
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_8"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_4
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-9164,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9144,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),DrawY=-9164,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),LinkDesc="Link 2",DrawY=-9144,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-1884,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1928
   ObjPosY=-9200
   DrawWidth=89
   DrawHeight=101
   Name="SeqAct_RandomSwitch_4"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-9296
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_43"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_14
   InputLinks(0)=(DrawY=-9566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_25'),DrawX=-1142,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_26'),DrawX=-1086,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=-9600
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_14"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_25
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=-9512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_25"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_31
   VarName="Trader 1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-952
   ObjPosY=-9584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_31"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_26
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1088
   ObjPosY=-9496
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_26"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_16
   InputLinks(0)=(DrawY=-8578,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_13')),DrawY=-8588,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8568,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_45'),DrawX=-2283,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_33'),DrawX=-2233,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2312
   ObjPosY=-8624
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_16"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_45
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-8496
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_45"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_33
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2248
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_33"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_46
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2032
   ObjPosY=-8512
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_46"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_34
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-8528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_34"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_13
   InputLinks(0)=(DrawY=-8582,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-8582,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_34'),DrawX=-2086,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_46'),DrawX=-2030,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2120
   ObjPosY=-8616
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_13"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-2744
   ObjComment="Stairs Railing"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-9624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bLooping=True
   InputLinks(0)=(DrawY=-9234,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9212,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9190,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9168,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9146,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9218,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9162,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=48,OverrideDelta=33)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),LinkDesc="Eye_1",MinVars=0,DrawX=100,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-9272
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.018812,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_01')
         AkEvents(1)=(Time=11.087023,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_05')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=1.924516,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_02')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Time=6.124561,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_03')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_3
         AkEvents(0)=(Time=9.314715,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_04')
         Name="InterpTrackAkEvent_3"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000183,Z=-0.000366),ArriveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),LeaveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=0.000000,Y=0.000244,Z=-0.000488),ArriveTangent=(X=0.000000,Y=0.000046,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000046,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000366,Z=-0.000732),ArriveTangent=(X=0.000000,Y=0.000045,Z=-0.000089),LeaveTangent=(X=0.000000,Y=0.000045,Z=-0.000089),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=0.000427,Z=-0.000854),ArriveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=0.000000,Y=0.000549,Z=-0.001099),ArriveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000610,Z=-0.001221),ArriveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),LeaveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),InterpMode=CIM_CurveAutoClamped),(InVal=9.900001,OutVal=(X=0.000000,Y=0.000732,Z=-0.001465),ArriveTangent=(X=0.000000,Y=0.000122,Z=-0.000244),LeaveTangent=(X=0.000000,Y=0.000122,Z=-0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=0.000000,Y=0.000854,Z=-0.001709),ArriveTangent=(X=0.000000,Y=0.000060,Z=-0.000119),LeaveTangent=(X=0.000000,Y=0.000060,Z=-0.000119),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000977,Z=-0.001953),ArriveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.001099,Z=-0.002197),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=42.736816,Y=-15.710449,Z=16.303711),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=42.736816,Y=-15.710449,Z=16.303711),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=35.288086,Y=29.948730,Z=-35.332031),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=35.288086,Y=29.948730,Z=-35.332031),InterpMode=CIM_CurveAutoClamped),(InVal=9.900001,OutVal=(X=20.258789,Y=15.556641,Z=-16.479492),ArriveTangent=(X=0.000000,Y=-0.158082,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.158082,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=42.758789,Y=15.490723,Z=-16.589355),ArriveTangent=(X=2.146105,Y=-0.107456,Z=0.000000),LeaveTangent=(X=2.146105,Y=-0.107456,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=44.956055,Y=-0.241699,Z=-0.329590),ArriveTangent=(X=0.000000,Y=-0.076570,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.076570,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=-0.043945,Y=-0.285645,Z=-0.351563),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=1.900000),(Time=5.000000),(Time=6.000000),(Time=8.000000),(Time=9.000000),(Time=9.900001),(Time=11.000000),(Time=14.000000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4.InterpTrackAkEvent_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4.InterpTrackAkEvent_1'
      InterpTracks(3)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4.InterpTrackAkEvent_2'
      InterpTracks(4)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4.InterpTrackAkEvent_3'
      GroupName="Eye_1"
      GroupColor=(B=0,G=176,R=163,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=16.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=16.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-9072
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=-9112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-6640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
   VarName="Portal_4"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4440
   ObjPosY=-5160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_15"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_4"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-5088
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_41"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_15
   InputLinks(0)=(DrawY=-5170,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-5180,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5160,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_41'),DrawX=-4051,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4001,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-5216
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_15"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-5187,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5166,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5145,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5166,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=-3794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3832
   ObjPosY=-5224
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-5088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_42
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_4"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8736
   ObjPosY=600
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_42"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bLooping=True
   InputLinks(0)=(DrawY=-9530,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9508,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9486,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9464,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9442,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9514,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9458,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=47,OverrideDelta=40)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),LinkDesc="lens",MinVars=0,DrawX=92,OverrideDelta=87)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=-9568
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_01')
         AkEvents(1)=(Time=6.830938,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_05')
         AkEvents(2)=(Time=14.218311,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_09')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=2.501275,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_02')
         AkEvents(1)=(Time=8.188382,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_06')
         AkEvents(2)=(Time=15.912575,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_10')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Time=4.497356,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_03')
         AkEvents(1)=(Time=10.239702,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_07')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_3
         AkEvents(0)=(Time=5.978844,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_04')
         AkEvents(1)=(Time=13.354730,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_Movement_08')
         Name="InterpTrackAkEvent_3"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-0.000244,Y=0.000000,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000732,Y=0.000000,Z=-0.000183),ArriveTangent=(X=-0.000195,Y=0.000000,Z=-0.000049),LeaveTangent=(X=-0.000195,Y=0.000000,Z=-0.000049),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-0.000854,Y=0.000000,Z=-0.000214),ArriveTangent=(X=-0.000244,Y=0.000000,Z=-0.000061),LeaveTangent=(X=-0.000244,Y=0.000000,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.001099,Y=0.000000,Z=-0.000275),ArriveTangent=(X=-0.000183,Y=0.000000,Z=-0.000046),LeaveTangent=(X=-0.000183,Y=0.000000,Z=-0.000046),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=-0.001221,Y=0.000000,Z=-0.000305),ArriveTangent=(X=-0.000183,Y=0.000000,Z=-0.000046),LeaveTangent=(X=-0.000183,Y=0.000000,Z=-0.000046),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.001465,Y=0.000000,Z=-0.000366),ArriveTangent=(X=-0.000244,Y=0.000000,Z=-0.000061),LeaveTangent=(X=-0.000244,Y=0.000000,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=-0.001587,Y=0.000000,Z=-0.000397),ArriveTangent=(X=-0.000275,Y=0.000000,Z=-0.000069),LeaveTangent=(X=-0.000275,Y=0.000000,Z=-0.000069),InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,OutVal=(X=-0.001953,Y=0.000000,Z=-0.000488),ArriveTangent=(X=-0.000275,Y=0.000000,Z=-0.000069),LeaveTangent=(X=-0.000275,Y=0.000000,Z=-0.000069),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=-0.002075,Y=0.000000,Z=-0.000519),ArriveTangent=(X=-0.000244,Y=0.000000,Z=-0.000061),LeaveTangent=(X=-0.000244,Y=0.000000,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=-0.002319,Y=0.000000,Z=-0.000580),ArriveTangent=(X=-0.000523,Y=0.000000,Z=-0.000131),LeaveTangent=(X=-0.000523,Y=0.000000,Z=-0.000131),InterpMode=CIM_CurveAutoClamped),(InVal=8.200000,OutVal=(X=-0.002441,Y=0.000000,Z=-0.000610),ArriveTangent=(X=-0.000458,Y=0.000000,Z=-0.000114),LeaveTangent=(X=-0.000458,Y=0.000000,Z=-0.000114),InterpMode=CIM_CurveAutoClamped),(InVal=8.800000,OutVal=(X=-0.002686,Y=0.000000,Z=-0.000671),ArriveTangent=(X=-0.000203,Y=0.000000,Z=-0.000051),LeaveTangent=(X=-0.000203,Y=0.000000,Z=-0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=-0.002808,Y=0.000000,Z=-0.000702),ArriveTangent=(X=-0.000114,Y=0.000000,Z=-0.000029),LeaveTangent=(X=-0.000114,Y=0.000000,Z=-0.000029),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=-0.003052,Y=0.000000,Z=-0.000763),ArriveTangent=(X=-0.000118,Y=0.000000,Z=-0.000030),LeaveTangent=(X=-0.000118,Y=0.000000,Z=-0.000030),InterpMode=CIM_CurveAutoClamped),(InVal=13.100000,OutVal=(X=-0.003174,Y=0.000000,Z=-0.000793),ArriveTangent=(X=-0.000183,Y=0.000000,Z=-0.000046),LeaveTangent=(X=-0.000183,Y=0.000000,Z=-0.000046),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-0.003418,Y=0.000000,Z=-0.000854),ArriveTangent=(X=-0.000168,Y=0.000000,Z=-0.000042),LeaveTangent=(X=-0.000168,Y=0.000000,Z=-0.000042),InterpMode=CIM_CurveAutoClamped),(InVal=16.000000,OutVal=(X=-0.003662,Y=0.000000,Z=-0.000916),ArriveTangent=(X=-0.000163,Y=0.000000,Z=-0.000041),LeaveTangent=(X=-0.000163,Y=0.000000,Z=-0.000041),InterpMode=CIM_CurveAutoClamped),(InVal=17.000000,OutVal=(X=-0.003906,Y=0.000000,Z=-0.000977),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=67.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=67.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=59.567871,Y=40.803223,Z=-21.005859),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=59.567871,Y=40.803223,Z=-21.005859),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=53.239746,Y=-50.141602,Z=29.685059),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=53.239746,Y=-50.141602,Z=29.685059),InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,OutVal=(X=11.184082,Y=0.065918,Z=-0.527344),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=11.184082,Y=0.065918,Z=-0.527344),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=10.437012,Y=-4.174805,Z=21.489258),InterpMode=CIM_CurveAutoClamped),(InVal=8.200000,OutVal=(X=10.437012,Y=-4.174805,Z=21.489258),InterpMode=CIM_CurveAutoClamped),(InVal=8.800000,OutVal=(X=10.327148,Y=4.438477,Z=-22.851563),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=10.327148,Y=4.438477,Z=-22.851563),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=10.327148,Y=4.438477,Z=-45.351563),InterpMode=CIM_CurveAutoClamped),(InVal=13.100000,OutVal=(X=10.327148,Y=4.438477,Z=-45.351563),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=32.827148,Y=4.526367,Z=-45.571289),InterpMode=CIM_CurveAutoClamped),(InVal=16.000000,OutVal=(X=32.827148,Y=4.526367,Z=-0.571289),InterpMode=CIM_CurveAutoClamped),(InVal=17.000000,OutVal=(X=-1.032715,Y=3.427734,Z=-3.032227),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=2.500000),(Time=3.000000),(Time=4.500000),(Time=5.000000),(Time=6.000000),(Time=6.500000),(Time=7.500000),(Time=8.000000),(Time=8.200000),(Time=8.800000),(Time=10.000000),(Time=12.000000),(Time=13.100000),(Time=14.000000),(Time=16.000000),(Time=17.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAkEvent_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAkEvent_1'
      InterpTracks(3)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAkEvent_2'
      InterpTracks(4)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAkEvent_3'
      GroupName="lens"
      GroupColor=(B=206,G=120,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=25.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=25.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-9648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_8
   InputLinks(0)=(DrawY=-9294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_30'),DrawX=-1126,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_44'),DrawX=-1070,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-9328
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_8"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_30
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_30"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_44
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1072
   ObjPosY=-9224
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_44"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_9
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_29')),DrawY=-6099,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6078,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6057,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=-6168
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_9"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001221,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001221,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001221,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001221,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001526,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001526,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=-6352
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   InputLinks(0)=(DrawY=-6498,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6476,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6454,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6432,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6410,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6482,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6426,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=4663,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),LinkDesc="Bottom",MinVars=0,DrawX=4718,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),LinkDesc="Top",MinVars=0,DrawX=4770,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=-6536
   ObjComment="Left Front Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="Bollards_Open_1"
   InputLinks(0)=(DrawY=-6726,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6726,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9113,OverrideDelta=111)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9256
   ObjPosY=-6760
   ObjComment="Bollards_Open_1"
   DrawWidth=286
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Bollards_Open_1"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_29',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=1)),DrawY=-5878,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4096,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3984
   ObjPosY=-5944
   ObjComment="Bollards_Open_1"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_72
   EventName="Bollards_Open_2"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_31',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85',InputLinkIdx=1)),DrawY=-4446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3920,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3808
   ObjPosY=-4512
   ObjComment="Bollards_Open_2"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_72"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_71
   EventName="Bollards_Open_3"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_41',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_43',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86',InputLinkIdx=1)),DrawY=-3206,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4304,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=-3272
   ObjComment="Bollards_Open_3"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_71"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Bollards_Open_2"
   InputLinks(0)=(DrawY=-3614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3614,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9009,OverrideDelta=111)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-3648
   ObjComment="Bollards_Open_2"
   DrawWidth=286
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_36
   EventName="Bollards_Open_3"
   InputLinks(0)=(DrawY=-1406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9057,OverrideDelta=111)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-1440
   ObjComment="Bollards_Open_3"
   DrawWidth=286
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_36"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_10
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_41'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_43')),DrawY=-3019,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2998,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2977,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=-3088
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_10"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_31'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-4699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4678,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4657,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=-4768
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="Boll_Close_1"
   MaxWidth=198
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_8'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_22')),DrawY=-6462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2699,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2600
   ObjPosY=-6528
   ObjComment="Boll_Close_1"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_12
   EventName="Boll_Open_1"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_3'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),DrawY=-6294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2714,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=-6360
   ObjComment="Boll_Open_1"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_12"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-9640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_4
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-6078,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_7')),DrawY=-6078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169'),DrawX=-9174,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-6112
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_4"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-6024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_8
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="100000")
   InputLinks(0)=(DrawY=-6486,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=-6486,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227'),DrawX=3297,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=-6520
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_8"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_271'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3256
   ObjPosY=-6416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-6323,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6302,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6281,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=1)),DrawY=-6302,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233'),DrawX=3526,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3577,OverrideDelta=76)
   EventLinks(0)=(DrawX=3626,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=-6360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=-6224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_307
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3672
   ObjPosY=-6616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_307"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-6707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=-6686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_307'),DrawX=3686,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3737,OverrideDelta=76)
   EventLinks(0)=(DrawX=3786,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3648
   ObjPosY=-6744
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_271'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=-6224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_3
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-6294,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25',InputLinkIdx=1)),DrawY=-6294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248'),DrawX=3369,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=-6328
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_3"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_4
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-3414,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29',InputLinkIdx=1)),DrawY=-3414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=3361,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3304
   ObjPosY=-3448
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_4"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-3843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=-3822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263'),DrawX=3694,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3745,OverrideDelta=76)
   EventLinks(0)=(DrawX=3794,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3656
   ObjPosY=-3880
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-3443,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3422,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3401,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_43',InputLinkIdx=1)),DrawY=-3422,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264'),DrawX=3518,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3569,OverrideDelta=76)
   EventLinks(0)=(DrawX=3618,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3480
   ObjPosY=-3480
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_5
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="100000")
   InputLinks(0)=(DrawY=-3662,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_43'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=-3662,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265'),DrawX=3369,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=-3696
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_5"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
   EventName="Boll_Open_8"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_4'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23')),DrawY=-3326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2762,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-3392
   ObjComment="Boll_Open_8"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_13"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
   EventName="Boll_Close_8"
   MaxWidth=198
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_5'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_23')),DrawY=-3606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2763,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-3672
   ObjComment="Boll_Close_8"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_14"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_263
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3664
   ObjPosY=-3752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_263"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_264
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=-3352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_264"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_265
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=-3616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_265"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3336
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="Boll_Close_10"
   MaxWidth=206
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_6'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=-2830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2775,OverrideDelta=71)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=-2896
   ObjComment="Boll_Close_10"
   DrawWidth=123
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_20
   EventName="Boll_Open_10"
   MaxWidth=205
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_7'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_27')),DrawY=-2590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2774,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=-2656
   ObjComment="Boll_Open_10"
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_20"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_6
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="100000")
   InputLinks(0)=(DrawY=-2846,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_10')),DrawY=-2846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235'),DrawX=3361,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3304
   ObjPosY=-2880
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_6"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-2627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2585,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=1)),DrawY=-2606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=3510,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3561,OverrideDelta=76)
   EventLinks(0)=(DrawX=3610,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3472
   ObjPosY=-2664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=-3099,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3078,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3057,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39')),DrawY=-3078,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=3670,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3721,OverrideDelta=76)
   EventLinks(0)=(DrawX=3770,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3632
   ObjPosY=-3136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_7
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-2598,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37',InputLinkIdx=1)),DrawY=-2598,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131'),DrawX=3353,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3296
   ObjPosY=-2632
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_7"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3296
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_180'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3384
   ObjPosY=-2792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=-2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_180'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3384
   ObjPosY=-2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3640
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3480
   ObjPosY=-2536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=4335
   SizeY=7960
   bDrawBox=True
   FillColor=(B=255,G=67,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-6840
   ObjComment="Bollard Controls"
   DrawWidth=4335
   DrawHeight=7960
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_6
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_8')),DrawY=-9412,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_8')),DrawY=-9392,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2717,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2656,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-2575,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-9480
   ObjComment="Determine what trader is used"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_6"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_4
   LinkCount=6
   IncrementAmount=0
   InputLinks(0)=(DrawY=-9466,OverrideDelta=71)
   OutputLinks(0)=(DrawY=-9521,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),LinkDesc="Link 2",DrawY=-9499,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),LinkDesc="Link 3",DrawY=-9477,OverrideDelta=60)
   OutputLinks(3)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),LinkDesc="Link 4",DrawY=-9455,OverrideDelta=82)
   OutputLinks(4)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),LinkDesc="Link 5",DrawY=-9433,OverrideDelta=104)
   OutputLinks(5)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),LinkDesc="Link 6",DrawY=-9411,OverrideDelta=126)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_5'),DrawX=-1886,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1920
   ObjPosY=-9560
   DrawWidth=68
   DrawHeight=181
   Name="SeqAct_Switch_4"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3920
   ObjPosY=-6632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-4899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_412'),DrawX=-3770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=-4936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_11
   InputLinks(0)=(DrawY=-4874,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=-4884,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4864,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_21'),DrawX=-4027,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3977,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-4920
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_11"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_21
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_5"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-4792
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_21"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   VarName="Portal_5"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4416
   ObjPosY=-4864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_14"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-4651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4609,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=-3770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=-4688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=-4626,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-4636,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4616,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_29'),DrawX=-4027,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3977,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-4672
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_6"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-4544
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_29"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   VarName="Portal_6"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4416
   ObjPosY=-4616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3800
   ObjPosY=-4560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_15')),DrawY=-5155,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5134,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5113,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4262,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4344
   ObjPosY=-5224
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=-4619,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4598,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4577,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4226,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4312
   ObjPosY=-4688
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8176
   ObjPosY=-3096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_6"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-3144
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_5"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=-3096
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_14"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_2
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_3')),DrawY=-6532,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_3')),DrawY=-6512,OverrideDelta=33)
   VariableLinks(0)=(DrawX=5651,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5712,OverrideDelta=86)
   VariableLinks(2)=(DrawX=5793,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5608
   ObjPosY=-6600
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_2"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_33
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5920
   ObjPosY=-6408
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   bLooping=True
   InputLinks(0)=(DrawY=-6464,OverrideDelta=25)
   InputLinks(1)=(DrawY=-6420,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),DrawY=-6475,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_12')),LinkDesc="Link 2",DrawY=-6453,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),LinkDesc="Link 3",DrawY=-6431,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_14')),LinkDesc="Link 4",DrawY=-6409,OverrideDelta=80)
   VariableLinks(0)=(DrawX=6180,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6136
   ObjPosY=-6512
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_3
   ValueB=1
   InputLinks(0)=(DrawY=-6518,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-6562,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-6540,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-6518,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-6496,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-6474,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=5993,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_2'),DrawX=6018,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5960
   ObjPosY=-6600
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_3"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6016
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_2"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
   EventName="Boll_Close_10"
   InputLinks(0)=(DrawY=-6406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6485,OverrideDelta=101)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-6440
   ObjComment="Boll_Close_10"
   DrawWidth=267
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_8"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_12
   EventName="Boll_Close_8"
   InputLinks(0)=(DrawY=-6494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6481,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-6528
   ObjComment="Boll_Close_8"
   DrawWidth=259
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_12"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="Boll_Close_1"
   InputLinks(0)=(DrawY=-6582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6582,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6481,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-6616
   ObjComment="Boll_Close_1"
   DrawWidth=259
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_1')),DrawY=-6052,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_1')),DrawY=-6032,OverrideDelta=33)
   VariableLinks(0)=(DrawX=5643,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5704,OverrideDelta=86)
   VariableLinks(2)=(DrawX=5785,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5600
   ObjPosY=-6120
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_0"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_3
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6008
   ObjPosY=-5904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_3"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_1
   ValueB=1
   InputLinks(0)=(DrawY=-6022,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-6066,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-6044,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-6022,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-6000,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_41'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),DrawY=-5978,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_11'),DrawX=5993,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_3'),DrawX=6018,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5960
   ObjPosY=-6104
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_1"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5928
   ObjPosY=-5904
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_11"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="Boll_Open_10"
   InputLinks(0)=(DrawY=-5878,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5878,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6485,OverrideDelta=101)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-5912
   ObjComment="Boll_Open_10"
   DrawWidth=266
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_41
   EventName="Boll_Open_8"
   InputLinks(0)=(DrawY=-5966,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5966,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6481,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-6000
   ObjComment="Boll_Open_8"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_41"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="Boll_Open_1"
   InputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6481,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-6080
   ObjComment="Boll_Open_1"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=-6683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6641,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6662,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_365'),DrawX=3918,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3969,OverrideDelta=76)
   EventLinks(0)=(DrawX=4018,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3880
   ObjPosY=-6720
   ObjComment="Bollard Electric"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3808
   ObjPosY=-6560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3960
   ObjPosY=-6560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=10.000000
   InputLinks(0)=(DrawY=-6707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-6702,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6670,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3540,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=-6744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_32
   EventName="Bollards_Open_1"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=1),(LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_9')),DrawY=-6262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4968,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=-6328
   ObjComment="Bollards_Open_1"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_32"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-6203,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6182,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6161,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6182,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_359',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_364',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_366',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=5302,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5353,OverrideDelta=76)
   EventLinks(0)=(DrawX=5402,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5264
   ObjPosY=-6240
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5104
   ObjPosY=-6072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5376
   ObjPosY=-6072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5104
   ObjPosY=-5992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5384
   ObjPosY=-5976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5080
   ObjPosY=-5776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5384
   ObjPosY=-5784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="Bollards_Open_2"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33',InputLinkIdx=1),(LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_10')),DrawY=-4566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4952,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4840
   ObjPosY=-4632
   ObjComment="Bollards_Open_2"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=-4435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_352',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_353',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_341',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_360',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_361',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_362',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_368',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_367',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=5262,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5313,OverrideDelta=76)
   EventLinks(0)=(DrawX=5362,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=-4472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5760
   ObjPosY=-3096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6008
   ObjPosY=-3080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-3211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3169,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3190,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_320',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_321',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_326',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_327',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_328',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_329',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_330',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_335',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_336',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_337',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_363'),DrawX=5934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5985,OverrideDelta=76)
   EventLinks(0)=(DrawX=6034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5896
   ObjPosY=-3248
   ObjComment="Turn off bollard electricity"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_21
   VarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=567
   ObjPosY=-3224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_21"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_53
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-6528
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_53"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_20
   InputLinks(0)=(DrawY=-6594,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-6604,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=-6584,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_53'),DrawX=-2147,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2097,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-6640
   ObjComment="Trader Time?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_20"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_39'),(LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_12'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_5')),DrawY=-3100,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_39'),(LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_12'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_5')),DrawY=-3080,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-157,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-96,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-15,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-200
   ObjPosY=-3168
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_0"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_19
   EventName="Player_Off_Fire_1"
   InputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=458,OverrideDelta=115)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=311
   ObjPosY=-3528
   ObjComment="Player_Off_Fire_1"
   DrawWidth=294
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_19"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_20
   EventName="Player_Off_Fire_2"
   InputLinks(0)=(DrawY=-3398,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3398,OverrideDelta=11)
   VariableLinks(0)=(DrawX=466,OverrideDelta=115)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=319
   ObjPosY=-3432
   ObjComment="Player_Off_Fire_2"
   DrawWidth=294
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_20"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_39
   EventName="Player_Off_Fire_3"
   InputLinks(0)=(DrawY=-3294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=474,OverrideDelta=115)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=327
   ObjPosY=-3328
   ObjComment="Player_Off_Fire_3"
   DrawWidth=294
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_39"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_12
   InputLinks(0)=(DrawY=-3198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_29'),DrawX=425,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_38'),DrawX=481,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=391
   ObjPosY=-3232
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_12"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_29
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=359
   ObjPosY=-3144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_29"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=455
   ObjPosY=-3152
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_38"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_14
   InputLinks(0)=(DrawY=-3378,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-3388,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_3')),DrawY=-3368,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_37'),DrawX=-2035,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1985,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2064
   ObjPosY=-3424
   ObjComment="Trader Time?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_14"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=-3312
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_37"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-4826,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-4836,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=-4816,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_15'),DrawX=-2163,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2113,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=-4872
   ObjComment="Trader Time?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2200
   ObjPosY=-4760
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_15"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_5
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0'),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2')),DrawY=-2636,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4'),(LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0'),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2')),DrawY=-2616,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-149,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-88,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-7,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-192
   ObjPosY=-2704
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_5"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=504
   ObjPosY=-2648
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_9"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=-2640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_5"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_4
   InputLinks(0)=(DrawY=-2686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=466,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_9'),DrawX=522,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=432
   ObjPosY=-2720
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_4"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=10.000000
   InputLinks(0)=(DrawY=-3843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=-3838,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3806,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3508,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3456
   ObjPosY=-3880
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-3819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_319',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_323',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_324'),DrawX=3942,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3993,OverrideDelta=76)
   EventLinks(0)=(DrawX=4042,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3904
   ObjPosY=-3856
   ObjComment="Bollard Electric"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=-3091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_338',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_339',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_340'),DrawX=3950,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4001,OverrideDelta=76)
   EventLinks(0)=(DrawX=4050,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3912
   ObjPosY=-3128
   ObjComment="Bollard Electric"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_10
   Duration=10.000000
   InputLinks(0)=(DrawY=-3099,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3078,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3057,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38')),DrawY=-3094,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3062,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3532,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3480
   ObjPosY=-3136
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_10"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   Duration=10.000000
   InputLinks(0)=(DrawY=-2123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2081,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-2118,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2086,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3644,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3592
   ObjPosY=-2160
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-1843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1801,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_331'),DrawX=4070,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4121,OverrideDelta=76)
   EventLinks(0)=(DrawX=4170,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4032
   ObjPosY=-1880
   ObjComment="Bollard Electric"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_0
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-1838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1)),DrawY=-1838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),DrawX=3481,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3424
   ObjPosY=-1872
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_0"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-2139,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2118,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2097,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=-2118,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=3790,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3841,OverrideDelta=76)
   EventLinks(0)=(DrawX=3890,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3752
   ObjPosY=-2176
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-1867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1825,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=1)),DrawY=-1846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=3638,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3689,OverrideDelta=76)
   EventLinks(0)=(DrawX=3738,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3600
   ObjPosY=-1904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_1
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="100000")
   InputLinks(0)=(DrawY=-2206,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=-2206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243'),DrawX=3481,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3424
   ObjPosY=-2240
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_1"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Boll_Open_11"
   MaxWidth=205
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_0'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-1782,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2766,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-1848
   ObjComment="Boll_Open_11"
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Boll_Close_11"
   MaxWidth=206
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_1'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_19')),DrawY=-2110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2767,OverrideDelta=71)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-2176
   ObjComment="Boll_Close_11"
   DrawWidth=123
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_184'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3448
   ObjPosY=-2152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_184'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3448
   ObjPosY=-1792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3760
   ObjPosY=-2040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=-1776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=-1752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4144
   ObjPosY=-1752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
   EventName="Boll_Open_11"
   InputLinks(0)=(DrawY=-5798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6485,OverrideDelta=101)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-5832
   ObjComment="Boll_Open_11"
   DrawWidth=266
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_17"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_14
   EventName="Boll_Close_11"
   InputLinks(0)=(DrawY=-6326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6485,OverrideDelta=101)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-6360
   ObjComment="Boll_Close_11"
   DrawWidth=267
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_14"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="Eye_On_01"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43')),DrawY=-9494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-465,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-560
   ObjPosY=-9560
   ObjComment="Eye_On_01"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_16
   EventName="Eye_On_02"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81')),DrawY=-9198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-465,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-560
   ObjPosY=-9264
   ObjComment="Eye_On_02"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_16"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
   InputLinks(0)=(DrawY=-9227,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9206,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9185,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=-9206,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=-226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-264
   ObjPosY=-9264
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_81"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=-9523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9481,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=-9502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),DrawX=-242,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-191,OverrideDelta=76)
   EventLinks(0)=(DrawX=-142,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-280
   ObjPosY=-9560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-272
   ObjPosY=-9432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-256
   ObjPosY=-9136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-9280
   ObjComment="Eye 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8248
   ObjPosY=-9280
   ObjComment="Eye 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_26
   EventName="Eye_On_01"
   InputLinks(0)=(DrawY=-8302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8302,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8682,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-8336
   ObjComment="Eye_On_01"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_26"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_29
   EventName="Eye_On_02"
   InputLinks(0)=(DrawY=-1318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1318,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9074,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-1352
   ObjComment="Eye_On_02"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_29"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2000
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=-4427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_316',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_318'),DrawX=-1850,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1799,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1750,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-4464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=1818
   SizeY=3086
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-160
   ObjPosY=-6752
   ObjComment="Center Robot"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_1
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_5')),DrawY=-6508,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_5')),DrawY=-6488,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-45,OverrideDelta=16)
   VariableLinks(1)=(DrawX=16,OverrideDelta=86)
   VariableLinks(2)=(DrawX=97,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-6576
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_1"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_39
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=-6376
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_39"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_3
   LinkCount=3
   bLooping=True
   InputLinks(0)=(DrawY=-6534,OverrideDelta=19)
   InputLinks(1)=(DrawY=-6502,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_186')),DrawY=-6539,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_187')),LinkDesc="Link 2",DrawY=-6518,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_186'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_187')),LinkDesc="Link 3",DrawY=-6497,OverrideDelta=56)
   VariableLinks(0)=(DrawX=572,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=-6576
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_3"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_5
   ValueB=1
   InputLinks(0)=(DrawY=-6526,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-6570,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-6548,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-6526,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-6504,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_3')),DrawY=-6482,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_39'),DrawX=321,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_5'),DrawX=346,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=288
   ObjPosY=-6608
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_5"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_5
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=-6352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_5"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_186
   EventName="On_Arm_Center_01"
   InputLinks(0)=(DrawY=-6614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6614,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1016,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=-6648
   ObjComment="On_Arm_Center_01"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_186"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_81
   EventName="On_Arm_Center_01"
   MaxWidth=244
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_45')),DrawY=-5718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=106,OverrideDelta=90)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-16
   ObjPosY=-5784
   ObjComment="On_Arm_Center_01"
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_81"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_82
   EventName="Off_Arm_Center_01"
   MaxWidth=246
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_45',InputLinkIdx=2)),DrawY=-5534,OverrideDelta=11)
   VariableLinks(0)=(DrawX=99,OverrideDelta=91)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=-5600
   ObjComment="Off_Arm_Center_01"
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_82"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_34
   EventName="Off_Arm_Center_01"
   InputLinks(0)=(DrawY=-6230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=641,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=488
   ObjPosY=-6264
   ObjComment="Off_Arm_Center_01"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_34"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_143
   EventName="Off_Arm_Center_02"
   InputLinks(0)=(DrawY=-6134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=641,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=488
   ObjPosY=-6168
   ObjComment="Off_Arm_Center_02"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_143"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_79
   EventName="Off_Arm_Center_02"
   MaxWidth=246
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_44',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=2)),DrawY=-4814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=99,OverrideDelta=91)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=-4880
   ObjComment="Off_Arm_Center_02"
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_79"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_80
   EventName="On_Arm_Center_02"
   MaxWidth=244
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_44'),(LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=-4982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=98,OverrideDelta=90)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=-5048
   ObjComment="On_Arm_Center_02"
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_80"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_187
   EventName="On_Arm_Center_02"
   InputLinks(0)=(DrawY=-6518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6518,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1032,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=-6552
   ObjComment="On_Arm_Center_02"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_187"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_2
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),DrawY=-6164,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),DrawY=-6144,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-61,OverrideDelta=16)
   VariableLinks(1)=(OverrideDelta=86)
   VariableLinks(2)=(DrawX=81,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-104
   ObjPosY=-6232
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_2"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=296
   ObjPosY=-5976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_2
   ValueB=1
   InputLinks(0)=(DrawY=-6142,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-6186,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-6164,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-6142,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-6120,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_34'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_143')),DrawY=-6098,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=273,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=298,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=-6224
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_2"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_32
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=176
   ObjPosY=-6000
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_32"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_189
   EventName="On_Arm_Center_03"
   InputLinks(0)=(DrawY=-1070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9064,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-1104
   ObjComment="On_Arm_Center_03"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_189"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="On_Arm_Center_03"
   MaxWidth=244
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47')),DrawY=-4206,OverrideDelta=11)
   VariableLinks(0)=(DrawX=114,OverrideDelta=90)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=-4272
   ObjComment="On_Arm_Center_03"
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
   InputLinks(0)=(DrawY=-5435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_304',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_305'),DrawX=406,OverrideDelta=16)
   VariableLinks(1)=(DrawX=457,OverrideDelta=76)
   EventLinks(0)=(DrawX=506,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=368
   ObjPosY=-5472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_45"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_261
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=-5304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_261"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-4675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4633,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_312',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_259'),DrawX=302,OverrideDelta=16)
   VariableLinks(1)=(DrawX=353,OverrideDelta=76)
   EventLinks(0)=(DrawX=402,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=264
   ObjPosY=-4712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-4544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_38
   EventName="Open_Gate_01"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_56')),DrawY=-6718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7061,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-6784
   ObjComment="Open_Gate_01"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_38"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_39
   EventName="Close_Gate_01"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_55',InputLinkIdx=1)),DrawY=-6494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7069,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7176
   ObjPosY=-6560
   ObjComment="Close_Gate_01"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_39"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_30
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-6856
   ObjComment="Zed Gate 1"
   Name="SequenceFrameWrapped_30"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
   InputLinks(0)=(DrawY=-6531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6489,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17',InputLinkIdx=1)),DrawY=-6510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_334'),DrawX=-6858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-6568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_55"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
   InputLinks(0)=(DrawY=-6755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6713,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17')),DrawY=-6734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_333'),DrawX=-6858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-6792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_56"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_333
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=-6656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_333"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_334
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=-6416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_334"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
   InputLinks(0)=(DrawY=-6219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6177,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23')),DrawY=-6198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_343',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_344'),DrawX=-6858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-6256
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_57"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
   InputLinks(0)=(DrawY=-5995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5953,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23',InputLinkIdx=1)),DrawY=-5974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_342',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_345'),DrawX=-6858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-6032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_58"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_10
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-6312
   ObjComment="Zed Gate 2"
   Name="SequenceFrameWrapped_10"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_40
   EventName="Close_Gate_02"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_58',InputLinkIdx=1)),DrawY=-5966,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7045,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-6032
   ObjComment="Close_Gate_02"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_40"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_41
   EventName="Open_Gate_02"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57')),DrawY=-6182,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7061,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-6248
   ObjComment="Open_Gate_02"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_41"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_22
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_6
         AkEvents(0)=(Time=0.014837,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_6"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=288.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_0.InterpTrackAkEvent_6'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_22"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_23
   InputLinks(0)=(DrawY=-6122,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6100,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6078,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6056,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6034,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6106,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6050,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_22'),DrawX=-6551,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_346'),LinkDesc="Door1",MinVars=0,DrawX=-6500,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-6160
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_23"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_342
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6800
   ObjPosY=-5896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_342"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_343
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-6112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_343"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_344
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-6128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_344"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_345
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-5904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_345"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_346
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6528
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_346"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_27
   InputLinks(0)=(DrawY=-5586,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5564,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5542,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5520,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5498,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5570,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5514,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_27'),DrawX=-6543,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_351'),LinkDesc="Door1",MinVars=0,DrawX=-6492,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-5624
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_27"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_27
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_4
         AkEvents(0)=(Time=0.086053,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_4"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=288.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_27.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_27.InterpGroup_0.InterpTrackAkEvent_4'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_27.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_27.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-5424
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_27"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_42
   EventName="Open_Gate_03"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_61')),DrawY=-5646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7053,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7160
   ObjPosY=-5712
   ObjComment="Open_Gate_03"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_42"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_43
   EventName="Close_Gate_03"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_60',InputLinkIdx=1)),DrawY=-5430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7037,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-5496
   ObjComment="Close_Gate_03"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_43"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_11
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-5776
   ObjComment="Zed Gate 3"
   Name="SequenceFrameWrapped_11"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_60
   InputLinks(0)=(DrawY=-5459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5417,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_27',InputLinkIdx=1)),DrawY=-5438,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_348',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_350'),DrawX=-6850,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6799,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6750,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-5496
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_60"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
   InputLinks(0)=(DrawY=-5683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5641,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_27')),DrawY=-5662,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_347',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_349'),DrawX=-6850,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6799,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6750,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-5720
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_61"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_347
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-5576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_347"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_348
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-5352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_348"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_349
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-5576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_349"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_350
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-5352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_350"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_351
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6488
   ObjPosY=-5432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_351"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_95
   EventName="Open_Gate_03"
   InputLinks(0)=(DrawY=-7998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8679,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=-8032
   ObjComment="Open_Gate_03"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_95"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_96
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-8094,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8671,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-8128
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_96"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_97
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-8190,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8190,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8671,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-8224
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_97"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_59
   InputLinks(0)=(DrawY=-8971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8929,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8950,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_180',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_182',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_185',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215'),DrawX=-9106,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9055,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9006,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-9008
   ObjComment="Zed closet pulsing blue lights"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_59"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
   InputLinks(0)=(DrawY=-5147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5105,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32')),DrawY=-5126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_355',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_309'),DrawX=-6842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=-5184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_62"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
   InputLinks(0)=(DrawY=-4923,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4902,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4881,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32',InputLinkIdx=1)),DrawY=-4902,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_356',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-6842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=-4960
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_63"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_12
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-5240
   ObjComment="Zed Gate 4"
   Name="SequenceFrameWrapped_12"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_44
   EventName="Close_Gate_04"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_63',InputLinkIdx=1)),DrawY=-4894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7029,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-4960
   ObjComment="Close_Gate_04"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_44"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_45
   EventName="Open_Gate_04"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_62')),DrawY=-5110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7045,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-5176
   ObjComment="Open_Gate_04"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_45"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_32
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_7
         AkEvents(0)=(Time=0.038576,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_7"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=-255.999908),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpGroup_0.InterpTrackAkEvent_7'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-4888
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_32"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_32
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5050,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5028,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5006,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4984,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4962,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5034,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4978,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_32'),DrawX=-6535,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193'),LinkDesc="Door1",MinVars=0,DrawX=-6484,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-5088
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_32"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_33
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4514,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4492,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4470,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4448,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4426,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4498,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4442,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_33'),DrawX=-6535,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194'),LinkDesc="Door1",MinVars=0,DrawX=-6484,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-4552
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_33"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_33
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_8
         AkEvents(0)=(Time=0.050000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_8"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=-255.999908),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_0.InterpTrackAkEvent_8'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-4352
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_33"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_47
   EventName="Open_Gate_05"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_64')),DrawY=-4574,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7045,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-4640
   ObjComment="Open_Gate_05"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_47"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="Close_Gate_05"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65',InputLinkIdx=1)),DrawY=-4358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7029,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-4424
   ObjComment="Close_Gate_05"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_13
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-4704
   ObjComment="Zed Gate 5"
   Name="SequenceFrameWrapped_13"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
   InputLinks(0)=(DrawY=-4387,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4366,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4345,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33',InputLinkIdx=1)),DrawY=-4366,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_358',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),DrawX=-6842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=-4424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_65"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
   InputLinks(0)=(DrawY=-4611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4569,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33')),DrawY=-4590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_357',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-6842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=-4648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_64"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_34
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3978,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3956,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3934,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3912,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3890,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3962,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3906,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_34'),DrawX=-6535,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="Door1",MinVars=0,DrawX=-6484,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-4016
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_34"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_34
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_4
      Name="InterpCurveEdSetup_4"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_9
         AkEvents(0)=(Time=0.030769,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_9"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000214,Z=296.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpGroup_0.InterpTrackAkEvent_9'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpCurveEdSetup_4'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-3816
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_34"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_49
   EventName="Open_Gate_06"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66')),DrawY=-4038,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7045,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-4104
   ObjComment="Open_Gate_06"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_49"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_48
   EventName="Close_Gate_06"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_67',InputLinkIdx=1)),DrawY=-3822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7029,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-3888
   ObjComment="Close_Gate_06"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_48"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_14
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-4168
   ObjComment="Zed Gate 6"
   Name="SequenceFrameWrapped_14"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
   InputLinks(0)=(DrawY=-3851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3809,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34',InputLinkIdx=1)),DrawY=-3830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=-6842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=-3888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_67"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
   InputLinks(0)=(DrawY=-4075,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4054,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4033,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34')),DrawY=-4054,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=-6842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=-4112
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_66"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_16
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3442,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3420,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3398,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3376,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3354,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3426,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3370,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_16'),DrawX=-6527,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),LinkDesc="Door1",MinVars=0,DrawX=-6476,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-3480
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_16"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_16
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_5
      Name="InterpCurveEdSetup_5"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_10
         AkEvents(0)=(Time=0.015385,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_10"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=288.000061),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0.InterpTrackAkEvent_10'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpCurveEdSetup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-3280
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_16"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_54
   EventName="Open_Gate_07"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-3502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7037,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-3568
   ObjComment="Open_Gate_07"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_54"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_55
   EventName="Close_Gate_07"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1)),DrawY=-3286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7021,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7128
   ObjPosY=-3352
   ObjComment="Close_Gate_07"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_55"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=-3632
   ObjComment="Zed Gate 7"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-3315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3273,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16',InputLinkIdx=1)),DrawY=-3294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),DrawX=-6834,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6783,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6734,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-3352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-3539,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3518,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3497,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16')),DrawY=-3518,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135'),DrawX=-6834,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6783,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6734,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-3576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_355
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-5056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_355"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_356
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-4832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_356"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_357
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-4520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_357"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_358
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-4296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_358"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-3840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-3984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-3760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-3448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-3224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_113
   EventName="Open_Gate_07"
   InputLinks(0)=(DrawY=-6174,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6174,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9183,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-6208
   ObjComment="Open_Gate_07"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_113"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_62
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9183,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-6296
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_62"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_114
   EventName="Open_Gate_05"
   InputLinks(0)=(DrawY=-6350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9183,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-6384
   ObjComment="Open_Gate_05"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_114"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_58
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-6446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9183,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-6480
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_58"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_8
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_4')),DrawY=-8156,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8136,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9709,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9648,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9567,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-8224
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_8"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_20
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=-8096
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_20"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_4
   ValueB=1
   InputLinks(0)=(DrawY=-8198,OverrideDelta=59)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_9')),DrawY=-8242,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-8220,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-8198,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-8176,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8154,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_20'),DrawX=-9183,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_4'),DrawX=-9158,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-8280
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_4"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_4
   IntValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-8088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_4"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="Wave_2"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_58'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_114'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_62'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_113'),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_4'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_134'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_55'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_56'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_54'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_31')),DrawY=-6462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9731,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9816
   ObjPosY=-6528
   ObjComment="Wave_2"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_53
   EventName="Wave_2"
   InputLinks(0)=(DrawY=-7750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7750,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8493,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=-7784
   ObjComment="Wave_2"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_53"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_55
   EventName="Wave_3"
   InputLinks(0)=(DrawY=-7646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8501,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-7680
   ObjComment="Wave_3"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_55"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_36
   EventName="Wave_3"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_118'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_117'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_120'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_119'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_192')),DrawY=-5518,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9699,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-5584
   ObjComment="Wave_3"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_36"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_63
   EventName="Wave_4"
   InputLinks(0)=(DrawY=-7542,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7542,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8493,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=-7576
   ObjComment="Wave_4"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_63"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_37
   EventName="Wave_4"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_47'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_51'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_124'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_122'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_123'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_121'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_128')),DrawY=-4646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9667,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-4712
   ObjComment="Wave_4"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_37"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_64
   EventName="Wave_5"
   InputLinks(0)=(DrawY=-7446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8501,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-7480
   ObjComment="Wave_5"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_64"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_50
   EventName="Wave_5"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_127'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_126'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_190')),DrawY=-3910,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9635,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9720
   ObjPosY=-3976
   ObjComment="Wave_5  BOSS"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_50"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_65
   EventName="Wave_6"
   InputLinks(0)=(DrawY=-7342,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8501,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-7376
   ObjComment="Wave_6"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_65"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_51
   EventName="Wave_6"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3'),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_0'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_133'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_132'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_131'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_191'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_136'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_135'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_137'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_52'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_53'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_51'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_49')),DrawY=-3134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9691,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9776
   ObjPosY=-3200
   ObjComment="Wave_6"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_51"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_129
   EventName="Wave_7"
   InputLinks(0)=(DrawY=-7230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8501,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-7264
   ObjComment="Wave_7"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_129"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Wave_8"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_36'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_29'),(LinkedOp=SeqAct_ChangeCollision'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_1'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_83'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_46'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_130'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_54'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_125'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_60'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_71'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_73'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_75'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_77'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_79'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_81'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_189'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_188'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_31'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_195'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_58'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_59'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_57'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_48')),DrawY=-902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9723,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-968
   ObjComment="Wave_8"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-6747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6705,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18')),DrawY=-6726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-5938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-6784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-6523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6481,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=1)),DrawY=-6502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155'),DrawX=-5938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-6560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_56
   EventName="Close_Gate_08"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1)),DrawY=-6494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6125,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-6560
   ObjComment="Close_Gate_08"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_56"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_57
   EventName="Open_Gate_08"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-6710,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6141,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-6776
   ObjComment="Open_Gate_08"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_57"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_18
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_6
      Name="InterpCurveEdSetup_6"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_11
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_11"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=-304.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_0.InterpTrackAkEvent_11'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpCurveEdSetup_6'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_18"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_18
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-6650,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6628,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6606,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6584,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6562,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6634,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6578,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_18'),DrawX=-5631,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),LinkDesc="Door1",MinVars=0,DrawX=-5580,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5680
   ObjPosY=-6688
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_18"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_15
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6280
   ObjPosY=-6848
   ObjComment="Zed Gate 8"
   Name="SequenceFrameWrapped_15"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_16
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-6328
   ObjComment="Zed Gate 9"
   Name="SequenceFrameWrapped_16"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_20
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-6122,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6100,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6078,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6056,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6034,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6106,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6050,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_20'),DrawX=-5623,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),LinkDesc="Door1",MinVars=0,DrawX=-5572,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-6160
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_20"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_20
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_7
      Name="InterpCurveEdSetup_7"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_12
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_12"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000122,Y=-0.000214,Z=-296.000061),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_0.InterpTrackAkEvent_12'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpCurveEdSetup_7'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_20"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_59
   EventName="Open_Gate_09"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),DrawY=-6182,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6133,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-6248
   ObjComment="Open_Gate_09"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_59"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_58
   EventName="Close_Gate_09"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27',InputLinkIdx=1)),DrawY=-5966,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6117,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-6032
   ObjComment="Close_Gate_09"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_58"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-5995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5953,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_20',InputLinkIdx=1)),DrawY=-5974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-6032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-6219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6177,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_20')),DrawY=-6198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-6256
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_17
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6272
   ObjPosY=-5776
   ObjComment="Zed Gate 10"
   Name="SequenceFrameWrapped_17"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_28
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5578,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5556,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5534,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5512,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5490,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5562,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5506,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_28'),DrawX=-5623,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105'),LinkDesc="Door1",MinVars=0,DrawX=-5572,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-5616
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_28"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_28
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_8
      Name="InterpCurveEdSetup_8"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_13
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_13"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000000,Z=296.000061),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpGroup_0.InterpTrackAkEvent_13'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpCurveEdSetup_8'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-5416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_28"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_61
   EventName="Open_Gate_10"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_53')),DrawY=-5638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6133,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-5704
   ObjComment="Open_Gate_10"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_61"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_60
   EventName="Close_Gate_10"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_54',InputLinkIdx=1)),DrawY=-5422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6117,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-5488
   ObjComment="Close_Gate_10"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_60"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
   InputLinks(0)=(DrawY=-5451,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5430,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5409,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_28',InputLinkIdx=1)),DrawY=-5430,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-5488
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_54"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_53
   InputLinks(0)=(DrawY=-5675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5633,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_28')),DrawY=-5654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-5712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_53"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_18
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-5256
   ObjComment="Zed Gate 11"
   Name="SequenceFrameWrapped_18"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_30
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5042,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5020,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4998,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4976,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4954,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5026,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4970,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_30'),DrawX=-5623,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187'),LinkDesc="Door1",MinVars=0,DrawX=-5572,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-5080
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_30"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_30
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_9
      Name="InterpCurveEdSetup_9"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_14
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_14"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000214,Z=-312.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpGroup_0.InterpTrackAkEvent_14'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpCurveEdSetup_9'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-4880
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_30"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_63
   EventName="Open_Gate_11"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_68')),DrawY=-5102,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6133,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-5168
   ObjComment="Open_Gate_11"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_63"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_62
   EventName="Close_Gate_11"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_69',InputLinkIdx=1)),DrawY=-4886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6117,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-4952
   ObjComment="Close_Gate_11"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_62"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
   InputLinks(0)=(DrawY=-4915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4873,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30',InputLinkIdx=1)),DrawY=-4894,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-4952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_69"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
   InputLinks(0)=(DrawY=-5139,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5118,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5097,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30')),DrawY=-5118,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-5176
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_68"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_19
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6272
   ObjPosY=-4712
   ObjComment="Zed Gate 12"
   Name="SequenceFrameWrapped_19"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_35
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4514,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4492,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4470,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4448,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4426,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4498,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4442,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_35'),DrawX=-5623,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197'),LinkDesc="Door1",MinVars=0,DrawX=-5572,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-4552
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_35"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_35
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_10
      Name="InterpCurveEdSetup_10"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_15
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_15"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000244,Z=-304.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_0.InterpTrackAkEvent_15'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpCurveEdSetup_10'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-4352
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_35"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_65
   EventName="Open_Gate_12"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_70')),DrawY=-4574,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6133,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-4640
   ObjComment="Open_Gate_12"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_65"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_64
   EventName="Close_Gate_12"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_71',InputLinkIdx=1)),DrawY=-4358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6117,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-4424
   ObjComment="Close_Gate_12"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_64"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
   InputLinks(0)=(DrawY=-4387,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4366,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4345,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35',InputLinkIdx=1)),DrawY=-4366,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_189',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-4424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_71"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
   InputLinks(0)=(DrawY=-4611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4569,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35')),DrawY=-4590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_188',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166'),DrawX=-5930,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5879,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5830,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-4648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_70"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_20
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-4168
   ObjComment="Zed Gate 13"
   Name="SequenceFrameWrapped_20"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_36
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3970,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3948,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3926,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3904,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3882,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3954,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3898,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_36'),DrawX=-5615,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_202'),LinkDesc="Door1",MinVars=0,DrawX=-5564,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-4008
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_36"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_36
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_11
      Name="InterpCurveEdSetup_11"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_16
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_16"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000366,Z=-312.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpGroup_0.InterpTrackAkEvent_16'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpCurveEdSetup_11'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-3808
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_36"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_67
   EventName="Open_Gate_13"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72')),DrawY=-4030,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6125,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-4096
   ObjComment="Open_Gate_13"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_67"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_66
   EventName="Close_Gate_13"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73',InputLinkIdx=1)),DrawY=-3814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6109,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-3880
   ObjComment="Close_Gate_13"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_66"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
   InputLinks(0)=(DrawY=-3843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36',InputLinkIdx=1)),DrawY=-3822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172'),DrawX=-5922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-3880
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_73"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
   InputLinks(0)=(DrawY=-4067,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4046,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4025,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36')),DrawY=-4046,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171'),DrawX=-5922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-4104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_72"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_21
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-3632
   ObjComment="Zed Gate 14"
   Name="SequenceFrameWrapped_21"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_37
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3434,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3412,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3390,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3368,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3346,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3418,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3362,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_37'),DrawX=-5615,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208'),LinkDesc="Door1",MinVars=0,DrawX=-5564,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-3472
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_37"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_37
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_12
      Name="InterpCurveEdSetup_12"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_17
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_17"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=-280.000214,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpGroup_0.InterpTrackAkEvent_17'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpCurveEdSetup_12'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-3272
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_37"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_69
   EventName="Open_Gate_14"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_74')),DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6125,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-3560
   ObjComment="Open_Gate_14"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_69"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_68
   EventName="Close_Gate_14"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75',InputLinkIdx=1)),DrawY=-3278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6109,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-3344
   ObjComment="Close_Gate_14"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_68"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
   InputLinks(0)=(DrawY=-3307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3265,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37',InputLinkIdx=1)),DrawY=-3286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_206',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177'),DrawX=-5922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-3344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_75"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
   InputLinks(0)=(DrawY=-3531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3489,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37')),DrawY=-3510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176'),DrawX=-5922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-3568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_74"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_9
   SizeX=826
   SizeY=513
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-3072
   ObjComment="Zed Gate 15"
   Name="SequenceFrameWrapped_9"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2874,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2852,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2830,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2808,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2786,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2858,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2802,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=-5615,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240'),LinkDesc="Door1",MinVars=0,DrawX=-5564,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-2912
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_13
      Name="InterpCurveEdSetup_13"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_18
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_18"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=-0.000305,Z=-312.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0.InterpTrackAkEvent_18'
      GroupName="Door1"
      GroupColor=(B=224,G=0,R=79,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_13'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-2712
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_34
   EventName="Open_Gate_15"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51')),DrawY=-2934,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6125,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-3000
   ObjComment="Open_Gate_15"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_34"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_35
   EventName="Close_Gate_15"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_52',InputLinkIdx=1)),DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6109,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-2784
   ObjComment="Close_Gate_15"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_35"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_52
   InputLinks(0)=(DrawY=-2747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2705,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=1)),DrawY=-2726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179'),DrawX=-5922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-2784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_52"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
   InputLinks(0)=(DrawY=-2971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2929,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-2950,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_178'),DrawX=-5922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-3008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_51"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-6656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-6128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-5904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-5360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=-6512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-5440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-5048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-4824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_187
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-4904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_187"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_188
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-4520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_188"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-4296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-4376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-3976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-3752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_202
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-3832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_202"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-3440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_206
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-3216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_206"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-3296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-2880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=KFSpawnVolume'KF-DieSector.TheWorld:PersistentLevel.KFSpawnVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-2656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_46
   EventName="Open_Gate_15"
   InputLinks(0)=(DrawY=354,OverrideDelta=11)
   OutputLinks(0)=(DrawY=354,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=320
   ObjComment="Open_Gate_15"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_46"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_83
   EventName="Open_Gate_14"
   InputLinks(0)=(DrawY=258,OverrideDelta=11)
   OutputLinks(0)=(DrawY=258,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=224
   ObjComment="Open_Gate_14"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_83"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="Open_Gate_13"
   InputLinks(0)=(DrawY=-1558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-1592
   ObjComment="Open_Gate_13"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="Open_Gate_12"
   InputLinks(0)=(DrawY=-1646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-1680
   ObjComment="Open_Gate_12"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_66
   EventName="Open_Gate_11"
   InputLinks(0)=(DrawY=-1750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1750,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-1784
   ObjComment="Open_Gate_11"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_66"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_131
   EventName="Open_Gate_10"
   InputLinks(0)=(DrawY=-2886,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-2920
   ObjComment="Open_Gate_10"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_131"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_132
   EventName="Open_Gate_09"
   InputLinks(0)=(DrawY=-2966,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2966,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-3000
   ObjComment="Open_Gate_09"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_132"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_133
   EventName="Open_Gate_08"
   InputLinks(0)=(DrawY=-3054,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-3088
   ObjComment="Open_Gate_08"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_133"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_56
   EventName="Close_Gate_03"
   InputLinks(0)=(DrawY=-2086,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4926,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-2120
   ObjComment="Close_Gate_03"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_56"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_50
   EventName="Close_Gate_02"
   InputLinks(0)=(DrawY=-2182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2182,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4934,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5072
   ObjPosY=-2216
   ObjComment="Close_Gate_02"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_50"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_48
   EventName="Close_Gate_01"
   InputLinks(0)=(DrawY=-2278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4934,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5072
   ObjPosY=-2312
   ObjComment="Close_Gate_01"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_48"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_44
   EventName="Close_Gate_15"
   InputLinks(0)=(DrawY=-1006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1006,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4910,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5048
   ObjPosY=-1040
   ObjComment="Close_Gate_15"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_44"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_82
   EventName="Close_Gate_14"
   InputLinks(0)=(DrawY=-1086,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4910,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5048
   ObjPosY=-1120
   ObjComment="Close_Gate_14"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_82"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_80
   EventName="Close_Gate_13"
   InputLinks(0)=(DrawY=-1166,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4910,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5048
   ObjPosY=-1200
   ObjComment="Close_Gate_13"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_80"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_78
   EventName="Close_Gate_12"
   InputLinks(0)=(DrawY=-1246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4918,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-1280
   ObjComment="Close_Gate_12"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_78"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_76
   EventName="Close_Gate_11"
   InputLinks(0)=(DrawY=-1334,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1334,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4918,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-1368
   ObjComment="Close_Gate_11"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_76"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_74
   EventName="Close_Gate_10"
   InputLinks(0)=(DrawY=-1414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4918,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-1448
   ObjComment="Close_Gate_10"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_74"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_72
   EventName="Close_Gate_09"
   InputLinks(0)=(DrawY=-1510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4918,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-1544
   ObjComment="Close_Gate_09"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_72"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_70
   EventName="Close_Gate_08"
   InputLinks(0)=(DrawY=-1606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4926,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-1640
   ObjComment="Close_Gate_08"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_70"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_69
   EventName="Close_Gate_07"
   InputLinks(0)=(DrawY=-1702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4918,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-1736
   ObjComment="Close_Gate_07"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_69"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_61
   EventName="Close_Gate_06"
   InputLinks(0)=(DrawY=-1798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4926,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-1832
   ObjComment="Close_Gate_06"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_61"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_52
   EventName="Close_Gate_05"
   InputLinks(0)=(DrawY=-1894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4926,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-1928
   ObjComment="Close_Gate_05"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_52"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_57
   EventName="Close_Gate_04"
   InputLinks(0)=(DrawY=-1990,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4926,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-2024
   ObjComment="Close_Gate_04"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_57"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_3
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_50'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_56'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_57'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_52'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_61'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_69'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_70'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_72'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_74'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_76'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_78'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_80'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_82'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_44'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_48')),DrawY=-1652,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_50'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_56'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_57'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_52'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_61'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_69'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_70'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_72'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_74'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_76'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_78'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_80'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_82'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_44'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_48')),DrawY=-1632,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-5709,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5648,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-5567,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-1720
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_3"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_117
   EventName="Open_Gate_05"
   InputLinks(0)=(DrawY=-5366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5366,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5400
   ObjComment="Open_Gate_05"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_117"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_118
   EventName="Open_Gate_07"
   InputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5304
   ObjComment="Open_Gate_07"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_118"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_119
   EventName="Open_Gate_03"
   InputLinks(0)=(DrawY=-5462,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5496
   ObjComment="Open_Gate_03"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_119"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_120
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-5558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5592
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_120"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_47
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-4766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9047,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-4800
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_47"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_51
   EventName="Open_Gate_03"
   InputLinks(0)=(DrawY=-4678,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4678,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9047,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-4712
   ObjComment="Open_Gate_03"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_51"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_121
   EventName="Open_Gate_07"
   InputLinks(0)=(DrawY=-4326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9047,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-4360
   ObjComment="Open_Gate_07"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_121"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_122
   EventName="Open_Gate_05"
   InputLinks(0)=(DrawY=-4494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9047,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-4528
   ObjComment="Open_Gate_05"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_122"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_123
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-4406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9055,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-4440
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_123"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_124
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-4590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9047,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-4624
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_124"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_126
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-3894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9023,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-3928
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_126"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_127
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-3806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9023,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-3840
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_127"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_190
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-3998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9023,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-4032
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_190"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_191
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-3470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-3504
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_191"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_135
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-3198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-3232
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_135"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_136
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-3286,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-3320
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_136"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_141
   EventName="Wave_8"
   InputLinks(0)=(DrawY=-7118,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8493,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=-7152
   ObjComment="Wave_8"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_141"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_46
   EventName="Wave_7"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_66'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_193'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_67'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_92'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_93'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_138'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_139'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_140')),DrawY=-2014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9699,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-2080
   ObjComment="Wave_7"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_46"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_137
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9063,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-3408
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_137"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_67
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-2334,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2334,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9071,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-2368
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_67"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_92
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-2246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-2280
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_92"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_93
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-2158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2158,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-2192
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_93"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_193
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-2430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-2464
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_193"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_138
   EventName="Open_Gate_08"
   InputLinks(0)=(DrawY=-2014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-2048
   ObjComment="Open_Gate_08"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_138"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_139
   EventName="Open_Gate_09"
   InputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-1960
   ObjComment="Open_Gate_09"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_139"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_140
   EventName="Open_Gate_10"
   InputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-1880
   ObjComment="Open_Gate_10"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_140"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_9
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-6438,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6438,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244'),DrawX=5281,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=-6472
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_9"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5248
   ObjPosY=-6392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_188'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5328
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_302'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5408
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_10
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-4638,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=5281,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=-4672
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_10"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_149'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5176
   ObjPosY=-4568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_261'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5256
   ObjPosY=-4576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_312'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5336
   ObjPosY=-4568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ModifyProperty Name=SeqAct_ModifyProperty_2
   Properties(0)=(PropertyName="ExtraCost",bModifyProperty=True,PropertyValue="0")
   InputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_266',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=5961,OverrideDelta=35)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5904
   ObjPosY=-3528
   ObjComment="Set path Cost at 0"
   DrawWidth=114
   DrawHeight=61
   Name="SeqAct_ModifyProperty_2"
   ObjectArchetype=SeqAct_ModifyProperty'GameFramework.Default__SeqAct_ModifyProperty'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
   EventName="Bollards_Open_3"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ModifyProperty'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ModifyProperty_2'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=1)),DrawY=-3334,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5568,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5456
   ObjPosY=-3400
   ObjComment="Bollards_Open_3"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_17"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5728
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3736
   ObjPosY=-6648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-4403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),DrawX=-3754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3792
   ObjPosY=-4440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_18
   InputLinks(0)=(DrawY=-4378,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-4388,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4368,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_49'),DrawX=-4011,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3961,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-4424
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_18"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_49
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_7"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-4296
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_49"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_37
   VarName="Portal_7"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-4368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_37"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_18')),DrawY=-4347,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4326,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4305,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4226,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4312
   ObjPosY=-4416
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3784
   ObjPosY=-4048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_50
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_7"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=680
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_50"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=-6352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4744
   ObjPosY=-6352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_13
   InputLinks(0)=(DrawY=-6218,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6196,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6174,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6152,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6130,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6202,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6146,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_13'),DrawX=4655,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),LinkDesc="Bottom",MinVars=0,DrawX=4710,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),LinkDesc="Top",MinVars=0,DrawX=4762,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4624
   ObjPosY=-6256
   ObjComment="Right Front Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_13"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_13
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=-6080
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_13"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_14
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4568
   ObjPosY=-5800
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   InputLinks(0)=(DrawY=-5938,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5916,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5894,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5872,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5850,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5922,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5866,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=4647,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),LinkDesc="Bottom",MinVars=0,DrawX=4702,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),LinkDesc="Top",MinVars=0,DrawX=4754,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=-5976
   ObjComment="Right Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_15
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4568
   ObjPosY=-5536
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_15"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_29
   InputLinks(0)=(DrawY=-5674,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5652,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5630,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5608,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5586,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5658,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5602,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_15'),DrawX=4647,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),LinkDesc="Bottom",MinVars=0,DrawX=4702,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52'),LinkDesc="Top",MinVars=0,DrawX=4754,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=-5712
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_29"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=-6080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4672
   ObjPosY=-6080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4720
   ObjPosY=-5800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4664
   ObjPosY=-5800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4720
   ObjPosY=-5536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4664
   ObjPosY=-5536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_22
   SizeX=2928
   SizeY=1804
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-6800
   ObjComment="Phase 1"
   Name="SequenceFrameWrapped_22"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=3771
   SizeY=5470
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-3960
   ObjComment="Phase 3"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_31
   InputLinks(0)=(DrawY=-4210,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4188,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4166,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4144,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4122,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4194,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4138,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_29'),DrawX=4567,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),LinkDesc="Bottom",MinVars=0,DrawX=4622,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Top",MinVars=0,DrawX=4674,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=-4248
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_31"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_29
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4488
   ObjPosY=-4072
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_29"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=-4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4584
   ObjPosY=-4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_38
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4504
   ObjPosY=-4664
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_38"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_39
   InputLinks(0)=(DrawY=-4802,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4780,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4758,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4736,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4714,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4786,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4730,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_38'),DrawX=4575,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),LinkDesc="Bottom",MinVars=0,DrawX=4630,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),LinkDesc="Top",MinVars=0,DrawX=4682,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=-4840
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_39"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=-4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4600
   ObjPosY=-4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-4490,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4468,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4446,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4424,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4402,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4474,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4418,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=4559,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),LinkDesc="Bottom",MinVars=0,DrawX=4614,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),LinkDesc="Top",MinVars=0,DrawX=4666,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=-4528
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4480
   ObjPosY=-4352
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=-4352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=-4352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_40
   InputLinks(0)=(DrawY=-2538,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2516,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2494,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2472,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2450,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2522,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2466,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_39'),DrawX=5007,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),LinkDesc="Bottom",MinVars=0,DrawX=5062,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_406'),LinkDesc="Top",MinVars=0,DrawX=5114,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4976
   ObjPosY=-2576
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_40"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_39
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_6
      Name="InterpCurveEdSetup_6"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpCurveEdSetup_6'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4928
   ObjPosY=-2400
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_39"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_40
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_5
      Name="InterpCurveEdSetup_5"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpCurveEdSetup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=-2032
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_40"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_41
   InputLinks(0)=(DrawY=-2170,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2148,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2126,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2104,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2082,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2154,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2098,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_40'),DrawX=4975,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),LinkDesc="Bottom",MinVars=0,DrawX=5030,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),LinkDesc="Top",MinVars=0,DrawX=5082,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=-2208
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_41"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_42
   InputLinks(0)=(DrawY=-2866,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2844,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2800,OverrideDelta=81)
   InputLinks(3)=(DrawY=-2822,OverrideDelta=59)
   InputLinks(4)=(DrawY=-2778,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2850,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2794,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_41'),DrawX=5023,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),LinkDesc="Bottom",MinVars=0,DrawX=5078,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_404'),LinkDesc="Top",MinVars=0,DrawX=5130,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4992
   ObjPosY=-2904
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_42"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_41
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_7
      Name="InterpCurveEdSetup_7"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpCurveEdSetup_7'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=-2720
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_41"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_42
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_4
      Name="InterpCurveEdSetup_4"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpCurveEdSetup_4'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4992
   ObjPosY=-3408
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_42"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_43
   InputLinks(0)=(DrawY=-3546,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3524,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3502,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3480,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3458,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3530,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3474,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_42'),DrawX=5055,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),LinkDesc="Bottom",MinVars=0,DrawX=5110,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_402'),LinkDesc="Top",MinVars=0,DrawX=5162,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5024
   ObjPosY=-3584
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_43"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_31
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_8
      Name="InterpCurveEdSetup_8"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000244,Z=68.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpGroup_7.InterpTrackMove_0'
      GroupName="Bottom"
      GroupColor=(B=0,G=167,R=172,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=0.000000,Y=0.000183,Z=5.946991),ArriveTangent=(X=0.000000,Y=0.001220,Z=104.737106),LeaveTangent=(X=0.000000,Y=0.001220,Z=104.737106),InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=0.000000,Y=0.000305,Z=24.123016),ArriveTangent=(X=0.000000,Y=0.001220,Z=188.935532),LeaveTangent=(X=0.000000,Y=0.001220,Z=188.935532),InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,OutVal=(X=0.000000,Y=0.000427,Z=43.734100),ArriveTangent=(X=0.000000,Y=0.001525,Z=185.578918),LeaveTangent=(X=0.000000,Y=0.001525,Z=185.578918),InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,OutVal=(X=0.000000,Y=0.000610,Z=61.238800),ArriveTangent=(X=0.000000,Y=0.000000,Z=103.603287),LeaveTangent=(X=0.000000,Y=0.000000,Z=103.603287),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000549,Z=67.196594),ArriveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),LeaveTangent=(X=0.000000,Y=-0.000381,Z=73.790337),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=0.000305,Z=192.000092),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped),(InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.400000,InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.100000),(Time=0.200000),(Time=0.300000),(Time=0.400000),(Time=0.500000),(Time=1.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpGroup_8.InterpTrackMove_1'
      GroupName="Top"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.200000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpCurveEdSetup_8'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4960
   ObjPosY=-3048
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_31"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_38
   InputLinks(0)=(DrawY=-3186,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3164,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3142,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3120,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3098,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3170,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3114,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_31'),DrawX=5031,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),LinkDesc="Bottom",MinVars=0,DrawX=5086,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),LinkDesc="Top",MinVars=0,DrawX=5138,OverrideDelta=126)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5000
   ObjPosY=-3224
   ObjComment="Left Back Poles"
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_38"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_406
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5080
   ObjPosY=-2400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_406"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5024
   ObjPosY=-2400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5048
   ObjPosY=-2032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4992
   ObjPosY=-2032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_404
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5096
   ObjPosY=-2720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_404"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5040
   ObjPosY=-2720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5104
   ObjPosY=-3040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5056
   ObjPosY=-3040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_402
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5136
   ObjPosY=-3408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_402"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5080
   ObjPosY=-3408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_11
   Duration=1.500000
   InputLinks(0)=(DrawY=-4499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4457,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=-4494,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4462,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2108,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-4536
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_11"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=InterpData Name=InterpData_24
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.050000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Intro')
         AkEvents(1)=(Time=1.500000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Loop')
         AkEvents(2)=(Time=13.900001,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Outro')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RobotArmShoot_Intro",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=1.500000,AnimSeqName="RobotArmShoot_Loop",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=13.900001,AnimSeqName="RobotArmShoot_Outro",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_0.InterpTrackAnimControl_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Arm"
      GroupColor=(B=0,G=149,R=188,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.500000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.500000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2648
   ObjPosY=-3736
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_24"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_21
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3898,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3876,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3854,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3832,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3810,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3882,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3826,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_24'),DrawX=-2592,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),LinkDesc="Arm",MinVars=0,DrawX=-2548,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2648
   ObjPosY=-3936
   ObjComment="Arm Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_21"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSkeletalMeshActor'KF-DieSector.TheWorld:PersistentLevel.KFSkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2584
   ObjPosY=-3760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_12
   Duration=1.500000
   InputLinks(0)=(DrawY=-6147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6105,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-6142,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6110,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2052,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=-6184
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_12"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-9264
   ObjComment="Arm 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-9256
   ObjComment="Arm 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_15
   Duration=1.500000
   InputLinks(0)=(DrawY=-2995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2953,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-2990,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2958,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2060,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-3032
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_15"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_308
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1928
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_308"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1832
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFSkeletalMeshActor'KF-DieSector.TheWorld:PersistentLevel.KFSkeletalMeshActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-5224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFSkeletalMeshActor'KF-DieSector.TheWorld:PersistentLevel.KFSkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-2200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1984
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5752
   ObjPosY=-2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5992
   ObjPosY=-2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_22
   bLooping=True
   InputLinks(0)=(DrawY=-5858,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5836,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5814,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5792,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5770,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5842,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5786,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_26'),DrawX=648,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245'),LinkDesc="Arm",MinVars=0,DrawX=692,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=-5896
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_22"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_26
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Time=0.046662,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_V1')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RobotArm_V1",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpGroup_0.InterpTrackAnimControl_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpGroup_0.InterpTrackAkEvent_2'
      GroupName="Arm"
      GroupColor=(B=0,G=161,R=178,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=12.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=-5696
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_26"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_44
   bLooping=True
   InputLinks(0)=(DrawY=-5090,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5068,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5046,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5024,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5002,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5074,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5018,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_44'),DrawX=600,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249'),LinkDesc="Arm",MinVars=0,DrawX=644,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=544
   ObjPosY=-5128
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_44"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_44
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.038885,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_V2')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RobotArm_V2",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpGroup_0.InterpTrackAnimControl_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Arm"
      GroupColor=(B=0,G=161,R=178,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=12.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=544
   ObjPosY=-4928
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_44"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-4552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=-5304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-9264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-9256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-9256
   ObjComment="Arm 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_309
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-5048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_309"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-4824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-4512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-3968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-3744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-3440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=-3216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5864
   ObjPosY=-6648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-6424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-6120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5864
   ObjPosY=-5896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-5568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5864
   ObjPosY=-5352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5880
   ObjPosY=-5040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5864
   ObjPosY=-4816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-4512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-3968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-3744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-3432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5840
   ObjPosY=-3200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-2872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5848
   ObjPosY=-2648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8840
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8736
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8640
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8440
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8240
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_205
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_205"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8040
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7936
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7840
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7736
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_75
   EventName="Open_Gate_10"
   InputLinks(0)=(DrawY=-246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-280
   ObjComment="Open_Gate_10"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_75"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_73
   EventName="Open_Gate_09"
   InputLinks(0)=(DrawY=-326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-360
   ObjComment="Open_Gate_09"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_73"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_71
   EventName="Open_Gate_08"
   InputLinks(0)=(DrawY=-414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-448
   ObjComment="Open_Gate_08"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_71"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_130
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-864
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_130"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_60
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-592
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_60"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_125
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-680
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_125"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_54
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9079,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-768
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_54"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_77
   EventName="Open_Gate_11"
   InputLinks(0)=(DrawY=-150,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-184
   ObjComment="Open_Gate_11"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_77"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_79
   EventName="Open_Gate_12"
   InputLinks(0)=(DrawY=-46,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-46,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9087,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-80
   ObjComment="Open_Gate_12"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_79"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_81
   EventName="Open_Gate_13"
   InputLinks(0)=(DrawY=34,OverrideDelta=11)
   OutputLinks(0)=(DrawY=34,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjComment="Open_Gate_13"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_81"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_24
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2338,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2316,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2294,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2272,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2250,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2322,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2266,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_25'),DrawX=-2552,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),LinkDesc="Arm",MinVars=0,DrawX=-2508,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2608
   ObjPosY=-2376
   ObjComment="Arm Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_24"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_25
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=0.050000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Intro')
         AkEvents(1)=(Time=1.500000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Loop')
         AkEvents(2)=(Time=13.900001,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Outro')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RobotArmShoot_Intro",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=1.500000,AnimSeqName="RobotArmShoot_Loop",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=13.900001,AnimSeqName="RobotArmShoot_Outro",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_0.InterpTrackAnimControl_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_0.InterpTrackAkEvent_1'
      GroupName="Arm"
      GroupColor=(B=0,G=149,R=188,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.500000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.500000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2616
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_25"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_26
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5370,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5348,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5326,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5304,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5282,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5354,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5298,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=-2528,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),LinkDesc="Arm",MinVars=0,DrawX=-2484,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2584
   ObjPosY=-5408
   ObjComment="Arm Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_26"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.030136,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Intro')
         AkEvents(1)=(Time=1.506805,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Loop')
         AkEvents(2)=(Time=13.900001,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Shoot_Outro')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RobotArmShoot_Intro",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=1.500000,AnimSeqName="RobotArmShoot_Loop",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=13.900001,AnimSeqName="RobotArmShoot_Outro",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackAnimControl_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Arm"
      GroupColor=(B=0,G=149,R=188,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.500000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.500000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2592
   ObjPosY=-5224
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_0
   ValueB=1
   InputLinks(0)=(DrawY=-7206,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-7250,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-7228,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-7206,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-7184,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_59')),DrawY=-7162,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_8'),DrawX=-9167,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_7'),DrawX=-9142,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-7288
   ObjComment="Wave 9 and beyond"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_0"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_7
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-7064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_7"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_59
   EventName="Wave_9"
   InputLinks(0)=(DrawY=-6958,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6958,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8517,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-6992
   ObjComment="Wave_9"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_59"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_70
   EventName="Wave_9"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9683,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9768
   ObjPosY=1024
   ObjComment="Wave_9"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_70"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_29
   EventName="Off_Arm_Center_03"
   MaxWidth=246
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47',InputLinkIdx=1)),DrawY=-4006,OverrideDelta=11)
   VariableLinks(0)=(DrawX=99,OverrideDelta=91)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=-4072
   ObjComment="Off_Arm_Center_03"
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_29"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
   EventName="Off_Arm_Center_03"
   InputLinks(0)=(DrawY=-6038,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6038,OverrideDelta=11)
   VariableLinks(0)=(DrawX=633,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=480
   ObjPosY=-6072
   ObjComment="Off_Arm_Center_03"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_18"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6144
   ObjPosY=-4128
   ObjComment="Boss"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7112
   ObjPosY=-6792
   ObjComment="Boss"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=-4672
   ObjComment="Boss"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=3
   bLooping=True
   InputLinks(0)=(DrawY=1090,OverrideDelta=19)
   InputLinks(1)=(DrawY=1122,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_170')),DrawY=1085,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_183')),LinkDesc="Link 2",DrawY=1106,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_116')),LinkDesc="Link 3",DrawY=1127,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9484,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9528
   ObjPosY=1048
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_88
   EventName="Open_Gate_15"
   InputLinks(0)=(DrawY=-1470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-1504
   ObjComment="Open_Gate_15"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_88"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_87
   EventName="Open_Gate_14"
   InputLinks(0)=(DrawY=-1550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1550,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-1584
   ObjComment="Open_Gate_14"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_87"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_86
   EventName="Open_Gate_13"
   InputLinks(0)=(DrawY=-1638,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6103,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-1672
   ObjComment="Open_Gate_13"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_86"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_85
   EventName="Open_Gate_12"
   InputLinks(0)=(DrawY=-1718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6103,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-1752
   ObjComment="Open_Gate_12"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_85"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_84
   EventName="Open_Gate_11"
   InputLinks(0)=(DrawY=-1798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6103,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-1832
   ObjComment="Open_Gate_11"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_84"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_91
   EventName="Open_Gate_10"
   InputLinks(0)=(DrawY=-1870,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1870,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6111,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-1904
   ObjComment="Open_Gate_10"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_91"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_90
   EventName="Open_Gate_09"
   InputLinks(0)=(DrawY=-1950,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1950,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6111,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-1984
   ObjComment="Open_Gate_09"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_90"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_89
   EventName="Open_Gate_08"
   InputLinks(0)=(DrawY=-2022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6111,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-2056
   ObjComment="Open_Gate_08"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_89"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_169
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-2190,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2190,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6575,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6712
   ObjPosY=-2224
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_169"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_68
   EventName="Open_Gate_07"
   InputLinks(0)=(DrawY=-2022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-2056
   ObjComment="Open_Gate_07"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_68"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_42
   EventName="Open_Gate_05"
   InputLinks(0)=(DrawY=-2102,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2102,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6583,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=-2136
   ObjComment="Open_Gate_05"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_42"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_33
   EventName="Open_Gate_03"
   InputLinks(0)=(DrawY=-1078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-1112
   ObjComment="Open_Gate_03"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_33"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_171
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=-1158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1158,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-1192
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_171"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_172
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-1254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-1288
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_172"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_173
   EventName="Open_Gate_07"
   InputLinks(0)=(DrawY=-742,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-742,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-776
   ObjComment="Open_Gate_07"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_173"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_174
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=-830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-864
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_174"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_175
   EventName="Open_Gate_05"
   InputLinks(0)=(DrawY=-910,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-910,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-944
   ObjComment="Open_Gate_05"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_175"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_176
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=-998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-1032
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_176"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_177
   EventName="Open_Gate_14"
   InputLinks(0)=(DrawY=-158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-158,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-192
   ObjComment="Open_Gate_14"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_177"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_178
   EventName="Open_Gate_13"
   InputLinks(0)=(DrawY=-238,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6271,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6408
   ObjPosY=-272
   ObjComment="Open_Gate_13"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_178"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_179
   EventName="Open_Gate_12"
   InputLinks(0)=(DrawY=-326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-360
   ObjComment="Open_Gate_12"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_179"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_180
   EventName="Open_Gate_10"
   InputLinks(0)=(DrawY=-414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-448
   ObjComment="Open_Gate_10"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_180"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_181
   EventName="Open_Gate_09"
   InputLinks(0)=(DrawY=-502,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6271,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6408
   ObjPosY=-536
   ObjComment="Open_Gate_09"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_181"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_182
   EventName="Open_Gate_08"
   InputLinks(0)=(DrawY=-598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-598,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-632
   ObjComment="Open_Gate_08"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_182"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_73
   EventName="Gate_Group_1"
   MaxWidth=210
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_169'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_42'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_68'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_89'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_90'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_91'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_84'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_85'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_86'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_87'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_88'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_94')),DrawY=-1638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7095,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-1704
   ObjComment="Gate_Group_1"
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_73"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_170
   EventName="Gate_Group_1"
   InputLinks(0)=(DrawY=986,OverrideDelta=11)
   OutputLinks(0)=(DrawY=986,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9113,OverrideDelta=103)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=952
   ObjComment="Gate_Group_1"
   DrawWidth=271
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_170"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_183
   EventName="Gate_Group_2"
   InputLinks(0)=(DrawY=1162,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1162,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9121,OverrideDelta=103)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9256
   ObjPosY=1128
   ObjComment="Gate_Group_2"
   DrawWidth=271
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_183"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_74
   EventName="Gate_Group_2"
   MaxWidth=210
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_172'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_171'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_33'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_176'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_175'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_174'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_173'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_177'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_178'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_179'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_180'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_181'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_182')),DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6975,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-712
   ObjComment="Gate_Group_2"
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_74"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=1285
   SizeY=1242
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=-1328
   ObjComment="Lower spawns more"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_24
   SizeX=1335
   SizeY=960
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-2368
   ObjComment="Upper spawns more"
   Name="SequenceFrameWrapped_24"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=999
   SizeY=3013
   bDrawBox=True
   FillColor=(B=104,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4504
   ObjPosY=-6904
   ObjComment="Portal Spawns"
   DrawWidth=999
   DrawHeight=3013
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=883
   SizeY=1337
   bDrawBox=True
   FillColor=(B=242,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-656
   ObjPosY=-9672
   ObjComment="Eyes"
   DrawWidth=883
   DrawHeight=1337
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2256
   ObjPosY=-9008
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_40"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_6
   ValueB=1
   InputLinks(0)=(DrawY=-9110,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-9154,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9132,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-9110,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_4')),DrawY=-9088,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-9066,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_40'),DrawX=-2183,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_9'),DrawX=-2158,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2216
   ObjPosY=-9192
   ObjComment="Make Sure Wave > 1"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_6"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_9
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-8992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_9"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_2
   LinkCount=3
   bLooping=True
   InputLinks(0)=(DrawY=-9006,OverrideDelta=19)
   InputLinks(1)=(DrawY=-8974,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),DrawY=-9011,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),LinkDesc="Link 2",DrawY=-8990,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_2')),LinkDesc="Link 3",DrawY=-8969,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-1884,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1928
   ObjPosY=-9048
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_2"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_30
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1064
   ObjPosY=-9000
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_30"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_16
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1184
   ObjPosY=-9016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_16"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_15
   InputLinks(0)=(DrawY=-9070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9070,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_16'),DrawX=-1118,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=-1062,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=-9104
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_15"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_2
   InputLinks(0)=(LinkDesc="In",DrawY=-9084,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9064,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_15')),DrawY=-9074,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_236'),PropertyName="Targets",DrawX=-1327,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1368
   ObjPosY=-9120
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_2"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
   ObjValue=KFTraderTrigger'KF-DieSector.TheWorld:PersistentLevel.KFTraderTrigger_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_236"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_32
   VarName="Trader 2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-960
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_32"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_22
   VarName="Trader 3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-968
   ObjPosY=-9080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_22"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=InterpData Name=InterpData_17
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_3
         AkEvents(0)=(Time=0.010000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Zed_Door')
         Name="InterpTrackAkEvent_3"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000244,Z=312.000153),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1.InterpTrackAkEvent_3'
      GroupName="Door1"
      GroupColor=(B=0,G=115,R=209,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1504
   ObjPosY=-7624
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_17"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_19
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-7786,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7764,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7742,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7720,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7698,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7770,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7714,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_17'),DrawX=-1447,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237'),LinkDesc="Door1",MinVars=0,DrawX=-1396,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1496
   ObjPosY=-7824
   ObjComment="Trader Door 3"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_19"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1416
   ObjPosY=-7624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_17
   InputLinks(0)=(DrawY=-8358,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-8358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_35'),DrawX=-2110,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_47'),DrawX=-2054,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-8392
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_17"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_35
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-8304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_35"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_47
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2056
   ObjPosY=-8288
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_47"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_36
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2264
   ObjPosY=-8288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_36"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_48
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2376
   ObjPosY=-8280
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_48"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_17
   InputLinks(0)=(DrawY=-8362,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_17')),DrawY=-8372,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8352,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_48'),DrawX=-2299,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_36'),DrawX=-2249,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2328
   ObjPosY=-8408
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_17"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_7
   InputLinks(0)=(DrawY=-8138,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_16')),DrawY=-8148,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8128,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_25'),DrawX=-2307,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_24'),DrawX=-2257,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=-8184
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_7"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_25
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=-8056
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_25"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_24
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2272
   ObjPosY=-8064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_24"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_31
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader 3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2056
   ObjPosY=-8072
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_31"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_27
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-8088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_27"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_16
   InputLinks(0)=(DrawY=-8142,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19')),DrawY=-8142,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_27'),DrawX=-2110,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=-2054,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-8176
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_16"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_25
   SizeX=1297
   SizeY=1450
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7176
   ObjPosY=-32
   ObjComment="All Spawns"
   Name="SequenceFrameWrapped_25"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_53
   EventName="Gate_Group_All"
   MaxWidth=217
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_115'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_154'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_155'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_152'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_45'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_153'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_150'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_149'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_148'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_184'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_145'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_144'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_185'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_146')),DrawY=698,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6980,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=632
   ObjComment="Gate_Group_All"
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_53"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_144
   EventName="Open_Gate_08"
   InputLinks(0)=(DrawY=746,OverrideDelta=11)
   OutputLinks(0)=(DrawY=746,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6287,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=712
   ObjComment="Open_Gate_08"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_144"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_145
   EventName="Open_Gate_09"
   InputLinks(0)=(DrawY=842,OverrideDelta=11)
   OutputLinks(0)=(DrawY=842,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=808
   ObjComment="Open_Gate_09"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_145"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_184
   EventName="Open_Gate_10"
   InputLinks(0)=(DrawY=930,OverrideDelta=11)
   OutputLinks(0)=(DrawY=930,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6287,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=896
   ObjComment="Open_Gate_10"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_184"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_148
   EventName="Open_Gate_12"
   InputLinks(0)=(DrawY=1098,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1098,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6287,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=1064
   ObjComment="Open_Gate_12"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_148"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_149
   EventName="Open_Gate_13"
   InputLinks(0)=(DrawY=1186,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1186,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=1152
   ObjComment="Open_Gate_13"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_149"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_150
   EventName="Open_Gate_14"
   InputLinks(0)=(DrawY=1266,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1266,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6287,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=1232
   ObjComment="Open_Gate_14"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_150"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="Open_Gate_04"
   InputLinks(0)=(DrawY=346,OverrideDelta=11)
   OutputLinks(0)=(DrawY=346,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=312
   ObjComment="Open_Gate_04"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_152
   EventName="Open_Gate_05"
   InputLinks(0)=(DrawY=434,OverrideDelta=11)
   OutputLinks(0)=(DrawY=434,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=400
   ObjComment="Open_Gate_05"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_152"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_45
   EventName="Open_Gate_06"
   InputLinks(0)=(DrawY=514,OverrideDelta=11)
   OutputLinks(0)=(DrawY=514,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=480
   ObjComment="Open_Gate_06"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_45"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_153
   EventName="Open_Gate_07"
   InputLinks(0)=(DrawY=602,OverrideDelta=11)
   OutputLinks(0)=(DrawY=602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=568
   ObjComment="Open_Gate_07"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_153"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_115
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=90,OverrideDelta=11)
   OutputLinks(0)=(DrawY=90,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6591,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=56
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_115"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_154
   EventName="Open_Gate_02"
   InputLinks(0)=(DrawY=170,OverrideDelta=11)
   OutputLinks(0)=(DrawY=170,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=136
   ObjComment="Open_Gate_02"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_154"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_155
   EventName="Open_Gate_03"
   InputLinks(0)=(DrawY=258,OverrideDelta=11)
   OutputLinks(0)=(DrawY=258,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6599,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=224
   ObjComment="Open_Gate_03"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_155"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_116
   EventName="Gate_Group_All"
   InputLinks(0)=(DrawY=1338,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9109,OverrideDelta=107)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=1304
   ObjComment="Gate_Group_All"
   DrawWidth=278
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_116"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_185
   EventName="Open_Gate_11"
   InputLinks(0)=(DrawY=1010,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1010,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6287,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=976
   ObjComment="Open_Gate_11"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_185"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_146
   EventName="Open_Gate_15"
   InputLinks(0)=(DrawY=1346,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1346,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6279,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=1312
   ObjComment="Open_Gate_15"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_146"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3680
   ObjPosY=-6640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_7
   VarName="Portal_8"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_7"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_8"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4032
   ObjPosY=-4064
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_10
   InputLinks(0)=(DrawY=-4146,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-4156,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4136,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0'),DrawX=-4003,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3953,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4032
   ObjPosY=-4192
   ObjComment="Portal Ready?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_10"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-4171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4129,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4150,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239'),DrawX=-3754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3792
   ObjPosY=-4208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3784
   ObjPosY=-4296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_12
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Portal_8"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=688
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_12"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_266
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5896
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_266"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_180'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5984
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5808
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_184'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6056
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=KFPathnode'KF-DieSector.TheWorld:PersistentLevel.KFPathnode_271'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5160
   ObjPosY=-6392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_26
   SizeX=674
   SizeY=820
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=-6496
   ObjComment="Remove path cost and electricty at bollards for phase 1"
   Name="SequenceFrameWrapped_26"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_28
   SizeX=1110
   SizeY=1136
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5576
   ObjPosY=-6800
   ObjComment="Randomly closes a bollard set/Opens them all during trader"
   Name="SequenceFrameWrapped_28"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=KFSkeletalMeshActor'KF-DieSector.TheWorld:PersistentLevel.KFSkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=696
   ObjPosY=-5704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=KFSkeletalMeshActor'KF-DieSector.TheWorld:PersistentLevel.KFSkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-4952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_142
   EventName="On_Arm_Center_03"
   InputLinks(0)=(DrawY=-8926,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8926,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8160,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8008
   ObjPosY=-8960
   ObjComment="On_Arm_Center_03"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_142"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_32
   EventName="On_Arm_Center_02"
   InputLinks(0)=(DrawY=-8806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8184,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8032
   ObjPosY=-8840
   ObjComment="On_Arm_Center_02"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_32"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_40
   EventName="On_Arm_Center_01"
   InputLinks(0)=(DrawY=-9022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8184,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8032
   ObjPosY=-9056
   ObjComment="On_Arm_Center_01"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_40"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=0.015554,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_V3')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RobotArm_V3",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackAnimControl_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackAkEvent_1'
      GroupName="Arm"
      GroupColor=(B=0,G=161,R=178,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=6.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=6.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Arena_ANIM_ANIM.robotarm.ENV_Arena_RobotArm_Anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=-4080
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bLooping=True
   InputLinks(0)=(DrawY=-4234,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4212,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4190,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4168,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4146,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4218,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4162,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=728,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228'),LinkDesc="Arm",MinVars=0,DrawX=772,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=-4272
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=KFSkeletalMeshActor'KF-DieSector.TheWorld:PersistentLevel.KFSkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
   InputLinks(0)=(DrawY=-4051,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4030,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4009,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4030,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252'),DrawX=414,OverrideDelta=16)
   VariableLinks(1)=(DrawX=465,OverrideDelta=76)
   EventLinks(0)=(DrawX=514,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=-4088
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=-3952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_252"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_253
   ObjValue=PointLightMovable'KF-DieSector.TheWorld:PersistentLevel.PointLightMovable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-9256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_253"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_188
   EventName="On_Robot"
   InputLinks(0)=(DrawY=-974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8983,OverrideDelta=89)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-1008
   ObjComment="On_Robot"
   DrawWidth=242
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_188"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=801
   SizeY=599
   bDrawBox=True
   FillColor=(B=247,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=368
   ObjPosY=-9664
   ObjComment="Robot lights and FX"
   DrawWidth=801
   DrawHeight=599
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_27
   EventName="On_Robot"
   MaxWidth=181
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-9510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=538,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=-9576
   ObjComment="On_Robot"
   DrawWidth=110
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_27"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-9515,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9494,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9473,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9494,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_255',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_256',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_275',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=806,OverrideDelta=16)
   VariableLinks(1)=(DrawX=857,OverrideDelta=76)
   EventLinks(0)=(DrawX=906,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=-9552
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_254"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_255
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_255"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_256
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_256"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=960
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_257"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_260"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_262"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_267
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_267"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_268
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_268"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_269
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8840
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_269"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_270
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_270"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_271
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_271"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_272
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_272"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_273
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8432
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_273"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_274
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=656
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_274"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_275
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=744
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_275"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_276
   ObjValue=SpotLight'KF-DieSector.TheWorld:PersistentLevel.SpotLight_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_276"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_4
   InputLinks(0)=(DrawY=-5947,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5926,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5905,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5926,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_279'),DrawX=-866,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-815,OverrideDelta=76)
   EventLinks(0)=(DrawX=-766,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-904
   ObjPosY=-5984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_4"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_279
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=-5832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_279"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_277
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=-2424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_277"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_0
   InputLinks(0)=(DrawY=-2523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_277',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_313',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_314'),DrawX=454,OverrideDelta=16)
   VariableLinks(1)=(DrawX=505,OverrideDelta=76)
   EventLinks(0)=(DrawX=554,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=416
   ObjPosY=-2560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_0"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0')),DrawY=-2427,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2406,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2385,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=-2496
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_21
   InputLinks(0)=(DrawY=-6210,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-6220,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46')),DrawY=-6200,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_54'),DrawX=-1235,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1185,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1264
   ObjPosY=-6256
   ObjComment="Trader Time?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_21"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_54
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1272
   ObjPosY=-6152
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_54"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_36
   SizeX=732
   SizeY=1053
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=-3616
   ObjComment="Remove path cost and electricty at bollards for phase 3"
   Name="SequenceFrameWrapped_36"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_55
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1344
   ObjPosY=-4480
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_55"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_22
   InputLinks(0)=(DrawY=-4546,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-4556,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_77'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_78',InputLinkIdx=1)),DrawY=-4536,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_55'),DrawX=-1307,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1257,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1336
   ObjPosY=-4592
   ObjComment="Trader Time?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_22"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_3
   InputLinks(0)=(DrawY=-4195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4153,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4174,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_292'),DrawX=-842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-880
   ObjPosY=-4232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_3"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Trader_Time?"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-2896
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_13
   InputLinks(0)=(DrawY=-2962,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-2972,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_79'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80',InputLinkIdx=1)),DrawY=-2952,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36'),DrawX=-1291,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1241,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1320
   ObjPosY=-3008
   ObjComment="Trader Time?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_13"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_1
   InputLinks(0)=(DrawY=-2603,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2582,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2561,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2582,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_293'),DrawX=-954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-2640
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_1"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_283
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8400
   ObjPosY=-9368
   ObjComment="Console Lights"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_283"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-5715,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5694,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5673,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5694,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_284'),DrawX=-874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=-5752
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_284
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-904
   ObjPosY=-5616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_284"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=-6115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_285'),DrawX=-626,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-575,OverrideDelta=76)
   EventLinks(0)=(DrawX=-526,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-664
   ObjPosY=-6152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_285
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-664
   ObjPosY=-6024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_285"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
   InputLinks(0)=(DrawY=-2899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_286',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_288',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_290'),DrawX=1334,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1385,OverrideDelta=76)
   EventLinks(0)=(DrawX=1434,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1296
   ObjPosY=-2936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_50"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_286
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=-2808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_286"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
   InputLinks(0)=(DrawY=-3107,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3086,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3065,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3086,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_287',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_289',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_291'),DrawX=1342,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1393,OverrideDelta=76)
   EventLinks(0)=(DrawX=1442,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=-3144
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_76"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_287
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1312
   ObjPosY=-3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_287"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_4
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=-3220,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=-3200,OverrideDelta=33)
   VariableLinks(0)=(DrawX=923,OverrideDelta=16)
   VariableLinks(1)=(DrawX=984,OverrideDelta=86)
   VariableLinks(2)=(DrawX=1065,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=-3288
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_4"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_3
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76',InputLinkIdx=1)),DrawY=-2924,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76',InputLinkIdx=1)),DrawY=-2904,OverrideDelta=33)
   VariableLinks(0)=(DrawX=907,OverrideDelta=16)
   VariableLinks(1)=(DrawX=968,OverrideDelta=86)
   VariableLinks(2)=(DrawX=1049,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=-2992
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_3"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_288
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=-2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_288"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_289
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1384
   ObjPosY=-3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_289"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_290
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=-2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_290"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_291
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1472
   ObjPosY=-3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_291"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_292
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-880
   ObjPosY=-4112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_292"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_293
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-984
   ObjPosY=-2512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_293"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_77
   InputLinks(0)=(DrawY=-4499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_296'),DrawX=-834,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-783,OverrideDelta=76)
   EventLinks(0)=(DrawX=-734,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-872
   ObjPosY=-4536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_77"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_78
   InputLinks(0)=(DrawY=-3995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_297'),DrawX=-842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-880
   ObjPosY=-4032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_78"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_79
   InputLinks(0)=(DrawY=-2979,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2958,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2937,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2958,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_294'),DrawX=-722,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-671,OverrideDelta=76)
   EventLinks(0)=(DrawX=-622,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-760
   ObjPosY=-3016
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_79"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
   InputLinks(0)=(DrawY=-2403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_295'),DrawX=-962,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-911,OverrideDelta=76)
   EventLinks(0)=(DrawX=-862,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-2440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_80"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_294
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-760
   ObjPosY=-2888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_294"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_295
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_295"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_296
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-864
   ObjPosY=-4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_296"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_297
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-872
   ObjPosY=-3904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_297"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_298
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-9368
   ObjComment="Console Lights"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_298"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_299
   ObjValue=PointLight'KF-DieSector.TheWorld:PersistentLevel.PointLight_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-9368
   ObjComment="Console Lights"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_299"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_128
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-4886,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9047,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-4920
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_128"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_192
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-5654,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5654,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9095,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5688
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_192"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_134
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-6526,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9183,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-6560
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_134"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_94
   EventName="Open_Gate_01"
   InputLinks(0)=(DrawY=-2294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6575,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6712
   ObjPosY=-2328
   ObjComment="Open_Gate_01"
   DrawWidth=275
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_94"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=2944
   SizeY=959
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=-4952
   ObjComment="Phase 2"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
   InputLinks(0)=(DrawY=-8947,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8926,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8905,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-8926,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226'),DrawX=-218,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-167,OverrideDelta=76)
   EventLinks(0)=(DrawX=-118,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-256
   ObjPosY=-8984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_84"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_76
   EventName="Eye_On_03"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84')),DrawY=-8918,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-457,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-552
   ObjPosY=-8984
   ObjComment="Eye_On_03"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_76"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_4
         AkEvents(0)=(Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_01')
         AkEvents(1)=(Time=11.083333,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_05')
         Name="InterpTrackAkEvent_4"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_5
         AkEvents(0)=(Time=0.960000,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_02')
         Name="InterpTrackAkEvent_5"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_6
         AkEvents(0)=(Time=6.129231,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_03')
         Name="InterpTrackAkEvent_6"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_7
         AkEvents(0)=(Time=9.329230,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_B_04')
         Name="InterpTrackAkEvent_7"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000183,Z=-0.000366),ArriveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),LeaveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=0.000000,Y=0.000244,Z=-0.000488),ArriveTangent=(X=0.000000,Y=0.000046,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000046,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000366,Z=-0.000732),ArriveTangent=(X=0.000000,Y=0.000045,Z=-0.000089),LeaveTangent=(X=0.000000,Y=0.000045,Z=-0.000089),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=0.000427,Z=-0.000854),ArriveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=0.000000,Y=0.000549,Z=-0.001099),ArriveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000610,Z=-0.001221),ArriveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),LeaveTangent=(X=0.000000,Y=0.000096,Z=-0.000193),InterpMode=CIM_CurveAutoClamped),(InVal=9.900001,OutVal=(X=0.000000,Y=0.000732,Z=-0.001465),ArriveTangent=(X=0.000000,Y=0.000122,Z=-0.000244),LeaveTangent=(X=0.000000,Y=0.000122,Z=-0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=0.000000,Y=0.000854,Z=-0.001709),ArriveTangent=(X=0.000000,Y=0.000060,Z=-0.000119),LeaveTangent=(X=0.000000,Y=0.000060,Z=-0.000119),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000977,Z=-0.001953),ArriveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000061,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.001099,Z=-0.002197),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=42.736816,Y=-15.710449,Z=16.303711),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=42.736816,Y=-15.710449,Z=16.303711),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=35.288086,Y=29.948730,Z=-35.332031),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=35.288086,Y=29.948730,Z=-35.332031),InterpMode=CIM_CurveAutoClamped),(InVal=9.900001,OutVal=(X=20.258789,Y=15.556641,Z=-16.479492),ArriveTangent=(X=0.000000,Y=-0.158082,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.158082,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=42.758789,Y=15.490723,Z=-16.589355),ArriveTangent=(X=2.146105,Y=-0.107456,Z=0.000000),LeaveTangent=(X=2.146105,Y=-0.107456,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=44.956055,Y=-0.241699,Z=-0.329590),ArriveTangent=(X=0.000000,Y=-0.076571,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.076571,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=-0.043945,Y=-0.285645,Z=-0.351563),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=1.900000),(Time=5.000000),(Time=6.000000),(Time=8.000000),(Time=9.000000),(Time=9.900001),(Time=11.000000),(Time=14.000000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_4.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_4.InterpTrackAkEvent_4'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_4.InterpTrackAkEvent_5'
      InterpTracks(3)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_4.InterpTrackAkEvent_6'
      InterpTracks(4)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_4.InterpTrackAkEvent_7'
      GroupName="Eye_1"
      GroupColor=(B=0,G=176,R=163,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=16.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=16.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bLooping=True
   InputLinks(0)=(DrawY=-8946,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8924,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8902,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8880,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8858,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8930,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8874,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=48,OverrideDelta=33)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_278'),LinkDesc="Eye_1",MinVars=0,DrawX=100,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-8984
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-248
   ObjPosY=-8848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-9280
   ObjComment="Eye 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_278
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_278"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_31
   EventName="Eye_On_03"
   InputLinks(0)=(DrawY=-1238,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9082,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-1272
   ObjComment="Eye_On_03"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_31"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bLooping=True
   InputLinks(0)=(DrawY=-8634,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8612,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8590,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8568,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8546,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8618,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8562,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=48,OverrideDelta=33)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_282'),LinkDesc="Eye_1",MinVars=0,DrawX=100,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-8672
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_10
         AkEvents(0)=(Time=9.504918,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_C_04')
         Name="InterpTrackAkEvent_10"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_8
         AkEvents(0)=(Time=0.056831,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_C_01')
         Name="InterpTrackAkEvent_8"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_9
         AkEvents(0)=(Time=1.534426,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_C_02')
         AkEvents(1)=(Time=7.913661,Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ComputerOculus_C_03')
         Name="InterpTrackAkEvent_9"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=0.001465,Y=0.001709,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.001099,Y=0.001221,Z=0.000977),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.001831,Y=0.002197,Z=0.000977),ArriveTangent=(X=0.000488,Y=0.000732,Z=0.000000),LeaveTangent=(X=0.000488,Y=0.000732,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=0.002563,Y=0.003418,Z=0.001221),ArriveTangent=(X=0.001465,Y=0.002441,Z=0.000488),LeaveTangent=(X=0.001465,Y=0.002441,Z=0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.003296,Y=0.004639,Z=0.001465),ArriveTangent=(X=0.001221,Y=0.001953,Z=0.000326),LeaveTangent=(X=0.001221,Y=0.001953,Z=0.000326),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.004395,Y=0.006348,Z=0.001709),ArriveTangent=(X=0.000732,Y=0.001172,Z=0.000195),LeaveTangent=(X=0.000732,Y=0.001172,Z=0.000195),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=0.005127,Y=0.007568,Z=0.001953),ArriveTangent=(X=0.000419,Y=0.000558,Z=0.000000),LeaveTangent=(X=0.000419,Y=0.000558,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=0.005859,Y=0.008301,Z=0.001709),ArriveTangent=(X=0.000488,Y=0.000407,Z=-0.000244),LeaveTangent=(X=0.000488,Y=0.000407,Z=-0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=0.006592,Y=0.008789,Z=0.001221),ArriveTangent=(X=0.001172,Y=0.000782,Z=-0.000782),LeaveTangent=(X=0.001172,Y=0.000782,Z=-0.000782),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.009521,Y=0.010742,Z=-0.000732),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=9.733887,Y=-29.998169,Z=-35.266113),ArriveTangent=(X=0.000000,Y=-10.774476,Z=0.000000),LeaveTangent=(X=0.000000,Y=-10.774476,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-60.919189,Y=-44.027710,Z=11.189575),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.352518),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.352518),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=-58.359375,Y=-36.359253,Z=17.468262),ArriveTangent=(X=10.401790,Y=0.000000,Z=0.000000),LeaveTangent=(X=10.401790,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-44.555054,Y=-38.995972,Z=8.986816),ArriveTangent=(X=38.714462,Y=0.000000,Z=-23.809965),LeaveTangent=(X=38.714462,Y=0.000000,Z=-23.809965),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=10.876465,Y=-32.145996,Z=-25.169678),ArriveTangent=(X=0.000000,Y=11.992476,Z=0.000000),LeaveTangent=(X=0.000000,Y=11.992476,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=8.014526,Y=6.668701,Z=16.869507),ArriveTangent=(X=-3.912102,Y=8.926370,Z=0.000000),LeaveTangent=(X=-3.912102,Y=8.926370,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=-25.449829,Y=14.798584,Z=10.437012),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=-3.136597,Y=9.585571,Z=15.270996),ArriveTangent=(X=5.533845,Y=-6.161133,Z=0.000000),LeaveTangent=(X=5.533845,Y=-6.161133,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.324097,Y=-0.604248,Z=-1.411743),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=4.000000),(Time=4.500000),(Time=5.000000),(Time=6.000000),(Time=7.500000),(Time=9.500000),(Time=10.500000),(Time=12.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_4.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_4.InterpTrackAkEvent_8'
      InterpTracks(2)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_4.InterpTrackAkEvent_9'
      InterpTracks(3)=InterpTrackAkEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_4.InterpTrackAkEvent_10'
      GroupName="Eye_1"
      GroupColor=(B=0,G=176,R=163,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=13.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=13.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-8472
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_25
   EventName="Eye_On_04"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40')),DrawY=-8598,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-449,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-544
   ObjPosY=-8664
   ObjComment="Eye_On_04"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_25"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=-8627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8585,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-8606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_280'),DrawX=-210,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-159,OverrideDelta=76)
   EventLinks(0)=(DrawX=-110,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-248
   ObjPosY=-8664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_280
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-248
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_280"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_282
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=-8496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_282"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_300
   ObjValue=SpotLightMovable'KF-DieSector.TheWorld:PersistentLevel.SpotLightMovable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-9288
   ObjComment="Eye 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_300"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_195
   EventName="Eye_On_04"
   InputLinks(0)=(DrawY=-1158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1158,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9090,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-1192
   ObjComment="Eye_On_04"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_195"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_15
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5450,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5428,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5406,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5384,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5362,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5434,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5378,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_23'),DrawX=-2318,OverrideDelta=27)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_301'),LinkDesc="Flame_Damage",MinVars=0,DrawX=-2260,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-5488
   ObjComment="Damage Actor"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_15"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_23
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000122,Y=-0.000061,Z=0.000008),ArriveTangent=(X=0.000000,Y=-0.000087,Z=0.000007),LeaveTangent=(X=0.000000,Y=-0.000087,Z=0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-127.999512,Y=-40.000244,Z=0.000031),ArriveTangent=(X=-49.871815,Y=0.000000,Z=0.000011),LeaveTangent=(X=-49.871815,Y=0.000000,Z=0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-175.999268,Y=135.999634,Z=0.000046),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000015),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=-175.999023,Y=-64.000488,Z=0.000061),ArriveTangent=(X=0.000610,Y=0.000000,Z=0.000015),LeaveTangent=(X=0.000610,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=-95.999023,Y=95.999390,Z=0.000076),ArriveTangent=(X=85.333496,Y=0.000000,Z=0.000020),LeaveTangent=(X=85.333496,Y=0.000000,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=-47.998779,Y=-128.000732,Z=0.000092),ArriveTangent=(X=53.333660,Y=0.000000,Z=0.000020),LeaveTangent=(X=53.333660,Y=0.000000,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=-15.998535,Y=199.999146,Z=0.000107),ArriveTangent=(X=59.817657,Y=0.000000,Z=0.000015),LeaveTangent=(X=59.817657,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=104.001709,Y=7.999023,Z=0.000122),ArriveTangent=(X=148.000244,Y=0.000000,Z=0.000015),LeaveTangent=(X=148.000244,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=280.001953,Y=239.998901,Z=0.000137),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000010),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,OutVal=(X=32.002197,Y=-288.001282,Z=0.000153),ArriveTangent=(X=-45.394596,Y=0.000000,Z=0.000012),LeaveTangent=(X=-45.394596,Y=0.000000,Z=0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,OutVal=(X=16.002441,Y=15.998535,Z=0.000168),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=4.000000),(Time=5.000000),(Time=6.000000),(Time=7.000000),(Time=7.500000),(Time=8.500000),(Time=9.500000),(Time=10.500000),(Time=12.500000),(Time=13.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0.InterpTrackMove_0'
      GroupName="Flame_Damage"
      GroupColor=(B=143,G=192,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-5288
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_23"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_301
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2280
   ObjPosY=-5288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_301"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000122,Y=-0.000061,Z=0.000008),ArriveTangent=(X=0.000000,Y=-0.000087,Z=0.000007),LeaveTangent=(X=0.000000,Y=-0.000087,Z=0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-127.999512,Y=-40.000244,Z=0.000031),ArriveTangent=(X=-49.871815,Y=0.000000,Z=0.000011),LeaveTangent=(X=-49.871815,Y=0.000000,Z=0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-175.999268,Y=135.999634,Z=0.000046),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000015),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=-175.999023,Y=-64.000488,Z=0.000061),ArriveTangent=(X=0.000610,Y=0.000000,Z=0.000015),LeaveTangent=(X=0.000610,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=-95.999023,Y=95.999390,Z=0.000076),ArriveTangent=(X=85.333496,Y=0.000000,Z=0.000021),LeaveTangent=(X=85.333496,Y=0.000000,Z=0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=-47.998779,Y=-128.000732,Z=0.000092),ArriveTangent=(X=53.333660,Y=0.000000,Z=0.000021),LeaveTangent=(X=53.333660,Y=0.000000,Z=0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=-15.998535,Y=199.999146,Z=0.000107),ArriveTangent=(X=59.817657,Y=0.000000,Z=0.000015),LeaveTangent=(X=59.817657,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=104.001709,Y=7.999023,Z=0.000122),ArriveTangent=(X=148.000244,Y=0.000000,Z=0.000015),LeaveTangent=(X=148.000244,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=280.001953,Y=239.998901,Z=0.000137),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000010),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,OutVal=(X=32.002197,Y=-288.001282,Z=0.000153),ArriveTangent=(X=-45.394596,Y=0.000000,Z=0.000012),LeaveTangent=(X=-45.394596,Y=0.000000,Z=0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,OutVal=(X=16.002441,Y=15.998535,Z=0.000168),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=4.000000),(Time=5.000000),(Time=6.000000),(Time=7.000000),(Time=7.500000),(Time=8.500000),(Time=9.500000),(Time=10.500000),(Time=12.500000),(Time=13.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0.InterpTrackMove_0'
      GroupName="Flame_Damage"
      GroupColor=(B=143,G=192,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-2168
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2330,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2308,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2286,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2264,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2242,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2314,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2258,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=-2278,OverrideDelta=27)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_409'),LinkDesc="Flame_Damage",MinVars=0,DrawX=-2220,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-2368
   ObjComment="Damage Actor"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_409
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2256
   ObjPosY=-2176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_409"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1688
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_43
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000122,Y=-0.000061,Z=0.000008),ArriveTangent=(X=0.000000,Y=-0.000087,Z=0.000007),LeaveTangent=(X=0.000000,Y=-0.000087,Z=0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-127.999512,Y=-40.000244,Z=0.000031),ArriveTangent=(X=-49.871815,Y=0.000000,Z=0.000011),LeaveTangent=(X=-49.871815,Y=0.000000,Z=0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-175.999268,Y=135.999634,Z=0.000046),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000015),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=-175.999023,Y=-64.000488,Z=0.000061),ArriveTangent=(X=0.000610,Y=0.000000,Z=0.000015),LeaveTangent=(X=0.000610,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=-95.999023,Y=95.999390,Z=0.000076),ArriveTangent=(X=85.333496,Y=0.000000,Z=0.000021),LeaveTangent=(X=85.333496,Y=0.000000,Z=0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=-47.998779,Y=-128.000732,Z=0.000092),ArriveTangent=(X=53.333660,Y=0.000000,Z=0.000021),LeaveTangent=(X=53.333660,Y=0.000000,Z=0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=-15.998535,Y=199.999146,Z=0.000107),ArriveTangent=(X=59.817657,Y=0.000000,Z=0.000015),LeaveTangent=(X=59.817657,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=104.001709,Y=7.999023,Z=0.000122),ArriveTangent=(X=148.000244,Y=0.000000,Z=0.000015),LeaveTangent=(X=148.000244,Y=0.000000,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=280.001953,Y=239.998901,Z=0.000137),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000010),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,OutVal=(X=32.002197,Y=-288.001282,Z=0.000153),ArriveTangent=(X=-45.394596,Y=0.000000,Z=0.000012),LeaveTangent=(X=-45.394596,Y=0.000000,Z=0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,OutVal=(X=16.002441,Y=15.998535,Z=0.000168),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=4.000000),(Time=5.000000),(Time=6.000000),(Time=7.000000),(Time=7.500000),(Time=8.500000),(Time=9.500000),(Time=10.500000),(Time=12.500000),(Time=13.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_43.InterpGroup_0.InterpTrackMove_0'
      GroupName="Flame_Damage"
      GroupColor=(B=143,G=192,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_43.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_43.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-3768
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_43"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_25
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3930,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3908,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3886,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3864,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3842,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3914,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3858,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_43'),DrawX=-2350,OverrideDelta=27)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_408'),LinkDesc="Flame_Damage",MinVars=0,DrawX=-2292,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-3968
   ObjComment="Damage Actor"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_25"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_408
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-3776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_408"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_304
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=-5296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_304"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_45
   bLooping=True
   InputLinks(0)=(DrawY=-5562,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5540,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5518,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5496,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5474,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5546,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5490,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_45'),DrawX=650,OverrideDelta=27)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_410'),LinkDesc="Flame_Damage",MinVars=0,DrawX=708,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-5600
   ObjComment="Damage Actor"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_45"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_45
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=184.000000,Y=64.000023,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-104.000000,Y=-55.999954,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-24.000000,Y=-23.999954,Z=-0.000183),ArriveTangent=(X=0.000000,Y=64.000008,Z=-0.000122),LeaveTangent=(X=0.000000,Y=64.000008,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-88.000000,Y=8.000053,Z=-0.000244),ArriveTangent=(X=-192.000061,Y=100.960060,Z=-0.000122),LeaveTangent=(X=-192.000061,Y=100.960060,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-216.000061,Y=80.000076,Z=-0.000305),ArriveTangent=(X=-121.658020,Y=238.594666,Z=-0.000122),LeaveTangent=(X=-121.658020,Y=238.594666,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-248.000183,Y=264.000122,Z=-0.000366),ArriveTangent=(X=0.000000,Y=157.220276,Z=-0.000122),LeaveTangent=(X=0.000000,Y=157.220276,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=3.500000,OutVal=(X=-32.000244,Y=304.000183,Z=-0.000427),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000153),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-88.000244,Y=72.000275,Z=-0.000519),ArriveTangent=(X=-112.000000,Y=0.000000,Z=-0.000153),LeaveTangent=(X=-112.000000,Y=0.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=-144.000244,Y=120.000305,Z=-0.000580),ArriveTangent=(X=0.000000,Y=164.938599,Z=-0.000122),LeaveTangent=(X=0.000000,Y=164.938599,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-32.000244,Y=256.000366,Z=-0.000641),ArriveTangent=(X=168.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=168.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=5.500000,OutVal=(X=23.999756,Y=216.000427,Z=-0.000702),ArriveTangent=(X=0.000000,Y=-136.898849,Z=-0.000122),LeaveTangent=(X=0.000000,Y=-136.898849,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=-8.000244,Y=104.000473,Z=-0.000763),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,OutVal=(X=183.999756,Y=168.000519,Z=-0.000824),ArriveTangent=(X=0.000000,Y=0.000153,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000153,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=183.999756,Y=168.000549,Z=-0.000854),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=15.999756,Y=40.000595,Z=-0.000916),ArriveTangent=(X=0.000000,Y=-215.999939,Z=-0.000122),LeaveTangent=(X=0.000000,Y=-215.999939,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=47.999756,Y=-47.999390,Z=-0.000977),ArriveTangent=(X=141.345627,Y=-176.000000,Z=-0.000122),LeaveTangent=(X=141.345627,Y=-176.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=343.999786,Y=-135.999405,Z=-0.001038),ArriveTangent=(X=0.000153,Y=-0.000076,Z=-0.000092),LeaveTangent=(X=0.000153,Y=-0.000076,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=343.999817,Y=-135.999420,Z=-0.001068),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=223.999878,Y=-95.999435,Z=-0.001129),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=223.999908,Y=-95.999435,Z=-0.001160),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=-8.000061,Y=-127.999451,Z=-0.001221),ArriveTangent=(X=-383.999969,Y=0.000000,Z=-0.000122),LeaveTangent=(X=-383.999969,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=-160.000061,Y=-87.999466,Z=-0.001282),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,OutVal=(X=-160.000061,Y=-87.999466,Z=-0.001312),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000107),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000107),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=-0.000061,Y=0.000565,Z=-0.001404),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.500000,InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=3.000000),(Time=3.500000),(Time=4.000000),(Time=4.500000),(Time=5.000000),(Time=5.500000),(Time=6.000000),(Time=6.500000),(Time=7.000000),(Time=7.500000),(Time=8.000000),(Time=8.500000),(Time=9.000000),(Time=9.500000),(Time=10.000000),(Time=10.500000),(Time=11.000000),(Time=11.500000),(Time=12.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_45.InterpGroup_0.InterpTrackMove_0'
      GroupName="Flame_Damage"
      GroupColor=(B=143,G=192,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=12.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_45.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_45.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-5400
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_45"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_410
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_410"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_21
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_4
      Name="InterpCurveEdSetup_4"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-40.000000,Y=-192.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000153),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-40.000000,Y=168.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000191),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000191),InterpMode=CIM_CurveAutoClamped),(InVal=1.300000,OutVal=(X=-40.000000,Y=168.000000,Z=-0.000214),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000244),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-112.000000,Y=168.000000,Z=-0.000275),ArriveTangent=(X=-194.285736,Y=0.000000,Z=-0.000174),LeaveTangent=(X=-194.285736,Y=0.000000,Z=-0.000174),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-176.000000,Y=24.000000,Z=-0.000336),ArriveTangent=(X=-120.000000,Y=-224.000000,Z=-0.000122),LeaveTangent=(X=-120.000000,Y=-224.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-232.000000,Y=-56.000000,Z=-0.000397),ArriveTangent=(X=-201.689728,Y=-232.000000,Z=-0.000122),LeaveTangent=(X=-201.689728,Y=-232.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-416.000122,Y=-208.000000,Z=-0.000458),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=3.500000,OutVal=(X=-336.000366,Y=-208.000000,Z=-0.000519),ArriveTangent=(X=223.999634,Y=0.000000,Z=-0.000122),LeaveTangent=(X=223.999634,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-192.000488,Y=-208.000000,Z=-0.000580),ArriveTangent=(X=239.919754,Y=0.000000,Z=-0.000153),LeaveTangent=(X=239.919754,Y=0.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=4.300000,OutVal=(X=-136.000488,Y=-144.000000,Z=-0.000641),ArriveTangent=(X=288.000000,Y=0.000000,Z=-0.000244),LeaveTangent=(X=288.000000,Y=0.000000,Z=-0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=-48.000488,Y=-200.000000,Z=-0.000702),ArriveTangent=(X=176.525146,Y=-361.162476,Z=-0.000174),LeaveTangent=(X=176.525146,Y=-361.162476,Z=-0.000174),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-8.000488,Y=-440.000122,Z=-0.000763),ArriveTangent=(X=120.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=120.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=5.500000,OutVal=(X=71.999512,Y=-264.000244,Z=-0.000824),ArriveTangent=(X=168.000000,Y=415.999878,Z=-0.000122),LeaveTangent=(X=168.000000,Y=415.999878,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=159.999512,Y=-24.000244,Z=-0.000885),ArriveTangent=(X=144.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=144.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,OutVal=(X=215.999512,Y=-24.000244,Z=-0.000946),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000153),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=183.999512,Y=79.999756,Z=-0.001038),ArriveTangent=(X=-88.000000,Y=296.000000,Z=-0.000153),LeaveTangent=(X=-88.000000,Y=296.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=127.999512,Y=271.999756,Z=-0.001099),ArriveTangent=(X=-168.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=-168.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=15.999512,Y=207.999756,Z=-0.001160),ArriveTangent=(X=0.000000,Y=-232.332901,Z=-0.000122),LeaveTangent=(X=0.000000,Y=-232.332901,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=167.999512,Y=-8.000244,Z=-0.001221),ArriveTangent=(X=336.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=336.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=351.999512,Y=39.999756,Z=-0.001282),ArriveTangent=(X=0.000000,Y=168.072067,Z=-0.000122),LeaveTangent=(X=0.000000,Y=168.072067,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=287.999512,Y=183.999756,Z=-0.001343),ArriveTangent=(X=-210.368088,Y=0.000000,Z=-0.000122),LeaveTangent=(X=-210.368088,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=127.999512,Y=79.999756,Z=-0.001404),ArriveTangent=(X=-240.000000,Y=-67.235237,Z=-0.000122),LeaveTangent=(X=-240.000000,Y=-67.235237,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=47.999512,Y=63.999756,Z=-0.001465),ArriveTangent=(X=-105.184036,Y=0.000000,Z=-0.000122),LeaveTangent=(X=-105.184036,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=15.999512,Y=231.999756,Z=-0.001526),ArriveTangent=(X=0.000000,Y=344.000000,Z=-0.000122),LeaveTangent=(X=0.000000,Y=344.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,OutVal=(X=15.999512,Y=407.999756,Z=-0.001587),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=-0.000488,Y=-0.000244,Z=-0.001648),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1.300000,InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped),(InVal=4.300000,InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.500000,InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.300000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=3.000000),(Time=3.500000),(Time=4.000000),(Time=4.300000),(Time=4.500000),(Time=5.000000),(Time=5.500000),(Time=6.000000),(Time=6.500000),(Time=7.000000),(Time=7.500000),(Time=8.000000),(Time=8.500000),(Time=9.000000),(Time=9.500000),(Time=10.000000),(Time=10.500000),(Time=11.000000),(Time=11.500000),(Time=12.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpGroup_0.InterpTrackMove_0'
      GroupName="Flame_Damage"
      GroupColor=(B=143,G=192,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=12.000000
   InterpGroups(0)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpCurveEdSetup_4'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=544
   ObjPosY=-4640
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_21"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bLooping=True
   InputLinks(0)=(DrawY=-4802,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4780,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4758,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4736,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4714,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4786,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4730,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_21'),DrawX=586,OverrideDelta=27)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_411'),LinkDesc="Flame_Damage",MinVars=0,DrawX=644,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=544
   ObjPosY=-4840
   ObjComment="Damage Actor"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_411
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_411"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_312
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=120
   ObjPosY=-4552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_312"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_313
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=-2432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_313"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_314
   ObjValue=InterpActor'KF-DieSector.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=488
   ObjPosY=-2432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_314"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=2005
   SizeY=1476
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=-3560
   ObjComment="Console lights and mesh swap"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_315
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1648
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_315"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_316
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1592
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_316"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_317
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1544
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_317"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_318
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_318"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_31
   SizeX=1406
   SizeY=485
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-8376
   ObjComment="Wave 1"
   Name="SequenceFrameWrapped_31"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_32
   SizeX=1498
   SizeY=959
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-7856
   ObjComment="All waves after 1"
   Name="SequenceFrameWrapped_32"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_34
   SizeX=2545
   SizeY=8303
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9848
   ObjPosY=-6872
   ObjComment="Controls what zed gates/spawns activate"
   Name="SequenceFrameWrapped_34"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=1085
   SizeY=1430
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5832
   ObjPosY=-2376
   ObjComment="Turn off all zed closet spawns"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=2435
   SizeY=1397
   bDrawBox=True
   FillColor=(B=242,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9944
   ObjPosY=-9936
   ObjComment="Most Global Level Loaded Commands"
   DrawWidth=2435
   DrawHeight=1397
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_27
   SizeX=709
   SizeY=690
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4800
   ObjPosY=-4704
   ObjComment="Remove path cost and electricty at bollards for phase 2"
   Name="SequenceFrameWrapped_27"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281'),DrawX=3088,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-6232
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_259
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-4552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_259"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_305
   ObjValue=KFMGVolume_SwingHit'KF-DieSector.TheWorld:PersistentLevel.KFMGVolume_SwingHit_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-5296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_305"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8208
   ObjPosY=-9272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
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
         PosTrack=(Points=((OutVal=(X=0.000488,Y=-0.000244,Z=-0.000046),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000488,Y=-0.000244,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000008),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=292.120605,Y=1172.879395,Z=-0.000107),ArriveTangent=(X=117.158119,Y=298.011200,Z=0.000000),LeaveTangent=(X=117.158119,Y=298.011200,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=702.949219,Y=1788.066895,Z=95.999847),ArriveTangent=(X=0.000000,Y=225.513351,Z=32.999996),LeaveTangent=(X=0.000000,Y=225.513351,Z=32.999996),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=689.871582,Y=2525.959473,Z=197.999878),ArriveTangent=(X=0.000000,Y=0.000328,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000328,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=689.871582,Y=2525.959961,Z=197.999878),ArriveTangent=(X=0.000000,Y=0.000328,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000328,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=874.084717,Y=3015.482910,Z=195.999878),ArriveTangent=(X=38.642555,Y=140.394287,Z=-0.500000),LeaveTangent=(X=38.642555,Y=140.394287,Z=-0.500000),InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=(X=942.889648,Y=3368.325684,Z=194.999878),ArriveTangent=(X=0.000000,Y=0.000332,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000332,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=28.000000,OutVal=(X=942.889648,Y=3368.326172,Z=194.999878),ArriveTangent=(X=0.000000,Y=0.000332,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000332,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=31.000000,OutVal=(X=451.808105,Y=3609.386719,Z=179.999878),ArriveTangent=(X=-204.107986,Y=16.729794,Z=-11.778622),LeaveTangent=(X=-204.107986,Y=16.729794,Z=-11.778622),InterpMode=CIM_CurveAutoClamped),(InVal=34.000000,OutVal=(X=-281.758301,Y=3631.724609,Z=-114.000168),ArriveTangent=(X=-142.049637,Y=19.137680,Z=-23.694771),LeaveTangent=(X=-142.049637,Y=19.137680,Z=-23.694771),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=-456.854492,Y=3899.036133,Z=-138.000229),ArriveTangent=(X=0.000000,Y=169.799805,Z=-5.702750),LeaveTangent=(X=0.000000,Y=169.799805,Z=-5.702750),InterpMode=CIM_CurveAutoClamped),(InVal=38.000000,OutVal=(X=-396.429199,Y=4310.923828,Z=-144.000290),ArriveTangent=(X=62.896484,Y=0.000000,Z=-0.000077),LeaveTangent=(X=62.896484,Y=0.000000,Z=-0.000077),InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,OutVal=(X=-24.512695,Y=4303.250488,Z=-144.000351),ArriveTangent=(X=250.965149,Y=-6.791169,Z=-0.000069),LeaveTangent=(X=250.965149,Y=-6.791169,Z=-0.000069),InterpMode=CIM_CurveAutoClamped),(InVal=43.000000,OutVal=(X=915.026611,Y=4257.476074,Z=-384.000427),ArriveTangent=(X=0.000000,Y=-36.164429,Z=-0.000107),LeaveTangent=(X=0.000000,Y=-36.164429,Z=-0.000107),InterpMode=CIM_CurveAutoClamped),(InVal=46.000000,OutVal=(X=877.455811,Y=3256.555664,Z=-384.000549),ArriveTangent=(X=-28.840088,Y=-316.874969,Z=-0.000102),LeaveTangent=(X=-28.840088,Y=-316.874969,Z=-0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=49.000000,OutVal=(X=347.044678,Y=2356.226318,Z=-396.000732),ArriveTangent=(X=0.000000,Y=-271.225739,Z=0.000000),LeaveTangent=(X=0.000000,Y=-271.225739,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=52.000000,OutVal=(X=747.049072,Y=1629.201172,Z=-393.000793),ArriveTangent=(X=194.235886,Y=-205.857651,Z=0.000000),LeaveTangent=(X=194.235886,Y=-205.857651,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=1318.224121,Y=1307.605713,Z=-396.000916),ArriveTangent=(X=321.163483,Y=-116.696167,Z=-0.000114),LeaveTangent=(X=321.163483,Y=-116.696167,Z=-0.000114),InterpMode=CIM_CurveAutoClamped),(InVal=57.000000,OutVal=(X=2352.866455,Y=1045.720337,Z=-396.001038),ArriveTangent=(X=0.000336,Y=0.000000,Z=-0.000035),LeaveTangent=(X=0.000336,Y=0.000000,Z=-0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=61.000000,OutVal=(X=2352.866943,Y=1045.720581,Z=-396.001160),ArriveTangent=(X=0.000140,Y=0.000070,Z=-0.000035),LeaveTangent=(X=0.000140,Y=0.000070,Z=-0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=64.000000,OutVal=(X=2352.867432,Y=1045.720825,Z=-396.001282),ArriveTangent=(X=0.000381,Y=0.000186,Z=-0.000093),LeaveTangent=(X=0.000381,Y=0.000186,Z=-0.000093),InterpMode=CIM_CurveAutoClamped),(InVal=68.000000,OutVal=(X=3564.515625,Y=1148.263184,Z=-450.001404),ArriveTangent=(X=190.338593,Y=60.787354,Z=-0.000093),LeaveTangent=(X=190.338593,Y=60.787354,Z=-0.000093),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=3920.163330,Y=1938.824341,Z=-450.001526),ArriveTangent=(X=0.000000,Y=237.199005,Z=0.000000),LeaveTangent=(X=0.000000,Y=237.199005,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=3861.083496,Y=2808.656250,Z=-426.001770),ArriveTangent=(X=-36.705284,Y=193.934906,Z=7.285679),LeaveTangent=(X=-36.705284,Y=193.934906,Z=7.285679),InterpMode=CIM_CurveAutoClamped),(InVal=78.000000,OutVal=(X=3151.694092,Y=3296.368652,Z=-399.001770),ArriveTangent=(X=-239.545532,Y=119.612160,Z=6.833303),LeaveTangent=(X=-239.545532,Y=119.612160,Z=6.833303),InterpMode=CIM_CurveAutoClamped),(InVal=81.000000,OutVal=(X=2423.810303,Y=3531.893066,Z=-385.001953),ArriveTangent=(X=-192.178909,Y=0.000000,Z=1.971492),LeaveTangent=(X=-192.178909,Y=0.000000,Z=1.971492),InterpMode=CIM_CurveAutoClamped),(InVal=84.000000,OutVal=(X=1998.620605,Y=3438.966309,Z=-382.002075),ArriveTangent=(X=0.000000,Y=-23.141811,Z=0.000000),LeaveTangent=(X=0.000000,Y=-23.141811,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=2784.498535,Y=3369.900391,Z=-382.002258),ArriveTangent=(X=210.343262,Y=0.000000,Z=-0.000124),LeaveTangent=(X=210.343262,Y=0.000000,Z=-0.000124),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=3471.023438,Y=3387.831543,Z=-385.002319),ArriveTangent=(X=286.053894,Y=0.000000,Z=0.000000),LeaveTangent=(X=286.053894,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=4214.768066,Y=3375.528320,Z=-111.002350),ArriveTangent=(X=201.705826,Y=-11.198035,Z=0.000000),LeaveTangent=(X=201.705826,Y=-11.198035,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=4532.894043,Y=3290.822998,Z=-111.002411),ArriveTangent=(X=116.174805,Y=-30.569433,Z=0.000000),LeaveTangent=(X=116.174805,Y=-30.569433,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=4795.642090,Y=3222.681152,Z=-108.002472),ArriveTangent=(X=0.000000,Y=-63.973366,Z=0.000000),LeaveTangent=(X=0.000000,Y=-63.973366,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=4676.751953,Y=2658.366699,Z=-108.002533),ArriveTangent=(X=-28.266043,Y=-203.375336,Z=0.000000),LeaveTangent=(X=-28.266043,Y=-203.375336,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=103.000000,OutVal=(X=4638.178223,Y=2205.804443,Z=-36.002579),ArriveTangent=(X=-39.070168,Y=-246.251678,Z=24.273958),LeaveTangent=(X=-39.070168,Y=-246.251678,Z=24.273958),InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=(X=4433.274902,Y=1673.359985,Z=-6.002609),ArriveTangent=(X=0.000000,Y=-217.332001,Z=0.000000),LeaveTangent=(X=0.000000,Y=-217.332001,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=108.000000,OutVal=(X=4520.370605,Y=1119.144409,Z=-30.002655),ArriveTangent=(X=25.177229,Y=-201.418793,Z=-14.726749),LeaveTangent=(X=25.177229,Y=-201.418793,Z=-14.726749),InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=(X=4560.553711,Y=666.265991,Z=-81.002701),ArriveTangent=(X=41.369083,Y=-199.420135,Z=-24.000027),LeaveTangent=(X=41.369083,Y=-199.420135,Z=-24.000027),InterpMode=CIM_CurveAutoClamped),(InVal=112.000000,OutVal=(X=4793.087891,Y=321.463867,Z=-126.002762),ArriveTangent=(X=0.000000,Y=-164.077606,Z=0.000000),LeaveTangent=(X=0.000000,Y=-164.077606,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=114.000000,OutVal=(X=4579.548340,Y=9.955566,Z=-111.002823),ArriveTangent=(X=-140.802185,Y=-36.774799,Z=7.199975),LeaveTangent=(X=-140.802185,Y=-36.774799,Z=7.199975),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=4066.411133,Y=-35.667480,Z=-90.002884),ArriveTangent=(X=-155.104004,Y=0.000000,Z=11.410636),LeaveTangent=(X=-155.104004,Y=0.000000,Z=11.410636),InterpMode=CIM_CurveAutoClamped),(InVal=121.000000,OutVal=(X=3493.820313,Y=442.675537,Z=-15.002930),ArriveTangent=(X=-213.359451,Y=3.716606,Z=0.000000),LeaveTangent=(X=-213.359451,Y=3.716606,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=124.000000,OutVal=(X=2572.895020,Y=447.617188,Z=-15.002960),ArriveTangent=(X=-230.746628,Y=0.000000,Z=-0.000026),LeaveTangent=(X=-230.746628,Y=0.000000,Z=-0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=127.000000,OutVal=(X=2109.340576,Y=-58.846924,Z=-27.002991),ArriveTangent=(X=-205.395920,Y=0.000000,Z=-7.003017),LeaveTangent=(X=-205.395920,Y=0.000000,Z=-7.003017),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=1340.519531,Y=128.406982,Z=-63.003036),ArriveTangent=(X=-269.351532,Y=41.696892,Z=-5.702734),LeaveTangent=(X=-269.351532,Y=41.696892,Z=-5.702734),InterpMode=CIM_CurveAutoClamped),(InVal=133.000000,OutVal=(X=493.231445,Y=205.260742,Z=-72.003098),ArriveTangent=(X=0.000000,Y=43.246017,Z=-0.000051),LeaveTangent=(X=0.000000,Y=43.246017,Z=-0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=136.000000,OutVal=(X=820.208496,Y=412.149536,Z=-72.003159),ArriveTangent=(X=174.425659,Y=0.000000,Z=-0.000020),LeaveTangent=(X=174.425659,Y=0.000000,Z=-0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=139.000000,OutVal=(X=1582.849121,Y=303.834961,Z=-72.003220),ArriveTangent=(X=245.447754,Y=-63.562885,Z=0.000000),LeaveTangent=(X=245.447754,Y=-63.562885,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=142.000000,OutVal=(X=2292.895020,Y=-26.813721,Z=-15.003265),ArriveTangent=(X=141.680496,Y=0.000000,Z=19.999987),LeaveTangent=(X=141.680496,Y=0.000000,Z=19.999987),InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=(X=2538.684570,Y=597.499146,Z=47.996704),ArriveTangent=(X=15.800203,Y=190.848007,Z=2.364979),LeaveTangent=(X=15.800203,Y=190.848007,Z=2.364979),InterpMode=CIM_CurveAutoClamped),(InVal=148.000000,OutVal=(X=2559.603027,Y=1118.274292,Z=50.996674),ArriveTangent=(X=16.977692,Y=30.960419,Z=2.317622),LeaveTangent=(X=16.977692,Y=30.960419,Z=2.317622),InterpMode=CIM_CurveAutoClamped),(InVal=151.000000,OutVal=(X=3481.002686,Y=1158.940552,Z=96.996674),ArriveTangent=(X=191.239273,Y=32.383621,Z=1.584251),LeaveTangent=(X=191.239273,Y=32.383621,Z=1.584251),InterpMode=CIM_CurveAutoClamped),(InVal=154.000000,OutVal=(X=3819.565430,Y=2203.580078,Z=98.996674),ArriveTangent=(X=0.000000,Y=146.896378,Z=1.613560),LeaveTangent=(X=0.000000,Y=146.896378,Z=1.613560),InterpMode=CIM_CurveAutoClamped),(InVal=157.000000,OutVal=(X=3003.585449,Y=2427.010010,Z=170.996704),ArriveTangent=(X=-229.860718,Y=0.000000,Z=6.503503),LeaveTangent=(X=-229.860718,Y=0.000000,Z=6.503503),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=2440.401123,Y=2347.207031,Z=179.996704),ArriveTangent=(X=-250.573242,Y=-24.108927,Z=0.000000),LeaveTangent=(X=-250.573242,Y=-24.108927,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=1500.145996,Y=2282.356445,Z=167.996704),ArriveTangent=(X=-123.631157,Y=0.000000,Z=-3.000000),LeaveTangent=(X=-123.631157,Y=0.000000,Z=-3.000000),InterpMode=CIM_CurveAutoClamped),(InVal=166.000000,OutVal=(X=1315.488770,Y=2672.868408,Z=161.996704),ArriveTangent=(X=0.000000,Y=162.312912,Z=-4.079003),LeaveTangent=(X=0.000000,Y=162.312912,Z=-4.079003),InterpMode=CIM_CurveAutoClamped),(InVal=169.000000,OutVal=(X=1443.866699,Y=3256.233887,Z=128.996674),ArriveTangent=(X=89.978508,Y=110.721512,Z=-25.672050),LeaveTangent=(X=89.978508,Y=110.721512,Z=-25.672050),InterpMode=CIM_CurveAutoClamped),(InVal=172.000000,OutVal=(X=2282.093750,Y=3443.806641,Z=-429.003357),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.939209),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.939209),InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=(X=2215.686523,Y=3164.849854,Z=-435.003479),ArriveTangent=(X=0.000000,Y=-131.978073,Z=-0.000102),LeaveTangent=(X=0.000000,Y=-131.978073,Z=-0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=178.000000,OutVal=(X=2217.582764,Y=2651.938232,Z=-435.003601),ArriveTangent=(X=0.000000,Y=-262.620789,Z=0.000000),LeaveTangent=(X=0.000000,Y=-262.620789,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=182.000000,OutVal=(X=1980.630859,Y=1113.727295,Z=-432.003723),ArriveTangent=(X=0.000000,Y=-27.250046,Z=2.022926),LeaveTangent=(X=0.000000,Y=-27.250046,Z=2.022926),InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=(X=2188.616699,Y=1076.847900,Z=47.996185),ArriveTangent=(X=42.569115,Y=-29.553802,Z=0.000000),LeaveTangent=(X=42.569115,Y=-29.553802,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=188.000000,OutVal=(X=2263.426270,Y=-23.198975,Z=-9.003815),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=1.230469,Z=80.859375),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=0.000000,Y=1.230469,Z=67.500000),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=0.000000,Y=1.230469,Z=89.472656),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=1.230469,Z=87.187500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.686881),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.686881),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=0.000000,Y=-0.703125,Z=-5.273438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.068638),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.068638),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=0.000000,Y=-0.703125,Z=-60.292969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.941406),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.941406),InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=(X=0.000000,Y=-0.703125,Z=-94.921875),InterpMode=CIM_CurveAutoClamped),(InVal=28.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-29.003906),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.855648),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.855648),InterpMode=CIM_CurveAutoClamped),(InVal=31.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-5.097656),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.685584),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.685584),InterpMode=CIM_CurveAutoClamped),(InVal=34.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-1.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.051546),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.051546),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=0.000000,Y=-2.285156,Z=0.351563),InterpMode=CIM_CurveAutoClamped),(InVal=38.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-2.285156),InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-0.703125),InterpMode=CIM_CurveAutoClamped),(InVal=43.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-88.066406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.008900),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.008900),InterpMode=CIM_CurveAutoClamped),(InVal=46.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-89.296875),InterpMode=CIM_CurveAutoClamped),(InVal=49.000000,OutVal=(X=0.000000,Y=-2.285156,Z=0.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=30.292969),LeaveTangent=(X=0.000000,Y=0.000000,Z=30.292969),InterpMode=CIM_CurveAutoClamped),(InVal=52.000000,OutVal=(X=0.000000,Y=-2.285156,Z=92.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.976349),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.976349),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=0.000000,Y=-2.285156,Z=124.804688),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.121094),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.121094),InterpMode=CIM_CurveAutoClamped),(InVal=57.000000,OutVal=(X=0.000000,Y=-2.285156,Z=178.066406),InterpMode=CIM_CurveAutoClamped),(InVal=61.000000,OutVal=(X=0.000000,Y=-1.757813,Z=90.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-25.111607),LeaveTangent=(X=0.000000,Y=0.000000,Z=-25.111607),InterpMode=CIM_CurveAutoClamped),(InVal=64.000000,OutVal=(X=0.000000,Y=-4.042969,Z=2.285156),InterpMode=CIM_CurveAutoClamped),(InVal=68.000000,OutVal=(X=0.000000,Y=-4.042969,Z=48.691406),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.852678),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.852678),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=0.000000,Y=-4.042969,Z=85.253906),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.254464),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.254464),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=0.000000,Y=-4.042969,Z=134.472656),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.781808),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.781808),InterpMode=CIM_CurveAutoClamped),(InVal=78.000000,OutVal=(X=0.000000,Y=-4.042969,Z=174.726563),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.837891),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.837891),InterpMode=CIM_CurveAutoClamped),(InVal=81.000000,OutVal=(X=0.000000,Y=-4.042969,Z=247.500000),ArriveTangent=(X=0.000000,Y=0.000000,Z=23.173828),LeaveTangent=(X=0.000000,Y=0.000000,Z=23.173828),InterpMode=CIM_CurveAutoClamped),(InVal=84.000000,OutVal=(X=0.000000,Y=-4.042969,Z=313.769531),ArriveTangent=(X=0.000000,Y=0.000000,Z=15.468750),LeaveTangent=(X=0.000000,Y=0.000000,Z=15.468750),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=0.000000,Y=-2.109375,Z=355.781250),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.431415),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.431415),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=0.000000,Y=-4.042969,Z=361.054688),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=0.000000,Y=-4.042969,Z=357.011719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.193975),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.193975),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=0.000000,Y=-4.042969,Z=265.078125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-27.418921),LeaveTangent=(X=0.000000,Y=0.000000,Z=-27.418921),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=0.000000,Y=-4.042969,Z=219.726563),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=0.000000,Y=-4.042969,Z=261.386719),InterpMode=CIM_CurveAutoClamped),(InVal=103.000000,OutVal=(X=0.000000,Y=-4.042969,Z=248.378906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.181257),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.181257),InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=(X=0.000000,Y=-4.042969,Z=179.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.784471),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.784471),InterpMode=CIM_CurveAutoClamped),(InVal=108.000000,OutVal=(X=0.000000,Y=-2.812500,Z=172.265625),ArriveTangent=(X=0.000000,Y=1.058420,Z=-4.940091),LeaveTangent=(X=0.000000,Y=1.058420,Z=-4.940091),InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=(X=0.000000,Y=12.656250,Z=146.953125),ArriveTangent=(X=0.000000,Y=5.652652,Z=-14.765625),LeaveTangent=(X=0.000000,Y=5.652652,Z=-14.765625),InterpMode=CIM_CurveAutoClamped),(InVal=112.000000,OutVal=(X=0.000000,Y=20.039063,Z=113.203125),InterpMode=CIM_CurveAutoClamped),(InVal=114.000000,OutVal=(X=0.000000,Y=11.250000,Z=126.386719),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=0.000000,Y=18.281250,Z=83.320313),InterpMode=CIM_CurveAutoClamped),(InVal=121.000000,OutVal=(X=0.000000,Y=-2.460938,Z=179.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.266723),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.266723),InterpMode=CIM_CurveAutoClamped),(InVal=124.000000,OutVal=(X=0.000000,Y=-2.460938,Z=179.472656),InterpMode=CIM_CurveAutoClamped),(InVal=127.000000,OutVal=(X=0.000000,Y=6.328125,Z=100.546875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-25.634766),LeaveTangent=(X=0.000000,Y=0.000000,Z=-25.634766),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=0.000000,Y=2.636719,Z=25.664063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.025585),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.025585),InterpMode=CIM_CurveAutoClamped),(InVal=133.000000,OutVal=(X=0.000000,Y=2.812500,Z=4.394531),ArriveTangent=(X=0.000000,Y=0.142981,Z=-13.678263),LeaveTangent=(X=0.000000,Y=0.142981,Z=-13.678263),InterpMode=CIM_CurveAutoClamped),(InVal=136.000000,OutVal=(X=0.000000,Y=11.250000,Z=-85.957031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-31.171875),LeaveTangent=(X=0.000000,Y=0.000000,Z=-31.171875),InterpMode=CIM_CurveAutoClamped),(InVal=139.000000,OutVal=(X=0.000000,Y=6.152344,Z=-182.636719),ArriveTangent=(X=0.000000,Y=-2.197266,Z=-4.508214),LeaveTangent=(X=0.000000,Y=-2.197266,Z=-4.508214),InterpMode=CIM_CurveAutoClamped),(InVal=142.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-188.437500),ArriveTangent=(X=0.000000,Y=-1.238773,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.238773,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=(X=0.000000,Y=-3.867188,Z=-132.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.083984),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.083984),InterpMode=CIM_CurveAutoClamped),(InVal=148.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-91.933594),InterpMode=CIM_CurveAutoClamped),(InVal=151.000000,OutVal=(X=0.000000,Y=-4.746094,Z=-92.988281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.759916),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.759916),InterpMode=CIM_CurveAutoClamped),(InVal=154.000000,OutVal=(X=0.000000,Y=4.570313,Z=-101.250000),InterpMode=CIM_CurveAutoClamped),(InVal=157.000000,OutVal=(X=0.000000,Y=1.933594,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.118423),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.118423),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=0.000000,Y=1.933594,Z=-0.878906),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=0.000000,Y=1.933594,Z=-3.339844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.950280),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.950280),InterpMode=CIM_CurveAutoClamped),(InVal=166.000000,OutVal=(X=0.000000,Y=1.933594,Z=-60.468750),InterpMode=CIM_CurveAutoClamped),(InVal=169.000000,OutVal=(X=0.000000,Y=-1.054688,Z=34.804688),ArriveTangent=(X=0.000000,Y=-1.754750,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.754750,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=172.000000,OutVal=(X=0.000000,Y=-10.195313,Z=17.929688),InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=(X=0.000000,Y=0.527344,Z=89.472656),ArriveTangent=(X=0.000000,Y=5.420823,Z=0.000000),LeaveTangent=(X=0.000000,Y=5.420823,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=178.000000,OutVal=(X=0.000000,Y=22.500000,Z=89.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.167461),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.167461),InterpMode=CIM_CurveAutoClamped),(InVal=182.000000,OutVal=(X=0.000000,Y=22.500000,Z=88.242188),InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=(X=0.000000,Y=-2.988281,Z=90.351563),InterpMode=CIM_CurveAutoClamped),(InVal=188.000000,OutVal=(X=0.000000,Y=13.535156,Z=81.738281),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000),(Time=8.000000),(Time=11.000000),(Time=14.000000),(Time=18.000000),(Time=21.000000),(Time=24.000000),(Time=28.000000),(Time=31.000000),(Time=34.000000),(Time=36.000000),(Time=38.000000),(Time=40.000000),(Time=43.000000),(Time=46.000000),(Time=49.000000),(Time=52.000000),(Time=54.000000),(Time=57.000000),(Time=61.000000),(Time=64.000000),(Time=68.000000),(Time=71.000000),(Time=75.000000),(Time=78.000000),(Time=81.000000),(Time=84.000000),(Time=88.000000),(Time=91.000000),(Time=93.000000),(Time=96.000000),(Time=98.000000),(Time=101.000000),(Time=103.000000),(Time=105.000000),(Time=108.000000),(Time=110.000000),(Time=112.000000),(Time=114.000000),(Time=117.000000),(Time=121.000000),(Time=124.000000),(Time=127.000000),(Time=130.000000),(Time=133.000000),(Time=136.000000),(Time=139.000000),(Time=142.000000),(Time=145.000000),(Time=148.000000),(Time=151.000000),(Time=154.000000),(Time=157.000000),(Time=160.000000),(Time=163.000000),(Time=166.000000),(Time=169.000000),(Time=172.000000),(Time=175.000000),(Time=178.000000),(Time=182.000000),(Time=185.000000),(Time=188.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="NewCameraGroup"
      GroupColor=(B=51,G=0,R=229,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=0,G=203,R=126,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=188.000000
   InterpGroups(0)=InterpGroupDirector'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=188.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7904
   ObjPosY=-9520
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   InputLinks(0)=(DrawY=-9690,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9668,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9646,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9624,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9602,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2')),DrawY=-9674,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9618,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=7959,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=8029,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7928
   ObjPosY=-9728
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=900
   SizeY=1093
   bDrawBox=True
   FillColor=(B=239,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7608
   ObjPosY=-9800
   ObjComment="Benchmark"
   DrawWidth=900
   DrawHeight=1093
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6'),(LinkedOp=SeqAct_ConsoleCommand'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3')),DrawY=-9550,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7743,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7648
   ObjPosY=-9616
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=CameraActor'KF-DieSector.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8000
   ObjPosY=-9520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=8296,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8232
   ObjPosY=-9680
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9382,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=8016,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7952
   ObjPosY=-9416
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16')),DrawY=-8990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9833,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9928
   ObjPosY=-9056
   ObjComment="BENCHMARK"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_3"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_16
   InputLinks(0)=(DrawY=-8995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8953,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_59'),(LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_202'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_203'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_204'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_205')),DrawY=-8990,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8958,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9636,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9688
   ObjPosY=-9032
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_16"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_8
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_32'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_142'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_40')),DrawY=-8926,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7799,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7704
   ObjPosY=-8992
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_8"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_5
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-6278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2065,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-6344
   ObjComment="BENCHMARK"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_5"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_6
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=-4606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2105,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2200
   ObjPosY=-4672
   ObjComment="BENCHMARK"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_6"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_7
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-3118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2049,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-3184
   ObjComment="BENCHMARK"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_7"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_205
   EventName="Eye_On_04"
   InputLinks(0)=(DrawY=-8606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-8640
   ObjComment="Eye_On_04"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_205"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_204
   EventName="Eye_On_03"
   InputLinks(0)=(DrawY=-8686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8686,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-8720
   ObjComment="Eye_On_03"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_204"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_203
   EventName="Eye_On_02"
   InputLinks(0)=(DrawY=-8766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-8800
   ObjComment="Eye_On_02"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_203"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_202
   EventName="Eye_On_01"
   InputLinks(0)=(DrawY=-8846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-8880
   ObjComment="Eye_On_01"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_202"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-9326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=543,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=-9392
   ObjComment="BENCHMARK"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_4"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_319
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3864
   ObjPosY=-3728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_319"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_320
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5760
   ObjPosY=-3000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_320"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_321
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6000
   ObjPosY=-3000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_321"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_323
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4016
   ObjPosY=-3720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_323"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_324
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3944
   ObjPosY=-3720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_324"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_326
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=-3000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_326"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_327
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5872
   ObjPosY=-2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_327"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_328
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5752
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_328"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_329
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5872
   ObjPosY=-2776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_329"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_330
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5976
   ObjPosY=-2776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_330"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_331
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4040
   ObjPosY=-1728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_331"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_335
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5760
   ObjPosY=-2872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_335"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_336
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5864
   ObjPosY=-2872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_336"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_337
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5984
   ObjPosY=-2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_337"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_338
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3912
   ObjPosY=-2992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_338"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_339
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=-2992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_339"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_340
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3992
   ObjPosY=-2992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_340"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_341
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5112
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_341"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_352
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=-4096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_352"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_353
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5208
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_353"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_359
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5232
   ObjPosY=-5784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_359"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_360
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5312
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_360"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_361
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5112
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_361"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_362
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5216
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_362"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_363
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=-3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_363"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_364
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5256
   ObjPosY=-6072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_364"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_365
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3880
   ObjPosY=-6560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_365"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_366
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5256
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_366"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_367
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5096
   ObjPosY=-4208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_367"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_368
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5320
   ObjPosY=-4200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_368"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_37
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-5332,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5332,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-1340,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1388
   ObjPosY=-5366
   ObjComment="Fire LOOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_37"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_46
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-5574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-1512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=-5608
   ObjComment="Fire STOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_46"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_27
   InputLinks(0)=(DrawY=-5315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5273,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_39'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_37')),DrawY=-5310,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5278,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1732,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-5352
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_27"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258'),DrawX=2968,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=-6584
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-6686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258'),DrawX=3136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3088
   ObjPosY=-6720
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_84
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-5582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5582,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_310'),DrawX=3656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=-5616
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_84"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_89
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-6006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_306'),DrawX=3192,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3144
   ObjPosY=-6040
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_89"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_92'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_93'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_91'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=-5875,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5854,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5833,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=-5944
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_77
   EventName="Bollards_Open_1"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_84'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_85'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_86'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_83'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_87'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_82'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-5198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2960,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-5264
   ObjComment="Bollards_Open_1"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_77"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_92
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-5758,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5758,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_306'),DrawX=2936,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=-5792
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_92"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_20
   InputLinks(0)=(DrawY=-6011,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5990,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5969,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_89'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_88'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_90'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-6006,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5974,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2956,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2904
   ObjPosY=-6048
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_20"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_85
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-5534,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5534,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_310'),DrawX=3376,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=-5568
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_85"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),DrawY=-6198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281'),DrawX=2936,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=-6232
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_22
   Duration=10.000000
   InputLinks(0)=(DrawY=-6699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6657,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),DrawY=-6694,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6662,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2980,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=-6736
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_22"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_78
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-4294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_419'),DrawX=2960,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-4328
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_78"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_21
   InputLinks(0)=(DrawY=-4851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4809,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_47'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_50'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=-4846,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4814,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2948,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2896
   ObjPosY=-4888
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_21"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_76
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-4646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_416'),DrawX=2904,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2856
   ObjPosY=-4680
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_76"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_78
   EventName="Bollards_Open_2"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_79'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_78'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_80'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_81'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),DrawY=-4238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2752,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-4304
   ObjComment="Bollards_Open_2"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_78"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_6
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_76'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_21')),DrawY=-4771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4729,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2608
   ObjPosY=-4840
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_6"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_47
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-4846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_416'),DrawX=3240,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3192
   ObjPosY=-4880
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_47"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_79
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-4366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4366,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_419'),DrawX=3328,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3280
   ObjPosY=-4400
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_79"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_70
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-398,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-398,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),DrawX=3064,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=-432
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_70"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_61
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-1550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1550,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=3624,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3576
   ObjPosY=-1584
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_61"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_64'),(LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_18'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_66'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_67'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_65'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=-1427,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1406,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1385,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2656
   ObjPosY=-1496
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_52
   EventName="Bollards_Open_3"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_70'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_71'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_73'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_68'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_74'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_72'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_69'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_75'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=-150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2776,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-216
   ObjComment="Bollards_Open_3"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_52"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_64
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-1278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1278,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_427'),DrawX=3032,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=-1312
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_64"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_18
   InputLinks(0)=(DrawY=-1507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1465,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_61'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_62'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_60'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_63'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-1502,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1470,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3132,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-1544
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_18"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_71
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=218,OverrideDelta=11)
   OutputLinks(0)=(DrawY=218,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_422'),DrawX=3048,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=184
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_71"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_39
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_Ignite'
   InputLinks(0)=(DrawY=-5260,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5260,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-1540,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1588
   ObjPosY=-5294
   ObjComment="Fire IGNITE"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_39"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_23
   Duration=10.000000
   InputLinks(0)=(DrawY=-3851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3809,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24')),DrawY=-3846,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3814,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2964,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-3888
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_23"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26')),DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_436'),DrawX=3008,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=-3528
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-3846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_437'),DrawX=3120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=-3880
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-3718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_437'),DrawX=2960,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-3752
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_436'),DrawX=3160,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=-3528
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_435'),DrawX=3128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-2752
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_434'),DrawX=2960,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-2968
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-3062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_434'),DrawX=3112,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3064
   ObjPosY=-3096
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_27
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30')),DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_435'),DrawX=2976,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=-2752
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_27"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_24
   Duration=10.000000
   InputLinks(0)=(DrawY=-3075,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3054,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3033,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28')),DrawY=-3070,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3038,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2956,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2904
   ObjPosY=-3112
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_24"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_432'),DrawX=3176,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=-1960
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-2254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_433'),DrawX=2976,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=-2288
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-2390,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_433'),DrawX=3120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=-2424
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-1926,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_432'),DrawX=3024,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=-1960
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_19
   Duration=10.000000
   InputLinks(0)=(DrawY=-2395,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2374,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2353,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-2390,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2358,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2980,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=-2432
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_19"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_34
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_Ignite'
   InputLinks(0)=(DrawY=-3718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-1720,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1768
   ObjPosY=-3752
   ObjComment="Fire IGNITE"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_34"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_26
   InputLinks(0)=(DrawY=-3771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3729,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_34'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-3766,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3734,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1900,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1952
   ObjPosY=-3808
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_26"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-4022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4022,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-1680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=-4056
   ObjComment="Fire STOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-3790,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3790,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-1496,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1544
   ObjPosY=-3824
   ObjComment="Fire LOOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-2206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-1488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=-2240
   ObjComment="Fire LOOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-2414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-1672,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-2448
   ObjComment="Fire STOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_17
   InputLinks(0)=(DrawY=-2187,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2166,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2145,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=-2182,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2150,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1852,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=-2224
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_17"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_Ignite'
   InputLinks(0)=(DrawY=-2134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2134,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-1672,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-2168
   ObjComment="Fire IGNITE"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_40
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_Ignite'
   InputLinks(0)=(DrawY=-5750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),DrawX=1368,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=-5784
   ObjComment="Fire IGNITE"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_40"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_28
   InputLinks(0)=(DrawY=-5707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_42')),DrawY=-5702,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5670,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1188,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=-5744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_28"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_41
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-5494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5494,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),DrawX=1168,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=-5528
   ObjComment="Fire STOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_41"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_42
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-5662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5662,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),DrawX=1480,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=-5696
   ObjComment="Fire LOOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_42"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_45
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-4974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=1488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1440
   ObjPosY=-5008
   ObjComment="Fire LOOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_45"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_44
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Robot_Arm_Fire_LP'
   InputLinks(0)=(DrawY=-4838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=1160,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=-4872
   ObjComment="Fire STOP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_44"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_29
   InputLinks(0)=(DrawY=-5003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4961,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_43'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_45')),DrawY=-4998,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4966,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1148,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=-5040
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_29"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_43
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Robot_Arm_Fire_Ignite'
   InputLinks(0)=(DrawY=-5062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=1352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=-5096
   ObjComment="Fire IGNITE"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_43"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_29
   SizeX=1392
   SizeY=2530
   BorderColor=(B=245,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-1616
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_29"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_37
   SizeX=1062
   SizeY=915
   BorderColor=(B=247,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-4920
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_37"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_43
   SizeX=1147
   SizeY=1061
   BorderColor=(B=247,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=-6072
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_43"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_39
   SizeX=348
   SizeY=593
   BorderColor=(B=247,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-6744
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_39"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_40
   SizeX=376
   SizeY=2198
   BorderColor=(B=247,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2872
   ObjPosY=-3936
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_40"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_23
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_1"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=-5464
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_23"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_9
   InputLinks(0)=(DrawY=-5546,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_46'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_32')),DrawY=-5556,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5536,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_23'),DrawX=-1763,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1713,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=-5592
   ObjComment="Fire already in use?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_9"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   bReplicateToClients=True
   InputLinks(0)=(DrawY=-5518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-1360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=-5552
   ObjComment="Fire OUTRO CONNECT ME"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   bReplicateToClients=True
   InputLinks(0)=(DrawY=-3974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-1504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1552
   ObjPosY=-4008
   ObjComment="Fire OUTRO CONNECT ME"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_23
   InputLinks(0)=(DrawY=-3978,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33')),DrawY=-3988,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-3968,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_24'),DrawX=-1915,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1865,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1944
   ObjPosY=-4024
   ObjComment="Fire already in use?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_23"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_24
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_3"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1944
   ObjPosY=-3904
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_24"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="fire_2"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1912
   ObjPosY=-2304
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_12
   InputLinks(0)=(DrawY=-2386,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_38')),DrawY=-2396,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2376,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34'),DrawX=-1883,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1833,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1912
   ObjPosY=-2432
   ObjComment="Fire already in use?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_12"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_38
   bReplicateToClients=True
   InputLinks(0)=(DrawY=-2350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-1520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1568
   ObjPosY=-2384
   ObjComment="Fire OUTRO CONNECT ME"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_38"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_28
   EventName="On_Arm_Center_02"
   bClientSideOnly=True
   MaxWidth=355
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_29')),DrawY=-4990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1025,OverrideDelta=145)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=-5056
   ObjComment="On_Arm_Center_02"
   DrawWidth=197
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_28"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_26
   EventName="Off_Arm_Center_02"
   bClientSideOnly=True
   MaxWidth=357
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_44')),DrawY=-4814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1026,OverrideDelta=146)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=-4880
   ObjComment="Off_Arm_Center_02"
   DrawWidth=198
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_26"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=776
   SizeY=1131
   BorderColor=(B=229,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=-5800
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_30
   EventName="Off_Arm_Center_01"
   MaxWidth=246
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_41')),DrawY=-5494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=955,OverrideDelta=91)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=-5560
   ObjComment="Off_Arm_Center_01"
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_30"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="On_Arm_Center_01"
   MaxWidth=244
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28')),DrawY=-5678,OverrideDelta=11)
   VariableLinks(0)=(DrawX=962,OverrideDelta=90)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=840
   ObjPosY=-5744
   ObjComment="On_Arm_Center_01"
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=2594
   SizeY=4544
   bDrawBox=True
   FillColor=(B=104,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7256
   ObjPosY=-6984
   ObjComment="Zed closet on/off switch"
   DrawWidth=2594
   DrawHeight=4544
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_52
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_442'),DrawX=-9744,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-2768
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_52"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_47
   SizeX=542
   SizeY=274
   BorderColor=(B=244,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9832
   ObjPosY=-2824
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_47"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_48
   SizeX=545
   SizeY=246
   BorderColor=(B=244,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9848
   ObjPosY=320
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_48"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_58
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_446'),DrawX=-9768,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9816
   ObjPosY=368
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_58"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_55
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_438'),DrawX=-9760,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-6080
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_55"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_42
   SizeX=538
   SizeY=202
   BorderColor=(B=244,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9840
   ObjPosY=-6112
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_42"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-5699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5657,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5678,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_376',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_377'),DrawX=4246,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4297,OverrideDelta=76)
   EventLinks(0)=(DrawX=4346,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4208
   ObjPosY=-5736
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4184
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4072
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_376
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4272
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_376"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_377
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4376
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_377"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
   InputLinks(0)=(DrawY=-4195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4153,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4174,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_378',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_379',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_380'),DrawX=4206,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4257,OverrideDelta=76)
   EventLinks(0)=(DrawX=4306,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4168
   ObjPosY=-4232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_85"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_378
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4176
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_378"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_379
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4280
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_379"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_380
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4376
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_380"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
   InputLinks(0)=(DrawY=-3851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_381',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_382',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_383',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_387'),DrawX=5038,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5089,OverrideDelta=76)
   EventLinks(0)=(DrawX=5138,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5000
   ObjPosY=-3888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_86"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_381
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5008
   ObjPosY=-3752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_381"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_382
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5104
   ObjPosY=-3752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_382"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_383
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5208
   ObjPosY=-3752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_383"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_387
   ObjValue=KFDynamicPhysicsVolume'KF-DieSector.TheWorld:PersistentLevel.KFDynamicPhysicsVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5304
   ObjPosY=-3752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_387"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_391
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8272
   ObjPosY=-3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_391"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_412
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-4784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_412"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_413
   ObjValue=KFSpawner'KF-DieSector.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-6640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_413"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_11')),DrawY=-4859,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4838,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4817,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4238,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4320
   ObjPosY=-4928
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-DieSector.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_10')),DrawY=-4115,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4094,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4073,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4222,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=-4184
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_3
   Originator=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_2'
   ReTriggerDelay=30.000000
   MaxWidth=329
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_19')),DrawY=-3395,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3373,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-3351,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-3329,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2516,OverrideDelta=132)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2680
   ObjPosY=-3464
   ObjName="KFTrigger_DoshActivated_2 Minigame Activation"
   DrawWidth=234
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_3"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_4
   Originator=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_0'
   ReTriggerDelay=30.000000
   MaxWidth=329
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-4843,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4821,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-4799,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-4777,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2564,OverrideDelta=132)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2728
   ObjPosY=-4912
   ObjName="KFTrigger_DoshActivated_0 Minigame Activation"
   DrawWidth=234
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_4"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_0
   Originator=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_3'
   MaxWidth=329
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_6')),DrawY=-6587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6565,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-6543,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-6521,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2548,OverrideDelta=132)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2712
   ObjPosY=-6656
   ObjName="KFTrigger_DoshActivated_3 Minigame Activation"
   DrawWidth=234
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_0"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_5
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-2998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2998,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216'),DrawX=458,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-3032
   ObjComment="Collision Blockers"
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_5"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=320
   ObjPosY=-2912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-2912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=-2912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFTrigger_DoshActivated'KF-DieSector.TheWorld:PersistentLevel.KFTrigger_DoshActivated_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_2
   CollisionType=COLLIDE_TouchAll
   InputLinks(0)=(DrawY=-2278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2278,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=506,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=-2312
   ObjComment="Collision Blockers"
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_2"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_45
   SizeX=2409
   SizeY=1736
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2848
   ObjPosY=-6832
   ObjComment="Trap 1"
   Name="SequenceFrameWrapped_45"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=-5536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=-5424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_414
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3448
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_414"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_415
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3536
   ObjPosY=-5096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_415"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_419
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_419"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_420
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=-4176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_420"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_421
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=-4080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_421"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3176
   ObjPosY=-368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3160
   ObjPosY=-248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3160
   ObjPosY=-136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=-8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=96
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-1496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3592
   ObjPosY=-1312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3600
   ObjPosY=-992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_432
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3064
   ObjPosY=-1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_432"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_433
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_433"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_434
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_434"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_435
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3024
   ObjPosY=-2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_435"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_436
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-3456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_436"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_437
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=-3712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_437"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_438
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9840
   ObjPosY=-6000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_438"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_439
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9736
   ObjPosY=-6000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_439"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_440
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9576
   ObjPosY=-5976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_440"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_441
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-5976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_441"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_442
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9800
   ObjPosY=-2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_442"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_443
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_443"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_444
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9600
   ObjPosY=-2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_444"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_445
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9504
   ObjPosY=-2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_445"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_446
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_446"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_447
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_447"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_448
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9560
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_448"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_449
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_449"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=DynamicBlockingVolume'KF-DieSector.TheWorld:PersistentLevel.DynamicBlockingVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-9624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5080
   ObjPosY=-5872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5384
   ObjPosY=-5864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5232
   ObjPosY=-5872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5192
   ObjPosY=-4192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_49
   SizeX=658
   SizeY=499
   BorderColor=(B=253,G=229,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1840
   ObjPosY=-5656
   ObjComment="Audio"
   Name="SequenceFrameWrapped_49"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_50
   SizeX=654
   SizeY=449
   BorderColor=(B=253,G=229,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2016
   ObjPosY=-4104
   ObjComment="Audio"
   Name="SequenceFrameWrapped_50"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=627
   SizeY=407
   BorderColor=(B=253,G=229,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-2480
   ObjComment="Audio"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=744
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=840
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=Emitter'KF-DieSector.TheWorld:PersistentLevel.Emitter_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=944
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-3912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1648
   ObjPosY=-2296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=-4808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1344
   ObjPosY=-5544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_38
   SizeX=1701
   SizeY=799
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-2448
   ObjComment="Bollard 11"
   Name="SequenceFrameWrapped_38"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_41
   SizeX=1451
   SizeY=696
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-3152
   ObjComment="Bollard 10"
   Name="SequenceFrameWrapped_41"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_44
   SizeX=1435
   SizeY=735
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-3952
   ObjComment="Bollard 8"
   Name="SequenceFrameWrapped_44"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_33
   SizeX=1475
   SizeY=669
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-6752
   ObjComment="Bollard 1"
   Name="SequenceFrameWrapped_33"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_53
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_443'),DrawX=-9608,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9656
   ObjPosY=-2768
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_53"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_49
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_445'),DrawX=-9336,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-2768
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_49"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_51
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_444'),DrawX=-9472,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9520
   ObjPosY=-2768
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_51"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_56
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_439'),DrawX=-9632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=-6080
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_56"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_441'),DrawX=-9368,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-6080
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_31"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_54
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_440'),DrawX=-9496,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-6080
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_54"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_59
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_447'),DrawX=-9632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=368
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_59"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_48
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_449'),DrawX=-9360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=368
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_48"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_57
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ZedDoor_Alarm'
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_448'),DrawX=-9496,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=368
   ObjComment="New Area Alarm"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_57"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_62
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-1366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1366,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=3632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-1400
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_62"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_63
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-1022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1022,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=3640,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3592
   ObjPosY=-1056
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_63"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_60
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-1182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1182,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),DrawX=3632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-1216
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_60"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-862,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-862,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=3632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-896
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_66
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-1094,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1094,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_428'),DrawX=3008,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=-1128
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_66"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_67
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-926,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-926,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_429'),DrawX=3000,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-960
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_67"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-590,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_431'),DrawX=3016,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-624
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_65
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-758,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-758,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_430'),DrawX=3032,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=-792
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_65"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_431
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_431"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_430
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=-728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_430"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_429
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_429"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_428
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3008
   ObjPosY=-1048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_428"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_427
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-1224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_427"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_72
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=330,OverrideDelta=11)
   OutputLinks(0)=(DrawY=330,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_423'),DrawX=3040,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=296
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_72"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_73
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-286,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-286,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=3056,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3008
   ObjPosY=-320
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_73"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_74
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-54,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-54,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=3048,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-88
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_74"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_75
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=554,OverrideDelta=11)
   OutputLinks(0)=(DrawY=554,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_425'),DrawX=3032,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=520
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_75"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_69
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=450,OverrideDelta=11)
   OutputLinks(0)=(DrawY=450,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_424'),DrawX=3040,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=416
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_69"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_68
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-166,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-166,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=3056,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3008
   ObjPosY=-200
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_68"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=658,OverrideDelta=11)
   OutputLinks(0)=(DrawY=658,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_426'),DrawX=3024,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=624
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=50,OverrideDelta=11)
   OutputLinks(0)=(DrawY=50,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=3040,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=16
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_426
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_426"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_425
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3120
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_425"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_424
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_424"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_423
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3120
   ObjPosY=368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_423"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_422
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3168
   ObjPosY=248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_422"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1496
   ObjPosY=-5440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_258
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-6568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_258"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_281
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=-6136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_281"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_302
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-5688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_302"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_303
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3456
   ObjPosY=-5384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_303"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_306
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=-5784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_306"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_310
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3464
   ObjPosY=-5528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_310"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_50
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-4726,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4726,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_417'),DrawX=3232,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3184
   ObjPosY=-4760
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_50"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-4606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_418'),DrawX=3232,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3184
   ObjPosY=-4640
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_77
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-4534,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4534,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_417'),DrawX=2896,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-4568
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_77"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-4430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_418'),DrawX=2896,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-4464
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_418
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=-4400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_418"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_417
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=-4536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_417"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_416
   ObjValue=Note'KF-DieSector.TheWorld:PersistentLevel.Note_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=-4640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_416"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_81
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-4222,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4222,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_420'),DrawX=3280,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3232
   ObjPosY=-4256
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_81"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_80
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-4206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_420'),DrawX=2952,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2904
   ObjPosY=-4240
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_80"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-4110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_421'),DrawX=3256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3208
   ObjPosY=-4144
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-4110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_421'),DrawX=2936,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=-4144
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_86
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-5422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_303'),DrawX=3352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3304
   ObjPosY=-5456
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_86"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_87
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-5446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_303'),DrawX=3680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3632
   ObjPosY=-5480
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_87"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-5142,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5142,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_415'),DrawX=3704,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3656
   ObjPosY=-5176
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-5110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_415'),DrawX=3352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3304
   ObjPosY=-5144
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_83
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Down'
   InputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_414'),DrawX=3360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=-5304
   ObjComment="Bollard DOWN"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_83"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_82
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_EndlessArena.Stop_SFX_KFArena_Electric_Barrier_LP'
   InputLinks(0)=(DrawY=-5294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_414'),DrawX=3680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3632
   ObjPosY=-5328
   ObjComment="Electric OFF"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_82"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_90
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-5830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_302'),DrawX=3200,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3152
   ObjPosY=-5864
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_90"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-5582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5582,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247'),DrawX=3216,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3168
   ObjPosY=-5616
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_88
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_ElectricBarrier_LP'
   InputLinks(0)=(DrawY=-5718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=3232,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3184
   ObjPosY=-5752
   ObjComment="Electric ON"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_88"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_93
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-5646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_302'),DrawX=2928,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2880
   ObjPosY=-5680
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_93"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-5422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247'),DrawX=2920,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2872
   ObjPosY=-5456
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_91
   Event=AkEvent'WW_ENV_EndlessArena.Play_SFX_KFArena_Bollard_Up'
   InputLinks(0)=(DrawY=-5534,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5534,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=2928,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-DieSector.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2880
   ObjPosY=-5568
   ObjComment="Bollard UP"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_91"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object
