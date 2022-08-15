Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-4483,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4462,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4441,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4462,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-7114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-4520
   ObjComment="...toggle emitter"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-4352
   ObjComment="Plug in Emitter here"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=665
   SizeY=292
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7608
   ObjPosY=-4552
   ObjComment="Toggle leaf emitter when treetops are shot"
   DrawWidth=665
   DrawHeight=292
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_1
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=2)),DrawY=-4454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7416,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-7342,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7552
   ObjPosY=-4520
   ObjName="TriggerVolume_145 Take Damage"
   ObjComment="When trigger volume is touched by explosive damage..."
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_1"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_65
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=324
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65',InputLinkIdx=2)),DrawY=-4406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6568,OverrideDelta=96)
   VariableLinks(1)=(DrawX=-6494,OverrideDelta=176)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-4472
   ObjName="TriggerVolume_0 Take Damage"
   DrawWidth=182
   DrawHeight=144
   Name="SeqEvent_TakeDamage_65"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
   InputLinks(0)=(DrawY=-4435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),DrawX=-6266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-4472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_65"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
   InputLinks(0)=(DrawY=-4115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),DrawX=-6274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=-4152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_66"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-3984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_66
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_112'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66',InputLinkIdx=2)),DrawY=-4086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6560,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6486,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-4152
   ObjName="TriggerVolume_112 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_66"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_67
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_126'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_67',InputLinkIdx=2)),DrawY=-3438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6544,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6470,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6680
   ObjPosY=-3504
   ObjName="TriggerVolume_126 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_67"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
   InputLinks(0)=(DrawY=-3467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67'),DrawX=-6266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-3504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_67"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
   InputLinks(0)=(DrawY=-3787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=-6258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-3824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_68"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6288
   ObjPosY=-3656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_68
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_118'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_68',InputLinkIdx=2)),DrawY=-3758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6544,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6470,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6680
   ObjPosY=-3824
   ObjName="TriggerVolume_118 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_68"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_69
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_119'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_69',InputLinkIdx=2)),DrawY=-3758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5792,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5718,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-3824
   ObjName="TriggerVolume_119 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_69"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-3656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
   InputLinks(0)=(DrawY=-3787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=-5506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-3824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_69"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
   InputLinks(0)=(DrawY=-3467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=-5514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-3504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_70"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_70
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_127'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_70',InputLinkIdx=2)),DrawY=-3438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5792,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5718,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-3504
   ObjName="TriggerVolume_127 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_70"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_71
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_113'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_71',InputLinkIdx=2)),DrawY=-4086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-4152
   ObjName="TriggerVolume_113 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_71"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-3984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
   InputLinks(0)=(DrawY=-4115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=-5522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-4152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_71"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
   InputLinks(0)=(DrawY=-4435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-5514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-4472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_72"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_72
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_105'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72',InputLinkIdx=2)),DrawY=-4406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-4472
   ObjName="TriggerVolume_105 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_72"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_73
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_107'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73',InputLinkIdx=2)),DrawY=-4438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4288,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4214,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-4504
   ObjName="TriggerVolume_107 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_73"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4024
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
   InputLinks(0)=(DrawY=-4467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=-3994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4032
   ObjPosY=-4504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_73"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
   InputLinks(0)=(DrawY=-4147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=-4002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-4184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_74"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_456'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4032
   ObjPosY=-4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_74
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_149'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_74',InputLinkIdx=2)),DrawY=-4118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4288,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4214,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-4184
   ObjName="TriggerVolume_149 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_74"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_75
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_129'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75',InputLinkIdx=2)),DrawY=-3470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4272,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4198,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-3536
   ObjName="TriggerVolume_129 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_75"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_124'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4024
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
   InputLinks(0)=(DrawY=-3499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),DrawX=-3994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4032
   ObjPosY=-3536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_75"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
   InputLinks(0)=(DrawY=-3819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76'),DrawX=-3986,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3935,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3886,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4024
   ObjPosY=-3856
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_76"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_76
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_121'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76',InputLinkIdx=2)),DrawY=-3790,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4272,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4198,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-3856
   ObjName="TriggerVolume_121 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_76"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_77
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_120'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_77',InputLinkIdx=2)),DrawY=-3790,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5024,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4950,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5160
   ObjPosY=-3856
   ObjName="TriggerVolume_120 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_77"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4768
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_77
   InputLinks(0)=(DrawY=-3819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77'),DrawX=-4738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-3856
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_77"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_78
   InputLinks(0)=(DrawY=-3499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78'),DrawX=-4746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-3536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_78"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_123'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_78
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_128'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_78',InputLinkIdx=2)),DrawY=-3470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5024,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4950,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5160
   ObjPosY=-3536
   ObjName="TriggerVolume_128 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_78"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_79
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_114'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_79',InputLinkIdx=2)),DrawY=-4118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-4184
   ObjName="TriggerVolume_114 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_79"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_79
   InputLinks(0)=(DrawY=-4147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=-4754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-4184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_79"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
   InputLinks(0)=(DrawY=-4467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=-4746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-4504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_80"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_80
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_106'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80',InputLinkIdx=2)),DrawY=-4438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-4504
   ObjName="TriggerVolume_106 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_80"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_81
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81',InputLinkIdx=2)),DrawY=-3054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5092,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5018,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=-3120
   ObjName="TriggerVolume_18 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_81"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
   InputLinks(0)=(DrawY=-3083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3041,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=-4794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-3120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_81"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
   InputLinks(0)=(DrawY=-2763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2742,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=-4802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=-2800
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_82"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_137'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_82
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_142'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_82',InputLinkIdx=2)),DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5088,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5014,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=-2800
   ObjName="TriggerVolume_142 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_82"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
   InputLinks(0)=(DrawY=-2435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84'),DrawX=-4786,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4735,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4686,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-2472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_84"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4816
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_84
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_24'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84',InputLinkIdx=2)),DrawY=-2406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5076,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5002,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=-2472
   ObjName="TriggerVolume_24 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_84"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_85
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_25'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85',InputLinkIdx=2)),DrawY=-2406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4324,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4250,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-2472
   ObjName="TriggerVolume_25 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_85"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
   InputLinks(0)=(DrawY=-2435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85'),DrawX=-4034,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3983,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3934,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=-2472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_85"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
   InputLinks(0)=(DrawY=-2123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=-4042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-2160
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_86"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=-1992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_86
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_32'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86',InputLinkIdx=2)),DrawY=-2094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4324,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4250,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-2160
   ObjName="TriggerVolume_32 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_86"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_87
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_143'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_87',InputLinkIdx=2)),DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4336,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4262,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=-2800
   ObjName="TriggerVolume_143 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_87"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_138'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_87
   InputLinks(0)=(DrawY=-2763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2742,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=-4050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=-2800
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_87"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_88
   InputLinks(0)=(DrawY=-3083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3041,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=-4042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-3120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_88"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_130'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_88
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_135'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_88',InputLinkIdx=2)),DrawY=-3054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4336,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4262,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=-3120
   ObjName="TriggerVolume_135 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_88"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_89
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_150'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_89',InputLinkIdx=2)),DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5856,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5782,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-3088
   ObjName="TriggerVolume_150 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_89"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_457'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-2920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_89
   InputLinks(0)=(DrawY=-3051,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3030,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3009,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3030,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=-5562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-3088
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_89"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_90
   InputLinks(0)=(DrawY=-2731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-5570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=-2768
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_90"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_136'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-2600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_90
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_141'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_90',InputLinkIdx=2)),DrawY=-2702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5856,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5782,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-2768
   ObjName="TriggerVolume_141 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_90"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_91
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_30'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_91',InputLinkIdx=2)),DrawY=-2062,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5844,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5770,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-2128
   ObjName="TriggerVolume_30 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_91"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_506'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-1960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_91
   InputLinks(0)=(DrawY=-2091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-5562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=-2128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_91"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
   InputLinks(0)=(DrawY=-2403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=-5554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-2440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_92"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5584
   ObjPosY=-2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_92
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_23'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92',InputLinkIdx=2)),DrawY=-2374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5844,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5770,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-2440
   ObjName="TriggerVolume_23 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_92"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_93
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_93',InputLinkIdx=2)),DrawY=-2374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6588,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6514,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=-2440
   ObjName="TriggerVolume_22 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_93"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=-2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_93
   InputLinks(0)=(DrawY=-2403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=-6306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-2440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_93"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_94
   InputLinks(0)=(DrawY=-2091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-2128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_94"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_505'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-1960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_94
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_29'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_94',InputLinkIdx=2)),DrawY=-2062,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6588,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6514,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=-2128
   ObjName="TriggerVolume_29 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_94"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_95
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_140'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_95',InputLinkIdx=2)),DrawY=-2702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6600,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6526,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-2768
   ObjName="TriggerVolume_140 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_95"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_135'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-2600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_95
   InputLinks(0)=(DrawY=-2731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-2768
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_95"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_96
   InputLinks(0)=(DrawY=-3051,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3030,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3009,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3030,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-3088
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_96"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_129'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-2920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_96
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_134'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_96',InputLinkIdx=2)),DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6600,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6526,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-3088
   ObjName="TriggerVolume_134 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_96"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_97
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_136'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_97',InputLinkIdx=2)),DrawY=-3054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3552,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3478,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=-3120
   ObjName="TriggerVolume_136 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_97"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_131'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_97
   InputLinks(0)=(DrawY=-3083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3041,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),DrawX=-3266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-3120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_97"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_98
   InputLinks(0)=(DrawY=-2763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2742,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),DrawX=-3274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-2800
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_98"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_139'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_98
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_144'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_98',InputLinkIdx=2)),DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3552,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3478,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=-2800
   ObjName="TriggerVolume_144 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_98"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_99
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_33'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_99',InputLinkIdx=2)),DrawY=-2094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3540,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3466,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-2160
   ObjName="TriggerVolume_33 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_99"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-1992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_99
   InputLinks(0)=(DrawY=-2123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),DrawX=-3266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-2160
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_99"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_100
   InputLinks(0)=(DrawY=-2435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),DrawX=-3258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-2472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_100"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_502'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_100
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_26'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_100',InputLinkIdx=2)),DrawY=-2406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3540,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3466,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-2472
   ObjName="TriggerVolume_26 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_100"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_101
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_101',InputLinkIdx=2)),DrawY=-2406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2796,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2722,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-2472
   ObjName="TriggerVolume_27 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_101"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_503'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_101
   InputLinks(0)=(DrawY=-2435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101'),DrawX=-2506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-2472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_101"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_103
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_103',InputLinkIdx=2)),DrawY=-2734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2812,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2738,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=-2800
   ObjName="TriggerVolume_19 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_103"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_103
   InputLinks(0)=(DrawY=-2763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2742,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=-2522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-2800
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_103"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_104
   InputLinks(0)=(DrawY=-3083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3041,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),DrawX=-2514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-3120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_104"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_132'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_104
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_137'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_104',InputLinkIdx=2)),DrawY=-3054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=-3120
   ObjName="TriggerVolume_137 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_104"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_105
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_139'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_105',InputLinkIdx=2)),DrawY=-3086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1288,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1214,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=-3152
   ObjName="TriggerVolume_139 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_105"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_134'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=-2984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_105
   InputLinks(0)=(DrawY=-3115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-3152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_105"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_106
   InputLinks(0)=(DrawY=-2795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106'),DrawX=-1002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-2832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_106"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_106
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_106',InputLinkIdx=2)),DrawY=-2766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1292,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1218,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=-2832
   ObjName="TriggerVolume_21 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_106"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_107
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_36'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_107',InputLinkIdx=2)),DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1202,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=-2192
   ObjName="TriggerVolume_36 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_107"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=-2024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_107
   InputLinks(0)=(DrawY=-2155,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2134,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2113,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2134,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-2192
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_107"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_108
   InputLinks(0)=(DrawY=-2467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-986,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-935,OverrideDelta=76)
   EventLinks(0)=(DrawX=-886,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=-2504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_108"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_504'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1016
   ObjPosY=-2344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_108
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_28'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_108',InputLinkIdx=2)),DrawY=-2438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1202,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=-2504
   ObjName="TriggerVolume_28 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_108"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_109
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_109',InputLinkIdx=2)),DrawY=-2438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2024,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1950,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-2504
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_109"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1768
   ObjPosY=-2344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_109
   InputLinks(0)=(DrawY=-2467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=-1738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=-2504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_109"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_110
   InputLinks(0)=(DrawY=-2155,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2134,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2113,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2134,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=-1746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-2192
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_110"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=-2024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_110
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_35'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_110',InputLinkIdx=2)),DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2028,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1954,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-2192
   ObjName="TriggerVolume_35 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_110"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_111
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_111',InputLinkIdx=2)),DrawY=-2766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2044,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1970,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-2832
   ObjName="TriggerVolume_20 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_111"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_111
   InputLinks(0)=(DrawY=-2795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),DrawX=-1754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=-2832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_111"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_112
   InputLinks(0)=(DrawY=-3115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),DrawX=-1746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-3152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_112"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_133'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=-2984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_112
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_138'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_112',InputLinkIdx=2)),DrawY=-3086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-3152
   ObjName="TriggerVolume_138 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_112"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_113
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_110'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_113',InputLinkIdx=2)),DrawY=-4470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1992,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1918,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-4536
   ObjName="TriggerVolume_110 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_113"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=-4368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_113
   InputLinks(0)=(DrawY=-4499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),DrawX=-1698,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1647,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1598,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-4536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_113"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_114
   InputLinks(0)=(DrawY=-4179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=-1706,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1655,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1606,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1744
   ObjPosY=-4216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_114"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-4048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_114
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_116'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_114',InputLinkIdx=2)),DrawY=-4150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1992,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1918,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-4216
   ObjName="TriggerVolume_116 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_114"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_115
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_132'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_115',InputLinkIdx=2)),DrawY=-3502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1976,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1902,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-3568
   ObjName="TriggerVolume_132 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_115"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_127'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=-3400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_115
   InputLinks(0)=(DrawY=-3531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3489,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=-1698,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1647,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1598,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-3568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_115"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_116
   InputLinks(0)=(DrawY=-3851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=-1690,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1639,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1590,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=-3888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_116"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-3720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_116
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_124'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_116',InputLinkIdx=2)),DrawY=-3822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1976,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1902,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-3888
   ObjName="TriggerVolume_124 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_116"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_117
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_125'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_117',InputLinkIdx=2)),DrawY=-3822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1224,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1150,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1360
   ObjPosY=-3888
   ObjName="TriggerVolume_125 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_117"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-968
   ObjPosY=-3720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_117
   InputLinks(0)=(DrawY=-3851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),DrawX=-938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-976
   ObjPosY=-3888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_117"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_118
   InputLinks(0)=(DrawY=-3531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3489,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),DrawX=-946,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-895,OverrideDelta=76)
   EventLinks(0)=(DrawX=-846,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-984
   ObjPosY=-3568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_118"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-976
   ObjPosY=-3400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_118
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_133'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_118',InputLinkIdx=2)),DrawY=-3502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1224,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1150,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1360
   ObjPosY=-3568
   ObjName="TriggerVolume_133 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_118"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_119
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_117'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_119',InputLinkIdx=2)),DrawY=-4150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1240,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1166,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1376
   ObjPosY=-4216
   ObjName="TriggerVolume_117 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_119"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-984
   ObjPosY=-4048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_119
   InputLinks(0)=(DrawY=-4179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),DrawX=-954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-4216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_119"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_120
   InputLinks(0)=(DrawY=-4499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),DrawX=-946,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-895,OverrideDelta=76)
   EventLinks(0)=(DrawX=-846,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-984
   ObjPosY=-4536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_120"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-976
   ObjPosY=-4368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_120
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_111'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_120',InputLinkIdx=2)),DrawY=-4470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1240,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1166,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1376
   ObjPosY=-4536
   ObjName="TriggerVolume_111 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_120"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_121
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_109'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_121',InputLinkIdx=2)),DrawY=-4438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2760,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2686,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2896
   ObjPosY=-4504
   ObjName="TriggerVolume_109 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_121"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_121
   InputLinks(0)=(DrawY=-4467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),DrawX=-2466,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2415,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2366,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-4504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_121"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_122
   InputLinks(0)=(DrawY=-4147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),DrawX=-2474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-4184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_122"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_122
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_115'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_122',InputLinkIdx=2)),DrawY=-4118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2760,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2686,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2896
   ObjPosY=-4184
   ObjName="TriggerVolume_115 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_122"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_123
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_131'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_123',InputLinkIdx=2)),DrawY=-3470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2744,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2670,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-3536
   ObjName="TriggerVolume_131 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_123"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_126'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_123
   InputLinks(0)=(DrawY=-3499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-2466,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2415,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2366,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-3536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_123"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_124
   InputLinks(0)=(DrawY=-3819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=-2458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-3856
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_124"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_124
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_123'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_124',InputLinkIdx=2)),DrawY=-3790,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2744,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2670,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-3856
   ObjName="TriggerVolume_123 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_124"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_125
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_122'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_125',InputLinkIdx=2)),DrawY=-3790,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3496,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3422,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3632
   ObjPosY=-3856
   ObjName="TriggerVolume_122 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_125"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_125
   InputLinks(0)=(DrawY=-3819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),DrawX=-3210,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3159,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3110,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3248
   ObjPosY=-3856
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_125"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_126
   InputLinks(0)=(DrawY=-3499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126'),DrawX=-3218,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3167,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3118,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-3536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_126"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_125'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3248
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_126
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_130'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_126',InputLinkIdx=2)),DrawY=-3470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3496,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3422,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3632
   ObjPosY=-3536
   ObjName="TriggerVolume_130 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_126"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_127
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_127',InputLinkIdx=2)),DrawY=-4118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3516,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3442,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-4184
   ObjName="TriggerVolume_17 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_127"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_127
   InputLinks(0)=(DrawY=-4147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=-3226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-4184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_127"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_128
   InputLinks(0)=(DrawY=-4467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=-3218,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3167,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3118,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-4504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_128"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3248
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_128
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_108'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_128',InputLinkIdx=2)),DrawY=-4438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3512,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3438,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-4504
   ObjName="TriggerVolume_108 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_128"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_17
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_41'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17',InputLinkIdx=2)),DrawY=-1662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3532,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3458,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-1728
   ObjName="TriggerVolume_41 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_17"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-1691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-3234,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3183,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3134,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-1371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1350,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1329,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1350,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-3242,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3191,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3142,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-1408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_18
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_48'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=2)),DrawY=-1342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3532,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3458,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-1408
   ObjName="TriggerVolume_48 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_18"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_19
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_158'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=2)),DrawY=-694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3512,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3438,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-760
   ObjName="TriggerVolume_158 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_19"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_465'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-3234,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3183,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3134,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-1043,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1022,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1001,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1022,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-3226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-1080
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_458'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_20
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_151'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=2)),DrawY=-1014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3512,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3438,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-1080
   ObjName="TriggerVolume_151 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_20"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_21
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_152'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=2)),DrawY=-1014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2760,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2686,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2896
   ObjPosY=-1080
   ObjName="TriggerVolume_152 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_21"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_459'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-1043,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1022,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1001,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1022,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-2474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-1080
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=-2482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_466'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_22
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_159'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=2)),DrawY=-694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2760,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2686,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2896
   ObjPosY=-760
   ObjName="TriggerVolume_159 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_22"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_23
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_49'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=2)),DrawY=-1342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2780,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2706,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2912
   ObjPosY=-1408
   ObjName="TriggerVolume_49 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_23"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-1371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1350,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1329,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1350,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-2490,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2439,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2390,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-1408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-1691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-2482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_24
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_42'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=2)),DrawY=-1662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2780,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2706,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2912
   ObjPosY=-1728
   ObjName="TriggerVolume_42 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_24"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_25
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_44'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25',InputLinkIdx=2)),DrawY=-1694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1260,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1186,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=-1760
   ObjName="TriggerVolume_44 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_25"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-1592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-1723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=-962,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-911,OverrideDelta=76)
   EventLinks(0)=(DrawX=-862,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-1760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-1403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=-970,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-919,OverrideDelta=76)
   EventLinks(0)=(DrawX=-870,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-1440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_453'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-1272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_26
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_146'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26',InputLinkIdx=2)),DrawY=-1374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1256,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1182,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=-1440
   ObjName="TriggerVolume_146 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_26"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_27
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_161'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27',InputLinkIdx=2)),DrawY=-726,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1240,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1166,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1376
   ObjPosY=-792
   ObjName="TriggerVolume_161 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_27"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_468'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-713,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-962,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-911,OverrideDelta=76)
   EventLinks(0)=(DrawX=-862,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-1075,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1054,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1033,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1054,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=-954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-1112
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_460'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-984
   ObjPosY=-944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_28
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_153'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28',InputLinkIdx=2)),DrawY=-1046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1240,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1166,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1376
   ObjPosY=-1112
   ObjName="TriggerVolume_153 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_28"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_29
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_51'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29',InputLinkIdx=2)),DrawY=-1046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1996,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1922,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-1112
   ObjName="TriggerVolume_51 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_29"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-1075,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1054,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1033,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1054,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=-1706,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1655,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1606,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1744
   ObjPosY=-1112
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-713,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-1714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1752
   ObjPosY=-792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_467'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1744
   ObjPosY=-624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_30
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_160'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30',InputLinkIdx=2)),DrawY=-726,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1992,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1918,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-792
   ObjName="TriggerVolume_160 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_30"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_31
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_50'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=2)),DrawY=-1374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2012,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1938,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-1440
   ObjName="TriggerVolume_50 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_31"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1752
   ObjPosY=-1272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=-1403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=-1722,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1671,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1622,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1760
   ObjPosY=-1440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-1723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-1714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1752
   ObjPosY=-1760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1744
   ObjPosY=-1592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_32
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_43'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=2)),DrawY=-1694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2012,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1938,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-1760
   ObjName="TriggerVolume_43 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_32"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_129
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_167'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_129',InputLinkIdx=2)),DrawY=-310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2056,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1982,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=-376
   ObjName="TriggerVolume_167 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_129"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_474'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_129
   InputLinks(0)=(DrawY=-339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-297,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-318,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129'),DrawX=-1762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=-376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_129"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_130
   InputLinks(0)=(DrawY=-19,OverrideDelta=14)
   InputLinks(1)=(DrawY=2,OverrideDelta=35)
   InputLinks(2)=(DrawY=23,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130'),DrawX=-1770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=-56
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_130"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_481'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_130
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_174'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_130',InputLinkIdx=2)),DrawY=10,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2056,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1982,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=-56
   ObjName="TriggerVolume_174 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_130"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_131
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_189'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_131',InputLinkIdx=2)),DrawY=650,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=584
   ObjName="TriggerVolume_189 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_131"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_496'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_131
   InputLinks(0)=(DrawY=621,OverrideDelta=14)
   InputLinks(1)=(DrawY=642,OverrideDelta=35)
   InputLinks(2)=(DrawY=663,OverrideDelta=56)
   OutputLinks(0)=(DrawY=642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131'),DrawX=-1762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_131"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_132
   InputLinks(0)=(DrawY=301,OverrideDelta=14)
   InputLinks(1)=(DrawY=322,OverrideDelta=35)
   InputLinks(2)=(DrawY=343,OverrideDelta=56)
   OutputLinks(0)=(DrawY=322,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=-1754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=264
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_132"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_489'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_132
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_182'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_132',InputLinkIdx=2)),DrawY=330,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=264
   ObjName="TriggerVolume_182 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_132"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_133
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_54'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_133',InputLinkIdx=2)),DrawY=330,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1292,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1218,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=264
   ObjName="TriggerVolume_54 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_133"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_133
   InputLinks(0)=(DrawY=301,OverrideDelta=14)
   InputLinks(1)=(DrawY=322,OverrideDelta=35)
   InputLinks(2)=(DrawY=343,OverrideDelta=56)
   OutputLinks(0)=(DrawY=322,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=-1002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=264
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_133"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_134
   InputLinks(0)=(DrawY=621,OverrideDelta=14)
   InputLinks(1)=(DrawY=642,OverrideDelta=35)
   InputLinks(2)=(DrawY=663,OverrideDelta=56)
   OutputLinks(0)=(DrawY=642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134'),DrawX=-1010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1048
   ObjPosY=584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_134"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_497'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_134
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_190'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_134',InputLinkIdx=2)),DrawY=650,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1288,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1214,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=584
   ObjName="TriggerVolume_190 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_134"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_135
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_175'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_135',InputLinkIdx=2)),DrawY=10,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1304,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1230,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1440
   ObjPosY=-56
   ObjName="TriggerVolume_175 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_135"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_482'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1048
   ObjPosY=104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_135
   InputLinks(0)=(DrawY=-19,OverrideDelta=14)
   InputLinks(1)=(DrawY=2,OverrideDelta=35)
   InputLinks(2)=(DrawY=23,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135'),DrawX=-1018,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-967,OverrideDelta=76)
   EventLinks(0)=(DrawX=-918,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1056
   ObjPosY=-56
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_135"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_136
   InputLinks(0)=(DrawY=-339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-297,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-318,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-1010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1048
   ObjPosY=-376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_136"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_475'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_136
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_168'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_136',InputLinkIdx=2)),DrawY=-310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1304,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-1230,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1440
   ObjPosY=-376
   ObjName="TriggerVolume_168 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_136"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_137
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_166'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_137',InputLinkIdx=2)),DrawY=-278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2824,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2750,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2960
   ObjPosY=-344
   ObjName="TriggerVolume_166 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_137"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_473'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_137
   InputLinks(0)=(DrawY=-307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-265,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),DrawX=-2530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=-344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_137"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_138
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=-2538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=-24
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_138"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_480'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_138
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_173'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_138',InputLinkIdx=2)),DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2824,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2750,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2960
   ObjPosY=-24
   ObjName="TriggerVolume_173 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_138"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_139
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_188'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_139',InputLinkIdx=2)),DrawY=682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=616
   ObjName="TriggerVolume_188 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_139"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_495'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_139
   InputLinks(0)=(DrawY=653,OverrideDelta=14)
   InputLinks(1)=(DrawY=674,OverrideDelta=35)
   InputLinks(2)=(DrawY=695,OverrideDelta=56)
   OutputLinks(0)=(DrawY=674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-2530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_139"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_140
   InputLinks(0)=(DrawY=333,OverrideDelta=14)
   InputLinks(1)=(DrawY=354,OverrideDelta=35)
   InputLinks(2)=(DrawY=375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=-2522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_140"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_488'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_140
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_181'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_140',InputLinkIdx=2)),DrawY=362,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=296
   ObjName="TriggerVolume_181 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_140"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_141
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_180'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_141',InputLinkIdx=2)),DrawY=362,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3552,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3478,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=296
   ObjName="TriggerVolume_180 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_141"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_487'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_141
   InputLinks(0)=(DrawY=333,OverrideDelta=14)
   InputLinks(1)=(DrawY=354,OverrideDelta=35)
   InputLinks(2)=(DrawY=375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),DrawX=-3274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_141"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_142
   InputLinks(0)=(DrawY=653,OverrideDelta=14)
   InputLinks(1)=(DrawY=674,OverrideDelta=35)
   InputLinks(2)=(DrawY=695,OverrideDelta=56)
   OutputLinks(0)=(DrawY=674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),DrawX=-3282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3320
   ObjPosY=616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_142"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_494'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_142
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_187'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_142',InputLinkIdx=2)),DrawY=682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3552,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3478,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=616
   ObjName="TriggerVolume_187 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_142"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_143
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_53'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_143',InputLinkIdx=2)),DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3572,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3498,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-24
   ObjName="TriggerVolume_53 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_143"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3320
   ObjPosY=136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_143
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-3290,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3239,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3190,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3328
   ObjPosY=-24
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_143"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_144
   InputLinks(0)=(DrawY=-307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-265,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=-3282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3320
   ObjPosY=-344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_144"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_472'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_144
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_165'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_144',InputLinkIdx=2)),DrawY=-278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3568,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3494,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-344
   ObjName="TriggerVolume_165 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_144"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_145
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_162'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_145',InputLinkIdx=2)),DrawY=-246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6616,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6542,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-312
   ObjName="TriggerVolume_162 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_145"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_469'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_145
   InputLinks(0)=(DrawY=-275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145'),DrawX=-6330,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6279,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6230,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_145"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_146
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),DrawX=-6338,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6287,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6238,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_146"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_476'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_146
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_169'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_146',InputLinkIdx=2)),DrawY=66,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6616,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6542,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjName="TriggerVolume_169 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_146"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_147
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_183'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_147',InputLinkIdx=2)),DrawY=714,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6600,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6526,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=648
   ObjName="TriggerVolume_183 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_147"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_490'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_147
   InputLinks(0)=(DrawY=685,OverrideDelta=14)
   InputLinks(1)=(DrawY=706,OverrideDelta=35)
   InputLinks(2)=(DrawY=727,OverrideDelta=56)
   OutputLinks(0)=(DrawY=706,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),DrawX=-6330,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6279,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6230,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_147"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_148
   InputLinks(0)=(DrawY=365,OverrideDelta=14)
   InputLinks(1)=(DrawY=386,OverrideDelta=35)
   InputLinks(2)=(DrawY=407,OverrideDelta=56)
   OutputLinks(0)=(DrawY=386,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_148"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_483'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_148
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_176'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_148',InputLinkIdx=2)),DrawY=394,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6600,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6526,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=328
   ObjName="TriggerVolume_176 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_148"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_149
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_177'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_149',InputLinkIdx=2)),DrawY=394,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5856,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5782,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=328
   ObjName="TriggerVolume_177 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_149"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_484'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_149
   InputLinks(0)=(DrawY=365,OverrideDelta=14)
   InputLinks(1)=(DrawY=386,OverrideDelta=35)
   InputLinks(2)=(DrawY=407,OverrideDelta=56)
   OutputLinks(0)=(DrawY=386,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-5570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_149"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_150
   InputLinks(0)=(DrawY=685,OverrideDelta=14)
   InputLinks(1)=(DrawY=706,OverrideDelta=35)
   InputLinks(2)=(DrawY=727,OverrideDelta=56)
   OutputLinks(0)=(DrawY=706,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150'),DrawX=-5578,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5527,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5478,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5616
   ObjPosY=648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_150"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_491'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_150
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_184'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_150',InputLinkIdx=2)),DrawY=714,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5856,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5782,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=648
   ObjName="TriggerVolume_184 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_150"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_151
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_170'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_151',InputLinkIdx=2)),DrawY=66,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5872,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5798,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjName="TriggerVolume_170 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_151"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_477'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5616
   ObjPosY=168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_151
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),DrawX=-5586,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5535,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5486,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_151"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_152
   InputLinks(0)=(DrawY=-275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-5578,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5527,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5478,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5616
   ObjPosY=-312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_152"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=-144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_152
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_52'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_152',InputLinkIdx=2)),DrawY=-246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5876,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5802,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjPosY=-312
   ObjName="TriggerVolume_52 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_152"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_153
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_164'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_153',InputLinkIdx=2)),DrawY=-278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4352,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4278,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-344
   ObjName="TriggerVolume_164 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_153"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_471'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=-176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_153
   InputLinks(0)=(DrawY=-307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-265,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=-4058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4096
   ObjPosY=-344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_153"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_154
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154'),DrawX=-4066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4104
   ObjPosY=-24
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_154"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_479'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4096
   ObjPosY=136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_154
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_172'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_154',InputLinkIdx=2)),DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4352,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4278,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-24
   ObjName="TriggerVolume_172 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_154"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_155
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_186'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_155',InputLinkIdx=2)),DrawY=682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4336,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4262,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=616
   ObjName="TriggerVolume_186 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_155"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_493'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_155
   InputLinks(0)=(DrawY=653,OverrideDelta=14)
   InputLinks(1)=(DrawY=674,OverrideDelta=35)
   InputLinks(2)=(DrawY=695,OverrideDelta=56)
   OutputLinks(0)=(DrawY=674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155'),DrawX=-4058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4096
   ObjPosY=616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_155"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_156
   InputLinks(0)=(DrawY=333,OverrideDelta=14)
   InputLinks(1)=(DrawY=354,OverrideDelta=35)
   InputLinks(2)=(DrawY=375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_156'),DrawX=-4050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_156"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_486'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_156
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_179'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_156',InputLinkIdx=2)),DrawY=362,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4336,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4262,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=296
   ObjName="TriggerVolume_179 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_156"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_157
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_178'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_157',InputLinkIdx=2)),DrawY=362,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5088,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5014,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=296
   ObjName="TriggerVolume_178 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_157"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_485'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_157
   InputLinks(0)=(DrawY=333,OverrideDelta=14)
   InputLinks(1)=(DrawY=354,OverrideDelta=35)
   InputLinks(2)=(DrawY=375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157'),DrawX=-4802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_157"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_158
   InputLinks(0)=(DrawY=653,OverrideDelta=14)
   InputLinks(1)=(DrawY=674,OverrideDelta=35)
   InputLinks(2)=(DrawY=695,OverrideDelta=56)
   OutputLinks(0)=(DrawY=674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158'),DrawX=-4810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4848
   ObjPosY=616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_158"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_492'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_158
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_185'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_158',InputLinkIdx=2)),DrawY=682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5088,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5014,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=616
   ObjName="TriggerVolume_185 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_158"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_159
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_171'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_159',InputLinkIdx=2)),DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5104,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5030,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-24
   ObjName="TriggerVolume_171 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_159"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_478'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4848
   ObjPosY=136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_159
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159'),DrawX=-4818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4856
   ObjPosY=-24
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_159"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_160
   InputLinks(0)=(DrawY=-307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-265,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-4810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4848
   ObjPosY=-344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_160"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_470'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=-176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_160
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_163'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_160',InputLinkIdx=2)),DrawY=-278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5104,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5030,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-344
   ObjName="TriggerVolume_163 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_160"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_48
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_39'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48',InputLinkIdx=2)),DrawY=-1662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5060,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4986,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-1728
   ObjName="TriggerVolume_39 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_48"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=-1691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48'),DrawX=-4762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
   InputLinks(0)=(DrawY=-1371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1350,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1329,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1350,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),DrawX=-4770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4808
   ObjPosY=-1408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_47
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_46'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47',InputLinkIdx=2)),DrawY=-1342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5060,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4986,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-1408
   ObjName="TriggerVolume_46 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_47"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_46
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_156'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46',InputLinkIdx=2)),DrawY=-694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-760
   ObjName="TriggerVolume_156 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_46"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_463'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=-723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=-4762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
   InputLinks(0)=(DrawY=-1043,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1022,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1001,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1022,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=-4754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-1080
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_45"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_456'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_45
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_149'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45',InputLinkIdx=2)),DrawY=-1014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5040,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4966,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-1080
   ObjName="TriggerVolume_149 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_45"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_44
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_150'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44',InputLinkIdx=2)),DrawY=-1014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4288,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4214,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-1080
   ObjName="TriggerVolume_150 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_44"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_457'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4032
   ObjPosY=-912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
   InputLinks(0)=(DrawY=-1043,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1022,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1001,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1022,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=-4002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-1080
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_44"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=-723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=-4010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4048
   ObjPosY=-760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_464'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_43
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_157'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43',InputLinkIdx=2)),DrawY=-694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4288,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4214,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-760
   ObjName="TriggerVolume_157 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_43"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_42
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_47'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_42',InputLinkIdx=2)),DrawY=-1342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4308,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4234,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4440
   ObjPosY=-1408
   ObjName="TriggerVolume_47 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_42"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4048
   ObjPosY=-1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
   InputLinks(0)=(DrawY=-1371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1350,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1329,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1350,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-4018,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3967,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3918,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-1408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_42"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=-1691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-4010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4048
   ObjPosY=-1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_41"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_41
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_40'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41',InputLinkIdx=2)),DrawY=-1662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4308,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4234,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4440
   ObjPosY=-1728
   ObjName="TriggerVolume_40 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_41"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_40
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_38'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40',InputLinkIdx=2)),DrawY=-1630,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5828,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5754,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-1696
   ObjName="TriggerVolume_38 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_40"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-1528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=-1659,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1638,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1617,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1638,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=-5530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5568
   ObjPosY=-1696
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=-1339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1297,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1318,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=-5538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5576
   ObjPosY=-1376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5568
   ObjPosY=-1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_39
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_45'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39',InputLinkIdx=2)),DrawY=-1310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5828,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5754,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-1376
   ObjName="TriggerVolume_45 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_39"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_38
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_155'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38',InputLinkIdx=2)),DrawY=-662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-728
   ObjName="TriggerVolume_155 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_38"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_462'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=-691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-5530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5568
   ObjPosY=-728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-1011,OverrideDelta=14)
   InputLinks(1)=(DrawY=-990,OverrideDelta=35)
   InputLinks(2)=(DrawY=-969,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-990,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-5522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-1048
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_455'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_37
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_148'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37',InputLinkIdx=2)),DrawY=-982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5808,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5734,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-1048
   ObjName="TriggerVolume_148 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_37"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_36
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_147'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36',InputLinkIdx=2)),DrawY=-982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6560,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6486,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-1048
   ObjName="TriggerVolume_147 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_36"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_454'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-1011,OverrideDelta=14)
   InputLinks(1)=(DrawY=-990,OverrideDelta=35)
   InputLinks(2)=(DrawY=-969,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-990,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=-6274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=-1048
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=-691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-6282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6320
   ObjPosY=-728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_461'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=-560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_35
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_154'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35',InputLinkIdx=2)),DrawY=-662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6560,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6486,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-728
   ObjName="TriggerVolume_154 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_35"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_34
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=324
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=2)),DrawY=-1310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6584,OverrideDelta=96)
   VariableLinks(1)=(DrawX=-6510,OverrideDelta=176)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6712
   ObjPosY=-1376
   ObjName="TriggerVolume_4 Take Damage"
   DrawWidth=182
   DrawHeight=144
   Name="SeqEvent_TakeDamage_34"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6320
   ObjPosY=-1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-1339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1297,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1318,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=-6290,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6239,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6190,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6328
   ObjPosY=-1376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_49
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_56'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49',InputLinkIdx=2)),DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5092,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5018,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=1024
   ObjName="TriggerVolume_56 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_49"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-4794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_49"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
   InputLinks(0)=(DrawY=1381,OverrideDelta=14)
   InputLinks(1)=(DrawY=1402,OverrideDelta=35)
   InputLinks(2)=(DrawY=1423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=-4802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=1344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_50"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=1504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_50
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_64'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=2)),DrawY=1410,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5092,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5018,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=1344
   ObjName="TriggerVolume_64 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_50"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_161
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_79'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_161',InputLinkIdx=2)),DrawY=2050,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5076,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5002,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=1984
   ObjName="TriggerVolume_79 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_161"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=2152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_161
   InputLinks(0)=(DrawY=2021,OverrideDelta=14)
   InputLinks(1)=(DrawY=2042,OverrideDelta=35)
   InputLinks(2)=(DrawY=2063,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2042,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-4794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=1984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_161"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_162
   InputLinks(0)=(DrawY=1701,OverrideDelta=14)
   InputLinks(1)=(DrawY=1722,OverrideDelta=35)
   InputLinks(2)=(DrawY=1743,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1722,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),DrawX=-4786,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4735,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4686,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=1664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_162"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4816
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_162
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_72'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_162',InputLinkIdx=2)),DrawY=1730,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5076,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5002,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=1664
   ObjName="TriggerVolume_72 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_162"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_163
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_73'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_163',InputLinkIdx=2)),DrawY=1730,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4324,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4250,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=1664
   ObjName="TriggerVolume_73 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_163"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_163
   InputLinks(0)=(DrawY=1701,OverrideDelta=14)
   InputLinks(1)=(DrawY=1722,OverrideDelta=35)
   InputLinks(2)=(DrawY=1743,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1722,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),DrawX=-4034,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3983,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3934,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=1664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_163"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_164
   InputLinks(0)=(DrawY=2021,OverrideDelta=14)
   InputLinks(1)=(DrawY=2042,OverrideDelta=35)
   InputLinks(2)=(DrawY=2063,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2042,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164'),DrawX=-4042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=1984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_164"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=2152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_164
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_80'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_164',InputLinkIdx=2)),DrawY=2050,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4324,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4250,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=1984
   ObjName="TriggerVolume_80 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_164"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_55
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_65'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_55',InputLinkIdx=2)),DrawY=1410,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4340,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4266,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=1344
   ObjName="TriggerVolume_65 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_55"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=1504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
   InputLinks(0)=(DrawY=1381,OverrideDelta=14)
   InputLinks(1)=(DrawY=1402,OverrideDelta=35)
   InputLinks(2)=(DrawY=1423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-4050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=1344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_55"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=-4042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_56"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_56
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_57'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_56',InputLinkIdx=2)),DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4340,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4266,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=1024
   ObjName="TriggerVolume_57 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_56"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_57
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_55'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57',InputLinkIdx=2)),DrawY=1122,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5860,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5786,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=1056
   ObjName="TriggerVolume_55 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_57"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=1224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
   InputLinks(0)=(DrawY=1093,OverrideDelta=14)
   InputLinks(1)=(DrawY=1114,OverrideDelta=35)
   InputLinks(2)=(DrawY=1135,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1114,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-5562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=1056
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_57"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
   InputLinks(0)=(DrawY=1405,OverrideDelta=14)
   InputLinks(1)=(DrawY=1426,OverrideDelta=35)
   InputLinks(2)=(DrawY=1447,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1426,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-5570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=1368
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_58"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=1536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_58
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_63'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_58',InputLinkIdx=2)),DrawY=1434,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5860,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5786,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=1368
   ObjName="TriggerVolume_63 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_58"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_165
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_78'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_165',InputLinkIdx=2)),DrawY=2082,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5844,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5770,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=2016
   ObjName="TriggerVolume_78 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_165"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_501'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=2184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_165
   InputLinks(0)=(DrawY=2053,OverrideDelta=14)
   InputLinks(1)=(DrawY=2074,OverrideDelta=35)
   InputLinks(2)=(DrawY=2095,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2074,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),DrawX=-5562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=2016
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_165"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_166
   InputLinks(0)=(DrawY=1733,OverrideDelta=14)
   InputLinks(1)=(DrawY=1754,OverrideDelta=35)
   InputLinks(2)=(DrawY=1775,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1754,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166'),DrawX=-5554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=1696
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_166"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5584
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_166
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_71'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_166',InputLinkIdx=2)),DrawY=1762,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5844,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5770,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=1696
   ObjName="TriggerVolume_71 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_166"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_167
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_70'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_167',InputLinkIdx=2)),DrawY=1762,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6588,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6514,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=1696
   ObjName="TriggerVolume_70 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_167"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_167
   InputLinks(0)=(DrawY=1733,OverrideDelta=14)
   InputLinks(1)=(DrawY=1754,OverrideDelta=35)
   InputLinks(2)=(DrawY=1775,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1754,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167'),DrawX=-6306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=1696
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_167"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_168
   InputLinks(0)=(DrawY=2053,OverrideDelta=14)
   InputLinks(1)=(DrawY=2074,OverrideDelta=35)
   InputLinks(2)=(DrawY=2095,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2074,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=2016
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_168"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_500'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=2184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_168
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_77'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_168',InputLinkIdx=2)),DrawY=2082,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6588,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6514,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=2016
   ObjName="TriggerVolume_77 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_168"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_63
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_62'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_63',InputLinkIdx=2)),DrawY=1434,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6604,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6530,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=1368
   ObjName="TriggerVolume_62 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_63"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=1536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
   InputLinks(0)=(DrawY=1405,OverrideDelta=14)
   InputLinks(1)=(DrawY=1426,OverrideDelta=35)
   InputLinks(2)=(DrawY=1447,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1426,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=1368
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_63"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
   InputLinks(0)=(DrawY=1093,OverrideDelta=14)
   InputLinks(1)=(DrawY=1114,OverrideDelta=35)
   InputLinks(2)=(DrawY=1135,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1114,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=1056
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_64"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_498'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=1224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_64
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_191'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_64',InputLinkIdx=2)),DrawY=1122,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6600,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6526,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=1056
   ObjName="TriggerVolume_191 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_64"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_9
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_58'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9',InputLinkIdx=2)),DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3556,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3482,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=1024
   ObjName="TriggerVolume_58 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_9"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-3266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1381,OverrideDelta=14)
   InputLinks(1)=(DrawY=1402,OverrideDelta=35)
   InputLinks(2)=(DrawY=1423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-3274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=1344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=1504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_10
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_66'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10',InputLinkIdx=2)),DrawY=1410,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3556,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3482,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=1344
   ObjName="TriggerVolume_66 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_10"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_169
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_81'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_169',InputLinkIdx=2)),DrawY=2050,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3540,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3466,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=1984
   ObjName="TriggerVolume_81 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_169"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=2152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_169
   InputLinks(0)=(DrawY=2021,OverrideDelta=14)
   InputLinks(1)=(DrawY=2042,OverrideDelta=35)
   InputLinks(2)=(DrawY=2063,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2042,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169'),DrawX=-3266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=1984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_169"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_170
   InputLinks(0)=(DrawY=1701,OverrideDelta=14)
   InputLinks(1)=(DrawY=1722,OverrideDelta=35)
   InputLinks(2)=(DrawY=1743,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1722,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),DrawX=-3258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=1664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_170"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_170
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_74'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_170',InputLinkIdx=2)),DrawY=1730,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3540,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3466,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=1664
   ObjName="TriggerVolume_74 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_170"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_171
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_171',InputLinkIdx=2)),DrawY=1730,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2796,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2722,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=1664
   ObjName="TriggerVolume_14 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_171"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_171
   InputLinks(0)=(DrawY=1701,OverrideDelta=14)
   InputLinks(1)=(DrawY=1722,OverrideDelta=35)
   InputLinks(2)=(DrawY=1743,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1722,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171'),DrawX=-2506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=1664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_171"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_172
   InputLinks(0)=(DrawY=2021,OverrideDelta=14)
   InputLinks(1)=(DrawY=2042,OverrideDelta=35)
   InputLinks(2)=(DrawY=2063,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2042,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172'),DrawX=-2514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=1984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_172"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=2152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_172
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_82'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_172',InputLinkIdx=2)),DrawY=2050,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2796,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2722,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=1984
   ObjName="TriggerVolume_82 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_172"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_15
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_67'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=2)),DrawY=1410,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2812,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2738,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=1344
   ObjName="TriggerVolume_67 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_15"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=1504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=1381,OverrideDelta=14)
   InputLinks(1)=(DrawY=1402,OverrideDelta=35)
   InputLinks(2)=(DrawY=1423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=-2522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=1344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-2514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_16
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_59'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=2)),DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2812,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2738,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=1024
   ObjName="TriggerVolume_59 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_16"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_3
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_61'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=2)),DrawY=1058,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1292,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1218,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=992
   ObjName="TriggerVolume_61 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_3"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=1160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1029,OverrideDelta=14)
   InputLinks(1)=(DrawY=1050,OverrideDelta=35)
   InputLinks(2)=(DrawY=1071,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1050,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=992
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=1349,OverrideDelta=14)
   InputLinks(1)=(DrawY=1370,OverrideDelta=35)
   InputLinks(2)=(DrawY=1391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-1002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=1312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=1472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_4
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_69'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=2)),DrawY=1378,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1292,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1218,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=1312
   ObjName="TriggerVolume_69 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_4"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_173
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_84'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_173',InputLinkIdx=2)),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1202,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=1952
   ObjName="TriggerVolume_84 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_173"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=2120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_173
   InputLinks(0)=(DrawY=1989,OverrideDelta=14)
   InputLinks(1)=(DrawY=2010,OverrideDelta=35)
   InputLinks(2)=(DrawY=2031,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2010,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_173'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=1952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_173"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_174
   InputLinks(0)=(DrawY=1669,OverrideDelta=14)
   InputLinks(1)=(DrawY=1690,OverrideDelta=35)
   InputLinks(2)=(DrawY=1711,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1690,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_174'),DrawX=-986,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-935,OverrideDelta=76)
   EventLinks(0)=(DrawX=-886,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=1632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_174"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1016
   ObjPosY=1800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_174
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_76'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_174',InputLinkIdx=2)),DrawY=1698,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1202,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=1632
   ObjName="TriggerVolume_76 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_174"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_175
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_75'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_175',InputLinkIdx=2)),DrawY=1698,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2028,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1954,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=1632
   ObjName="TriggerVolume_75 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_175"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_499'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1768
   ObjPosY=1800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_175
   InputLinks(0)=(DrawY=1669,OverrideDelta=14)
   InputLinks(1)=(DrawY=1690,OverrideDelta=35)
   InputLinks(2)=(DrawY=1711,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1690,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175'),DrawX=-1738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=1632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_175"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_176
   InputLinks(0)=(DrawY=1989,OverrideDelta=14)
   InputLinks(1)=(DrawY=2010,OverrideDelta=35)
   InputLinks(2)=(DrawY=2031,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2010,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176'),DrawX=-1746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=1952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_176"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=2120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_176
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_83'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_176',InputLinkIdx=2)),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2028,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1954,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=1952
   ObjName="TriggerVolume_83 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_176"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_6
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_68'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=2)),DrawY=1378,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2044,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1970,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=1312
   ObjName="TriggerVolume_68 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_6"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=1472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=1349,OverrideDelta=14)
   InputLinks(1)=(DrawY=1370,OverrideDelta=35)
   InputLinks(2)=(DrawY=1391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-1754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=1312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=1029,OverrideDelta=14)
   InputLinks(1)=(DrawY=1050,OverrideDelta=35)
   InputLinks(2)=(DrawY=1071,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1050,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-1746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=992
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=1160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_5
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_60'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=2)),DrawY=1058,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2044,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1970,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=992
   ObjName="TriggerVolume_60 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_5"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_225
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_97'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_223',InputLinkIdx=2)),DrawY=2762,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2028,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1954,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=2696
   ObjName="TriggerVolume_97 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_225"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_223
   InputLinks(0)=(DrawY=2733,OverrideDelta=14)
   InputLinks(1)=(DrawY=2754,OverrideDelta=35)
   InputLinks(2)=(DrawY=2775,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2754,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225'),DrawX=-1746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=2696
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_223"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_224
   InputLinks(0)=(DrawY=2413,OverrideDelta=14)
   InputLinks(1)=(DrawY=2434,OverrideDelta=35)
   InputLinks(2)=(DrawY=2455,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2434,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226'),DrawX=-1738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=2376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_224"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_85'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1768
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_226
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_90'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_224',InputLinkIdx=2)),DrawY=2442,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2028,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1954,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=2376
   ObjName="TriggerVolume_90 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_226"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_226
   InputLinks(0)=(DrawY=2733,OverrideDelta=14)
   InputLinks(1)=(DrawY=2754,OverrideDelta=35)
   InputLinks(2)=(DrawY=2775,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2754,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=2696
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_226"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_228
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_98'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_226',InputLinkIdx=2)),DrawY=2762,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1276,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1202,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=2696
   ObjName="TriggerVolume_98 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_228"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_229
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_96'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_227',InputLinkIdx=2)),DrawY=2794,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2796,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2722,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=2728
   ObjName="TriggerVolume_96 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_229"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_227
   InputLinks(0)=(DrawY=2765,OverrideDelta=14)
   InputLinks(1)=(DrawY=2786,OverrideDelta=35)
   InputLinks(2)=(DrawY=2807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229'),DrawX=-2514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=2728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_227"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_228
   InputLinks(0)=(DrawY=2445,OverrideDelta=14)
   InputLinks(1)=(DrawY=2466,OverrideDelta=35)
   InputLinks(2)=(DrawY=2487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230'),DrawX=-2506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=2408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_228"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_230
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_89'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_228',InputLinkIdx=2)),DrawY=2474,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2796,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-2722,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=2408
   ObjName="TriggerVolume_89 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_230"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_231
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_88'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_229',InputLinkIdx=2)),DrawY=2474,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3540,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3466,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=2408
   ObjName="TriggerVolume_88 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_231"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_83'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_229
   InputLinks(0)=(DrawY=2445,OverrideDelta=14)
   InputLinks(1)=(DrawY=2466,OverrideDelta=35)
   InputLinks(2)=(DrawY=2487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231'),DrawX=-3258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=2408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_229"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_230
   InputLinks(0)=(DrawY=2765,OverrideDelta=14)
   InputLinks(1)=(DrawY=2786,OverrideDelta=35)
   InputLinks(2)=(DrawY=2807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232'),DrawX=-3266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=2728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_230"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_232
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_95'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_230',InputLinkIdx=2)),DrawY=2794,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3540,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-3466,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=2728
   ObjName="TriggerVolume_95 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_232"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_233
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_92'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_231',InputLinkIdx=2)),DrawY=2826,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6588,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6514,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=2760
   ObjName="TriggerVolume_92 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_233"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_87'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_231
   InputLinks(0)=(DrawY=2797,OverrideDelta=14)
   InputLinks(1)=(DrawY=2818,OverrideDelta=35)
   InputLinks(2)=(DrawY=2839,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2818,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=2760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_231"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_232
   InputLinks(0)=(DrawY=2477,OverrideDelta=14)
   InputLinks(1)=(DrawY=2498,OverrideDelta=35)
   InputLinks(2)=(DrawY=2519,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2498,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234'),DrawX=-6306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=2440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_232"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_508'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=2608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_234
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_232',InputLinkIdx=2)),DrawY=2506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6588,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6514,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=2440
   ObjName="TriggerVolume_15 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_234"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_235
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_85'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_233',InputLinkIdx=2)),DrawY=2506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5844,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5770,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=2440
   ObjName="TriggerVolume_85 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_235"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5584
   ObjPosY=2608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_233
   InputLinks(0)=(DrawY=2477,OverrideDelta=14)
   InputLinks(1)=(DrawY=2498,OverrideDelta=35)
   InputLinks(2)=(DrawY=2519,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2498,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235'),DrawX=-5554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=2440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_233"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_234
   InputLinks(0)=(DrawY=2797,OverrideDelta=14)
   InputLinks(1)=(DrawY=2818,OverrideDelta=35)
   InputLinks(2)=(DrawY=2839,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2818,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_236'),DrawX=-5562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=2760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_234"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_236"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_236
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_93'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_234',InputLinkIdx=2)),DrawY=2826,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5844,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5770,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=2760
   ObjName="TriggerVolume_93 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_236"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_237
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_235',InputLinkIdx=2)),DrawY=2794,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4324,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4250,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=2728
   ObjName="TriggerVolume_16 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_237"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_235
   InputLinks(0)=(DrawY=2765,OverrideDelta=14)
   InputLinks(1)=(DrawY=2786,OverrideDelta=35)
   InputLinks(2)=(DrawY=2807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237'),DrawX=-4042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=2728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_235"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_236
   InputLinks(0)=(DrawY=2445,OverrideDelta=14)
   InputLinks(1)=(DrawY=2466,OverrideDelta=35)
   InputLinks(2)=(DrawY=2487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238'),DrawX=-4034,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3983,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3934,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=2408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_236"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_238
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_87'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_236',InputLinkIdx=2)),DrawY=2474,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4324,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-4250,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=2408
   ObjName="TriggerVolume_87 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_238"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_239
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_86'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_237',InputLinkIdx=2)),DrawY=2474,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5076,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5002,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=2408
   ObjName="TriggerVolume_86 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_239"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4816
   ObjPosY=2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_237
   InputLinks(0)=(DrawY=2445,OverrideDelta=14)
   InputLinks(1)=(DrawY=2466,OverrideDelta=35)
   InputLinks(2)=(DrawY=2487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239'),DrawX=-4786,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4735,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4686,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=2408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_237"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_238
   InputLinks(0)=(DrawY=2765,OverrideDelta=14)
   InputLinks(1)=(DrawY=2786,OverrideDelta=35)
   InputLinks(2)=(DrawY=2807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240'),DrawX=-4794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=2728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_238"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_240
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_94'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_238',InputLinkIdx=2)),DrawY=2794,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5076,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-5002,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=2728
   ObjName="TriggerVolume_94 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_240"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_241
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_239',InputLinkIdx=2)),DrawY=3522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5080,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5006,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5216
   ObjPosY=3456
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_241"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_239
   InputLinks(0)=(DrawY=3493,OverrideDelta=14)
   InputLinks(1)=(DrawY=3514,OverrideDelta=35)
   InputLinks(2)=(DrawY=3535,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3514,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),DrawX=-4802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=3456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_239"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_240
   InputLinks(0)=(DrawY=3173,OverrideDelta=14)
   InputLinks(1)=(DrawY=3194,OverrideDelta=35)
   InputLinks(2)=(DrawY=3215,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3194,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),DrawX=-4794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=3136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_240"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_242
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_101'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_240',InputLinkIdx=2)),DrawY=3202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5080,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5006,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5216
   ObjPosY=3136
   ObjName="TriggerVolume_101 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_242"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_243
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_102'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_241',InputLinkIdx=2)),DrawY=3202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4328,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4254,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=3136
   ObjName="TriggerVolume_102 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_243"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_241
   InputLinks(0)=(DrawY=3173,OverrideDelta=14)
   InputLinks(1)=(DrawY=3194,OverrideDelta=35)
   InputLinks(2)=(DrawY=3215,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3194,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243'),DrawX=-4042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=3136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_241"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_242
   InputLinks(0)=(DrawY=3493,OverrideDelta=14)
   InputLinks(1)=(DrawY=3514,OverrideDelta=35)
   InputLinks(2)=(DrawY=3535,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3514,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244'),DrawX=-4050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=3456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_242"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_244
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_242',InputLinkIdx=2)),DrawY=3522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4328,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-4254,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=3456
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_244"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_245
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_243',InputLinkIdx=2)),DrawY=3554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5848,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5774,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=3488
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_245"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=3656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_243
   InputLinks(0)=(DrawY=3525,OverrideDelta=14)
   InputLinks(1)=(DrawY=3546,OverrideDelta=35)
   InputLinks(2)=(DrawY=3567,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3546,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245'),DrawX=-5570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=3488
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_243"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_244
   InputLinks(0)=(DrawY=3205,OverrideDelta=14)
   InputLinks(1)=(DrawY=3226,OverrideDelta=35)
   InputLinks(2)=(DrawY=3247,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3226,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=-5562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5600
   ObjPosY=3168
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_244"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_246
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_100'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_244',InputLinkIdx=2)),DrawY=3234,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5848,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-5774,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=3168
   ObjName="TriggerVolume_100 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_246"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_247
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_99'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_245',InputLinkIdx=2)),DrawY=3234,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6596,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-6522,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=3168
   ObjName="TriggerVolume_99 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_247"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_245
   InputLinks(0)=(DrawY=3205,OverrideDelta=14)
   InputLinks(1)=(DrawY=3226,OverrideDelta=35)
   InputLinks(2)=(DrawY=3247,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3226,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=3168
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_245"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_246
   InputLinks(0)=(DrawY=3525,OverrideDelta=14)
   InputLinks(1)=(DrawY=3546,OverrideDelta=35)
   InputLinks(2)=(DrawY=3567,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3546,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=3488
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_246"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=3656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_248
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_246',InputLinkIdx=2)),DrawY=3554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6592,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-6518,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=3488
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_248"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_249
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_247',InputLinkIdx=2)),DrawY=3522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3544,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3470,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3680
   ObjPosY=3456
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_249"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_247
   InputLinks(0)=(DrawY=3493,OverrideDelta=14)
   InputLinks(1)=(DrawY=3514,OverrideDelta=35)
   InputLinks(2)=(DrawY=3535,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3514,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249'),DrawX=-3274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=3456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_247"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_248
   InputLinks(0)=(DrawY=3173,OverrideDelta=14)
   InputLinks(1)=(DrawY=3194,OverrideDelta=35)
   InputLinks(2)=(DrawY=3215,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3194,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250'),DrawX=-3266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=3136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_248"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_250
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_103'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_248',InputLinkIdx=2)),DrawY=3202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3544,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-3470,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3680
   ObjPosY=3136
   ObjName="TriggerVolume_103 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_250"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_104'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=2)),DrawY=3202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2800,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2726,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2936
   ObjPosY=3136
   ObjName="TriggerVolume_104 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_0"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=3173,OverrideDelta=14)
   InputLinks(1)=(DrawY=3194,OverrideDelta=35)
   InputLinks(2)=(DrawY=3215,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3194,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-2514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=3136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=3493,OverrideDelta=14)
   InputLinks(1)=(DrawY=3514,OverrideDelta=35)
   InputLinks(2)=(DrawY=3535,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3514,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-2522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=3456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_2
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_145'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=340
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=2)),DrawY=3522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2800,OverrideDelta=104)
   VariableLinks(1)=(DrawX=-2726,OverrideDelta=184)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2936
   ObjPosY=3456
   ObjName="TriggerVolume_145 Take Damage"
   DrawWidth=190
   DrawHeight=144
   Name="SeqEvent_TakeDamage_2"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_252
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_250',InputLinkIdx=2)),DrawY=3530,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2044,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1970,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=3464
   ObjName="TriggerVolume_17 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_252"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=3632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_252"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_250
   InputLinks(0)=(DrawY=3501,OverrideDelta=14)
   InputLinks(1)=(DrawY=3522,OverrideDelta=35)
   InputLinks(2)=(DrawY=3543,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3522,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252'),DrawX=-1762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=3464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_250"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_249
   InputLinks(0)=(DrawY=3181,OverrideDelta=14)
   InputLinks(1)=(DrawY=3202,OverrideDelta=35)
   InputLinks(2)=(DrawY=3223,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3202,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251'),DrawX=-1754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=3144
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_249"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=Emitter'FX-BlackForest.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=3312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_251
   DamageThreshold=1.000000
   DamageTypes(0)=Class'KFGame.KFDT_Explosive'
   Originator=TriggerVolume'FX-BlackForest.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   ReTriggerDelay=0.100000
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=332
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_249',InputLinkIdx=2)),DrawY=3210,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2044,OverrideDelta=100)
   VariableLinks(1)=(DrawX=-1970,OverrideDelta=180)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=3144
   ObjName="TriggerVolume_18 Take Damage"
   DrawWidth=186
   DrawHeight=144
   Name="SeqEvent_TakeDamage_251"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object
