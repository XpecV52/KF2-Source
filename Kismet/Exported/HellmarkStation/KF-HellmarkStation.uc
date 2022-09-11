Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8742
   ObjPosY=1127
   ObjComment="Portal spawn: ceiling"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9104
   ObjPosY=1361
   ObjComment="PARENT - ceiling spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=1238,OverrideDelta=14)
   InputLinks(1)=(DrawY=1259,OverrideDelta=35)
   InputLinks(2)=(DrawY=1280,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1259,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=9142,OverrideDelta=16)
   VariableLinks(1)=(DrawX=9193,OverrideDelta=76)
   EventLinks(0)=(DrawX=9242,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9104
   ObjPosY=1201
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32')),DrawY=1230,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1251,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1272,OverrideDelta=56)
   VariableLinks(0)=(DrawX=8862,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8776
   ObjPosY=1161
   ObjName="TriggerVolume_13 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_140
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8006
   ObjPosY=1127
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_140"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_137
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7294
   ObjPosY=1127
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_137"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7648
   ObjPosY=1353
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=1230,OverrideDelta=14)
   InputLinks(1)=(DrawY=1251,OverrideDelta=35)
   InputLinks(2)=(DrawY=1272,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1251,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177'),DrawX=7678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7729,OverrideDelta=76)
   EventLinks(0)=(DrawX=7778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7640
   ObjPosY=1193
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_25'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=1230,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1251,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1272,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7406,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7320
   ObjPosY=1161
   ObjName="TriggerVolume_25 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6526
   ObjPosY=1111
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6896
   ObjPosY=1345
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=1214,OverrideDelta=14)
   InputLinks(1)=(DrawY=1235,OverrideDelta=35)
   InputLinks(2)=(DrawY=1256,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1235,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=6934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6985,OverrideDelta=76)
   EventLinks(0)=(DrawX=7034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6896
   ObjPosY=1177
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=1214,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1235,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1256,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6646,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6560
   ObjPosY=1145
   ObjName="TriggerVolume_10 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=1655,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1676,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1697,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6680,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6598
   ObjPosY=1586
   ObjName="TriggerVolume_0 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=1655,OverrideDelta=14)
   InputLinks(1)=(DrawY=1676,OverrideDelta=35)
   InputLinks(2)=(DrawY=1697,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1676,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=6972,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7023,OverrideDelta=76)
   EventLinks(0)=(DrawX=7072,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6934
   ObjPosY=1618
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6934
   ObjPosY=1786
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_49
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6564
   ObjPosY=1552
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_49"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6625
   ObjPosY=2065
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6997
   ObjPosY=2288
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=2157,OverrideDelta=14)
   InputLinks(1)=(DrawY=2178,OverrideDelta=35)
   InputLinks(2)=(DrawY=2199,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2178,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=7035,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7086,OverrideDelta=76)
   EventLinks(0)=(DrawX=7135,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6997
   ObjPosY=2120
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=2157,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2178,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2199,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6743,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6661
   ObjPosY=2088
   ObjName="TriggerVolume_8 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_141
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6695
   ObjPosY=2492
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_141"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7065
   ObjPosY=2726
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=2595,OverrideDelta=14)
   InputLinks(1)=(DrawY=2616,OverrideDelta=35)
   InputLinks(2)=(DrawY=2637,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2616,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=7103,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7154,OverrideDelta=76)
   EventLinks(0)=(DrawX=7203,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7065
   ObjPosY=2558
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=2595,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2616,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2637,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6811,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6729
   ObjPosY=2526
   ObjName="TriggerVolume_3 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_138
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6743
   ObjPosY=3038
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_138"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7113
   ObjPosY=3272
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
   InputLinks(0)=(DrawY=3141,OverrideDelta=14)
   InputLinks(1)=(DrawY=3162,OverrideDelta=35)
   InputLinks(2)=(DrawY=3183,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=7151,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7202,OverrideDelta=76)
   EventLinks(0)=(DrawX=7251,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7113
   ObjPosY=3104
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_76"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76')),DrawY=3141,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3162,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3183,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6859,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6777
   ObjPosY=3072
   ObjName="TriggerVolume_9 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=1692,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1713,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1734,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7486,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7400
   ObjPosY=1623
   ObjName="TriggerVolume_14 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=1692,OverrideDelta=14)
   InputLinks(1)=(DrawY=1713,OverrideDelta=35)
   InputLinks(2)=(DrawY=1734,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1713,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=7758,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7809,OverrideDelta=76)
   EventLinks(0)=(DrawX=7858,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7720
   ObjPosY=1655
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7728
   ObjPosY=1815
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7374
   ObjPosY=1589
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_22
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75')),DrawY=1676,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1697,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1718,OverrideDelta=56)
   VariableLinks(0)=(DrawX=8942,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8860
   ObjPosY=1607
   ObjName="TriggerVolume_4 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_22"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
   InputLinks(0)=(DrawY=1684,OverrideDelta=14)
   InputLinks(1)=(DrawY=1705,OverrideDelta=35)
   InputLinks(2)=(DrawY=1726,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1705,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=9226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=9277,OverrideDelta=76)
   EventLinks(0)=(DrawX=9326,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9188
   ObjPosY=1647
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_75"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9188
   ObjPosY=1807
   ObjComment="PARENT - ceiling spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8826
   ObjPosY=1573
   ObjComment="Portal spawn: ceiling"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_21
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=3578,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3599,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3620,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6859,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6773
   ObjPosY=3509
   ObjName="TriggerVolume_14 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_21"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=3578,OverrideDelta=14)
   InputLinks(1)=(DrawY=3599,OverrideDelta=35)
   InputLinks(2)=(DrawY=3620,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3599,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),DrawX=7147,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7198,OverrideDelta=76)
   EventLinks(0)=(DrawX=7247,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7109
   ObjPosY=3541
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7109
   ObjPosY=3709
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6739
   ObjPosY=3475
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6741
   ObjPosY=3899
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7111
   ObjPosY=4133
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=4002,OverrideDelta=14)
   InputLinks(1)=(DrawY=4023,OverrideDelta=35)
   InputLinks(2)=(DrawY=4044,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4023,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=7149,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7200,OverrideDelta=76)
   EventLinks(0)=(DrawX=7249,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7111
   ObjPosY=3965
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29')),DrawY=4002,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4023,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4044,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6857,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6775
   ObjPosY=3933
   ObjName="TriggerVolume_2 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_50
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7443
   ObjPosY=2028
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_50"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7797
   ObjPosY=2254
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=2131,OverrideDelta=14)
   InputLinks(1)=(DrawY=2152,OverrideDelta=35)
   InputLinks(2)=(DrawY=2173,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2152,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=7827,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7878,OverrideDelta=76)
   EventLinks(0)=(DrawX=7927,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7789
   ObjPosY=2094
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=2131,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2152,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2173,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7555,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7469
   ObjPosY=2062
   ObjName="TriggerVolume_19 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=2556,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2577,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2598,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7606,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7520
   ObjPosY=2487
   ObjName="TriggerVolume_16 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=2556,OverrideDelta=14)
   InputLinks(1)=(DrawY=2577,OverrideDelta=35)
   InputLinks(2)=(DrawY=2598,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2577,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=7878,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7929,OverrideDelta=76)
   EventLinks(0)=(DrawX=7978,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7840
   ObjPosY=2519
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7848
   ObjPosY=2679
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7494
   ObjPosY=2453
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=4428,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4449,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4470,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6866,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6784
   ObjPosY=4359
   ObjName="TriggerVolume_5 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=4429,OverrideDelta=14)
   InputLinks(1)=(DrawY=4450,OverrideDelta=35)
   InputLinks(2)=(DrawY=4471,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4450,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=7158,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7209,OverrideDelta=76)
   EventLinks(0)=(DrawX=7258,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7120
   ObjPosY=4392
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7120
   ObjPosY=4560
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_33
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6744
   ObjPosY=4319
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_33"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7573
   ObjPosY=2821
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7927
   ObjPosY=3047
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=2924,OverrideDelta=14)
   InputLinks(1)=(DrawY=2945,OverrideDelta=35)
   InputLinks(2)=(DrawY=2966,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2945,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),DrawX=7957,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8008,OverrideDelta=76)
   EventLinks(0)=(DrawX=8057,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7919
   ObjPosY=2887
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=2924,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2945,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2966,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7685,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7599
   ObjPosY=2855
   ObjName="TriggerVolume_15 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_142
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6763
   ObjPosY=4728
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_142"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7139
   ObjPosY=4969
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=4838,OverrideDelta=14)
   InputLinks(1)=(DrawY=4859,OverrideDelta=35)
   InputLinks(2)=(DrawY=4880,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4859,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=7177,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7228,OverrideDelta=76)
   EventLinks(0)=(DrawX=7277,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7139
   ObjPosY=4801
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=4837,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4858,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4879,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6885,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6803
   ObjPosY=4768
   ObjName="TriggerVolume_6 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=3351,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3372,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3393,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7694,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7608
   ObjPosY=3282
   ObjName="TriggerVolume_17 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=3351,OverrideDelta=14)
   InputLinks(1)=(DrawY=3372,OverrideDelta=35)
   InputLinks(2)=(DrawY=3393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3372,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=7966,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8017,OverrideDelta=76)
   EventLinks(0)=(DrawX=8066,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7928
   ObjPosY=3314
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7936
   ObjPosY=3474
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_38
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7582
   ObjPosY=3248
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_38"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_40
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7566
   ObjPosY=3632
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_40"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7921
   ObjPosY=3858
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=3735,OverrideDelta=14)
   InputLinks(1)=(DrawY=3756,OverrideDelta=35)
   InputLinks(2)=(DrawY=3777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3756,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_173'),DrawX=7950,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8001,OverrideDelta=76)
   EventLinks(0)=(DrawX=8050,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7912
   ObjPosY=3698
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38')),DrawY=3735,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3756,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3777,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7678,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7592
   ObjPosY=3666
   ObjName="TriggerVolume_18 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=4124,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4145,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4166,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7658,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7576
   ObjPosY=4055
   ObjName="TriggerVolume_1 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=4125,OverrideDelta=14)
   InputLinks(1)=(DrawY=4146,OverrideDelta=35)
   InputLinks(2)=(DrawY=4167,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4146,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=7934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7985,OverrideDelta=76)
   EventLinks(0)=(DrawX=8034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7896
   ObjPosY=4088
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7904
   ObjPosY=4248
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7544
   ObjPosY=4024
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_31
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7544
   ObjPosY=4416
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_31"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7904
   ObjPosY=4640
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
   InputLinks(0)=(DrawY=4517,OverrideDelta=14)
   InputLinks(1)=(DrawY=4538,OverrideDelta=35)
   InputLinks(2)=(DrawY=4559,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4538,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),DrawX=7934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7985,OverrideDelta=76)
   EventLinks(0)=(DrawX=8034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7896
   ObjPosY=4480
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_73"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73')),DrawY=4509,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4530,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4551,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7662,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7576
   ObjPosY=4440
   ObjName="TriggerVolume_21 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=4930,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4951,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4972,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7687,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7601
   ObjPosY=4861
   ObjName="TriggerVolume_22 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_24"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=4938,OverrideDelta=14)
   InputLinks(1)=(DrawY=4959,OverrideDelta=35)
   InputLinks(2)=(DrawY=4980,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4959,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171'),DrawX=7958,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8009,OverrideDelta=76)
   EventLinks(0)=(DrawX=8058,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7920
   ObjPosY=4901
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7928
   ObjPosY=5061
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7568
   ObjPosY=4837
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_41
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8858
   ObjPosY=1998
   ObjComment="Portal spawn: ceiling"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_41"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9220
   ObjPosY=2232
   ObjComment="PARENT - ceiling spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=2109,OverrideDelta=14)
   InputLinks(1)=(DrawY=2130,OverrideDelta=35)
   InputLinks(2)=(DrawY=2151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=9258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=9309,OverrideDelta=76)
   EventLinks(0)=(DrawX=9358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9220
   ObjPosY=2072
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_23'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=2101,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2122,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2143,OverrideDelta=56)
   VariableLinks(0)=(DrawX=8978,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8892
   ObjPosY=2032
   ObjName="TriggerVolume_23 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_23"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=2562,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2583,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2604,OverrideDelta=56)
   VariableLinks(0)=(DrawX=8994,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8908
   ObjPosY=2493
   ObjName="TriggerVolume_11 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=2570,OverrideDelta=14)
   InputLinks(1)=(DrawY=2591,OverrideDelta=35)
   InputLinks(2)=(DrawY=2612,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2591,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=9274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=9325,OverrideDelta=76)
   EventLinks(0)=(DrawX=9374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9236
   ObjPosY=2533
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9236
   ObjPosY=2693
   ObjComment="PARENT - ceiling spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8874
   ObjPosY=2459
   ObjComment="Portal spawn: ceiling"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_42
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7575
   ObjPosY=5216
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_42"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7936
   ObjPosY=5440
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=5317,OverrideDelta=14)
   InputLinks(1)=(DrawY=5338,OverrideDelta=35)
   InputLinks(2)=(DrawY=5359,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5338,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=7965,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8016,OverrideDelta=76)
   EventLinks(0)=(DrawX=8065,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7927
   ObjPosY=5280
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_25
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_24'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=5309,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5330,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5351,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7693,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7607
   ObjPosY=5240
   ObjName="TriggerVolume_24 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_25"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_26
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=5660,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5681,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5702,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7693,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7607
   ObjPosY=5591
   ObjName="TriggerVolume_20 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_26"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=5668,OverrideDelta=14)
   InputLinks(1)=(DrawY=5689,OverrideDelta=35)
   InputLinks(2)=(DrawY=5710,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5689,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172'),DrawX=7965,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8016,OverrideDelta=76)
   EventLinks(0)=(DrawX=8065,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7927
   ObjPosY=5631
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7935
   ObjPosY=5791
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_43
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7576
   ObjPosY=5568
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_43"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7576
   ObjPosY=5920
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=3292
   SizeY=5699
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6368
   ObjPosY=816
   ObjComment="Portal Spawns"
   DrawWidth=3292
   DrawHeight=5699
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="FlythroughCamera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(OutVal=(X=0.001465,Y=0.000183,Z=0.000092),ArriveTangent=(X=316.935089,Y=-6.286388,Z=2.277154),LeaveTangent=(X=316.935089,Y=-6.286388,Z=2.277154),InterpMode=CIM_CurveAuto),(InVal=10.058781,OutVal=(X=3187.980469,Y=-63.233398,Z=22.905396),ArriveTangent=(X=270.285004,Y=0.000000,Z=3.669699),LeaveTangent=(X=270.285004,Y=0.000000,Z=3.669699),InterpMode=CIM_CurveAutoClamped),(InVal=19.944111,OutVal=(X=5390.595703,Y=125.700195,Z=76.171509),ArriveTangent=(X=213.565460,Y=0.000000,Z=0.000000),LeaveTangent=(X=213.565460,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.848183,OutVal=(X=6365.241211,Y=-520.456055,Z=59.108398),ArriveTangent=(X=0.000000,Y=-193.573532,Z=-3.718598),LeaveTangent=(X=0.000000,Y=-193.573532,Z=-3.718598),InterpMode=CIM_CurveAutoClamped),(InVal=29.829460,OutVal=(X=6023.300781,Y=-1787.841797,Z=39.411865),ArriveTangent=(X=-127.497665,Y=-49.574631,Z=0.000000),LeaveTangent=(X=-127.497665,Y=-49.574631,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.848602,OutVal=(X=4756.950195,Y=-1897.554688,Z=54.234863),ArriveTangent=(X=-30.612366,Y=-58.600372,Z=4.336824),LeaveTangent=(X=-30.612366,Y=-58.600372,Z=4.336824),InterpMode=CIM_CurveAutoClamped),(InVal=37.406853,OutVal=(X=4716.165039,Y=-2856.529297,Z=72.273682),ArriveTangent=(X=-45.258789,Y=-115.852982,Z=4.508607),LeaveTangent=(X=-45.258789,Y=-115.852982,Z=4.508607),InterpMode=CIM_CurveAutoClamped),(InVal=38.766319,OutVal=(X=3753.750000,Y=-2944.535156,Z=76.409668),ArriveTangent=(X=-381.797729,Y=-163.116150,Z=0.000000),LeaveTangent=(X=-381.797729,Y=-163.116150,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=39.714809,OutVal=(X=3539.000000,Y=-3917.291992,Z=35.383667),ArriveTangent=(X=-9.623562,Y=-187.296967,Z=-0.000045),LeaveTangent=(X=-9.623562,Y=-187.296967,Z=-0.000045),InterpMode=CIM_CurveAutoClamped),(InVal=49.947018,OutVal=(X=3509.957031,Y=-5038.645996,Z=35.383545),ArriveTangent=(X=0.000000,Y=-36.219223,Z=0.000000),LeaveTangent=(X=0.000000,Y=-36.219223,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=60.352650,OutVal=(X=4505.596680,Y=-5218.134277,Z=39.583008),ArriveTangent=(X=107.593597,Y=0.000000,Z=0.712166),LeaveTangent=(X=107.593597,Y=0.000000,Z=0.712166),InterpMode=CIM_CurveAutoClamped),(InVal=70.064568,OutVal=(X=5674.476563,Y=-5110.697266,Z=51.374390),ArriveTangent=(X=98.279724,Y=0.000000,Z=0.000000),LeaveTangent=(X=98.279724,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=73.737366,OutVal=(X=5971.379883,Y=-5246.631348,Z=31.101807),ArriveTangent=(X=0.000000,Y=-75.913589,Z=-8.439629),LeaveTangent=(X=0.000000,Y=-75.913589,Z=-8.439629),InterpMode=CIM_CurveAutoClamped),(InVal=77.008606,OutVal=(X=5909.412109,Y=-5870.549805,Z=-7.230713),ArriveTangent=(X=-41.876225,Y=-131.077148,Z=0.000000),LeaveTangent=(X=-41.876225,Y=-131.077148,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=80.123344,OutVal=(X=5403.478516,Y=-6127.549316,Z=-1.347778),ArriveTangent=(X=-67.212685,Y=-123.282135,Z=0.183315),LeaveTangent=(X=-67.212685,Y=-123.282135,Z=0.183315),InterpMode=CIM_CurveAutoClamped),(InVal=89.835266,OutVal=(X=5047.297852,Y=-9153.351563,Z=-0.754028),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.186360),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.186360),InterpMode=CIM_CurveAutoClamped),(InVal=93.909958,OutVal=(X=6788.625977,Y=-8315.042969,Z=25.195190),ArriveTangent=(X=387.106628,Y=0.000000,Z=0.000000),LeaveTangent=(X=387.106628,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=99.894043,OutVal=(X=8941.117188,Y=-8644.773438,Z=15.049072),ArriveTangent=(X=240.436920,Y=0.000000,Z=0.000000),LeaveTangent=(X=240.436920,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.605972,OutVal=(X=10562.527344,Y=-6783.227539,Z=51.807739),InterpMode=CIM_CurveAutoClamped),(InVal=112.758499,OutVal=(X=9547.350586,Y=-7046.437988,Z=4.591675),ArriveTangent=(X=-349.935089,Y=0.000000,Z=-19.765135),LeaveTangent=(X=-349.935089,Y=0.000000,Z=-19.765135),InterpMode=CIM_CurveAutoClamped),(InVal=113.848907,OutVal=(X=9077.775391,Y=-6418.431152,Z=-32.054443),ArriveTangent=(X=-509.347046,Y=74.918091,Z=0.000000),LeaveTangent=(X=-509.347046,Y=74.918091,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=115.406631,OutVal=(X=8198.532227,Y=-6372.906738,Z=371.494995),ArriveTangent=(X=-316.395233,Y=14.544721,Z=122.975578),LeaveTangent=(X=-316.395233,Y=14.544721,Z=122.975578),InterpMode=CIM_CurveAutoClamped),(InVal=119.838181,OutVal=(X=7182.797852,Y=-6331.318848,Z=704.479858),InterpMode=CIM_CurveAutoClamped),(InVal=130.070374,OutVal=(X=7356.948242,Y=-9766.869141,Z=579.361328),ArriveTangent=(X=0.000000,Y=-396.456360,Z=-25.753925),LeaveTangent=(X=0.000000,Y=-396.456360,Z=-25.753925),InterpMode=CIM_CurveAutoClamped),(InVal=132.775330,OutVal=(X=7342.296875,Y=-11460.333984,Z=371.297485),ArriveTangent=(X=0.000000,Y=-21.326569,Z=-29.981781),LeaveTangent=(X=0.000000,Y=-21.326569,Z=-29.981781),InterpMode=CIM_CurveAutoClamped),(InVal=139.782303,OutVal=(X=7900.439453,Y=-11508.803711,Z=277.130981),ArriveTangent=(X=222.107529,Y=-13.432513,Z=-26.033894),LeaveTangent=(X=222.107529,Y=-13.432513,Z=-26.033894),InterpMode=CIM_CurveAutoClamped),(InVal=140.797638,OutVal=(X=9350.634766,Y=-11568.093750,Z=162.445557),ArriveTangent=(X=690.954956,Y=0.000000,Z=0.000000),LeaveTangent=(X=690.954956,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=142.666916,OutVal=(X=9986.771484,Y=-10794.590820,Z=205.703247),ArriveTangent=(X=368.799591,Y=0.000000,Z=0.000000),LeaveTangent=(X=368.799591,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=149.320801,OutVal=(X=12673.515625,Y=-11573.583008,Z=164.418091),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.106350),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.106350),InterpMode=CIM_CurveAutoClamped),(InVal=153.102020,OutVal=(X=12185.610352,Y=-10251.389648,Z=100.242432),ArriveTangent=(X=-41.723751,Y=627.005615,Z=-27.988890),LeaveTangent=(X=-41.723751,Y=627.005615,Z=-27.988890),InterpMode=CIM_CurveAutoClamped),(InVal=155.325150,OutVal=(X=12134.899414,Y=-7808.822754,Z=-3.636963),ArriveTangent=(X=-61.337570,Y=0.000000,Z=0.000000),LeaveTangent=(X=-61.337570,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=156.765564,OutVal=(X=11043.218750,Y=-8011.850586,Z=28.457642),ArriveTangent=(X=-359.104767,Y=0.000000,Z=0.000000),LeaveTangent=(X=-359.104767,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=160.073288,OutVal=(X=10429.820313,Y=-6158.604980,Z=-6.940674),ArriveTangent=(X=0.000000,Y=186.270020,Z=0.000000),LeaveTangent=(X=0.000000,Y=186.270020,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=169.785217,OutVal=(X=11705.420898,Y=-5392.679199,Z=20.318726),ArriveTangent=(X=140.923660,Y=0.000000,Z=5.526166),LeaveTangent=(X=140.923660,Y=0.000000,Z=5.526166),InterpMode=CIM_CurveAutoClamped),(InVal=179.843994,OutVal=(X=13215.980469,Y=-7404.366211,Z=154.739868),ArriveTangent=(X=165.368896,Y=-173.243347,Z=0.000000),LeaveTangent=(X=165.368896,Y=-173.243347,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=182.260681,OutVal=(X=13768.474609,Y=-7782.843750,Z=138.917847),ArriveTangent=(X=314.309753,Y=-155.764496,Z=-10.244261),LeaveTangent=(X=314.309753,Y=-155.764496,Z=-10.244261),InterpMode=CIM_CurveAutoClamped),(InVal=185.141479,OutVal=(X=14883.257813,Y=-8229.526367,Z=95.733398),ArriveTangent=(X=159.620407,Y=-208.940338,Z=-21.530176),LeaveTangent=(X=159.620407,Y=-208.940338,Z=-21.530176),InterpMode=CIM_CurveAutoClamped),(InVal=189.555908,OutVal=(X=15214.083984,Y=-9382.921875,Z=-34.087402),ArriveTangent=(X=44.671566,Y=-294.494904,Z=-48.794235),LeaveTangent=(X=44.671566,Y=-294.494904,Z=-48.794235),InterpMode=CIM_CurveAutoClamped),(InVal=192.631592,OutVal=(X=15298.869141,Y=-10435.326172,Z=-269.740906),ArriveTangent=(X=0.000000,Y=-216.542709,Z=0.000000),LeaveTangent=(X=0.000000,Y=-216.542709,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=200.134964,OutVal=(X=14440.514648,Y=-11673.739258,Z=-3.908325),ArriveTangent=(X=-274.661285,Y=0.000000,Z=44.171043),LeaveTangent=(X=-274.661285,Y=0.000000,Z=44.171043),InterpMode=CIM_CurveAutoClamped),(InVal=202.138245,OutVal=(X=12639.382813,Y=-11418.904297,Z=150.177856),ArriveTangent=(X=-619.855347,Y=305.005096,Z=0.000000),LeaveTangent=(X=-619.855347,Y=305.005096,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=203.146515,OutVal=(X=12197.238281,Y=-10398.123047,Z=108.161621),ArriveTangent=(X=0.000000,Y=959.500427,Z=0.000000),LeaveTangent=(X=0.000000,Y=959.500427,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=204.442886,OutVal=(X=12372.564453,Y=-9207.599609,Z=118.627197),ArriveTangent=(X=196.914047,Y=460.758301,Z=0.000000),LeaveTangent=(X=196.914047,Y=460.758301,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=207.179657,OutVal=(X=13231.099609,Y=-8539.819336,Z=117.216797),ArriveTangent=(X=168.542282,Y=225.792267,Z=0.000000),LeaveTangent=(X=168.542282,Y=225.792267,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=210.193756,OutVal=(X=13506.506836,Y=-7909.097656,Z=119.868530),ArriveTangent=(X=229.399231,Y=112.269188,Z=0.000000),LeaveTangent=(X=229.399231,Y=112.269188,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=211.212769,OutVal=(X=14358.362305,Y=-7828.430664,Z=103.602051),ArriveTangent=(X=469.163177,Y=0.000000,Z=0.000000),LeaveTangent=(X=469.163177,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=213.373383,OutVal=(X=14998.270508,Y=-8380.867188,Z=137.349487),ArriveTangent=(X=119.670013,Y=-278.498718,Z=0.000000),LeaveTangent=(X=119.670013,Y=-278.498718,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=220.079102,OutVal=(X=15419.396484,Y=-10410.208984,Z=-301.937378),ArriveTangent=(X=91.511635,Y=-23.909340,Z=-44.540012),LeaveTangent=(X=91.511635,Y=-23.909340,Z=-44.540012),InterpMode=CIM_CurveAutoClamped),(InVal=229.791031,OutVal=(X=16641.953125,Y=-10497.759766,Z=-593.892761),ArriveTangent=(X=147.172714,Y=-20.260441,Z=-7.375811),LeaveTangent=(X=147.172714,Y=-20.260441,Z=-7.375811),InterpMode=CIM_CurveAutoClamped),(InVal=240.023224,OutVal=(X=18354.626953,Y=-11633.863281,Z=-627.758301),ArriveTangent=(X=209.748215,Y=0.000000,Z=-6.570652),LeaveTangent=(X=209.748215,Y=0.000000,Z=-6.570652),InterpMode=CIM_CurveAutoClamped),(InVal=242.325470,OutVal=(X=19271.029297,Y=-11354.641602,Z=-676.252197),ArriveTangent=(X=203.524536,Y=0.000000,Z=0.000000),LeaveTangent=(X=203.524536,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=249.561722,OutVal=(X=20295.945313,Y=-11993.089844,Z=-656.073425),ArriveTangent=(X=186.087311,Y=0.000000,Z=0.240433),LeaveTangent=(X=186.087311,Y=0.000000,Z=0.240433),InterpMode=CIM_CurveAutoClamped),(InVal=259.620514,OutVal=(X=22536.216797,Y=-11733.446289,Z=-655.148560),ArriveTangent=(X=0.000000,Y=61.335068,Z=0.000000),LeaveTangent=(X=0.000000,Y=61.335068,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=265.515961,OutVal=(X=22337.009766,Y=-10485.408203,Z=-689.599854),ArriveTangent=(X=-57.676426,Y=134.267273,Z=-12.316481),LeaveTangent=(X=-57.676426,Y=134.267273,Z=-12.316481),InterpMode=CIM_CurveAutoClamped),(InVal=269.679291,OutVal=(X=21956.062500,Y=-10131.501953,Z=-813.725098),ArriveTangent=(X=-129.775024,Y=89.225189,Z=0.000000),LeaveTangent=(X=-129.775024,Y=89.225189,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=273.150085,OutVal=(X=21346.291016,Y=-9804.251953,Z=-806.825073),ArriveTangent=(X=-161.161743,Y=14.085661,Z=3.665572),LeaveTangent=(X=-161.161743,Y=14.085661,Z=3.665572),InterpMode=CIM_CurveAutoClamped),(InVal=280.085144,OutVal=(X=20279.037109,Y=-9768.108398,Z=-682.417114),ArriveTangent=(X=-14.877899,Y=0.000000,Z=0.000000),LeaveTangent=(X=-14.877899,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=283.376953,OutVal=(X=20253.201172,Y=-10076.004883,Z=-685.663452),ArriveTangent=(X=-20.171354,Y=-74.844162,Z=0.000000),LeaveTangent=(X=-20.171354,Y=-74.844162,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=285.393524,OutVal=(X=20013.457031,Y=-10189.169922,Z=-666.462097),ArriveTangent=(X=0.000000,Y=-107.590012,Z=0.000000),LeaveTangent=(X=0.000000,Y=-107.590012,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=287.410065,OutVal=(X=20256.173828,Y=-10657.627930,Z=-686.331421),ArriveTangent=(X=161.212799,Y=0.000000,Z=0.000000),LeaveTangent=(X=161.212799,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=289.138550,OutVal=(X=20617.203125,Y=-10627.288086,Z=-684.248657),ArriveTangent=(X=41.503006,Y=0.000000,Z=3.580171),LeaveTangent=(X=41.503006,Y=0.000000,Z=3.580171),InterpMode=CIM_CurveAutoClamped),(InVal=289.676971,OutVal=(X=20631.156250,Y=-11024.878906,Z=-666.697937),ArriveTangent=(X=0.000000,Y=-97.603882,Z=0.000000),LeaveTangent=(X=0.000000,Y=-97.603882,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=289.970520,OutVal=(X=19891.626953,Y=-11039.551758,Z=-691.976990),ArriveTangent=(X=-185.588959,Y=0.000000,Z=0.000000),LeaveTangent=(X=-185.588959,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=300.029297,OutVal=(X=18709.878906,Y=-10995.867188,Z=-674.175293),ArriveTangent=(X=0.000000,Y=14.051671,Z=0.000000),LeaveTangent=(X=0.000000,Y=14.051671,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=301.116608,OutVal=(X=18774.591797,Y=-10763.099609,Z=-704.388000),ArriveTangent=(X=0.000000,Y=152.741608,Z=0.000000),LeaveTangent=(X=0.000000,Y=152.741608,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=302.339661,OutVal=(X=18502.925781,Y=-10642.978516,Z=-685.836365),ArriveTangent=(X=0.000000,Y=108.707077,Z=0.000000),LeaveTangent=(X=0.000000,Y=108.707077,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=310.434937,OutVal=(X=18685.822266,Y=-9507.594727,Z=-702.369873),ArriveTangent=(X=0.000000,Y=79.787094,Z=0.000000),LeaveTangent=(X=0.000000,Y=79.787094,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=319.799988,OutVal=(X=17661.220703,Y=-9094.756836,Z=-700.956665),ArriveTangent=(X=-111.269608,Y=0.000000,Z=0.356029),LeaveTangent=(X=-111.269608,Y=0.000000,Z=0.356029),InterpMode=CIM_CurveAutoClamped),(InVal=330.205627,OutVal=(X=16485.945313,Y=-9272.796875,Z=-635.155579),InterpMode=CIM_CurveAutoClamped),(InVal=340.091003,OutVal=(X=18161.291016,Y=-8451.641602,Z=-730.848938),ArriveTangent=(X=193.718201,Y=0.000000,Z=-7.720876),LeaveTangent=(X=193.718201,Y=0.000000,Z=-7.720876),InterpMode=CIM_CurveAutoClamped),(InVal=349.847168,OutVal=(X=20290.869141,Y=-9074.474609,Z=-786.805481),ArriveTangent=(X=260.035706,Y=-34.356041,Z=-7.760063),LeaveTangent=(X=260.035706,Y=-34.356041,Z=-7.760063),InterpMode=CIM_CurveAutoClamped),(InVal=351.532776,OutVal=(X=21136.560547,Y=-9121.495117,Z=-819.637817),InterpMode=CIM_CurveAutoClamped),(InVal=359.732544,OutVal=(X=21030.673828,Y=-8198.064453,Z=-789.362793),ArriveTangent=(X=-39.150650,Y=0.000000,Z=7.425111),LeaveTangent=(X=-39.150650,Y=0.000000,Z=7.425111),InterpMode=CIM_CurveAutoClamped),(InVal=362.433319,OutVal=(X=19736.845703,Y=-8253.464844,Z=-738.700073),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.241305),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.241305),InterpMode=CIM_CurveAutoClamped),(InVal=365.079742,OutVal=(X=19887.595703,Y=-7077.332031,Z=-729.169617),ArriveTangent=(X=132.684570,Y=102.963715,Z=0.000000),LeaveTangent=(X=132.684570,Y=102.963715,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=366.687683,OutVal=(X=20577.158203,Y=-6991.591797,Z=-764.266235),ArriveTangent=(X=37.238274,Y=84.246330,Z=0.000000),LeaveTangent=(X=37.238274,Y=84.246330,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=370.138184,OutVal=(X=20622.005859,Y=-6390.079102,Z=-760.936035),ArriveTangent=(X=0.000000,Y=224.794495,Z=0.000000),LeaveTangent=(X=0.000000,Y=224.794495,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=371.176575,OutVal=(X=20414.441406,Y=-5982.513672,Z=-765.991821),ArriveTangent=(X=-255.313324,Y=0.000000,Z=0.000000),LeaveTangent=(X=-255.313324,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=372.751038,OutVal=(X=19941.660156,Y=-6221.168457,Z=-757.906250),ArriveTangent=(X=-139.120178,Y=0.000000,Z=11.880169),LeaveTangent=(X=-139.120178,Y=0.000000,Z=11.880169),InterpMode=CIM_CurveAutoClamped),(InVal=374.325500,OutVal=(X=19827.398438,Y=-5457.332031,Z=-636.930847),ArriveTangent=(X=-107.622681,Y=205.691849,Z=59.038860),LeaveTangent=(X=-107.622681,Y=205.691849,Z=59.038860),InterpMode=CIM_CurveAutoClamped),(InVal=379.676666,OutVal=(X=18223.595703,Y=-4796.623047,Z=-349.025024),ArriveTangent=(X=-198.637833,Y=0.000000,Z=0.000000),LeaveTangent=(X=-198.637833,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=390.255737,OutVal=(X=16663.050781,Y=-5001.242676,Z=-644.549072),ArriveTangent=(X=0.000000,Y=-48.594296,Z=-22.421818),LeaveTangent=(X=0.000000,Y=-48.594296,Z=-22.421818),InterpMode=CIM_CurveAutoClamped),(InVal=393.319489,OutVal=(X=16742.339844,Y=-5549.431641,Z=-702.752319),ArriveTangent=(X=30.975603,Y=0.000000,Z=0.000000),LeaveTangent=(X=30.975603,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=400.141052,OutVal=(X=16987.527344,Y=-5500.080566,Z=-691.343018),ArriveTangent=(X=45.547939,Y=0.000000,Z=0.000000),LeaveTangent=(X=45.547939,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=404.575958,OutVal=(X=17255.048828,Y=-6312.061035,Z=-694.386658),ArriveTangent=(X=6.674820,Y=0.000000,Z=0.000000),LeaveTangent=(X=6.674820,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=406.954407,OutVal=(X=17263.148438,Y=-5497.323730,Z=-675.106567),InterpMode=CIM_CurveAutoClamped),(InVal=407.121887,OutVal=(X=16574.960938,Y=-5552.706543,Z=-697.566650),ArriveTangent=(X=-175.527222,Y=-439.179993,Z=-22.379997),LeaveTangent=(X=-175.527222,Y=-439.179993,Z=-22.379997),InterpMode=CIM_CurveAutoClamped),(InVal=408.126862,OutVal=(X=16522.480469,Y=-7146.221680,Z=-705.661560),ArriveTangent=(X=0.000000,Y=-424.776367,Z=0.000000),LeaveTangent=(X=0.000000,Y=-424.776367,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=410.199860,OutVal=(X=17450.968750,Y=-7502.108398,Z=-668.023682),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.525159),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.525159),InterpMode=CIM_CurveAutoClamped),(InVal=420.085205,OutVal=(X=16506.474609,Y=-6308.653809,Z=-627.631470),ArriveTangent=(X=0.000000,Y=184.827896,Z=0.000000),LeaveTangent=(X=0.000000,Y=184.827896,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=424.574951,OutVal=(X=16809.914063,Y=-4845.190430,Z=-665.357605),ArriveTangent=(X=0.000000,Y=197.303726,Z=0.000000),LeaveTangent=(X=0.000000,Y=197.303726,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=430.317413,OutVal=(X=16191.548828,Y=-4205.926758,Z=-660.605347),ArriveTangent=(X=0.000000,Y=125.831337,Z=1.176657),LeaveTangent=(X=0.000000,Y=125.831337,Z=1.176657),InterpMode=CIM_CurveAutoClamped),(InVal=440.029327,OutVal=(X=16637.253906,Y=-2897.248047,Z=-644.794434),ArriveTangent=(X=56.216385,Y=50.998100,Z=0.000000),LeaveTangent=(X=56.216385,Y=50.998100,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=441.173553,OutVal=(X=16801.841797,Y=-2849.012695,Z=-651.908813),ArriveTangent=(X=212.617462,Y=60.383411,Z=0.000000),LeaveTangent=(X=212.617462,Y=60.383411,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=443.384521,OutVal=(X=17542.509766,Y=-2652.451172,Z=-499.330383),ArriveTangent=(X=0.000000,Y=100.638901,Z=19.517357),LeaveTangent=(X=0.000000,Y=100.638901,Z=19.517357),InterpMode=CIM_CurveAutoClamped),(InVal=449.394409,OutVal=(X=17509.158203,Y=-1975.356445,Z=-452.148682),ArriveTangent=(X=-11.169312,Y=39.260437,Z=13.975988),LeaveTangent=(X=-11.169312,Y=39.260437,Z=13.975988),InterpMode=CIM_CurveAutoClamped),(InVal=459.973480,OutVal=(X=16211.467773,Y=-1793.028320,Z=-38.872559),ArriveTangent=(X=-158.910919,Y=44.328503,Z=0.000000),LeaveTangent=(X=-158.910919,Y=44.328503,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=460.971527,OutVal=(X=15669.427734,Y=-1462.160156,Z=-45.418335),ArriveTangent=(X=-137.741043,Y=0.000000,Z=0.000000),LeaveTangent=(X=-137.741043,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=469.685425,OutVal=(X=14873.734375,Y=-2261.830078,Z=-16.614502),ArriveTangent=(X=-30.454576,Y=-143.773422,Z=0.000000),LeaveTangent=(X=-30.454576,Y=-143.773422,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=480.264465,OutVal=(X=14725.634766,Y=-4503.214844,Z=-50.683716),ArriveTangent=(X=-41.763420,Y=0.000000,Z=-1.069355),LeaveTangent=(X=-41.763420,Y=0.000000,Z=-1.069355),InterpMode=CIM_CurveAutoClamped),(InVal=483.258118,OutVal=(X=13629.369141,Y=-4431.358398,Z=-52.841675),ArriveTangent=(X=0.000000,Y=39.968922,Z=0.000000),LeaveTangent=(X=0.000000,Y=39.968922,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=489.802979,OutVal=(X=13653.177734,Y=-3725.109863,Z=-12.740112),ArriveTangent=(X=0.000000,Y=117.403938,Z=0.000000),LeaveTangent=(X=0.000000,Y=117.403938,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=491.632904,OutVal=(X=13212.744141,Y=-3448.125488,Z=-22.955688),ArriveTangent=(X=-193.704239,Y=177.886581,Z=-6.016560),LeaveTangent=(X=-193.704239,Y=177.886581,Z=-6.016560),InterpMode=CIM_CurveAutoClamped),(InVal=493.709839,OutVal=(X=12896.402344,Y=-3030.131836,Z=-36.245972),ArriveTangent=(X=-150.885345,Y=98.858711,Z=-12.843637),LeaveTangent=(X=-150.885345,Y=98.858711,Z=-12.843637),InterpMode=CIM_CurveAutoClamped),(InVal=495.920837,OutVal=(X=12565.757813,Y=-2915.119141,Z=-112.157471),ArriveTangent=(X=0.000000,Y=84.542938,Z=0.000000),LeaveTangent=(X=0.000000,Y=84.542938,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=500.035187,OutVal=(X=12620.796875,Y=-2216.387695,Z=-38.529053),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.512197),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.512197),InterpMode=CIM_CurveAutoClamped),(InVal=509.747131,OutVal=(X=12552.581055,Y=-4124.144531,Z=5.534668),ArriveTangent=(X=0.000000,Y=-164.449783,Z=8.117237),LeaveTangent=(X=0.000000,Y=-164.449783,Z=8.117237),InterpMode=CIM_CurveAutoClamped),(InVal=519.979309,OutVal=(X=13278.447266,Y=-5496.194336,Z=158.017944),ArriveTangent=(X=0.835026,Y=-154.299774,Z=29.022072),LeaveTangent=(X=0.835026,Y=-154.299774,Z=29.022072),InterpMode=CIM_CurveAutoClamped),(InVal=521.322693,OutVal=(X=13279.281250,Y=-5910.250977,Z=341.481445),ArriveTangent=(X=0.000000,Y=0.000000,Z=94.819077),LeaveTangent=(X=0.000000,Y=0.000000,Z=94.819077),InterpMode=CIM_CurveAutoClamped),(InVal=523.190247,OutVal=(X=12586.429688,Y=-5856.221191,Z=462.476074),ArriveTangent=(X=0.000000,Y=35.671185,Z=30.149363),LeaveTangent=(X=0.000000,Y=35.671185,Z=30.149363),InterpMode=CIM_CurveAutoClamped),(InVal=530.038086,OutVal=(X=12596.347656,Y=-5515.003418,Z=604.244995),ArriveTangent=(X=3.758940,Y=107.959053,Z=6.087175),LeaveTangent=(X=3.758940,Y=107.959053,Z=6.087175),InterpMode=CIM_CurveAutoClamped),(InVal=534.713989,OutVal=(X=12743.894531,Y=-4197.858887,Z=618.943970),ArriveTangent=(X=59.163059,Y=0.000000,Z=1.996608),LeaveTangent=(X=59.163059,Y=0.000000,Z=1.996608),InterpMode=CIM_CurveAutoClamped),(InVal=540.096863,OutVal=(X=13446.738281,Y=-4337.216309,Z=625.243164),ArriveTangent=(X=132.797531,Y=-46.566418,Z=0.000000),LeaveTangent=(X=132.797531,Y=-46.566418,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=549.982239,OutVal=(X=14771.480469,Y=-5807.274902,Z=624.646729),ArriveTangent=(X=193.119049,Y=0.000000,Z=0.000000),LeaveTangent=(X=193.119049,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=552.301147,OutVal=(X=15803.618164,Y=-5628.403320,Z=629.800659),ArriveTangent=(X=0.000000,Y=162.900909,Z=0.000000),LeaveTangent=(X=0.000000,Y=162.900909,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=554.076599,OutVal=(X=15524.228516,Y=-4895.204590,Z=628.968872),ArriveTangent=(X=0.000000,Y=140.791428,Z=-0.725038),LeaveTangent=(X=0.000000,Y=140.791428,Z=-0.725038),InterpMode=CIM_CurveAutoClamped),(InVal=559.867615,OutVal=(X=15876.849609,Y=-4544.897461,Z=613.895996),ArriveTangent=(X=0.000000,Y=86.579681,Z=-2.080418),LeaveTangent=(X=0.000000,Y=86.579681,Z=-2.080418),InterpMode=CIM_CurveAutoClamped),(InVal=561.647400,OutVal=(X=15711.765625,Y=-4239.727051,Z=610.793091),ArriveTangent=(X=0.000000,Y=116.031464,Z=0.000000),LeaveTangent=(X=0.000000,Y=116.031464,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=569.232666,OutVal=(X=15722.872070,Y=-3458.256836,Z=626.692993),ArriveTangent=(X=3.266098,Y=0.000000,Z=0.000000),LeaveTangent=(X=3.266098,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=579.985168,OutVal=(X=18597.064453,Y=-3625.322266,Z=-85.760498),ArriveTangent=(X=49.821777,Y=-29.596004,Z=-19.834690),LeaveTangent=(X=49.821777,Y=-29.596004,Z=-19.834690),InterpMode=CIM_CurveAutoClamped),(InVal=590.564209,OutVal=(X=18829.835938,Y=-4282.222656,Z=-184.573669),InterpMode=CIM_CurveAutoClamped),(InVal=600.449585,OutVal=(X=18369.169922,Y=-3637.498047,Z=-43.146118),ArriveTangent=(X=-94.216263,Y=40.719730,Z=28.248322),LeaveTangent=(X=-94.216263,Y=40.719730,Z=28.248322),InterpMode=CIM_CurveAutoClamped),(InVal=610.334961,OutVal=(X=15946.144531,Y=-3399.612793,Z=621.283569),ArriveTangent=(X=-215.870422,Y=43.409241,Z=4.902094),LeaveTangent=(X=-215.870422,Y=43.409241,Z=4.902094),InterpMode=CIM_CurveAutoClamped),(InVal=620.107727,OutVal=(X=14125.558594,Y=-2625.959961,Z=641.199097),ArriveTangent=(X=-222.608536,Y=0.000000,Z=0.000000),LeaveTangent=(X=-222.608536,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=622.541748,OutVal=(X=13228.809570,Y=-2956.566406,Z=628.184448),ArriveTangent=(X=-45.787895,Y=0.000000,Z=-2.092044),LeaveTangent=(X=-45.787895,Y=0.000000,Z=-2.092044),InterpMode=CIM_CurveAutoClamped),(InVal=629.819641,OutVal=(X=13114.308594,Y=-2750.903320,Z=620.881348),ArriveTangent=(X=-28.157995,Y=0.000000,Z=-1.067792),LeaveTangent=(X=-28.157995,Y=0.000000,Z=-1.067792),InterpMode=CIM_CurveAutoClamped),(InVal=639.878418,OutVal=(X=12498.586914,Y=-4227.416992,Z=609.672485),ArriveTangent=(X=-127.345428,Y=0.000000,Z=0.000000),LeaveTangent=(X=-127.345428,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=645.890686,OutVal=(X=10800.658203,Y=-3994.472656,Z=611.262939),ArriveTangent=(X=-169.729034,Y=0.000000,Z=0.000000),LeaveTangent=(X=-169.729034,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=649.763733,OutVal=(X=10386.675781,Y=-4304.120605,Z=604.901123),ArriveTangent=(X=-58.743908,Y=-113.186134,Z=-1.574564),LeaveTangent=(X=-58.743908,Y=-113.186134,Z=-1.574564),InterpMode=CIM_CurveAutoClamped),(InVal=657.193420,OutVal=(X=10136.691406,Y=-5510.649902,Z=593.466064),ArriveTangent=(X=0.000000,Y=-130.873749,Z=0.000000),LeaveTangent=(X=0.000000,Y=-130.873749,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=660.169373,OutVal=(X=10234.682617,Y=-5825.350098,Z=622.956299),ArriveTangent=(X=0.000000,Y=-83.240982,Z=0.000000),LeaveTangent=(X=0.000000,Y=-83.240982,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=661.968933,OutVal=(X=9945.935547,Y=-5936.483398,Z=602.383179),ArriveTangent=(X=0.000000,Y=-69.815094,Z=0.000000),LeaveTangent=(X=0.000000,Y=-69.815094,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=669.881287,OutVal=(X=10034.596680,Y=-6608.879883,Z=629.397827),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.895560),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.895560),InterpMode=CIM_CurveAutoClamped),(InVal=679.766602,OutVal=(X=9139.841797,Y=-6240.897461,Z=633.259766),ArriveTangent=(X=-22.807014,Y=64.310562,Z=0.866382),LeaveTangent=(X=-22.807014,Y=64.310562,Z=0.866382),InterpMode=CIM_CurveAutoClamped),(InVal=690.172241,OutVal=(X=9032.913086,Y=-5106.200684,Z=676.668335),ArriveTangent=(X=0.000000,Y=87.630501,Z=0.000000),LeaveTangent=(X=0.000000,Y=87.630501,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=700.231018,OutVal=(X=9374.998047,Y=-4447.590332,Z=606.852173),ArriveTangent=(X=4.128728,Y=112.699699,Z=-2.135131),LeaveTangent=(X=4.128728,Y=112.699699,Z=-2.135131),InterpMode=CIM_CurveAutoClamped),(InVal=709.769531,OutVal=(X=9391.975586,Y=-2694.624023,Z=597.128784),ArriveTangent=(X=0.000000,Y=18.904945,Z=-1.939017),LeaveTangent=(X=0.000000,Y=18.904945,Z=-1.939017),InterpMode=CIM_CurveAutoClamped),(InVal=712.519531,OutVal=(X=8429.745117,Y=-2662.492188,Z=583.024536),ArriveTangent=(X=-83.389725,Y=26.134233,Z=-3.719362),LeaveTangent=(X=-83.389725,Y=26.134233,Z=-3.719362),InterpMode=CIM_CurveAutoClamped),(InVal=714.968201,OutVal=(X=8334.505859,Y=-2420.372070,Z=577.026733),ArriveTangent=(X=-66.206322,Y=49.183933,Z=0.000000),LeaveTangent=(X=-66.206322,Y=49.183933,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=720.001709,OutVal=(X=7410.384766,Y=-2294.489258,Z=590.320679),ArriveTangent=(X=-29.986412,Y=0.000000,Z=2.387782),LeaveTangent=(X=-29.986412,Y=0.000000,Z=2.387782),InterpMode=CIM_CurveAutoClamped),(InVal=729.887085,OutVal=(X=7299.257813,Y=-3379.870117,Z=612.649780),ArriveTangent=(X=-21.284061,Y=0.000000,Z=1.573867),LeaveTangent=(X=-21.284061,Y=0.000000,Z=1.573867),InterpMode=CIM_CurveAutoClamped),(InVal=739.252075,OutVal=(X=6895.990234,Y=-3348.308594,Z=622.017578),ArriveTangent=(X=-79.368515,Y=0.000000,Z=0.000000),LeaveTangent=(X=-79.368515,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=741.355652,OutVal=(X=6389.014648,Y=-3485.969727,Z=609.302979),ArriveTangent=(X=-127.017967,Y=0.000000,Z=0.000000),LeaveTangent=(X=-127.017967,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=750.524902,OutVal=(X=5464.138672,Y=-2669.253906,Z=633.849854),ArriveTangent=(X=-3.860645,Y=0.000000,Z=2.376748),LeaveTangent=(X=-3.860645,Y=0.000000,Z=2.376748),InterpMode=CIM_CurveAutoClamped),(InVal=760.063354,OutVal=(X=5449.312500,Y=-3794.924805,Z=653.766479),ArriveTangent=(X=0.000000,Y=-166.826202,Z=0.000000),LeaveTangent=(X=0.000000,Y=-166.826202,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=761.770691,OutVal=(X=5802.413086,Y=-4545.346191,Z=636.555908),ArriveTangent=(X=0.000000,Y=-186.271286,Z=-3.703092),LeaveTangent=(X=0.000000,Y=-186.271286,Z=-3.703092),InterpMode=CIM_CurveAutoClamped),(InVal=769.775269,OutVal=(X=5604.010742,Y=-5603.975586,Z=617.802368),InterpMode=CIM_CurveAutoClamped),(InVal=779.834045,OutVal=(X=6337.353516,Y=-5474.568848,Z=631.006836),ArriveTangent=(X=60.504726,Y=29.062965,Z=1.204324),LeaveTangent=(X=60.504726,Y=29.062965,Z=1.204324),InterpMode=CIM_CurveAutoClamped),(InVal=789.199097,OutVal=(X=6779.244141,Y=-4291.398926,Z=641.194946),ArriveTangent=(X=78.466866,Y=37.042088,Z=1.104922),LeaveTangent=(X=78.466866,Y=37.042088,Z=1.104922),InterpMode=CIM_CurveAutoClamped),(InVal=800.108765,OutVal=(X=8169.842773,Y=-4108.923340,Z=653.408813),InterpMode=CIM_CurveAutoClamped),(InVal=809.994141,OutVal=(X=7857.670898,Y=-5408.573730,Z=555.325317),ArriveTangent=(X=0.000000,Y=-78.107536,Z=-11.018445),LeaveTangent=(X=0.000000,Y=-78.107536,Z=-11.018445),InterpMode=CIM_CurveAutoClamped),(InVal=820.399780,OutVal=(X=7882.361328,Y=-5873.248535,Z=429.833374),ArriveTangent=(X=6.725048,Y=-9.148672,Z=-13.542847),LeaveTangent=(X=6.725048,Y=-9.148672,Z=-13.542847),InterpMode=CIM_CurveAutoClamped),(InVal=825.955688,OutVal=(X=8458.126953,Y=-5900.282715,Z=339.160522),ArriveTangent=(X=15.760509,Y=0.000000,Z=-22.206223),LeaveTangent=(X=15.760509,Y=0.000000,Z=-22.206223),InterpMode=CIM_CurveAutoClamped),(InVal=830.458557,OutVal=(X=8490.623047,Y=-5527.563965,Z=206.465942),ArriveTangent=(X=0.000000,Y=84.899315,Z=-21.036081),LeaveTangent=(X=0.000000,Y=84.899315,Z=-21.036081),InterpMode=CIM_CurveAutoClamped),(InVal=840.170471,OutVal=(X=8277.461914,Y=-4691.028320,Z=40.137207),ArriveTangent=(X=0.000000,Y=50.178036,Z=-9.336685),LeaveTangent=(X=0.000000,Y=50.178036,Z=-9.336685),InterpMode=CIM_CurveAutoClamped),(InVal=850.055786,OutVal=(X=8833.212891,Y=-4408.727051,Z=-10.848633),ArriveTangent=(X=21.240181,Y=0.000000,Z=-0.470858),LeaveTangent=(X=21.240181,Y=0.000000,Z=-0.470858),InterpMode=CIM_CurveAutoClamped),(InVal=859.767761,OutVal=(X=8935.204102,Y=-5055.563477,Z=-12.770752),ArriveTangent=(X=18.498131,Y=-58.518230,Z=-0.461188),LeaveTangent=(X=18.498131,Y=-58.518230,Z=-0.461188),InterpMode=CIM_CurveAutoClamped),(InVal=870.173340,OutVal=(X=9278.209961,Y=-5585.970703,Z=-59.164307),ArriveTangent=(X=42.997066,Y=0.000000,Z=0.000000),LeaveTangent=(X=42.997066,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=879.885254,OutVal=(X=9800.197266,Y=-5249.488770,Z=-45.863159),ArriveTangent=(X=78.603203,Y=0.000000,Z=1.676972),LeaveTangent=(X=78.603203,Y=0.000000,Z=1.676972),InterpMode=CIM_CurveAutoClamped),(InVal=890.290894,OutVal=(X=10865.966797,Y=-5442.375488,Z=-25.427734),ArriveTangent=(X=112.793457,Y=0.000000,Z=0.000000),LeaveTangent=(X=112.793457,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=893.412659,OutVal=(X=11326.000000,Y=-4946.987305,Z=-43.534912),ArriveTangent=(X=0.000000,Y=131.820007,Z=-6.756571),LeaveTangent=(X=0.000000,Y=131.820007,Z=-6.756571),InterpMode=CIM_CurveAutoClamped),(InVal=895.933350,OutVal=(X=11275.978516,Y=-4698.586914,Z=-63.551392),InterpMode=CIM_CurveAutoClamped),(InVal=900.002808,OutVal=(X=11385.398438,Y=-4707.183105,Z=-39.142456),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.575613),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.575613),InterpMode=CIM_CurveAutoClamped),(InVal=910.235046,OutVal=(X=10908.628906,Y=-4251.456055,Z=-12.414063),ArriveTangent=(X=-88.273048,Y=28.471674,Z=2.812370),LeaveTangent=(X=-88.273048,Y=28.471674,Z=2.812370),InterpMode=CIM_CurveAutoClamped),(InVal=919.773560,OutVal=(X=9215.126953,Y=-4087.174316,Z=16.460205),ArriveTangent=(X=0.000000,Y=36.541695,Z=0.000000),LeaveTangent=(X=0.000000,Y=36.541695,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=929.832275,OutVal=(X=9276.036133,Y=-2800.305664,Z=-66.556152),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.605680),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.605680),InterpMode=CIM_CurveAutoClamped),(InVal=939.207886,OutVal=(X=6676.038086,Y=-2809.646484,Z=-111.916748),ArriveTangent=(X=-9.450089,Y=-2.369316,Z=0.000000),LeaveTangent=(X=-9.450089,Y=-2.369316,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=949.960388,OutVal=(X=6636.331055,Y=-4158.714355,Z=0.129028),ArriveTangent=(X=-10.733658,Y=-62.836788,Z=0.000000),LeaveTangent=(X=-10.733658,Y=-62.836788,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=954.869751,OutVal=(X=5907.004883,Y=-4356.882813,Z=-32.091919),ArriveTangent=(X=-44.360912,Y=-59.520985,Z=-4.284652),LeaveTangent=(X=-44.360912,Y=-59.520985,Z=-4.284652),InterpMode=CIM_CurveAutoClamped),(InVal=960.192627,OutVal=(X=5798.327148,Y=-4774.589844,Z=-45.771484),ArriveTangent=(X=0.000000,Y=-87.545471,Z=0.000000),LeaveTangent=(X=0.000000,Y=-87.545471,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=963.512146,OutVal=(X=6198.541992,Y=-5113.485352,Z=-3.988159),ArriveTangent=(X=65.864357,Y=0.000000,Z=5.902598),LeaveTangent=(X=65.864357,Y=0.000000,Z=5.902598),InterpMode=CIM_CurveAutoClamped),(InVal=969.904541,OutVal=(X=6437.996094,Y=-4841.137207,Z=14.310669),ArriveTangent=(X=66.646744,Y=77.294640,Z=1.347159),LeaveTangent=(X=66.646744,Y=77.294640,Z=1.347159),InterpMode=CIM_CurveAutoClamped),(InVal=972.034546,OutVal=(X=6766.532227,Y=-4454.749512,Z=16.277222),ArriveTangent=(X=185.084244,Y=74.893730,Z=1.388625),LeaveTangent=(X=185.084244,Y=74.893730,Z=1.388625),InterpMode=CIM_CurveAutoClamped),(InVal=979.963318,OutVal=(X=8701.124023,Y=-4087.797852,Z=59.096680),ArriveTangent=(X=0.000000,Y=9.765923,Z=0.000000),LeaveTangent=(X=0.000000,Y=9.765923,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=979.963318,OutVal=(X=8701.115234,Y=-4087.796875,Z=59.096680),ArriveTangent=(X=0.000000,Y=9.767044,Z=0.000000),LeaveTangent=(X=0.000000,Y=9.767044,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=981.637207,OutVal=(X=9465.255859,Y=-4001.208984,Z=34.639160),ArriveTangent=(X=427.648956,Y=0.000000,Z=0.000000),LeaveTangent=(X=427.648956,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=985.358276,OutVal=(X=11008.263672,Y=-4622.343262,Z=42.121338),ArriveTangent=(X=322.937103,Y=0.000000,Z=2.031212),LeaveTangent=(X=322.937103,Y=0.000000,Z=2.031212),InterpMode=CIM_CurveAutoClamped),(InVal=991.062683,OutVal=(X=12509.091797,Y=-4061.876465,Z=53.784302),ArriveTangent=(X=12.820129,Y=147.959808,Z=0.000000),LeaveTangent=(X=12.820129,Y=147.959808,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1000.254333,OutVal=(X=12551.628906,Y=-2009.118164,Z=43.705078),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.721049),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.721049),InterpMode=CIM_CurveAutoClamped),(InVal=1010.313110,OutVal=(X=11890.914063,Y=-2067.750977,Z=18.767090),ArriveTangent=(X=0.000000,Y=-13.946011,Z=-2.168381),LeaveTangent=(X=0.000000,Y=-13.946011,Z=-2.168381),InterpMode=CIM_CurveAutoClamped),(InVal=1019.851624,OutVal=(X=11965.783203,Y=-3192.024414,Z=1.210693),ArriveTangent=(X=0.000000,Y=-11.855244,Z=-1.336820),LeaveTangent=(X=0.000000,Y=-11.855244,Z=-1.336820),InterpMode=CIM_CurveAutoClamped),(InVal=1029.043213,OutVal=(X=9673.578125,Y=-3238.295898,Z=-6.809937),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.573738),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.573738),InterpMode=CIM_CurveAutoClamped),(InVal=1039.795776,OutVal=(X=9689.672852,Y=-1993.638672,Z=-40.281860),ArriveTangent=(X=0.000000,Y=65.362526,Z=0.000000),LeaveTangent=(X=0.000000,Y=65.362526,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1050.027954,OutVal=(X=8380.997070,Y=-1614.220703,Z=-11.184204),ArriveTangent=(X=-116.156464,Y=49.222839,Z=0.000000),LeaveTangent=(X=-116.156464,Y=49.222839,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1052.991089,OutVal=(X=8065.541016,Y=-1344.127930,Z=-14.450073),ArriveTangent=(X=-94.476601,Y=0.000000,Z=-1.691451),LeaveTangent=(X=-94.476601,Y=0.000000,Z=-1.691451),InterpMode=CIM_CurveAutoClamped),(InVal=1060.260254,OutVal=(X=7414.284180,Y=-2135.357422,Z=-40.462769),ArriveTangent=(X=-45.098530,Y=0.000000,Z=-1.332619),LeaveTangent=(X=-45.098530,Y=0.000000,Z=-1.332619),InterpMode=CIM_CurveAutoClamped),(InVal=1069.625244,OutVal=(X=7196.314453,Y=-1645.868164,Z=-46.291992),ArriveTangent=(X=0.000000,Y=97.125740,Z=0.000000),LeaveTangent=(X=0.000000,Y=97.125740,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1079.693359,OutVal=(X=7412.254883,Y=360.510742,Z=24.228882),ArriveTangent=(X=52.525982,Y=100.620262,Z=0.000000),LeaveTangent=(X=52.525982,Y=100.620262,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1083.077148,OutVal=(X=8008.314453,Y=597.196289,Z=23.667969),ArriveTangent=(X=135.006699,Y=107.359116,Z=-0.281269),LeaveTangent=(X=135.006699,Y=107.359116,Z=-0.281269),InterpMode=CIM_CurveAutoClamped),(InVal=1090.098999,OutVal=(X=8817.085938,Y=1969.766602,Z=18.207642),ArriveTangent=(X=102.516777,Y=84.984848,Z=-1.488342),LeaveTangent=(X=102.516777,Y=84.984848,Z=-1.488342),InterpMode=CIM_CurveAutoClamped),(InVal=1099.984375,OutVal=(X=9741.588867,Y=2375.484375,Z=-25.540283),ArriveTangent=(X=148.604233,Y=0.000000,Z=0.000000),LeaveTangent=(X=148.604233,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1110.736816,OutVal=(X=12085.430664,Y=2237.914063,Z=-20.369385),ArriveTangent=(X=181.660446,Y=0.000000,Z=0.000000),LeaveTangent=(X=181.660446,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1119.581543,OutVal=(X=13301.619141,Y=2254.802734,Z=-20.369629),ArriveTangent=(X=45.477360,Y=4.211593,Z=-0.000066),LeaveTangent=(X=45.477360,Y=4.211593,Z=-0.000066),InterpMode=CIM_CurveAutoClamped),(InVal=1129.813721,OutVal=(X=13517.195313,Y=2509.627930,Z=-27.250732),InterpMode=CIM_CurveAutoClamped),(InVal=1139.699097,OutVal=(X=13468.500977,Y=1773.102539,Z=-9.425781),ArriveTangent=(X=-11.152449,Y=-64.167160,Z=0.000000),LeaveTangent=(X=-11.152449,Y=-64.167160,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1150.278076,OutVal=(X=12733.400391,Y=1196.488281,Z=-48.305786),ArriveTangent=(X=-60.987473,Y=0.000000,Z=-3.621106),LeaveTangent=(X=-60.987473,Y=0.000000,Z=-3.621106),InterpMode=CIM_CurveAutoClamped),(InVal=1159.469727,OutVal=(X=12262.740234,Y=1220.868164,Z=-81.017334),InterpMode=CIM_CurveAutoClamped),(InVal=1169.701904,OutVal=(X=12720.106445,Y=516.191406,Z=-8.345581),ArriveTangent=(X=0.000000,Y=-54.214886,Z=2.256185),LeaveTangent=(X=0.000000,Y=-54.214886,Z=2.256185),InterpMode=CIM_CurveAutoClamped),(InVal=1179.587280,OutVal=(X=10384.194336,Y=130.197266,Z=2.319092),ArriveTangent=(X=-114.467094,Y=0.000000,Z=0.000000),LeaveTangent=(X=-114.467094,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1182.628052,OutVal=(X=10139.336914,Y=219.862305,Z=-42.786499),ArriveTangent=(X=-66.735146,Y=0.000000,Z=0.000000),LeaveTangent=(X=-66.735146,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1186.109009,OutVal=(X=9948.965820,Y=-147.939453,Z=-37.974243),ArriveTangent=(X=-103.356598,Y=0.000000,Z=0.000000),LeaveTangent=(X=-103.356598,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1190.339722,OutVal=(X=8911.578125,Y=-106.239258,Z=-52.754883),ArriveTangent=(X=-12.237816,Y=0.000000,Z=0.000000),LeaveTangent=(X=-12.237816,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1193.724121,OutVal=(X=8893.436523,Y=-1519.166016,Z=-30.438721),InterpMode=CIM_CurveAutoClamped),(InVal=1199.531250,OutVal=(X=9160.148438,Y=-1315.699219,Z=-33.226929),ArriveTangent=(X=61.864090,Y=25.889353,Z=0.000000),LeaveTangent=(X=61.864090,Y=25.889353,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1210.283813,OutVal=(X=10027.715820,Y=-1090.446289,Z=50.904419),ArriveTangent=(X=134.392334,Y=0.000000,Z=0.093891),LeaveTangent=(X=134.392334,Y=0.000000,Z=0.093891),InterpMode=CIM_CurveAutoClamped),(InVal=1220.021240,OutVal=(X=12022.361328,Y=-1359.067383,Z=51.283203),ArriveTangent=(X=182.490585,Y=-11.994349,Z=0.000000),LeaveTangent=(X=182.490585,Y=-11.994349,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1230.080078,OutVal=(X=13640.347656,Y=-1420.377930,Z=-1.397949),ArriveTangent=(X=149.964828,Y=0.000000,Z=-1.827188),LeaveTangent=(X=149.964828,Y=0.000000,Z=-1.827188),InterpMode=CIM_CurveAutoClamped),(InVal=1232.287842,OutVal=(X=13955.325195,Y=-1404.880859,Z=-4.314941),ArriveTangent=(X=29.979603,Y=15.018097,Z=0.000000),LeaveTangent=(X=29.979603,Y=15.018097,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1235.312622,OutVal=(X=13992.855469,Y=-1055.454102,Z=-3.666870),ArriveTangent=(X=31.000282,Y=168.169846,Z=0.000000),LeaveTangent=(X=31.000282,Y=168.169846,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1237.761353,OutVal=(X=14655.201172,Y=-484.401367,Z=-18.821289),ArriveTangent=(X=198.806747,Y=0.000000,Z=0.000000),LeaveTangent=(X=198.806747,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1240.312256,OutVal=(X=14986.816406,Y=-1290.775391,Z=-10.632568),ArriveTangent=(X=110.045372,Y=-20.668663,Z=0.000000),LeaveTangent=(X=110.045372,Y=-20.668663,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1249.330444,OutVal=(X=15928.326172,Y=-1350.238281,Z=-61.463989),ArriveTangent=(X=42.740131,Y=0.000000,Z=0.000000),LeaveTangent=(X=42.740131,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1260.256348,OutVal=(X=16154.671875,Y=189.151367,Z=-51.333984),ArriveTangent=(X=0.000000,Y=34.266815,Z=0.983119),LeaveTangent=(X=0.000000,Y=34.266815,Z=0.983119),InterpMode=CIM_CurveAutoClamped),(InVal=1270.488525,OutVal=(X=14145.857422,Y=350.982422,Z=-40.663086),ArriveTangent=(X=-63.978840,Y=31.185375,Z=2.031736),LeaveTangent=(X=-63.978840,Y=31.185375,Z=2.031736),InterpMode=CIM_CurveAutoClamped),(InVal=1280.547241,OutVal=(X=13837.859375,Y=1084.861328,Z=5.268799),ArriveTangent=(X=0.000000,Y=123.846565,Z=12.415119),LeaveTangent=(X=0.000000,Y=123.846565,Z=12.415119),InterpMode=CIM_CurveAutoClamped),(InVal=1285.671265,OutVal=(X=13888.051758,Y=2231.312500,Z=468.868164),ArriveTangent=(X=0.000000,Y=194.257263,Z=30.217997),LeaveTangent=(X=0.000000,Y=194.257263,Z=30.217997),InterpMode=CIM_CurveAutoClamped),(InVal=1289.565430,OutVal=(X=13712.438477,Y=2836.709961,Z=529.182129),ArriveTangent=(X=-37.245441,Y=0.000000,Z=7.801723),LeaveTangent=(X=-37.245441,Y=0.000000,Z=7.801723),InterpMode=CIM_CurveAutoClamped),(InVal=1299.971069,OutVal=(X=13355.449219,Y=2145.393555,Z=580.431274),ArriveTangent=(X=-49.127769,Y=-46.953682,Z=4.972376),LeaveTangent=(X=-49.127769,Y=-46.953682,Z=4.972376),InterpMode=CIM_CurveAutoClamped),(InVal=1310.029785,OutVal=(X=12707.070313,Y=1843.117188,Z=630.938599),InterpMode=CIM_CurveAutoClamped),(InVal=1319.915039,OutVal=(X=12748.306641,Y=3171.159180,Z=595.796021),ArriveTangent=(X=0.000000,Y=15.584221,Z=-1.432743),LeaveTangent=(X=0.000000,Y=15.584221,Z=-1.432743),InterpMode=CIM_CurveAutoClamped),(InVal=1329.800415,OutVal=(X=11525.465820,Y=3236.413086,Z=588.704834),ArriveTangent=(X=-106.303650,Y=0.000000,Z=0.000000),LeaveTangent=(X=-106.303650,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1339.685791,OutVal=(X=10646.603516,Y=2494.753906,Z=599.784424),ArriveTangent=(X=-99.955917,Y=0.000000,Z=0.000000),LeaveTangent=(X=-99.955917,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1349.571045,OutVal=(X=9549.274414,Y=3048.097656,Z=581.296875),ArriveTangent=(X=-129.337097,Y=0.000000,Z=0.000000),LeaveTangent=(X=-129.337097,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1359.976685,OutVal=(X=8022.238281,Y=1714.546875,Z=614.691772),ArriveTangent=(X=-22.551868,Y=-84.134018,Z=0.000000),LeaveTangent=(X=-22.551868,Y=-84.134018,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1369.688599,OutVal=(X=7925.810547,Y=1212.910156,Z=614.168701),ArriveTangent=(X=-20.829424,Y=-48.568520,Z=-0.116356),LeaveTangent=(X=-20.829424,Y=-48.568520,Z=-0.116356),InterpMode=CIM_CurveAutoClamped),(InVal=1380.106812,OutVal=(X=7197.106445,Y=736.856445,Z=609.245728),ArriveTangent=(X=0.000000,Y=-77.476883,Z=-1.057177),LeaveTangent=(X=0.000000,Y=-77.476883,Z=-1.057177),InterpMode=CIM_CurveAutoClamped),(InVal=1390.859375,OutVal=(X=7313.440430,Y=-614.643555,Z=552.709106),ArriveTangent=(X=18.013260,Y=0.000000,Z=0.000000),LeaveTangent=(X=18.013260,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1394.413330,OutVal=(X=7454.813477,Y=-162.541016,Z=641.568481),ArriveTangent=(X=68.153336,Y=2.289635,Z=0.000000),LeaveTangent=(X=68.153336,Y=2.289635,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1400.050903,OutVal=(X=8261.439453,Y=-157.950195,Z=576.532959),ArriveTangent=(X=0.000000,Y=1.703125,Z=-1.058708),LeaveTangent=(X=0.000000,Y=1.703125,Z=-1.058708),InterpMode=CIM_CurveAutoClamped),(InVal=1409.762817,OutVal=(X=8226.110352,Y=1037.361328,Z=572.774902),ArriveTangent=(X=0.000000,Y=110.093231,Z=0.000000),LeaveTangent=(X=0.000000,Y=110.093231,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1419.821655,OutVal=(X=8658.723633,Y=2018.675781,Z=591.636108),ArriveTangent=(X=77.855614,Y=78.420906,Z=1.998471),LeaveTangent=(X=77.855614,Y=78.420906,Z=1.998471),InterpMode=CIM_CurveAutoClamped),(InVal=1429.880371,OutVal=(X=10105.479492,Y=2614.998047,Z=612.979248),InterpMode=CIM_CurveAutoClamped),(InVal=1439.765625,OutVal=(X=9889.293945,Y=1776.250977,Z=586.481201),ArriveTangent=(X=-33.983799,Y=0.000000,Z=0.000000),LeaveTangent=(X=-33.983799,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1449.477539,OutVal=(X=9429.819336,Y=1866.290039,Z=586.481201),ArriveTangent=(X=-1.575174,Y=0.000000,Z=0.000000),LeaveTangent=(X=-1.575174,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1460.056641,OutVal=(X=9423.214844,Y=1131.195313,Z=578.885864),ArriveTangent=(X=0.000000,Y=-10.137169,Z=0.000000),LeaveTangent=(X=0.000000,Y=-10.137169,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1470.982544,OutVal=(X=9989.140625,Y=1083.951172,Z=589.760498),ArriveTangent=(X=42.703945,Y=-10.761227,Z=0.000000),LeaveTangent=(X=42.703945,Y=-10.761227,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1480.000732,OutVal=(X=10274.906250,Y=224.256836,Z=573.350220),ArriveTangent=(X=24.478563,Y=-78.858566,Z=0.000000),LeaveTangent=(X=24.478563,Y=-78.858566,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1484.665161,OutVal=(X=10360.755859,Y=-66.627930,Z=609.904541),ArriveTangent=(X=0.000000,Y=-49.650200,Z=7.852029),LeaveTangent=(X=0.000000,Y=-49.650200,Z=7.852029),InterpMode=CIM_CurveAutoClamped),(InVal=1489.365723,OutVal=(X=9729.828125,Y=-240.716797,Z=646.884399),ArriveTangent=(X=-113.305984,Y=-0.937606,Z=0.000000),LeaveTangent=(X=-113.305984,Y=-0.937606,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1499.771362,OutVal=(X=8649.132813,Y=-243.954102,Z=623.116577),ArriveTangent=(X=-47.631565,Y=-0.759941,Z=0.000000),LeaveTangent=(X=-47.631565,Y=-0.759941,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1510.697266,OutVal=(X=8381.047852,Y=-678.316406,Z=627.395874),InterpMode=CIM_CurveAutoClamped),(InVal=1514.623169,OutVal=(X=9298.969727,Y=-163.952148,Z=622.392944),ArriveTangent=(X=141.306641,Y=0.000000,Z=0.000000),LeaveTangent=(X=141.306641,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1520.755981,OutVal=(X=9802.411133,Y=-552.962891,Z=632.559570),ArriveTangent=(X=68.827057,Y=0.000000,Z=0.853581),LeaveTangent=(X=68.827057,Y=0.000000,Z=0.853581),InterpMode=CIM_CurveAutoClamped),(InVal=1530.467896,OutVal=(X=10389.515625,Y=-518.482422,Z=636.794189),ArriveTangent=(X=2.182581,Y=8.696564,Z=0.000000),LeaveTangent=(X=2.182581,Y=8.696564,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1539.312744,OutVal=(X=10397.590820,Y=294.731445,Z=632.893188),ArriveTangent=(X=2.136009,Y=35.320782,Z=-0.571386),LeaveTangent=(X=2.136009,Y=35.320782,Z=-0.571386),InterpMode=CIM_CurveAutoClamped),(InVal=1549.718262,OutVal=(X=10993.083984,Y=470.657227,Z=625.794800),InterpMode=CIM_CurveAutoClamped),(InVal=1559.950439,OutVal=(X=10949.899414,Y=-228.972656,Z=637.631226),ArriveTangent=(X=0.000000,Y=-39.017815,Z=0.000000),LeaveTangent=(X=0.000000,Y=-39.017815,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1570.356079,OutVal=(X=11920.852539,Y=-457.853516,Z=628.592896),ArriveTangent=(X=29.554386,Y=0.000000,Z=-0.758249),LeaveTangent=(X=29.554386,Y=0.000000,Z=-0.758249),InterpMode=CIM_CurveAutoClamped),(InVal=1579.547729,OutVal=(X=12053.530273,Y=1004.631836,Z=622.771606),ArriveTangent=(X=29.788837,Y=3.687393,Z=0.000000),LeaveTangent=(X=29.788837,Y=3.687393,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1589.779907,OutVal=(X=13035.798828,Y=1019.416992,Z=635.107544),ArriveTangent=(X=32.252323,Y=0.000000,Z=0.000000),LeaveTangent=(X=32.252323,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1600.012085,OutVal=(X=13194.099609,Y=-261.319336,Z=625.170410),ArriveTangent=(X=24.865175,Y=0.000000,Z=-0.834610),LeaveTangent=(X=24.865175,Y=0.000000,Z=-0.834610),InterpMode=CIM_CurveAutoClamped),(InVal=1611.073364,OutVal=(X=13604.559570,Y=84.039063,Z=617.335815),ArriveTangent=(X=0.000000,Y=60.055325,Z=-0.826983),LeaveTangent=(X=0.000000,Y=60.055325,Z=-0.826983),InterpMode=CIM_CurveAutoClamped),(InVal=1619.744629,OutVal=(X=13547.015625,Y=1103.503906,Z=608.851929),ArriveTangent=(X=0.000000,Y=6.977913,Z=0.000000),LeaveTangent=(X=0.000000,Y=6.977913,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1629.803467,OutVal=(X=14198.385742,Y=1131.210938,Z=634.176270),ArriveTangent=(X=5.921591,Y=6.571949,Z=2.474427),LeaveTangent=(X=5.921591,Y=6.571949,Z=2.474427),InterpMode=CIM_CurveAutoClamped),(InVal=1639.341919,OutVal=(X=14222.370117,Y=1638.669922,Z=657.343994),ArriveTangent=(X=5.892385,Y=0.000000,Z=0.000000),LeaveTangent=(X=5.892385,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1649.574097,OutVal=(X=14881.436523,Y=1494.237305,Z=653.161743),ArriveTangent=(X=0.000000,Y=-27.466122,Z=0.000000),LeaveTangent=(X=0.000000,Y=-27.466122,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1660.153076,OutVal=(X=14335.158203,Y=821.343750,Z=674.653076),ArriveTangent=(X=-55.289516,Y=-70.890541,Z=0.000000),LeaveTangent=(X=-55.289516,Y=-70.890541,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1664.132813,OutVal=(X=14076.492188,Y=462.162109,Z=621.812012),ArriveTangent=(X=-82.850456,Y=0.000000,Z=-0.957539),LeaveTangent=(X=-82.850456,Y=0.000000,Z=-0.957539),InterpMode=CIM_CurveAutoClamped),(InVal=1670.038452,OutVal=(X=13503.732422,Y=578.864258,Z=619.700928),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.693229),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.693229),InterpMode=CIM_CurveAutoClamped),(InVal=1680.444092,OutVal=(X=13520.752930,Y=-29.495117,Z=578.975342),ArriveTangent=(X=4.001198,Y=-43.184334,Z=0.000000),LeaveTangent=(X=4.001198,Y=-43.184334,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1690.676270,OutVal=(X=14255.916016,Y=-320.913086,Z=612.657227),ArriveTangent=(X=79.807907,Y=0.000000,Z=0.000000),LeaveTangent=(X=79.807907,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1700.388184,OutVal=(X=15112.449219,Y=-169.297852,Z=611.119385),ArriveTangent=(X=86.476372,Y=4.721314,Z=0.000000),LeaveTangent=(X=86.476372,Y=4.721314,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1709.232910,OutVal=(X=15860.626953,Y=-149.223633,Z=611.119385),ArriveTangent=(X=60.715965,Y=3.113896,Z=0.000000),LeaveTangent=(X=60.715965,Y=3.113896,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1720.332275,OutVal=(X=16323.374023,Y=-106.488281,Z=560.099243),ArriveTangent=(X=59.070694,Y=7.184961,Z=-10.161627),LeaveTangent=(X=59.070694,Y=7.184961,Z=-10.161627),InterpMode=CIM_CurveAutoClamped),(InVal=1729.177002,OutVal=(X=17038.738281,Y=10.169922,Z=278.476196),ArriveTangent=(X=65.623795,Y=0.000000,Z=-27.570768),LeaveTangent=(X=65.623795,Y=0.000000,Z=-27.570768),InterpMode=CIM_CurveAutoClamped),(InVal=1739.755981,OutVal=(X=17598.031250,Y=-427.342773,Z=24.572754),ArriveTangent=(X=29.740164,Y=-74.283867,Z=-34.484371),LeaveTangent=(X=29.740164,Y=-74.283867,Z=-34.484371),InterpMode=CIM_CurveAutoClamped),(InVal=1749.814819,OutVal=(X=17767.486328,Y=-1757.723633,Z=-433.205933),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(ArriveTangent=(X=0.000000,Y=0.017475,Z=-0.279606),LeaveTangent=(X=0.000000,Y=0.017475,Z=-0.279606),InterpMode=CIM_CurveAuto),(InVal=10.058781,OutVal=(X=0.000000,Y=0.175781,Z=-2.812500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.631245),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.631245),InterpMode=CIM_CurveAutoClamped),(InVal=19.944111,OutVal=(X=0.000000,Y=-0.175781,Z=-32.871094),ArriveTangent=(X=0.000000,Y=-0.100758,Z=-6.129764),LeaveTangent=(X=0.000000,Y=-0.100758,Z=-6.129764),InterpMode=CIM_CurveAutoClamped),(InVal=24.848183,OutVal=(X=0.000000,Y=-5.888672,Z=-93.867188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.176459),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.176459),InterpMode=CIM_CurveAutoClamped),(InVal=29.829460,OutVal=(X=0.000000,Y=0.703125,Z=-163.125000),InterpMode=CIM_CurveAutoClamped),(InVal=34.848602,OutVal=(X=0.000000,Y=0.395508,Z=-84.133301),ArriveTangent=(X=0.000000,Y=-0.163070,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.163070,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=37.406853,OutVal=(X=0.000000,Y=-2.109375,Z=-180.065918),ArriveTangent=(X=0.000000,Y=-0.623771,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.623771,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=38.766319,OutVal=(X=0.000000,Y=-2.680664,Z=-58.535156),ArriveTangent=(X=0.000000,Y=0.000000,Z=79.466728),LeaveTangent=(X=0.000000,Y=0.000000,Z=79.466728),InterpMode=CIM_CurveAutoClamped),(InVal=39.714809,OutVal=(X=0.000000,Y=2.285156,Z=3.339844),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.629669),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.629669),InterpMode=CIM_CurveAutoClamped),(InVal=49.947018,OutVal=(X=0.000000,Y=1.054688,Z=5.097656),ArriveTangent=(X=0.000000,Y=-0.236103,Z=0.407805),LeaveTangent=(X=0.000000,Y=-0.236103,Z=0.407805),InterpMode=CIM_CurveAutoClamped),(InVal=60.352650,OutVal=(X=0.000000,Y=-4.746094,Z=49.218750),InterpMode=CIM_CurveAutoClamped),(InVal=70.064568,OutVal=(X=0.000000,Y=-0.878906,Z=0.175781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.540860),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.540860),InterpMode=CIM_CurveAutoClamped),(InVal=73.737366,OutVal=(X=0.000000,Y=-2.438965,Z=-91.867676),ArriveTangent=(X=0.000000,Y=-0.680140,Z=-25.608255),LeaveTangent=(X=0.000000,Y=-0.680140,Z=-25.608255),InterpMode=CIM_CurveAutoClamped),(InVal=77.008606,OutVal=(X=0.000000,Y=-5.625000,Z=-177.648926),InterpMode=CIM_CurveAutoClamped),(InVal=80.123344,OutVal=(X=0.000000,Y=2.636719,Z=-87.714844),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.329628),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.329628),InterpMode=CIM_CurveAutoClamped),(InVal=89.835266,OutVal=(X=0.000000,Y=-0.878906,Z=6.152344),InterpMode=CIM_CurveAutoClamped),(InVal=93.909958,OutVal=(X=0.000000,Y=2.395020,Z=-7.448730),InterpMode=CIM_CurveAutoClamped),(InVal=99.894043,OutVal=(X=0.000000,Y=1.933594,Z=2.636719),ArriveTangent=(X=0.000000,Y=-0.062995,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.062995,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.605972,OutVal=(X=0.000000,Y=1.406250,Z=-171.562500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.896078),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.896078),InterpMode=CIM_CurveAutoClamped),(InVal=112.758499,OutVal=(X=0.000000,Y=9.272461,Z=-191.140137),ArriveTangent=(X=0.000000,Y=0.000000,Z=-16.287502),LeaveTangent=(X=0.000000,Y=0.000000,Z=-16.287502),InterpMode=CIM_CurveAutoClamped),(InVal=113.848907,OutVal=(X=0.000000,Y=5.449219,Z=-268.176270),InterpMode=CIM_CurveAutoClamped),(InVal=115.406631,OutVal=(X=0.000000,Y=21.665039,Z=-178.901367),ArriveTangent=(X=0.000000,Y=0.000000,Z=31.128651),LeaveTangent=(X=0.000000,Y=0.000000,Z=31.128651),InterpMode=CIM_CurveAutoClamped),(InVal=119.838181,OutVal=(X=0.000000,Y=-7.031250,Z=-81.738281),ArriveTangent=(X=0.000000,Y=-0.258223,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.258223,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=130.070374,OutVal=(X=0.000000,Y=-7.910156,Z=-89.648438),ArriveTangent=(X=0.000000,Y=-0.237268,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.237268,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.775330,OutVal=(X=0.000000,Y=-11.337891,Z=-3.186035),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.831506),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.831506),InterpMode=CIM_CurveAutoClamped),(InVal=139.782303,OutVal=(X=0.000000,Y=-9.316406,Z=1.054688),ArriveTangent=(X=0.000000,Y=0.852212,Z=2.103352),LeaveTangent=(X=0.000000,Y=0.852212,Z=2.103352),InterpMode=CIM_CurveAutoClamped),(InVal=140.797638,OutVal=(X=0.000000,Y=-2.263184,Z=83.122559),ArriveTangent=(X=0.000000,Y=0.861040,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.861040,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=142.666916,OutVal=(X=0.000000,Y=-1.669922,Z=-42.231445),InterpMode=CIM_CurveAutoClamped),(InVal=149.320801,OutVal=(X=0.000000,Y=-5.273438,Z=17.753906),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.360336),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.360336),InterpMode=CIM_CurveAutoClamped),(InVal=153.102020,OutVal=(X=0.000000,Y=7.602539,Z=97.185059),ArriveTangent=(X=0.000000,Y=0.000000,Z=27.497160),LeaveTangent=(X=0.000000,Y=0.000000,Z=27.497160),InterpMode=CIM_CurveAutoClamped),(InVal=155.325150,OutVal=(X=0.000000,Y=0.285645,Z=182.856445),InterpMode=CIM_CurveAutoClamped),(InVal=156.765564,OutVal=(X=0.000000,Y=0.637207,Z=109.753418),ArriveTangent=(X=0.000000,Y=0.000000,Z=-24.147005),LeaveTangent=(X=0.000000,Y=0.000000,Z=-24.147005),InterpMode=CIM_CurveAutoClamped),(InVal=160.073288,OutVal=(X=0.000000,Y=-0.878906,Z=68.203125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.277676),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.277676),InterpMode=CIM_CurveAutoClamped),(InVal=169.785217,OutVal=(X=0.000000,Y=2.460938,Z=-50.097656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.610722),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.610722),InterpMode=CIM_CurveAutoClamped),(InVal=179.843994,OutVal=(X=0.000000,Y=-1.933594,Z=-56.953125),InterpMode=CIM_CurveAutoClamped),(InVal=182.260681,OutVal=(X=0.000000,Y=-0.615234,Z=-15.117188),InterpMode=CIM_CurveAutoClamped),(InVal=185.141479,OutVal=(X=0.000000,Y=-2.395020,Z=-54.030762),ArriveTangent=(X=0.000000,Y=-1.011975,Z=-8.577954),LeaveTangent=(X=0.000000,Y=-1.011975,Z=-8.577954),InterpMode=CIM_CurveAutoClamped),(InVal=189.555908,OutVal=(X=0.000000,Y=-10.371094,Z=-77.695313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.905931),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.905931),InterpMode=CIM_CurveAutoClamped),(InVal=192.631592,OutVal=(X=0.000000,Y=-9.558105,Z=-113.247070),ArriveTangent=(X=0.000000,Y=0.458756,Z=-10.218821),LeaveTangent=(X=0.000000,Y=0.458756,Z=-10.218821),InterpMode=CIM_CurveAutoClamped),(InVal=200.134964,OutVal=(X=0.000000,Y=7.382813,Z=-185.800781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.957896),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.957896),InterpMode=CIM_CurveAutoClamped),(InVal=202.138245,OutVal=(X=0.000000,Y=0.329590,Z=-245.939941),ArriveTangent=(X=0.000000,Y=0.000000,Z=-23.701195),LeaveTangent=(X=0.000000,Y=0.000000,Z=-23.701195),InterpMode=CIM_CurveAutoClamped),(InVal=203.146515,OutVal=(X=0.000000,Y=1.032715,Z=-264.265137),ArriveTangent=(X=0.000000,Y=0.000000,Z=-28.196404),LeaveTangent=(X=0.000000,Y=0.000000,Z=-28.196404),InterpMode=CIM_CurveAutoClamped),(InVal=204.442886,OutVal=(X=0.000000,Y=-0.395508,Z=-318.120117),InterpMode=CIM_CurveAutoClamped),(InVal=207.179657,OutVal=(X=0.000000,Y=1.186523,Z=-287.534180),InterpMode=CIM_CurveAutoClamped),(InVal=210.193756,OutVal=(X=0.000000,Y=0.351563,Z=-329.414063),ArriveTangent=(X=0.000000,Y=-0.672922,Z=-25.295368),LeaveTangent=(X=0.000000,Y=-0.672922,Z=-25.295368),InterpMode=CIM_CurveAutoClamped),(InVal=211.212769,OutVal=(X=0.000000,Y=-1.889648,Z=-389.553223),ArriveTangent=(X=0.000000,Y=-2.286928,Z=-31.000288),LeaveTangent=(X=0.000000,Y=-2.286928,Z=-31.000288),InterpMode=CIM_CurveAutoClamped),(InVal=213.373383,OutVal=(X=0.000000,Y=-6.943359,Z=-427.983398),ArriveTangent=(X=0.000000,Y=-1.531535,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.531535,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=220.079102,OutVal=(X=0.000000,Y=-15.468750,Z=-364.394531),InterpMode=CIM_CurveAutoClamped),(InVal=229.791031,OutVal=(X=0.000000,Y=-4.746094,Z=-426.621094),ArriveTangent=(X=0.000000,Y=0.846114,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.846114,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=240.023224,OutVal=(X=0.000000,Y=1.406250,Z=-351.914063),InterpMode=CIM_CurveAutoClamped),(InVal=242.325470,OutVal=(X=0.000000,Y=0.043945,Z=-360.109863),ArriveTangent=(X=0.000000,Y=-0.142244,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.142244,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=249.561722,OutVal=(X=0.000000,Y=-0.351563,Z=-343.652344),ArriveTangent=(X=0.000000,Y=-0.112547,Z=3.940305),LeaveTangent=(X=0.000000,Y=-0.112547,Z=3.940305),InterpMode=CIM_CurveAutoClamped),(InVal=259.620514,OutVal=(X=0.000000,Y=-5.976563,Z=-265.781250),ArriveTangent=(X=0.000000,Y=-0.599095,Z=7.894282),LeaveTangent=(X=0.000000,Y=-0.599095,Z=7.894282),InterpMode=CIM_CurveAutoClamped),(InVal=265.515961,OutVal=(X=0.000000,Y=-9.909668,Z=-217.705078),InterpMode=CIM_CurveAutoClamped),(InVal=269.679291,OutVal=(X=0.000000,Y=0.351563,Z=-221.835938),InterpMode=CIM_CurveAutoClamped),(InVal=273.150085,OutVal=(X=0.000000,Y=-6.064453,Z=-188.613281),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.247768),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.247768),InterpMode=CIM_CurveAutoClamped),(InVal=280.085144,OutVal=(X=0.000000,Y=-4.042969,Z=-83.671875),ArriveTangent=(X=0.000000,Y=0.487715,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.487715,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=283.376953,OutVal=(X=0.000000,Y=-1.076660,Z=-94.306641),InterpMode=CIM_CurveAutoClamped),(InVal=285.393524,OutVal=(X=0.000000,Y=-6.262207,Z=-81.826172),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.229451),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.229451),InterpMode=CIM_CurveAutoClamped),(InVal=287.410065,OutVal=(X=0.000000,Y=-0.615234,Z=8.679199),InterpMode=CIM_CurveAutoClamped),(InVal=289.138550,OutVal=(X=0.000000,Y=-6.174316,Z=-97.075195),ArriveTangent=(X=0.000000,Y=-1.662110,Z=-83.115692),LeaveTangent=(X=0.000000,Y=-1.662110,Z=-83.115692),InterpMode=CIM_CurveAutoClamped),(InVal=289.676971,OutVal=(X=0.000000,Y=-6.811523,Z=-179.736328),ArriveTangent=(X=0.000000,Y=0.000000,Z=-96.610855),LeaveTangent=(X=0.000000,Y=0.000000,Z=-96.610855),InterpMode=CIM_CurveAutoClamped),(InVal=289.970520,OutVal=(X=0.000000,Y=1.054688,Z=-198.632813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.160645),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.160645),InterpMode=CIM_CurveAutoClamped),(InVal=300.029297,OutVal=(X=0.000000,Y=-0.703125,Z=-274.570313),InterpMode=CIM_CurveAutoClamped),(InVal=301.116608,OutVal=(X=0.000000,Y=0.571289,Z=-207.048340),InterpMode=CIM_CurveAutoClamped),(InVal=302.339661,OutVal=(X=0.000000,Y=-0.593262,Z=-272.219238),ArriveTangent=(X=0.000000,Y=-0.400861,Z=-0.029361),LeaveTangent=(X=0.000000,Y=-0.400861,Z=-0.029361),InterpMode=CIM_CurveAutoClamped),(InVal=310.434937,OutVal=(X=0.000000,Y=-3.164063,Z=-272.285156),InterpMode=CIM_CurveAutoClamped),(InVal=319.799988,OutVal=(X=0.000000,Y=5.625000,Z=-191.953125),InterpMode=CIM_CurveAutoClamped),(InVal=330.205627,OutVal=(X=0.000000,Y=0.175781,Z=-330.117188),ArriveTangent=(X=0.000000,Y=-0.262746,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.262746,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=340.091003,OutVal=(X=0.000000,Y=-1.230469,Z=-268.417969),ArriveTangent=(X=0.000000,Y=-0.068143,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.068143,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=349.847168,OutVal=(X=0.000000,Y=-1.582031,Z=-316.933594),InterpMode=CIM_CurveAutoClamped),(InVal=351.532776,OutVal=(X=0.000000,Y=2.351074,Z=-287.160645),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.425371),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.425371),InterpMode=CIM_CurveAutoClamped),(InVal=359.732544,OutVal=(X=0.000000,Y=0.175781,Z=-184.218750),ArriveTangent=(X=0.000000,Y=-0.280188,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.280188,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=362.433319,OutVal=(X=0.000000,Y=-0.703125,Z=-269.890137),ArriveTangent=(X=0.000000,Y=-0.660120,Z=-29.327291),LeaveTangent=(X=0.000000,Y=-0.660120,Z=-29.327291),InterpMode=CIM_CurveAutoClamped),(InVal=365.079742,OutVal=(X=0.000000,Y=-5.229492,Z=-341.037598),ArriveTangent=(X=0.000000,Y=-1.279942,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.279942,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=366.687683,OutVal=(X=0.000000,Y=-6.701660,Z=-258.112793),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.153437),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.153437),InterpMode=CIM_CurveAutoClamped),(InVal=370.138184,OutVal=(X=0.000000,Y=3.339844,Z=-232.910156),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.752831),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.752831),InterpMode=CIM_CurveAutoClamped),(InVal=371.176575,OutVal=(X=0.000000,Y=-6.569824,Z=-171.892090),InterpMode=CIM_CurveAutoClamped),(InVal=372.751038,OutVal=(X=0.000000,Y=-0.461426,Z=-264.902344),ArriveTangent=(X=0.000000,Y=1.626802,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.626802,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=374.325500,OutVal=(X=0.000000,Y=0.834961,Z=-211.245117),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.563728),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.563728),InterpMode=CIM_CurveAutoClamped),(InVal=379.676666,OutVal=(X=0.000000,Y=-9.316406,Z=-177.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.423160),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.423160),InterpMode=CIM_CurveAutoClamped),(InVal=390.255737,OutVal=(X=0.000000,Y=-2.988281,Z=-88.769531),ArriveTangent=(X=0.000000,Y=0.681269,Z=13.444999),LeaveTangent=(X=0.000000,Y=0.681269,Z=13.444999),InterpMode=CIM_CurveAutoClamped),(InVal=393.319489,OutVal=(X=0.000000,Y=-0.021973,Z=5.537109),InterpMode=CIM_CurveAutoClamped),(InVal=400.141052,OutVal=(X=0.000000,Y=-1.406250,Z=-162.070313),ArriveTangent=(X=0.000000,Y=-0.164739,Z=-24.068190),LeaveTangent=(X=0.000000,Y=-0.164739,Z=-24.068190),InterpMode=CIM_CurveAutoClamped),(InVal=404.575958,OutVal=(X=0.000000,Y=-1.955566,Z=-265.385742),ArriveTangent=(X=0.000000,Y=-0.277413,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.277413,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=406.954407,OutVal=(X=0.000000,Y=-3.713379,Z=-167.409668),ArriveTangent=(X=0.000000,Y=0.000000,Z=70.105606),LeaveTangent=(X=0.000000,Y=0.000000,Z=70.105606),InterpMode=CIM_CurveAutoClamped),(InVal=407.121887,OutVal=(X=0.000000,Y=0.175781,Z=-86.901855),ArriveTangent=(X=0.000000,Y=7.758661,Z=142.354568),LeaveTangent=(X=0.000000,Y=7.758661,Z=142.354568),InterpMode=CIM_CurveAutoClamped),(InVal=408.126862,OutVal=(X=0.000000,Y=5.383301,Z=-0.505371),InterpMode=CIM_CurveAutoClamped),(InVal=410.199860,OutVal=(X=0.000000,Y=0.000000,Z=-221.835938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.663052),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.663052),InterpMode=CIM_CurveAutoClamped),(InVal=420.085205,OutVal=(X=0.000000,Y=0.351563,Z=-271.230469),InterpMode=CIM_CurveAutoClamped),(InVal=424.574951,OutVal=(X=0.000000,Y=-0.725098,Z=-226.450195),InterpMode=CIM_CurveAutoClamped),(InVal=430.317413,OutVal=(X=0.000000,Y=2.285156,Z=-273.515625),ArriveTangent=(X=0.000000,Y=0.570132,Z=-7.788487),LeaveTangent=(X=0.000000,Y=0.570132,Z=-7.788487),InterpMode=CIM_CurveAutoClamped),(InVal=440.029327,OutVal=(X=0.000000,Y=8.085938,Z=-346.816406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.664828),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.664828),InterpMode=CIM_CurveAutoClamped),(InVal=441.173553,OutVal=(X=0.000000,Y=5.163574,Z=-356.726074),ArriveTangent=(X=0.000000,Y=-4.027319,Z=0.000000),LeaveTangent=(X=0.000000,Y=-4.027319,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=443.384521,OutVal=(X=0.000000,Y=-11.535645,Z=-264.858398),ArriveTangent=(X=0.000000,Y=0.000000,Z=21.326225),LeaveTangent=(X=0.000000,Y=0.000000,Z=21.326225),InterpMode=CIM_CurveAutoClamped),(InVal=449.394409,OutVal=(X=0.000000,Y=14.062500,Z=-181.406250),InterpMode=CIM_CurveAutoClamped),(InVal=459.973480,OutVal=(X=0.000000,Y=1.582031,Z=-208.828125),InterpMode=CIM_CurveAutoClamped),(InVal=460.971527,OutVal=(X=0.000000,Y=2.548828,Z=-195.292969),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.710370),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.710370),InterpMode=CIM_CurveAutoClamped),(InVal=469.685425,OutVal=(X=0.000000,Y=1.230469,Z=-95.097656),InterpMode=CIM_CurveAutoClamped),(InVal=480.264465,OutVal=(X=0.000000,Y=2.812500,Z=-180.527344),ArriveTangent=(X=0.000000,Y=0.233120,Z=-12.909005),LeaveTangent=(X=0.000000,Y=0.233120,Z=-12.909005),InterpMode=CIM_CurveAutoClamped),(InVal=483.258118,OutVal=(X=0.000000,Y=4.394531,Z=-270.307617),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.754014),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.754014),InterpMode=CIM_CurveAutoClamped),(InVal=489.802979,OutVal=(X=0.000000,Y=0.703125,Z=-274.218750),ArriveTangent=(X=0.000000,Y=-0.776606,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.776606,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=491.632904,OutVal=(X=0.000000,Y=-2.109375,Z=-180.878906),ArriveTangent=(X=0.000000,Y=-1.124824,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.124824,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=493.709839,OutVal=(X=0.000000,Y=-3.691406,Z=-182.724609),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.126991),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.126991),InterpMode=CIM_CurveAutoClamped),(InVal=495.920837,OutVal=(X=0.000000,Y=10.283203,Z=-271.604004),ArriveTangent=(X=0.000000,Y=0.000000,Z=-42.435768),LeaveTangent=(X=0.000000,Y=0.000000,Z=-42.435768),InterpMode=CIM_CurveAutoClamped),(InVal=500.035187,OutVal=(X=0.000000,Y=-1.933594,Z=-451.230469),InterpMode=CIM_CurveAutoClamped),(InVal=509.747131,OutVal=(X=0.000000,Y=4.921875,Z=-428.027344),ArriveTangent=(X=0.000000,Y=1.273672,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.273672,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=519.979309,OutVal=(X=0.000000,Y=29.355469,Z=-459.492188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.686018),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.686018),InterpMode=CIM_CurveAutoClamped),(InVal=521.322693,OutVal=(X=0.000000,Y=11.997070,Z=-541.889648),ArriveTangent=(X=0.000000,Y=-3.666424,Z=-54.258667),LeaveTangent=(X=0.000000,Y=-3.666424,Z=-54.258667),InterpMode=CIM_CurveAutoClamped),(InVal=523.190247,OutVal=(X=0.000000,Y=9.030762,Z=-633.713379),ArriveTangent=(X=0.000000,Y=-1.594771,Z=-2.216260),LeaveTangent=(X=0.000000,Y=-1.594771,Z=-2.216260),InterpMode=CIM_CurveAutoClamped),(InVal=530.038086,OutVal=(X=0.000000,Y=-1.933594,Z=-638.437500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.807893),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.807893),InterpMode=CIM_CurveAutoClamped),(InVal=534.713989,OutVal=(X=0.000000,Y=0.197754,Z=-720.285645),ArriveTangent=(X=0.000000,Y=0.237864,Z=-14.626918),LeaveTangent=(X=0.000000,Y=0.237864,Z=-14.626918),InterpMode=CIM_CurveAutoClamped),(InVal=540.096863,OutVal=(X=0.000000,Y=0.878906,Z=-785.566406),InterpMode=CIM_CurveAutoClamped),(InVal=549.982239,OutVal=(X=0.000000,Y=-0.878906,Z=-709.628906),ArriveTangent=(X=0.000000,Y=-0.447298,Z=13.373409),LeaveTangent=(X=0.000000,Y=-0.447298,Z=13.373409),InterpMode=CIM_CurveAutoClamped),(InVal=552.301147,OutVal=(X=0.000000,Y=-4.877930,Z=-622.353516),InterpMode=CIM_CurveAutoClamped),(InVal=554.076599,OutVal=(X=0.000000,Y=-1.120605,Z=-661.816406),ArriveTangent=(X=0.000000,Y=0.295949,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.295949,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=559.867615,OutVal=(X=0.000000,Y=-0.527344,Z=-602.402344),InterpMode=CIM_CurveAutoClamped),(InVal=561.647400,OutVal=(X=0.000000,Y=-1.142578,Z=-623.056641),ArriveTangent=(X=0.000000,Y=-0.480318,Z=-12.125371),LeaveTangent=(X=0.000000,Y=-0.480318,Z=-12.125371),InterpMode=CIM_CurveAutoClamped),(InVal=569.232666,OutVal=(X=0.000000,Y=-10.722656,Z=-720.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.718239),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.718239),InterpMode=CIM_CurveAutoClamped),(InVal=579.985168,OutVal=(X=0.000000,Y=-9.140625,Z=-782.929688),ArriveTangent=(X=0.000000,Y=0.323063,Z=-9.872705),LeaveTangent=(X=0.000000,Y=0.323063,Z=-9.872705),InterpMode=CIM_CurveAutoClamped),(InVal=590.564209,OutVal=(X=0.000000,Y=4.218750,Z=-950.273438),ArriveTangent=(X=0.000000,Y=1.202545,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.202545,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=600.449585,OutVal=(X=0.000000,Y=15.468750,Z=-910.019531),InterpMode=CIM_CurveAutoClamped),(InVal=610.334961,OutVal=(X=0.000000,Y=-1.406250,Z=-918.281250),InterpMode=CIM_CurveAutoClamped),(InVal=620.107727,OutVal=(X=0.000000,Y=0.351563,Z=-864.492188),InterpMode=CIM_CurveAutoClamped),(InVal=622.541748,OutVal=(X=0.000000,Y=-3.537598,Z=-911.184082),InterpMode=CIM_CurveAutoClamped),(InVal=629.819641,OutVal=(X=0.000000,Y=-0.878906,Z=-848.496094),ArriveTangent=(X=0.000000,Y=0.396699,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.396699,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=639.878418,OutVal=(X=0.000000,Y=3.339844,Z=-903.515625),ArriveTangent=(X=0.000000,Y=0.299141,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.299141,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=645.890686,OutVal=(X=0.000000,Y=4.592285,Z=-878.708496),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.917710),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.917710),InterpMode=CIM_CurveAutoClamped),(InVal=649.763733,OutVal=(X=0.000000,Y=2.460938,Z=-821.425781),ArriveTangent=(X=0.000000,Y=-0.388802,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.388802,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=657.193420,OutVal=(X=0.000000,Y=0.197754,Z=-830.017090),ArriveTangent=(X=0.000000,Y=-0.641930,Z=-3.225797),LeaveTangent=(X=0.000000,Y=-0.641930,Z=-3.225797),InterpMode=CIM_CurveAutoClamped),(InVal=660.169373,OutVal=(X=0.000000,Y=-4.218750,Z=-894.199219),ArriveTangent=(X=0.000000,Y=-1.499962,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.499962,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=661.968933,OutVal=(X=0.000000,Y=-6.965332,Z=-825.490723),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.823117),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.823117),InterpMode=CIM_CurveAutoClamped),(InVal=669.881287,OutVal=(X=0.000000,Y=-6.328125,Z=-818.437500),ArriveTangent=(X=0.000000,Y=0.174270,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.174270,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=679.766602,OutVal=(X=0.000000,Y=4.218750,Z=-874.511719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.585509),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.585509),InterpMode=CIM_CurveAutoClamped),(InVal=690.172241,OutVal=(X=0.000000,Y=-2.109375,Z=-1036.230469),InterpMode=CIM_CurveAutoClamped),(InVal=700.231018,OutVal=(X=0.000000,Y=1.933594,Z=-984.199219),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.041192),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.041192),InterpMode=CIM_CurveAutoClamped),(InVal=709.769531,OutVal=(X=0.000000,Y=-0.878906,Z=-898.242188),ArriveTangent=(X=0.000000,Y=-0.425559,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.425559,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=712.519531,OutVal=(X=0.000000,Y=-3.295898,Z=-988.066406),InterpMode=CIM_CurveAutoClamped),(InVal=714.968201,OutVal=(X=0.000000,Y=3.581543,Z=-893.913574),ArriveTangent=(X=0.000000,Y=0.000000,Z=21.284954),LeaveTangent=(X=0.000000,Y=0.000000,Z=21.284954),InterpMode=CIM_CurveAutoClamped),(InVal=720.001709,OutVal=(X=0.000000,Y=0.351563,Z=-828.808594),ArriveTangent=(X=0.000000,Y=-0.357892,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.357892,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=729.887085,OutVal=(X=0.000000,Y=-1.757813,Z=-897.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.747191),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.747191),InterpMode=CIM_CurveAutoClamped),(InVal=739.252075,OutVal=(X=0.000000,Y=0.351563,Z=-905.449219),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.178153),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.178153),InterpMode=CIM_CurveAutoClamped),(InVal=741.355652,OutVal=(X=0.000000,Y=-1.340332,Z=-928.015137),InterpMode=CIM_CurveAutoClamped),(InVal=750.524902,OutVal=(X=0.000000,Y=-0.703125,Z=-777.304688),ArriveTangent=(X=0.000000,Y=0.081042,Z=0.640589),LeaveTangent=(X=0.000000,Y=0.081042,Z=0.640589),InterpMode=CIM_CurveAutoClamped),(InVal=760.063354,OutVal=(X=0.000000,Y=0.175781,Z=-774.843750),InterpMode=CIM_CurveAutoClamped),(InVal=761.770691,OutVal=(X=0.000000,Y=-5.295410,Z=-811.274414),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.882353),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.882353),InterpMode=CIM_CurveAutoClamped),(InVal=769.775269,OutVal=(X=0.000000,Y=0.000000,Z=-948.515625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.078865),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.078865),InterpMode=CIM_CurveAutoClamped),(InVal=779.834045,OutVal=(X=0.000000,Y=-0.175781,Z=-1065.585938),ArriveTangent=(X=0.000000,Y=-0.043234,Z=-4.049945),LeaveTangent=(X=0.000000,Y=-0.043234,Z=-4.049945),InterpMode=CIM_CurveAutoClamped),(InVal=789.199097,OutVal=(X=0.000000,Y=-6.503906,Z=-1084.218750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.770551),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.770551),InterpMode=CIM_CurveAutoClamped),(InVal=800.108765,OutVal=(X=0.000000,Y=-2.285156,Z=-1179.316406),InterpMode=CIM_CurveAutoClamped),(InVal=809.994141,OutVal=(X=0.000000,Y=-8.789063,Z=-1172.285156),ArriveTangent=(X=0.000000,Y=-0.762345,Z=1.616905),LeaveTangent=(X=0.000000,Y=-0.762345,Z=1.616905),InterpMode=CIM_CurveAutoClamped),(InVal=820.399780,OutVal=(X=0.000000,Y=-17.753906,Z=-1068.046875),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.830495),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.830495),InterpMode=CIM_CurveAutoClamped),(InVal=825.955688,OutVal=(X=0.000000,Y=-14.194336,Z=-983.452148),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.497425),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.497425),InterpMode=CIM_CurveAutoClamped),(InVal=830.458557,OutVal=(X=0.000000,Y=-16.875000,Z=-964.687500),InterpMode=CIM_CurveAutoClamped),(InVal=840.170471,OutVal=(X=0.000000,Y=-1.406250,Z=-1039.042969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.772366),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.772366),InterpMode=CIM_CurveAutoClamped),(InVal=850.055786,OutVal=(X=0.000000,Y=-5.976563,Z=-1136.601563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.380511),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.380511),InterpMode=CIM_CurveAutoClamped),(InVal=859.767761,OutVal=(X=0.000000,Y=-0.878906,Z=-1158.574219),ArriveTangent=(X=0.000000,Y=0.041441,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.041441,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=870.173340,OutVal=(X=0.000000,Y=-0.703125,Z=-1046.425781),ArriveTangent=(X=0.000000,Y=0.041547,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.041547,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=879.885254,OutVal=(X=0.000000,Y=4.746094,Z=-1065.937500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.432614),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.432614),InterpMode=CIM_CurveAutoClamped),(InVal=890.290894,OutVal=(X=0.000000,Y=1.230469,Z=-1075.429688),InterpMode=CIM_CurveAutoClamped),(InVal=893.412659,OutVal=(X=0.000000,Y=1.384277,Z=-995.339355),ArriveTangent=(X=0.000000,Y=0.128533,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.128533,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=895.933350,OutVal=(X=0.000000,Y=9.997559,Z=-1009.709473),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.577811),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.577811),InterpMode=CIM_CurveAutoClamped),(InVal=900.002808,OutVal=(X=0.000000,Y=4.042969,Z=-1025.507813),ArriveTangent=(X=0.000000,Y=-0.546039,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.546039,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=910.235046,OutVal=(X=0.000000,Y=1.582031,Z=-901.757813),ArriveTangent=(X=0.000000,Y=-0.394489,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.394489,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=919.773560,OutVal=(X=0.000000,Y=-4.042969,Z=-979.453125),InterpMode=CIM_CurveAutoClamped),(InVal=929.832275,OutVal=(X=0.000000,Y=-3.164063,Z=-893.671875),ArriveTangent=(X=0.000000,Y=0.197462,Z=8.891122),LeaveTangent=(X=0.000000,Y=0.197462,Z=8.891122),InterpMode=CIM_CurveAutoClamped),(InVal=939.207886,OutVal=(X=0.000000,Y=4.921875,Z=-806.660156),InterpMode=CIM_CurveAutoClamped),(InVal=949.960388,OutVal=(X=0.000000,Y=3.867188,Z=-880.664063),ArriveTangent=(X=0.000000,Y=-0.225505,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.225505,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=954.869751,OutVal=(X=0.000000,Y=0.769043,Z=-807.802734),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.472069),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.472069),InterpMode=CIM_CurveAutoClamped),(InVal=960.192627,OutVal=(X=0.000000,Y=10.019531,Z=-753.046875),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.985000),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.985000),InterpMode=CIM_CurveAutoClamped),(InVal=963.512146,OutVal=(X=0.000000,Y=-1.076660,Z=-704.223633),ArriveTangent=(X=0.000000,Y=-0.983289,Z=10.280543),LeaveTangent=(X=0.000000,Y=-0.983289,Z=10.280543),InterpMode=CIM_CurveAutoClamped),(InVal=969.904541,OutVal=(X=0.000000,Y=-3.691406,Z=-653.203125),InterpMode=CIM_CurveAutoClamped),(InVal=972.034546,OutVal=(X=0.000000,Y=1.054688,Z=-719.362793),InterpMode=CIM_CurveAutoClamped),(InVal=979.963318,OutVal=(X=0.000000,Y=0.878906,Z=-717.714844),InterpMode=CIM_CurveAutoClamped),(InVal=979.963318,OutVal=(X=0.000000,Y=0.878906,Z=-717.714844),InterpMode=CIM_CurveAutoClamped),(InVal=981.637207,OutVal=(X=0.000000,Y=2.768555,Z=-738.193359),InterpMode=CIM_CurveAutoClamped),(InVal=985.358276,OutVal=(X=0.000000,Y=-5.427246,Z=-688.117676),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.460172),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.460172),InterpMode=CIM_CurveAutoClamped),(InVal=991.062683,OutVal=(X=0.000000,Y=-4.921875,Z=-630.175781),ArriveTangent=(X=0.000000,Y=0.162014,Z=2.931605),LeaveTangent=(X=0.000000,Y=0.162014,Z=2.931605),InterpMode=CIM_CurveAutoClamped),(InVal=1000.254333,OutVal=(X=0.000000,Y=-0.703125,Z=-618.750000),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.785208),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.785208),InterpMode=CIM_CurveAutoClamped),(InVal=1010.313110,OutVal=(X=0.000000,Y=-4.921875,Z=-452.636719),InterpMode=CIM_CurveAutoClamped),(InVal=1019.851624,OutVal=(X=0.000000,Y=0.527344,Z=-544.394531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.647738),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.647738),InterpMode=CIM_CurveAutoClamped),(InVal=1029.043213,OutVal=(X=0.000000,Y=-1.757813,Z=-633.339844),InterpMode=CIM_CurveAutoClamped),(InVal=1039.795776,OutVal=(X=0.000000,Y=-0.878906,Z=-552.832031),InterpMode=CIM_CurveAutoClamped),(InVal=1050.027954,OutVal=(X=0.000000,Y=-1.933594,Z=-553.710938),InterpMode=CIM_CurveAutoClamped),(InVal=1052.991089,OutVal=(X=0.000000,Y=2.329102,Z=-540.395508),InterpMode=CIM_CurveAutoClamped),(InVal=1060.260254,OutVal=(X=0.000000,Y=1.054688,Z=-554.941406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.914390),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.914390),InterpMode=CIM_CurveAutoClamped),(InVal=1069.625244,OutVal=(X=0.000000,Y=4.570313,Z=-663.046875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.973412),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.973412),InterpMode=CIM_CurveAutoClamped),(InVal=1079.693359,OutVal=(X=0.000000,Y=-0.878906,Z=-682.031250),ArriveTangent=(X=0.000000,Y=-0.135556,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.135556,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1083.077148,OutVal=(X=0.000000,Y=-1.164551,Z=-673.615723),InterpMode=CIM_CurveAutoClamped),(InVal=1090.098999,OutVal=(X=0.000000,Y=-1.054688,Z=-677.109375),ArriveTangent=(X=0.000000,Y=0.023973,Z=-1.001560),LeaveTangent=(X=0.000000,Y=0.023973,Z=-1.001560),InterpMode=CIM_CurveAutoClamped),(InVal=1099.984375,OutVal=(X=0.000000,Y=-0.703125,Z=-718.417969),ArriveTangent=(X=0.000000,Y=0.062987,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.062987,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1110.736816,OutVal=(X=0.000000,Y=0.527344,Z=-629.296875),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.499040),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.499040),InterpMode=CIM_CurveAutoClamped),(InVal=1119.581543,OutVal=(X=0.000000,Y=-3.515625,Z=-618.398438),InterpMode=CIM_CurveAutoClamped),(InVal=1129.813721,OutVal=(X=0.000000,Y=0.351563,Z=-802.265625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.690125),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.690125),InterpMode=CIM_CurveAutoClamped),(InVal=1139.699097,OutVal=(X=0.000000,Y=-3.867188,Z=-823.710938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.329027),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.329027),InterpMode=CIM_CurveAutoClamped),(InVal=1150.278076,OutVal=(X=0.000000,Y=-2.988281,Z=-943.769531),ArriveTangent=(X=0.000000,Y=0.166681,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.166681,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1159.469727,OutVal=(X=0.000000,Y=0.527344,Z=-773.613281),InterpMode=CIM_CurveAutoClamped),(InVal=1169.701904,OutVal=(X=0.000000,Y=-2.812500,Z=-890.859375),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.760762),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.760762),InterpMode=CIM_CurveAutoClamped),(InVal=1179.587280,OutVal=(X=0.000000,Y=10.898438,Z=-903.339844),InterpMode=CIM_CurveAutoClamped),(InVal=1182.628052,OutVal=(X=0.000000,Y=5.668945,Z=-806.923828),ArriveTangent=(X=0.000000,Y=-2.818760,Z=0.000000),LeaveTangent=(X=0.000000,Y=-2.818760,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1186.109009,OutVal=(X=0.000000,Y=-9.733887,Z=-900.791016),InterpMode=CIM_CurveAutoClamped),(InVal=1190.339722,OutVal=(X=0.000000,Y=2.109375,Z=-814.746094),ArriveTangent=(X=0.000000,Y=0.302948,Z=25.850311),LeaveTangent=(X=0.000000,Y=0.302948,Z=25.850311),InterpMode=CIM_CurveAutoClamped),(InVal=1193.724121,OutVal=(X=0.000000,Y=2.570801,Z=-703.937988),ArriveTangent=(X=0.000000,Y=0.253508,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.253508,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1199.531250,OutVal=(X=0.000000,Y=7.734375,Z=-712.441406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.810721),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.810721),InterpMode=CIM_CurveAutoClamped),(InVal=1210.283813,OutVal=(X=0.000000,Y=0.351563,Z=-717.363281),ArriveTangent=(X=0.000000,Y=-0.540470,Z=-0.660574),LeaveTangent=(X=0.000000,Y=-0.540470,Z=-0.660574),InterpMode=CIM_CurveAutoClamped),(InVal=1220.021240,OutVal=(X=0.000000,Y=-3.339844,Z=-725.976563),InterpMode=CIM_CurveAutoClamped),(InVal=1230.080078,OutVal=(X=0.000000,Y=0.175781,Z=-717.187500),ArriveTangent=(X=0.000000,Y=0.424528,Z=2.768997),LeaveTangent=(X=0.000000,Y=0.424528,Z=2.768997),InterpMode=CIM_CurveAutoClamped),(InVal=1232.287842,OutVal=(X=0.000000,Y=1.867676,Z=-636.042480),ArriveTangent=(X=0.000000,Y=0.000000,Z=15.661695),LeaveTangent=(X=0.000000,Y=0.000000,Z=15.661695),InterpMode=CIM_CurveAutoClamped),(InVal=1235.312622,OutVal=(X=0.000000,Y=0.637207,Z=-613.234863),InterpMode=CIM_CurveAutoClamped),(InVal=1237.761353,OutVal=(X=0.000000,Y=0.769043,Z=-767.702637),InterpMode=CIM_CurveAutoClamped),(InVal=1240.312256,OutVal=(X=0.000000,Y=-4.746094,Z=-739.687500),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.807960),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.807960),InterpMode=CIM_CurveAutoClamped),(InVal=1249.330444,OutVal=(X=0.000000,Y=1.933594,Z=-624.375000),ArriveTangent=(X=0.000000,Y=0.245284,Z=10.100501),LeaveTangent=(X=0.000000,Y=0.245284,Z=10.100501),InterpMode=CIM_CurveAutoClamped),(InVal=1260.256348,OutVal=(X=0.000000,Y=3.164063,Z=-538.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.763847),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.763847),InterpMode=CIM_CurveAutoClamped),(InVal=1270.488525,OutVal=(X=0.000000,Y=1.230469,Z=-534.902344),InterpMode=CIM_CurveAutoClamped),(InVal=1280.547241,OutVal=(X=0.000000,Y=17.753906,Z=-628.242188),InterpMode=CIM_CurveAutoClamped),(InVal=1285.671265,OutVal=(X=0.000000,Y=3.955078,Z=-624.133301),ArriveTangent=(X=0.000000,Y=-0.606501,Z=2.103111),LeaveTangent=(X=0.000000,Y=-0.606501,Z=2.103111),InterpMode=CIM_CurveAutoClamped),(InVal=1289.565430,OutVal=(X=0.000000,Y=2.812500,Z=-480.585938),ArriveTangent=(X=0.000000,Y=-0.153657,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.153657,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1299.971069,OutVal=(X=0.000000,Y=1.757813,Z=-481.113281),ArriveTangent=(X=0.000000,Y=-0.218078,Z=-0.127492),LeaveTangent=(X=0.000000,Y=-0.218078,Z=-0.127492),InterpMode=CIM_CurveAutoClamped),(InVal=1310.029785,OutVal=(X=0.000000,Y=-5.625000,Z=-621.210938),InterpMode=CIM_CurveAutoClamped),(InVal=1319.915039,OutVal=(X=0.000000,Y=-1.230469,Z=-522.421875),ArriveTangent=(X=0.000000,Y=0.337859,Z=4.786943),LeaveTangent=(X=0.000000,Y=0.337859,Z=4.786943),InterpMode=CIM_CurveAutoClamped),(InVal=1329.800415,OutVal=(X=0.000000,Y=1.054688,Z=-497.460938),InterpMode=CIM_CurveAutoClamped),(InVal=1339.685791,OutVal=(X=0.000000,Y=-1.406250,Z=-541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=1349.571045,OutVal=(X=0.000000,Y=1.054688,Z=-492.714844),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.782010),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.782010),InterpMode=CIM_CurveAutoClamped),(InVal=1359.976685,OutVal=(X=0.000000,Y=0.703125,Z=-444.023438),InterpMode=CIM_CurveAutoClamped),(InVal=1369.688599,OutVal=(X=0.000000,Y=1.933594,Z=-503.261719),InterpMode=CIM_CurveAutoClamped),(InVal=1380.106812,OutVal=(X=0.000000,Y=-1.933594,Z=-447.011719),ArriveTangent=(X=0.000000,Y=-0.273999,Z=7.298349),LeaveTangent=(X=0.000000,Y=-0.273999,Z=7.298349),InterpMode=CIM_CurveAutoClamped),(InVal=1390.859375,OutVal=(X=0.000000,Y=-3.867188,Z=-348.750000),ArriveTangent=(X=0.000000,Y=-0.328672,Z=2.532589),LeaveTangent=(X=0.000000,Y=-0.328672,Z=2.532589),InterpMode=CIM_CurveAutoClamped),(InVal=1394.413330,OutVal=(X=0.000000,Y=-6.635742,Z=-343.059082),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.002709),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.002709),InterpMode=CIM_CurveAutoClamped),(InVal=1400.050903,OutVal=(X=0.000000,Y=1.054688,Z=-288.984375),InterpMode=CIM_CurveAutoClamped),(InVal=1409.762817,OutVal=(X=0.000000,Y=-6.328125,Z=-368.964844),InterpMode=CIM_CurveAutoClamped),(InVal=1419.821655,OutVal=(X=0.000000,Y=2.636719,Z=-296.367188),InterpMode=CIM_CurveAutoClamped),(InVal=1429.880371,OutVal=(X=0.000000,Y=-3.691406,Z=-452.285156),ArriveTangent=(X=0.000000,Y=-0.428161,Z=-11.157859),LeaveTangent=(X=0.000000,Y=-0.428161,Z=-11.157859),InterpMode=CIM_CurveAutoClamped),(InVal=1439.765625,OutVal=(X=0.000000,Y=-6.328125,Z=-523.652344),InterpMode=CIM_CurveAutoClamped),(InVal=1449.477539,OutVal=(X=0.000000,Y=-2.285156,Z=-442.792969),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.411781),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.411781),InterpMode=CIM_CurveAutoClamped),(InVal=1460.056641,OutVal=(X=0.000000,Y=-3.867188,Z=-352.968750),InterpMode=CIM_CurveAutoClamped),(InVal=1470.982544,OutVal=(X=0.000000,Y=3.339844,Z=-388.652344),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.697702),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.697702),InterpMode=CIM_CurveAutoClamped),(InVal=1480.000732,OutVal=(X=0.000000,Y=1.406250,Z=-446.660156),ArriveTangent=(X=0.000000,Y=-0.398259,Z=-1.218598),LeaveTangent=(X=0.000000,Y=-0.398259,Z=-1.218598),InterpMode=CIM_CurveAutoClamped),(InVal=1484.665161,OutVal=(X=0.000000,Y=-2.109375,Z=-449.692383),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.551947),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.551947),InterpMode=CIM_CurveAutoClamped),(InVal=1489.365723,OutVal=(X=0.000000,Y=-0.878906,Z=-530.683594),ArriveTangent=(X=0.000000,Y=0.162909,Z=-4.660699),LeaveTangent=(X=0.000000,Y=0.162909,Z=-4.660699),InterpMode=CIM_CurveAutoClamped),(InVal=1499.771362,OutVal=(X=0.000000,Y=0.351563,Z=-550.195313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.015679),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.015679),InterpMode=CIM_CurveAutoClamped),(InVal=1510.697266,OutVal=(X=0.000000,Y=-2.636719,Z=-711.914063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.956710),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.956710),InterpMode=CIM_CurveAutoClamped),(InVal=1514.623169,OutVal=(X=0.000000,Y=-1.032715,Z=-724.218750),ArriveTangent=(X=0.000000,Y=0.366986,Z=-0.079929),LeaveTangent=(X=0.000000,Y=0.366986,Z=-0.079929),InterpMode=CIM_CurveAutoClamped),(InVal=1520.755981,OutVal=(X=0.000000,Y=1.054688,Z=-724.394531),InterpMode=CIM_CurveAutoClamped),(InVal=1530.467896,OutVal=(X=0.000000,Y=-2.109375,Z=-628.417969),ArriveTangent=(X=0.000000,Y=-0.045179,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.045179,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1539.312744,OutVal=(X=0.000000,Y=-2.285156,Z=-711.035156),ArriveTangent=(X=0.000000,Y=-0.018263,Z=-9.149583),LeaveTangent=(X=0.000000,Y=-0.018263,Z=-9.149583),InterpMode=CIM_CurveAutoClamped),(InVal=1549.718262,OutVal=(X=0.000000,Y=-2.460938,Z=-804.550781),InterpMode=CIM_CurveAutoClamped),(InVal=1559.950439,OutVal=(X=0.000000,Y=-0.527344,Z=-714.550781),ArriveTangent=(X=0.000000,Y=0.038243,Z=8.193771),LeaveTangent=(X=0.000000,Y=0.038243,Z=8.193771),InterpMode=CIM_CurveAutoClamped),(InVal=1570.356079,OutVal=(X=0.000000,Y=-0.351563,Z=-635.449219),ArriveTangent=(X=0.000000,Y=0.039217,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.039217,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1579.547729,OutVal=(X=0.000000,Y=1.406250,Z=-716.132813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.361991),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.361991),InterpMode=CIM_CurveAutoClamped),(InVal=1589.779907,OutVal=(X=0.000000,Y=-2.460938,Z=-797.871094),InterpMode=CIM_CurveAutoClamped),(InVal=1600.012085,OutVal=(X=0.000000,Y=-0.175781,Z=-709.628906),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.735101),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.735101),InterpMode=CIM_CurveAutoClamped),(InVal=1611.073364,OutVal=(X=0.000000,Y=-3.867188,Z=-633.164063),InterpMode=CIM_CurveAutoClamped),(InVal=1619.744629,OutVal=(X=0.000000,Y=4.218750,Z=-720.527344),InterpMode=CIM_CurveAutoClamped),(InVal=1629.803467,OutVal=(X=0.000000,Y=4.218750,Z=-640.546875),InterpMode=CIM_CurveAutoClamped),(InVal=1639.341919,OutVal=(X=0.000000,Y=-1.757813,Z=-721.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.491415),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.491415),InterpMode=CIM_CurveAutoClamped),(InVal=1649.574097,OutVal=(X=0.000000,Y=-0.175781,Z=-847.968750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.574188),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.574188),InterpMode=CIM_CurveAutoClamped),(InVal=1660.153076,OutVal=(X=0.000000,Y=-7.031250,Z=-855.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.859592),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.859592),InterpMode=CIM_CurveAutoClamped),(InVal=1664.132813,OutVal=(X=0.000000,Y=1.186523,Z=-902.922363),InterpMode=CIM_CurveAutoClamped),(InVal=1670.038452,OutVal=(X=0.000000,Y=-3.691406,Z=-803.847656),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.740297),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.740297),InterpMode=CIM_CurveAutoClamped),(InVal=1680.444092,OutVal=(X=0.000000,Y=0.351563,Z=-727.734375),ArriveTangent=(X=0.000000,Y=0.215037,Z=0.654701),LeaveTangent=(X=0.000000,Y=0.215037,Z=0.654701),InterpMode=CIM_CurveAutoClamped),(InVal=1690.676270,OutVal=(X=0.000000,Y=1.582031,Z=-724.921875),InterpMode=CIM_CurveAutoClamped),(InVal=1700.388184,OutVal=(X=0.000000,Y=-0.878906,Z=-805.429688),ArriveTangent=(X=0.000000,Y=-0.359962,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.359962,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1709.232910,OutVal=(X=0.000000,Y=-5.097656,Z=-803.496094),ArriveTangent=(X=0.000000,Y=-0.813271,Z=0.496840),LeaveTangent=(X=0.000000,Y=-0.813271,Z=0.496840),InterpMode=CIM_CurveAutoClamped),(InVal=1720.332275,OutVal=(X=0.000000,Y=-21.093750,Z=-707.167969),InterpMode=CIM_CurveAutoClamped),(InVal=1729.177002,OutVal=(X=0.000000,Y=-19.863281,Z=-721.230469),ArriveTangent=(X=0.000000,Y=0.190046,Z=-3.095123),LeaveTangent=(X=0.000000,Y=0.190046,Z=-3.095123),InterpMode=CIM_CurveAutoClamped),(InVal=1739.755981,OutVal=(X=0.000000,Y=-17.402344,Z=-807.539063),ArriveTangent=(X=0.000000,Y=0.503394,Z=-8.168220),LeaveTangent=(X=0.000000,Y=0.503394,Z=-8.168220),InterpMode=CIM_CurveAutoClamped),(InVal=1749.814819,OutVal=(X=0.000000,Y=-0.175781,Z=-889.804688),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,,,(Time=10.058781),(Time=19.944111),(Time=24.848183),(Time=29.829460),(Time=34.848602),(Time=37.406853),(Time=38.766319),(Time=39.714809),(Time=49.947018),(Time=60.352650),(Time=70.064568),(Time=73.737366),(Time=77.008606),(Time=80.123344),(Time=89.835266),(Time=93.909958),(Time=99.894043),(Time=109.605972),(Time=112.758499),(Time=113.848907),(Time=115.406631),(Time=119.838181),(Time=130.070374),(Time=132.775330),(Time=139.782303),(Time=140.797638),(Time=142.666916),(Time=149.320801),(Time=153.102020),(Time=155.325150),(Time=156.765564),(Time=160.073288),(Time=169.785217),(Time=179.843994),(Time=182.260681),(Time=185.141479),(Time=189.555908),(Time=192.631592),(Time=200.134964),(Time=202.138245),(Time=203.146515),(Time=204.442886),(Time=207.179657),(Time=210.193756),(Time=211.212769),(Time=213.373383),(Time=220.079102),(Time=229.791031),(Time=240.023224),(Time=242.325470),(Time=249.561722),(Time=259.620514),(Time=265.515961),(Time=269.679291),(Time=273.150085),(Time=280.085144),(Time=283.376953),(Time=285.393524),(Time=287.410065),(Time=289.138550),(Time=289.676971),(Time=289.970520),(Time=300.029297),(Time=301.116608),(Time=302.339661),(Time=310.434937),(Time=319.799988),(Time=330.205627),(Time=340.091003),(Time=349.847168),(Time=351.532776),(Time=359.732544),(Time=362.433319),(Time=365.079742),(Time=366.687683),(Time=370.138184),(Time=371.176575),(Time=372.751038),(Time=374.325500),(Time=379.676666),(Time=390.255737),(Time=393.319489),(Time=400.141052),(Time=404.575958),(Time=406.954407),(Time=407.121887),(Time=408.126862),(Time=410.199860),(Time=420.085205),(Time=424.574951),(Time=430.317413),(Time=440.029327),(Time=441.173553),(Time=443.384521),(Time=449.394409),(Time=459.973480),(Time=460.971527),(Time=469.685425),(Time=480.264465),(Time=483.258118),(Time=489.802979),(Time=491.632904),(Time=493.709839),(Time=495.920837),(Time=500.035187),(Time=509.747131),(Time=519.979309),(Time=521.322693),(Time=523.190247),(Time=530.038086),(Time=534.713989),(Time=540.096863),(Time=549.982239),(Time=552.301147),(Time=554.076599),(Time=559.867615),(Time=561.647400),(Time=569.232666),(Time=579.985168),(Time=590.564209),(Time=600.449585),(Time=610.334961),(Time=620.107727),(Time=622.541748),(Time=629.819641),(Time=639.878418),(Time=645.890686),(Time=649.763733),(Time=657.193420),(Time=660.169373),(Time=661.968933),(Time=669.881287),(Time=679.766602),(Time=690.172241),(Time=700.231018),(Time=709.769531),(Time=712.519531),(Time=714.968201),(Time=720.001709),(Time=729.887085),(Time=739.252075),(Time=741.355652),(Time=750.524902),(Time=760.063354),(Time=761.770691),(Time=769.775269),(Time=779.834045),(Time=789.199097),(Time=800.108765),(Time=809.994141),(Time=820.399780),(Time=825.955688),(Time=830.458557),(Time=840.170471),(Time=850.055786),(Time=859.767761),(Time=870.173340),(Time=879.885254),(Time=890.290894),(Time=893.412659),(Time=895.933350),(Time=900.002808),(Time=910.235046),(Time=919.773560),(Time=929.832275),(Time=939.207886),(Time=949.960388),(Time=954.869751),(Time=960.192627),(Time=963.512146),(Time=969.904541),(Time=972.034546),(Time=979.963318),(Time=979.963318),(Time=981.637207),(Time=985.358276),(Time=991.062683),(Time=1000.254333),(Time=1010.313110),(Time=1019.851624),(Time=1029.043213),(Time=1039.795776),(Time=1050.027954),(Time=1052.991089),(Time=1060.260254),(Time=1069.625244),(Time=1079.693359),(Time=1083.077148),(Time=1090.098999),(Time=1099.984375),(Time=1110.736816),(Time=1119.581543),(Time=1129.813721),(Time=1139.699097),(Time=1150.278076),(Time=1159.469727),(Time=1169.701904),(Time=1179.587280),(Time=1182.628052),(Time=1186.109009),(Time=1190.339722),(Time=1193.724121),(Time=1199.531250),(Time=1210.283813),(Time=1220.021240),(Time=1230.080078),(Time=1232.287842),(Time=1235.312622),(Time=1237.761353),(Time=1240.312256),(Time=1249.330444),(Time=1260.256348),(Time=1270.488525),(Time=1280.547241),(Time=1285.671265),(Time=1289.565430),(Time=1299.971069),(Time=1310.029785),(Time=1319.915039),(Time=1329.800415),(Time=1339.685791),(Time=1349.571045),(Time=1359.976685),(Time=1369.688599),(Time=1380.106812),(Time=1390.859375),(Time=1394.413330),(Time=1400.050903),(Time=1409.762817),(Time=1419.821655),(Time=1429.880371),(Time=1439.765625),(Time=1449.477539),(Time=1460.056641),(Time=1470.982544),(Time=1480.000732),(Time=1484.665161),(Time=1489.365723),(Time=1499.771362),(Time=1510.697266),(Time=1514.623169),(Time=1520.755981),(Time=1530.467896),(Time=1539.312744),(Time=1549.718262),(Time=1559.950439),(Time=1570.356079),(Time=1579.547729),(Time=1589.779907),(Time=1600.012085),(Time=1611.073364),(Time=1619.744629),(Time=1629.803467),(Time=1639.341919),(Time=1649.574097),(Time=1660.153076),(Time=1664.132813),(Time=1670.038452),(Time=1680.444092),(Time=1690.676270),(Time=1700.388184),(Time=1709.232910),(Time=1720.332275),(Time=1729.177002),(Time=1739.755981),(Time=1749.814819)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1820.464478
   InterpGroups(0)=InterpGroup'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionStart=1820.464478
   EdSectionEnd=1820.464478
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9480
   ObjPosY=-9440
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   InputLinks(0)=(DrawY=-9634,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9612,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9590,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9568,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9546,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-9618,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9562,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-9431,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=-9364,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-9672
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-HELLMARKSTATION.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9352
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4'),(LinkedOp=SeqAct_ConsoleCommand'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-9550,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9689,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-9616
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9302,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-9560,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9624
   ObjPosY=-9336
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9622,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9622,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-9128,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-9656
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-9232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=805
   SizeY=572
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-9704
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-HELLMARKSTATION.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=5261,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5282,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5303,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6842,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6760
   ObjPosY=5192
   ObjName="TriggerVolume_7 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=5261,OverrideDelta=14)
   InputLinks(1)=(DrawY=5282,OverrideDelta=35)
   InputLinks(2)=(DrawY=5303,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5282,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=7134,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7185,OverrideDelta=76)
   EventLinks(0)=(DrawX=7234,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7096
   ObjPosY=5224
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=KFSpawner'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7096
   ObjPosY=5392
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_402
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-5664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_402"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_401
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4880
   ObjPosY=-5664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_401"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_400
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-5664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_400"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_399
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5080
   ObjPosY=-5664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_399"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_398
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-5664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_398"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_397
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5280
   ObjPosY=-5664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_397"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4545
   ObjPosY=-7933
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4649
   ObjPosY=-7933
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4745
   ObjPosY=-7933
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4849
   ObjPosY=-7933
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4945
   ObjPosY=-7933
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5049
   ObjPosY=-7933
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4505
   ObjPosY=-8389
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4601
   ObjPosY=-8389
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4705
   ObjPosY=-8389
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4801
   ObjPosY=-8389
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4905
   ObjPosY=-8389
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5001
   ObjPosY=-8389
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4553
   ObjPosY=-8829
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4649
   ObjPosY=-8829
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4753
   ObjPosY=-8829
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4849
   ObjPosY=-8829
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4953
   ObjPosY=-8829
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5049
   ObjPosY=-8829
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4569
   ObjPosY=-9205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4673
   ObjPosY=-9205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4769
   ObjPosY=-9205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4873
   ObjPosY=-9205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4969
   ObjPosY=-9205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5073
   ObjPosY=-9205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1731
   SizeY=4039
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6073
   ObjPosY=-9573
   ObjComment="Random Start Locations"
   DrawWidth=1731
   DrawHeight=4039
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_89
   InputLinks(0)=(DrawY=-8576,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8555,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8534,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8555,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_180',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181'),DrawX=-4939,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4888,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4839,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4977
   ObjPosY=-8613
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_89"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-8152,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8131,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8110,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8131,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-4915,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4864,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4815,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4953
   ObjPosY=-8189
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
   InputLinks(0)=(DrawY=-9016,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8995,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8974,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8995,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-4955,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4904,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4855,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4993
   ObjPosY=-9053
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_84"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_91
   InputLinks(0)=(DrawY=-9424,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9403,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9382,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9403,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-4939,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4888,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4839,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4977
   ObjPosY=-9461
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_91"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=8
   IncrementAmount=0
   bLooping=True
   Indices(0)=8
   InputLinks(0)=(DrawY=-9133,OverrideDelta=49)
   InputLinks(1)=(DrawY=-9041,OverrideDelta=141)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_91')),DrawY=-9167,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84')),LinkDesc="Link 2",DrawY=-9144,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_89')),LinkDesc="Link 3",DrawY=-9121,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),LinkDesc="Link 4",DrawY=-9098,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),LinkDesc="Link 5",DrawY=-9075,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),LinkDesc="Link 6",DrawY=-9052,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),LinkDesc="Link 7",DrawY=-9029,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92')),LinkDesc="Link 8",DrawY=-9006,OverrideDelta=176)
   VariableLinks(0)=(DrawX=-5349,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5393
   ObjPosY=-9205
   DrawWidth=89
   DrawHeight=245
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_73
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_91',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_89',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92',InputLinkIdx=1)),DrawY=-8779,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5387,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5481
   ObjPosY=-8845
   ObjComment="SpawnsOFF"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_73"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-9059,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),ActivateDelay=1.000000,DrawY=-9059,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5621,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5745
   ObjPosY=-9093
   ObjComment="SpawnsOFF"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
   InputLinks(0)=(DrawY=-5843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5801,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_397',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_398',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_399',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_400',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_401',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_402'),DrawX=-5050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5088
   ObjPosY=-5880
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-5814,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47')),DrawY=-5814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5300,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5424
   ObjPosY=-5848
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=-5995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5974,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-5650,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5599,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_1'),DrawX=-5550,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5688
   ObjPosY=-6032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_1
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43',InputLinkIdx=1),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-5807,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5532,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5650
   ObjPosY=-5873
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_1"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-7723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-4978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5016
   ObjPosY=-7760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5112
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4912
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4808
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4712
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4624
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4728
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4928
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5024
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5128
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-7315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7273,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-4994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5032
   ObjPosY=-7352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-6696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4712
   ObjPosY=-6696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4808
   ObjPosY=-6696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4912
   ObjPosY=-6696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-6696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5112
   ObjPosY=-6696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-6915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6873,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6894,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106'),DrawX=-4978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5016
   ObjPosY=-6952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4712
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4808
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4912
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=KFPlayerStart'KF-HELLMARKSTATION.TheWorld:PersistentLevel.KFPlayerStart_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5112
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
   InputLinks(0)=(DrawY=-6483,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6462,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6441,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6462,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_189',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_190',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204',SeqVar_Object'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212'),DrawX=-4978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5016
   ObjPosY=-6520
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_92"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(DrawY=-6027,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6006,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43')),DrawY=-5985,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-6096
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_5
   MaxTriggerCount=0
   MaxWidth=216
   OutputLinks(0)=(DrawY=-9282,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9259,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9236,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9213,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9190,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9167,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9144,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9121,OverrideDelta=176)
   OutputLinks(8)=(DrawY=-9098,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-HELLMARKSTATION.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=-9352
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_5"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object
