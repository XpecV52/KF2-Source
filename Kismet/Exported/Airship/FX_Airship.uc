Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=5852
   SizeY=3563
   bDrawBox=True
   FillColor=(B=226,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1360
   ObjPosY=3568
   ObjComment="Boiler Traps"
   DrawWidth=5852
   DrawHeight=3563
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_82
   SizeX=5991
   SizeY=1874
   bDrawBox=True
   FillColor=(B=255,G=100,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-7816
   ObjComment="Atmospheric Lightning"
   DrawWidth=5991
   DrawHeight=1874
   Name="SequenceFrame_82"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=5678
   SizeY=3259
   bDrawBox=True
   FillColor=(B=255,G=15,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=-56
   ObjComment="Water Trap"
   DrawWidth=5678
   DrawHeight=3259
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=4986
   SizeY=2974
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-2024
   ObjComment="Mini-ship Spawns and Effects"
   DrawWidth=4986
   DrawHeight=2974
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="Airship1"
   MaxWidth=168
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_77')),DrawY=-1518,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3060,OverrideDelta=52)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3144
   ObjPosY=-1584
   ObjComment="Airship1"
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_23
   EventName="Airship2"
   MaxWidth=168
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_78')),DrawY=26,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2980,OverrideDelta=52)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3064
   ObjPosY=-40
   ObjComment="Airship2"
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_23"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_20
   EventName="Airship4"
   MaxWidth=168
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_79')),DrawY=58,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-372,OverrideDelta=52)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-456
   ObjPosY=-8
   ObjComment="Airship4"
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_20"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_21
   EventName="Airship3"
   MaxWidth=168
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_76')),DrawY=-1414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-420,OverrideDelta=52)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=-1480
   ObjComment="Airship3"
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_21"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4360
   ObjPosY=-6496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Lightning12"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=-6582,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-4273,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-6648
   ObjComment="Lightning12"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_30
   EventName="Lightning11"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-6990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-4257,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-7056
   ObjComment="Lightning11"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_30"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4344
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-7328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5392
   ObjPosY=-7304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5408
   ObjPosY=-6976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5400
   ObjPosY=-6624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-6576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-6944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6376
   ObjPosY=-7304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7304
   ObjPosY=-6528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7312
   ObjPosY=-6936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7320
   ObjPosY=-7376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_24
   EventName="Lighting1"
   bClientSideOnly=True
   MaxWidth=287
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-7462,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=-7241,OverrideDelta=111)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-7528
   ObjComment="Lighting1"
   DrawWidth=163
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_24"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_26
   EventName="Lightning2"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-7022,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=-7229,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-7088
   ObjComment="Lightning2"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_26"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Lightning3"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),DrawX=-7221,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7368
   ObjPosY=-6672
   ObjComment="Lightning3"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="Lightning4"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=-7390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52'),DrawX=-6293,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-7456
   ObjComment="Lightning4"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Lightning5"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-7030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=-6285,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-7096
   ObjComment="Lightning5"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Lightning6"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-6654,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=-6277,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=-6720
   ObjComment="Lightning6"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="Lightning7"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-7390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-5309,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5456
   ObjPosY=-7456
   ObjComment="Lightning7"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="Lightning9"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=-6702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-5317,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5464
   ObjPosY=-6768
   ObjComment="Lightning9"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="Lightning8"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),DrawY=-7062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=-5325,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-7128
   ObjComment="Lightning8"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_27
   EventName="Lightning10"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-7414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-4257,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-7480
   ObjComment="Lightning10"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_27"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
   InputLinks(0)=(DrawY=373,OverrideDelta=14)
   InputLinks(1)=(DrawY=394,OverrideDelta=35)
   InputLinks(2)=(DrawY=415,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_13')),DrawY=394,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=2750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2801,OverrideDelta=76)
   EventLinks(0)=(DrawX=2850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2712
   ObjPosY=336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_63"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-3195,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3174,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3153,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=-3264
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=0.300000
   InputLinks(0)=(DrawY=-3307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3265,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1)),DrawY=-3302,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3270,OverrideDelta=51)
   VariableLinks(0)=(DrawX=5828,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5776
   ObjPosY=-3344
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=5842
   SizeY=8423
   bDrawBox=True
   FillColor=(B=0,G=89,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-2104
   ObjComment="Steam Vent Traps"
   DrawWidth=5842
   DrawHeight=8423
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-1363,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1342,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1321,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_11')),DrawY=-1342,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=-6066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6104
   ObjPosY=-1400
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
   InputLinks(0)=(DrawY=-1251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=-5402,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5351,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5302,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5440
   ObjPosY=-1288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_49"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_28
   SizeX=1423
   SizeY=713
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5168
   ObjPosY=-3464
   ObjComment="Coal Wheel"
   DrawWidth=1423
   DrawHeight=713
   Name="SequenceFrame_28"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_40
   Duration=10.000000
   InputLinks(0)=(DrawY=4277,OverrideDelta=14)
   InputLinks(1)=(DrawY=4298,OverrideDelta=35)
   InputLinks(2)=(DrawY=4319,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_54',InputLinkIdx=2)),DrawY=4282,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4314,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2100,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2048
   ObjPosY=4240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_40"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_34
   Duration=15.000000
   InputLinks(0)=(DrawY=4301,OverrideDelta=14)
   InputLinks(1)=(DrawY=4322,OverrideDelta=35)
   InputLinks(2)=(DrawY=4343,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_55',InputLinkIdx=1)),DrawY=4306,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4338,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2628,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=4264
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_34"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
   InputLinks(0)=(DrawY=4301,OverrideDelta=14)
   InputLinks(1)=(DrawY=4322,OverrideDelta=35)
   InputLinks(2)=(DrawY=4343,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4322,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=2838,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2889,OverrideDelta=76)
   EventLinks(0)=(DrawX=2938,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2800
   ObjPosY=4264
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_55"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
   InputLinks(0)=(DrawY=5325,OverrideDelta=14)
   InputLinks(1)=(DrawY=5346,OverrideDelta=35)
   InputLinks(2)=(DrawY=5367,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5346,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=3254,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3305,OverrideDelta=76)
   EventLinks(0)=(DrawX=3354,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=5288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_56"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_33
   Duration=15.000000
   InputLinks(0)=(DrawY=5341,OverrideDelta=14)
   InputLinks(1)=(DrawY=5362,OverrideDelta=35)
   InputLinks(2)=(DrawY=5383,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_56',InputLinkIdx=1)),DrawY=5346,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5378,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3068,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=5304
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_33"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
   InputLinks(0)=(DrawY=4306,OverrideDelta=35)
   InputLinks(1)=(DrawY=4327,OverrideDelta=56)
   InputLinks(2)=(DrawY=4285,OverrideDelta=14)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_34')),DrawY=4306,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=2342,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2393,OverrideDelta=76)
   EventLinks(0)=(DrawX=2442,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2304
   ObjPosY=4248
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_54"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_35
   Duration=10.000000
   InputLinks(0)=(DrawY=5261,OverrideDelta=14)
   InputLinks(1)=(DrawY=5282,OverrideDelta=35)
   InputLinks(2)=(DrawY=5303,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51')),DrawY=5266,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5298,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2460,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2408
   ObjPosY=5224
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_35"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
   InputLinks(0)=(DrawY=5325,OverrideDelta=14)
   InputLinks(1)=(DrawY=5346,OverrideDelta=35)
   InputLinks(2)=(DrawY=5367,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_33')),DrawY=5346,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=2702,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2753,OverrideDelta=76)
   EventLinks(0)=(DrawX=2802,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=5288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_51"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="Boiler1Ended"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_35'),(LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=5202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2100,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=5136
   ObjComment="Boiler1Ended"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_25
   EventName="Boiler2Ended"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_40'),(LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=4290,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1820,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1720
   ObjPosY=4224
   ObjComment="Boiler2Ended"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_25"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-1016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_11
   InputLinks(0)=(DrawY=-1195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1153,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49',InputLinkIdx=1)),DrawY=-1190,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1158,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5692,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-1232
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_11"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_13
   Duration=3.000000
   InputLinks(0)=(DrawY=405,OverrideDelta=14)
   InputLinks(1)=(DrawY=426,OverrideDelta=35)
   InputLinks(2)=(DrawY=447,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1)),DrawY=410,OverrideDelta=19)
   OutputLinks(1)=(DrawY=442,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3084,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=368
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_13"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=437,OverrideDelta=14)
   InputLinks(1)=(DrawY=458,OverrideDelta=35)
   InputLinks(2)=(DrawY=479,OverrideDelta=56)
   OutputLinks(0)=(DrawY=458,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=3334,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3385,OverrideDelta=76)
   EventLinks(0)=(DrawX=3434,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3296
   ObjPosY=400
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_31
   Duration=3.000000
   InputLinks(0)=(DrawY=-1491,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1470,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1449,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-1486,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1454,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6612,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6664
   ObjPosY=-1528
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_31"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6992
   ObjPosY=-1048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
   InputLinks(0)=(DrawY=-1307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1265,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_52')),DrawY=-1286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=-7714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-1344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_68"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_41
   EventName="SteamTrap1"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_68'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31')),DrawY=-1494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8030,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8128
   ObjPosY=-1560
   ObjComment="SteamTrap1"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_41"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
   InputLinks(0)=(DrawY=-1299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1257,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_53')),DrawY=-1278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=-7258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-1336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_69"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_52
   Duration=0.500000
   InputLinks(0)=(DrawY=-1291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1249,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_69',InputLinkIdx=1)),DrawY=-1286,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1254,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-1328
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_52"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_53
   Duration=0.500000
   InputLinks(0)=(DrawY=-1283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1241,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_71')),DrawY=-1278,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1246,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6964,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7016
   ObjPosY=-1320
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_53"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
   InputLinks(0)=(DrawY=-1275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=-6378,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6327,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6278,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-1312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_70"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
   InputLinks(0)=(DrawY=-1283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1241,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_54')),DrawY=-1262,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=-6802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-1320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_71"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_54
   Duration=0.500000
   InputLinks(0)=(DrawY=-1267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1225,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_70',InputLinkIdx=1)),DrawY=-1262,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1230,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6548,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-1304
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_54"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_55
   Duration=0.500000
   InputLinks(0)=(DrawY=21,OverrideDelta=14)
   InputLinks(1)=(DrawY=42,OverrideDelta=35)
   InputLinks(2)=(DrawY=63,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73',InputLinkIdx=1)),DrawY=26,OverrideDelta=19)
   OutputLinks(1)=(DrawY=58,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6492,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6544
   ObjPosY=-16
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_55"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
   InputLinks(0)=(DrawY=5,OverrideDelta=14)
   InputLinks(1)=(DrawY=26,OverrideDelta=35)
   InputLinks(2)=(DrawY=47,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_55')),DrawY=26,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-6746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-32
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_72"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-24
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_73"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_56
   Duration=0.500000
   InputLinks(0)=(DrawY=5,OverrideDelta=14)
   InputLinks(1)=(DrawY=26,OverrideDelta=35)
   InputLinks(2)=(DrawY=47,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72')),DrawY=10,OverrideDelta=19)
   OutputLinks(1)=(DrawY=42,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6908,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=-32
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_56"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_57
   Duration=0.500000
   InputLinks(0)=(DrawY=-3,OverrideDelta=14)
   InputLinks(1)=(DrawY=18,OverrideDelta=35)
   InputLinks(2)=(DrawY=39,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_74',InputLinkIdx=1)),DrawY=2,OverrideDelta=19)
   OutputLinks(1)=(DrawY=34,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7388,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=-40
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_57"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
   InputLinks(0)=(DrawY=-11,OverrideDelta=14)
   InputLinks(1)=(DrawY=10,OverrideDelta=35)
   InputLinks(2)=(DrawY=31,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_56')),DrawY=10,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-7202,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7151,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7102,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7240
   ObjPosY=-48
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_74"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_34
   EventName="SteamTrap2"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_58')),DrawY=-206,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7974,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-272
   ObjComment="SteamTrap2"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_34"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
   InputLinks(0)=(DrawY=-19,OverrideDelta=14)
   InputLinks(1)=(DrawY=2,OverrideDelta=35)
   InputLinks(2)=(DrawY=23,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_57')),DrawY=2,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-7658,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7607,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7558,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-56
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_75"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6936
   ObjPosY=232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_58
   Duration=3.000000
   InputLinks(0)=(DrawY=-203,OverrideDelta=14)
   InputLinks(1)=(DrawY=-182,OverrideDelta=35)
   InputLinks(2)=(DrawY=-161,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_77')),DrawY=-198,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-166,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6556,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_58"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_60
   InputLinks(0)=(DrawY=85,OverrideDelta=14)
   InputLinks(1)=(DrawY=106,OverrideDelta=35)
   InputLinks(2)=(DrawY=127,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76',InputLinkIdx=1)),DrawY=90,OverrideDelta=19)
   OutputLinks(1)=(DrawY=122,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5636,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5688
   ObjPosY=48
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_60"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=-5346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5295,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5384
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_76"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_77
   InputLinks(0)=(DrawY=-75,OverrideDelta=14)
   InputLinks(1)=(DrawY=-54,OverrideDelta=35)
   InputLinks(2)=(DrawY=-33,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_60')),DrawY=-54,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=-6010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6048
   ObjPosY=-112
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_77"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=1277,OverrideDelta=14)
   InputLinks(1)=(DrawY=1298,OverrideDelta=35)
   InputLinks(2)=(DrawY=1319,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_59')),DrawY=1298,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-5986,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5935,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5886,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=1240
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
   InputLinks(0)=(DrawY=1389,OverrideDelta=14)
   InputLinks(1)=(DrawY=1410,OverrideDelta=35)
   InputLinks(2)=(DrawY=1431,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-5322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5360
   ObjPosY=1352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5456
   ObjPosY=1624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_59
   InputLinks(0)=(DrawY=1445,OverrideDelta=14)
   InputLinks(1)=(DrawY=1466,OverrideDelta=35)
   InputLinks(2)=(DrawY=1487,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47',InputLinkIdx=1)),DrawY=1450,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1482,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5612,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=1408
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_59"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_62
   Duration=3.000000
   InputLinks(0)=(DrawY=1149,OverrideDelta=14)
   InputLinks(1)=(DrawY=1170,OverrideDelta=35)
   InputLinks(2)=(DrawY=1191,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46')),DrawY=1154,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1186,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6532,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=1112
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_62"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=1592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=1333,OverrideDelta=14)
   InputLinks(1)=(DrawY=1354,OverrideDelta=35)
   InputLinks(2)=(DrawY=1375,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_68')),DrawY=1354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=-7634,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7583,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7672
   ObjPosY=1296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="SteamTrap3"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_62')),DrawY=1146,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7950,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8048
   ObjPosY=1080
   ObjComment="SteamTrap3"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_52
   InputLinks(0)=(DrawY=1341,OverrideDelta=14)
   InputLinks(1)=(DrawY=1362,OverrideDelta=35)
   InputLinks(2)=(DrawY=1383,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_69')),DrawY=1362,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=-7178,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7127,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7078,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=1304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_52"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_68
   Duration=0.500000
   InputLinks(0)=(DrawY=1349,OverrideDelta=14)
   InputLinks(1)=(DrawY=1370,OverrideDelta=35)
   InputLinks(2)=(DrawY=1391,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_52',InputLinkIdx=1)),DrawY=1354,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1386,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7364,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=1312
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_68"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_69
   Duration=0.500000
   InputLinks(0)=(DrawY=1357,OverrideDelta=14)
   InputLinks(1)=(DrawY=1378,OverrideDelta=35)
   InputLinks(2)=(DrawY=1399,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57')),DrawY=1362,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1394,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6884,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6936
   ObjPosY=1320
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_69"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_53
   InputLinks(0)=(DrawY=1365,OverrideDelta=14)
   InputLinks(1)=(DrawY=1386,OverrideDelta=35)
   InputLinks(2)=(DrawY=1407,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1386,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=-6298,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6247,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6198,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=1328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_53"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
   InputLinks(0)=(DrawY=1357,OverrideDelta=14)
   InputLinks(1)=(DrawY=1378,OverrideDelta=35)
   InputLinks(2)=(DrawY=1399,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_70')),DrawY=1378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=-6722,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6671,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6622,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=1320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_57"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_70
   Duration=0.500000
   InputLinks(0)=(DrawY=1373,OverrideDelta=14)
   InputLinks(1)=(DrawY=1394,OverrideDelta=35)
   InputLinks(2)=(DrawY=1415,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_53',InputLinkIdx=1)),DrawY=1378,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1410,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6468,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=1336
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_70"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_71
   Duration=0.500000
   InputLinks(0)=(DrawY=2741,OverrideDelta=14)
   InputLinks(1)=(DrawY=2762,OverrideDelta=35)
   InputLinks(2)=(DrawY=2783,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_59',InputLinkIdx=1)),DrawY=2746,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2778,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6476,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6528
   ObjPosY=2704
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_71"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
   InputLinks(0)=(DrawY=2725,OverrideDelta=14)
   InputLinks(1)=(DrawY=2746,OverrideDelta=35)
   InputLinks(2)=(DrawY=2767,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_71')),DrawY=2746,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-6730,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6679,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6630,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=2688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_58"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_59
   InputLinks(0)=(DrawY=2733,OverrideDelta=14)
   InputLinks(1)=(DrawY=2754,OverrideDelta=35)
   InputLinks(2)=(DrawY=2775,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2754,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-6306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=2696
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_59"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_72
   Duration=0.500000
   InputLinks(0)=(DrawY=2725,OverrideDelta=14)
   InputLinks(1)=(DrawY=2746,OverrideDelta=35)
   InputLinks(2)=(DrawY=2767,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_58')),DrawY=2730,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2762,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6892,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=2688
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_72"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_73
   Duration=0.500000
   InputLinks(0)=(DrawY=2717,OverrideDelta=14)
   InputLinks(1)=(DrawY=2738,OverrideDelta=35)
   InputLinks(2)=(DrawY=2759,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_60',InputLinkIdx=1)),DrawY=2722,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2754,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7372,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7424
   ObjPosY=2680
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_73"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_60
   InputLinks(0)=(DrawY=2709,OverrideDelta=14)
   InputLinks(1)=(DrawY=2730,OverrideDelta=35)
   InputLinks(2)=(DrawY=2751,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_72')),DrawY=2730,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-7186,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7135,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7086,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=2672
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_60"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="SteamTrap4"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_61'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_74')),DrawY=2514,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7958,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8056
   ObjPosY=2448
   ObjComment="SteamTrap4"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
   InputLinks(0)=(DrawY=2701,OverrideDelta=14)
   InputLinks(1)=(DrawY=2722,OverrideDelta=35)
   InputLinks(2)=(DrawY=2743,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_73')),DrawY=2722,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-7642,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7591,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7542,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7680
   ObjPosY=2664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_61"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=2960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_74
   Duration=3.000000
   InputLinks(0)=(DrawY=2517,OverrideDelta=14)
   InputLinks(1)=(DrawY=2538,OverrideDelta=35)
   InputLinks(2)=(DrawY=2559,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_93')),DrawY=2522,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2554,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6540,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=2480
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_74"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_75
   InputLinks(0)=(DrawY=2813,OverrideDelta=14)
   InputLinks(1)=(DrawY=2834,OverrideDelta=35)
   InputLinks(2)=(DrawY=2855,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_62',InputLinkIdx=1)),DrawY=2818,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2850,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5620,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=2776
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_75"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5464
   ObjPosY=2992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
   InputLinks(0)=(DrawY=2757,OverrideDelta=14)
   InputLinks(1)=(DrawY=2778,OverrideDelta=35)
   InputLinks(2)=(DrawY=2799,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2778,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),DrawX=-5330,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5279,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5230,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5368
   ObjPosY=2720
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_62"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_93
   InputLinks(0)=(DrawY=2645,OverrideDelta=14)
   InputLinks(1)=(DrawY=2666,OverrideDelta=35)
   InputLinks(2)=(DrawY=2687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_75')),DrawY=2666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),DrawX=-5994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=2608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_93"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=10586
   SizeY=3098
   bDrawBox=True
   FillColor=(B=0,G=255,R=28,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9056
   ObjPosY=-5440
   ObjComment="Electricity Dome"
   DrawWidth=10586
   DrawHeight=3098
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_89
   InputLinks(0)=(DrawY=-5003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4961,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_96',InputLinkIdx=1)),DrawY=-4982,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270'),DrawX=-5434,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5383,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5334,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-5040
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_89"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_60
   EventName="Charge1"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_89')),DrawY=-4982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5659,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-5048
   ObjComment="Charge1"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_60"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_45
   EventName="Charge2"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_100')),DrawY=-4646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5675,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5760
   ObjPosY=-4712
   ObjComment="Charge2"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_45"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_40
   EventName="Charge3"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_101')),DrawY=-4238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5667,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-4304
   ObjComment="Charge3"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_40"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_100
   InputLinks(0)=(DrawY=-4651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4609,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_97',InputLinkIdx=1)),DrawY=-4630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268'),DrawX=-5450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5488
   ObjPosY=-4688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_100"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_101
   InputLinks(0)=(DrawY=-4267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269'),DrawX=-5482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5520
   ObjPosY=-4304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_101"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_55
   EventName="LightningCharge"
   MaxWidth=222
   OutputLinks(0)=(DrawY=-4830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7193,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7304
   ObjPosY=-4896
   ObjComment="LightningCharge"
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_55"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=1384
   SizeY=1680
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-5320
   ObjComment="Random Lightning Charging"
   DrawWidth=1384
   DrawHeight=1680
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=2745
   SizeY=2392
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7512
   ObjPosY=-5304
   ObjComment="Set Charge Level"
   DrawWidth=2745
   DrawHeight=2392
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_105
   InputLinks(0)=(DrawY=-3675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3633,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28')),DrawY=-3654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-2226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2264
   ObjPosY=-3712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_105"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=-3667,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3646,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3625,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3646,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-1770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=-3704
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_28
   Duration=25.000000
   InputLinks(0)=(DrawY=-3675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3633,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40',InputLinkIdx=1)),DrawY=-3670,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3638,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1992
   ObjPosY=-3712
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_28"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_61
   EventName="Charge0"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_102',InputLinkIdx=1)),DrawY=-4766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6419,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-4832
   ObjComment="Charge0"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_61"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_269
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5512
   ObjPosY=-4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_269"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_268
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-4520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_268"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_270
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5464
   ObjPosY=-4880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_270"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-3219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3177,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=-3198,OverrideDelta=35)
   VariableLinks(0)=(DrawX=5502,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5553,OverrideDelta=76)
   EventLinks(0)=(DrawX=5602,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5464
   ObjPosY=-3256
   ObjComment="Coal Emitter"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-3315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3273,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_67')),DrawY=-3294,OverrideDelta=35)
   VariableLinks(0)=(DrawX=6014,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6065,OverrideDelta=76)
   EventLinks(0)=(DrawX=6114,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5976
   ObjPosY=-3352
   ObjComment="Coal Emitter"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_67
   Duration=0.300000
   InputLinks(0)=(DrawY=-3059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3017,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-3054,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3022,OverrideDelta=51)
   VariableLinks(0)=(DrawX=6348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6296
   ObjPosY=-3096
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_67"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-1912
   ObjComment="SteamTrap1"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=-624
   ObjComment="SteamTrap2"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_46
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=720
   ObjComment="SteamTrap3"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_46"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_47
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8848
   ObjPosY=2056
   ObjComment="SteamTrap4"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_47"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_35
   SizeX=4405
   SizeY=2815
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3056
   ObjPosY=-5224
   ObjComment="Firing Lightning"
   DrawWidth=4405
   DrawHeight=2815
   Name="SequenceFrame_35"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_44
   EventName="StartBoilers"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_40'),(LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=3898,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1792,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1696
   ObjPosY=3832
   ObjComment="StartBoilers"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_44"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_45
   SizeX=3559
   SizeY=967
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1584
   ObjPosY=4904
   ObjComment="Boiler 2"
   DrawWidth=3559
   DrawHeight=967
   Name="SequenceFrame_45"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_38
   SizeX=3559
   SizeY=967
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1544
   ObjPosY=3760
   ObjComment="Boiler 1"
   DrawWidth=3559
   DrawHeight=967
   Name="SequenceFrame_38"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_64
   EventName="WaterTrapActivated"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=378,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2285,OverrideDelta=93)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2160
   ObjPosY=312
   ObjComment="WaterTrapActivated"
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_64"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=2.500000
   InputLinks(0)=(DrawY=357,OverrideDelta=14)
   InputLinks(1)=(DrawY=378,OverrideDelta=35)
   InputLinks(2)=(DrawY=399,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_63')),DrawY=362,OverrideDelta=19)
   OutputLinks(1)=(DrawY=394,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2556,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2504
   ObjPosY=320
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2096
   ObjPosY=-3488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1992
   ObjPosY=-3488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-3488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=-3488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-4843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_39')),DrawY=-4822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-1010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1048
   ObjPosY=-4880
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_66
   EventName="LightningFired"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=-4526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2824,OverrideDelta=72)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-4592
   ObjComment="LightningFired"
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_66"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1320
   ObjPosY=-4536
   ObjComment="Charge Constant"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_5
   InputLinks(0)=(DrawY=-5054,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-5076,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86')),DrawY=-5054,OverrideDelta=59)
   OutputLinks(2)=(DrawY=-5032,OverrideDelta=81)
   OutputLinks(3)=(DrawY=-5010,OverrideDelta=103)
   OutputLinks(4)=(DrawY=-5098,OverrideDelta=15)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36'),DrawX=-4191,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_8'),DrawX=-4166,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4224
   ObjPosY=-5136
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_5"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-4936
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4176
   ObjPosY=-4936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_8"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=1329
   SizeY=1913
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4568
   ObjPosY=-5240
   ObjComment="Lever Pulled"
   DrawWidth=1329
   DrawHeight=1913
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=801
   SizeY=460
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-3776
   ObjComment="Mini-Ships Electrocuted"
   DrawWidth=801
   DrawHeight=460
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=2452
   SizeY=598
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-4984
   ObjComment="Lightning Gun"
   DrawWidth=2452
   DrawHeight=598
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_76
   EventName="Lever1Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_5')),DrawY=-5046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4400,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-5112
   ObjComment="Lever1Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_76"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_77
   EventName="Lever2Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_6')),DrawY=-4606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4408,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4504
   ObjPosY=-4672
   ObjComment="Lever2Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_77"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_78
   EventName="Lever3Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_7')),DrawY=-4158,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4368,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=-4224
   ObjComment="Lever3Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_78"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_79
   EventName="Lever4Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_4')),DrawY=-3662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4384,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-3728
   ObjComment="Lever4Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_79"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4176
   ObjPosY=-4496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_9"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-4496
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_37"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_6
   InputLinks(0)=(DrawY=-4614,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-4636,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_90')),DrawY=-4614,OverrideDelta=59)
   OutputLinks(2)=(DrawY=-4592,OverrideDelta=81)
   OutputLinks(3)=(DrawY=-4570,OverrideDelta=103)
   OutputLinks(4)=(DrawY=-4658,OverrideDelta=15)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_37'),DrawX=-4191,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_9'),DrawX=-4166,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4224
   ObjPosY=-4696
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_6"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_7
   InputLinks(0)=(DrawY=-4158,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-4180,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_91')),DrawY=-4158,OverrideDelta=59)
   OutputLinks(2)=(DrawY=-4136,OverrideDelta=81)
   OutputLinks(3)=(DrawY=-4114,OverrideDelta=103)
   OutputLinks(4)=(DrawY=-4202,OverrideDelta=15)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_38'),DrawX=-4151,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_10'),DrawX=-4126,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-4240
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_7"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4224
   ObjPosY=-4040
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_38"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4136
   ObjPosY=-4040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_10"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4144
   ObjPosY=-3552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_7"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4224
   ObjPosY=-3552
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_4
   InputLinks(0)=(DrawY=-3670,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-3692,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84')),DrawY=-3670,OverrideDelta=59)
   OutputLinks(2)=(DrawY=-3648,OverrideDelta=81)
   OutputLinks(3)=(DrawY=-3626,OverrideDelta=103)
   OutputLinks(4)=(DrawY=-3714,OverrideDelta=15)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35'),DrawX=-4159,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_7'),DrawX=-4134,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=-3752
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_4"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
   InputLinks(0)=(DrawY=-5051,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5030,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5009,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_14')),DrawY=-5030,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244'),DrawX=-3938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-5088
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_86"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_87
   InputLinks(0)=(DrawY=-5035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5014,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4993,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5014,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244'),DrawX=-3474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3512
   ObjPosY=-5072
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_87"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_14
   Duration=2.000000
   InputLinks(0)=(DrawY=-5035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5014,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4993,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_87',InputLinkIdx=1)),DrawY=-5030,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4998,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3652,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-5072
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_14"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3752
   ObjPosY=-4872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3736
   ObjPosY=-4464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_15
   Duration=2.000000
   InputLinks(0)=(DrawY=-4627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4585,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_88',InputLinkIdx=1)),DrawY=-4622,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4590,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3636,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=-4664
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_15"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_88
   InputLinks(0)=(DrawY=-4627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4585,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245'),DrawX=-3458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3496
   ObjPosY=-4664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_88"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_90
   InputLinks(0)=(DrawY=-4643,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4601,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_15')),DrawY=-4622,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245'),DrawX=-3922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-4680
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_90"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_91
   InputLinks(0)=(DrawY=-4187,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4166,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4145,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20')),DrawY=-4166,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=-3938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-4224
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_91"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
   InputLinks(0)=(DrawY=-4171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4129,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4150,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=-3474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3512
   ObjPosY=-4208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_92"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_20
   Duration=2.000000
   InputLinks(0)=(DrawY=-4171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4129,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92',InputLinkIdx=1)),DrawY=-4166,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4134,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3652,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-4208
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_20"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3752
   ObjPosY=-4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=-3512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_12
   Duration=2.000000
   InputLinks(0)=(DrawY=-3667,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3646,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3625,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85',InputLinkIdx=1)),DrawY=-3662,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3630,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3660,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3712
   ObjPosY=-3704
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_12"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
   InputLinks(0)=(DrawY=-3667,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3646,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3625,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3646,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243'),DrawX=-3482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3520
   ObjPosY=-3704
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_85"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
   InputLinks(0)=(DrawY=-3683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3641,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_12')),DrawY=-3662,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243'),DrawX=-3946,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3895,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3846,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-3720
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_84"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_96
   InputLinks(0)=(DrawY=-5003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4961,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4982,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272'),DrawX=-5154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-5040
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_96"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_271
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=-4880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_271"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_272
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5120
   ObjPosY=-4872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_272"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_97
   InputLinks(0)=(DrawY=-4643,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4601,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4622,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267'),DrawX=-5146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5184
   ObjPosY=-4680
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_97"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_267
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-4496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_267"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_574
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6112
   ObjPosY=-4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_574"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_575
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6200
   ObjPosY=-4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_575"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_576
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6288
   ObjPosY=-4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_576"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_102
   InputLinks(0)=(DrawY=-4795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_576',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_575',SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_574'),DrawX=-6162,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6111,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6062,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6200
   ObjPosY=-4832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_102"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=4856
   ObjComment="SteamTrap6"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=3520
   ObjComment="SteamTrap5"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=5445,OverrideDelta=14)
   InputLinks(1)=(DrawY=5466,OverrideDelta=35)
   InputLinks(2)=(DrawY=5487,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_43')),DrawY=5466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-5866,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5815,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5766,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5904
   ObjPosY=5408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
   InputLinks(0)=(DrawY=5557,OverrideDelta=14)
   InputLinks(1)=(DrawY=5578,OverrideDelta=35)
   InputLinks(2)=(DrawY=5599,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5578,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-5202,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5151,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5102,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=5520
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_50"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5336
   ObjPosY=5792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_43
   InputLinks(0)=(DrawY=5613,OverrideDelta=14)
   InputLinks(1)=(DrawY=5634,OverrideDelta=35)
   InputLinks(2)=(DrawY=5655,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=5618,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5650,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5492,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=5576
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_43"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_32
   Duration=3.000000
   InputLinks(0)=(DrawY=5317,OverrideDelta=14)
   InputLinks(1)=(DrawY=5338,OverrideDelta=35)
   InputLinks(2)=(DrawY=5359,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=5322,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5354,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6412,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=5280
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_32"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=5760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
   InputLinks(0)=(DrawY=5501,OverrideDelta=14)
   InputLinks(1)=(DrawY=5522,OverrideDelta=35)
   InputLinks(2)=(DrawY=5543,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_50')),DrawY=5522,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-7514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7552
   ObjPosY=5464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_66"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_35
   EventName="SteamTrap6"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_32')),DrawY=5314,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7830,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=5248
   ObjComment="SteamTrap6"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_35"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
   InputLinks(0)=(DrawY=5509,OverrideDelta=14)
   InputLinks(1)=(DrawY=5530,OverrideDelta=35)
   InputLinks(2)=(DrawY=5551,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_51')),DrawY=5530,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-7058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=5472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_67"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_50
   Duration=0.500000
   InputLinks(0)=(DrawY=5517,OverrideDelta=14)
   InputLinks(1)=(DrawY=5538,OverrideDelta=35)
   InputLinks(2)=(DrawY=5559,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_67',InputLinkIdx=1)),DrawY=5522,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5554,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=5480
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_50"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_51
   Duration=0.500000
   InputLinks(0)=(DrawY=5525,OverrideDelta=14)
   InputLinks(1)=(DrawY=5546,OverrideDelta=35)
   InputLinks(2)=(DrawY=5567,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65')),DrawY=5530,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5562,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6764,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=5488
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_51"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
   InputLinks(0)=(DrawY=5533,OverrideDelta=14)
   InputLinks(1)=(DrawY=5554,OverrideDelta=35)
   InputLinks(2)=(DrawY=5575,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-6178,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6127,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6078,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=5496
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_64"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
   InputLinks(0)=(DrawY=5525,OverrideDelta=14)
   InputLinks(1)=(DrawY=5546,OverrideDelta=35)
   InputLinks(2)=(DrawY=5567,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_49')),DrawY=5546,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-6602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6640
   ObjPosY=5488
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_65"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_49
   Duration=0.500000
   InputLinks(0)=(DrawY=5541,OverrideDelta=14)
   InputLinks(1)=(DrawY=5562,OverrideDelta=35)
   InputLinks(2)=(DrawY=5583,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_64',InputLinkIdx=1)),DrawY=5546,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5578,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6400
   ObjPosY=5504
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_49"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_66
   Duration=0.500000
   InputLinks(0)=(DrawY=4173,OverrideDelta=14)
   InputLinks(1)=(DrawY=4194,OverrideDelta=35)
   InputLinks(2)=(DrawY=4215,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_82',InputLinkIdx=1)),DrawY=4178,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4210,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6340,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6392
   ObjPosY=4136
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_66"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_83
   InputLinks(0)=(DrawY=4157,OverrideDelta=14)
   InputLinks(1)=(DrawY=4178,OverrideDelta=35)
   InputLinks(2)=(DrawY=4199,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_66')),DrawY=4178,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181'),DrawX=-6594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6632
   ObjPosY=4120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_83"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
   InputLinks(0)=(DrawY=4165,OverrideDelta=14)
   InputLinks(1)=(DrawY=4186,OverrideDelta=35)
   InputLinks(2)=(DrawY=4207,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4186,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181'),DrawX=-6170,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6119,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6070,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6208
   ObjPosY=4128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_82"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_65
   Duration=0.500000
   InputLinks(0)=(DrawY=4157,OverrideDelta=14)
   InputLinks(1)=(DrawY=4178,OverrideDelta=35)
   InputLinks(2)=(DrawY=4199,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_83')),DrawY=4162,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4194,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6756,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=4120
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_65"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_64
   Duration=0.500000
   InputLinks(0)=(DrawY=4149,OverrideDelta=14)
   InputLinks(1)=(DrawY=4170,OverrideDelta=35)
   InputLinks(2)=(DrawY=4191,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81',InputLinkIdx=1)),DrawY=4154,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4186,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7236,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7288
   ObjPosY=4112
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_64"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
   InputLinks(0)=(DrawY=4141,OverrideDelta=14)
   InputLinks(1)=(DrawY=4162,OverrideDelta=35)
   InputLinks(2)=(DrawY=4183,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_65')),DrawY=4162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181'),DrawX=-7050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=4104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_81"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_36
   EventName="SteamTrap5"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80'),(LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_63')),DrawY=3946,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7822,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=3880
   ObjComment="SteamTrap5"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_36"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
   InputLinks(0)=(DrawY=4133,OverrideDelta=14)
   InputLinks(1)=(DrawY=4154,OverrideDelta=35)
   InputLinks(2)=(DrawY=4175,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_64')),DrawY=4154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181'),DrawX=-7506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7544
   ObjPosY=4096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_80"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=4392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_63
   Duration=3.000000
   InputLinks(0)=(DrawY=3949,OverrideDelta=14)
   InputLinks(1)=(DrawY=3970,OverrideDelta=35)
   InputLinks(2)=(DrawY=3991,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_78')),DrawY=3954,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3986,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6404,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=3912
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_63"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_61
   InputLinks(0)=(DrawY=4245,OverrideDelta=14)
   InputLinks(1)=(DrawY=4266,OverrideDelta=35)
   InputLinks(2)=(DrawY=4287,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_79',InputLinkIdx=1)),DrawY=4250,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4282,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5484,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=4208
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_61"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5328
   ObjPosY=4424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_79
   InputLinks(0)=(DrawY=4189,OverrideDelta=14)
   InputLinks(1)=(DrawY=4210,OverrideDelta=35)
   InputLinks(2)=(DrawY=4231,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4210,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179'),DrawX=-5194,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5143,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5094,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5232
   ObjPosY=4152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_79"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_78
   InputLinks(0)=(DrawY=4077,OverrideDelta=14)
   InputLinks(1)=(DrawY=4098,OverrideDelta=35)
   InputLinks(2)=(DrawY=4119,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_61')),DrawY=4098,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179'),DrawX=-5858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5896
   ObjPosY=4040
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_78"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_2
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1)),DrawY=-4860,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1)),DrawY=-4840,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-1349,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1288,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-1207,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=-4928
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_2"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_107
   EventName="Airship4BayDoorsOpen"
   MaxWidth=263
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=75,OverrideDelta=99)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-56
   ObjPosY=-416
   ObjComment="Airship4BayDoorsOpen"
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_107"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_106
   EventName="Airship3BayDoorsOpen"
   MaxWidth=263
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-1718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=43,OverrideDelta=99)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-1784
   ObjComment="Airship3BayDoorsOpen"
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_106"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_105
   EventName="Airship2BayDoorsOpen"
   MaxWidth=263
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2629,OverrideDelta=99)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-424
   ObjComment="Airship2BayDoorsOpen"
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_105"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_104
   EventName="Airship1BayDoorsOpen"
   MaxWidth=263
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-1750,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2637,OverrideDelta=99)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2768
   ObjPosY=-1816
   ObjComment="Airship1BayDoorsOpen"
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_104"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-1779,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1758,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1737,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1758,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247'),DrawX=-2362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2400
   ObjPosY=-1816
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-387,OverrideDelta=14)
   InputLinks(1)=(DrawY=-366,OverrideDelta=35)
   InputLinks(2)=(DrawY=-345,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-366,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249'),DrawX=-2378,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2327,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2278,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2416
   ObjPosY=-424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-1731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250'),DrawX=278,OverrideDelta=16)
   VariableLinks(1)=(DrawX=329,OverrideDelta=76)
   EventLinks(0)=(DrawX=378,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=-1768
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-387,OverrideDelta=14)
   InputLinks(1)=(DrawY=-366,OverrideDelta=35)
   InputLinks(2)=(DrawY=-345,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-366,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248'),DrawX=302,OverrideDelta=16)
   VariableLinks(1)=(DrawX=353,OverrideDelta=76)
   EventLinks(0)=(DrawX=402,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=264
   ObjPosY=-424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_48
   SizeX=1940
   SizeY=1122
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-576
   ObjComment="Mini-ship 2"
   DrawWidth=1940
   DrawHeight=1122
   Name="SequenceFrame_48"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=1959
   SizeY=1102
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-560
   ObjPosY=-520
   ObjComment="Mini-ship 4"
   DrawWidth=1959
   DrawHeight=1102
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_50
   SizeX=1942
   SizeY=966
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-560
   ObjPosY=-1872
   ObjComment="Mini-ship 3"
   DrawWidth=1942
   DrawHeight=966
   Name="SequenceFrame_50"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_49
   SizeX=1907
   SizeY=955
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3192
   ObjPosY=-1920
   ObjComment="Mini-ship 1"
   DrawWidth=1907
   DrawHeight=955
   Name="SequenceFrame_49"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-1680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=-272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2416
   ObjPosY=-264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=-1616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="LightningGunOff"
   MaxWidth=221
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_39')),DrawY=-4542,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-986,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1096
   ObjPosY=-4608
   ObjComment="LightningGunOff"
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=4456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=3981,OverrideDelta=14)
   InputLinks(1)=(DrawY=4002,OverrideDelta=35)
   InputLinks(2)=(DrawY=4023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=4002,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=2374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2479,OverrideDelta=130)
   EventLinks(0)=(DrawX=2431,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=3944
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=25.000000
   InputLinks(0)=(DrawY=3981,OverrideDelta=14)
   InputLinks(1)=(DrawY=4002,OverrideDelta=35)
   InputLinks(2)=(DrawY=4023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10',InputLinkIdx=1)),DrawY=3986,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4018,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2660,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2608
   ObjPosY=3944
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=3989,OverrideDelta=14)
   InputLinks(1)=(DrawY=4010,OverrideDelta=35)
   InputLinks(2)=(DrawY=4031,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4010,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=2854,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2905,OverrideDelta=76)
   EventLinks(0)=(DrawX=2954,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=3952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=5045,OverrideDelta=14)
   InputLinks(1)=(DrawY=5066,OverrideDelta=35)
   InputLinks(2)=(DrawY=5087,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5066,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=3206,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3257,OverrideDelta=76)
   EventLinks(0)=(DrawX=3306,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3168
   ObjPosY=5008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=25.000000
   InputLinks(0)=(DrawY=5037,OverrideDelta=14)
   InputLinks(1)=(DrawY=5058,OverrideDelta=35)
   InputLinks(2)=(DrawY=5079,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=1)),DrawY=5042,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5074,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3012,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=5000
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=5037,OverrideDelta=14)
   InputLinks(1)=(DrawY=5058,OverrideDelta=35)
   InputLinks(2)=(DrawY=5079,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=5058,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=2726,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2831,OverrideDelta=130)
   EventLinks(0)=(DrawX=2783,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=5000
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_85'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=5160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=5528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_108
   EventName="CoalWheelMove"
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-2974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5558,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5448
   ObjPosY=-3040
   ObjComment="CoalWheelMove"
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_108"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-2995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=5814,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5865,OverrideDelta=76)
   EventLinks(0)=(DrawX=5914,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5776
   ObjPosY=-3032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=-2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-4243,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4222,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4201,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4222,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-2258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2296
   ObjPosY=-4280
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2296
   ObjPosY=-4104
   ObjComment="EMP Blast"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=457
   SizeY=382
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=-4336
   ObjComment="EMP Blast"
   DrawWidth=457
   DrawHeight=382
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-7491,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7470,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7449,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7470,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-6938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6976
   ObjPosY=-7528
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6968
   ObjPosY=-7368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-6995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-6874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-7032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-6587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-6810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-6624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-6595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6553,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=-5882,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5831,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5782,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-6632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-6995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=-5914,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5863,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5814,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=-7032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-7403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-5906,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5855,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5806,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-7440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-7347,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7326,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7305,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7326,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-4890,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4839,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4790,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4928
   ObjPosY=-7384
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-6963,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6942,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6921,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6942,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=-4874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4912
   ObjPosY=-7000
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-6595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6553,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-4770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4808
   ObjPosY=-6632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-6523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-3818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3856
   ObjPosY=-6560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-6955,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6934,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6913,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6934,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=-3882,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3831,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3782,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3920
   ObjPosY=-6992
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-7403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-3810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3848
   ObjPosY=-7440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6904
   ObjPosY=-6880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-6448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-6856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5912
   ObjPosY=-6464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4920
   ObjPosY=-7216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4904
   ObjPosY=-6832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-6448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3832
   ObjPosY=-7264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFEmitter'FX_Airship.TheWorld:PersistentLevel.KFEmitter_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3840
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_86'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_87'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3448
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3544
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3648
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3744
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3848
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3944
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4048
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-1531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1489,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274'),DrawX=-2642,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2591,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2542,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2680
   ObjPosY=-1568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_274
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2672
   ObjPosY=-1416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_274"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_77
   Duration=3.000000
   InputLinks(0)=(DrawY=-1523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1481,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29')),DrawY=-1518,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1486,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2828,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-1560
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_77"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_78
   Duration=3.000000
   InputLinks(0)=(DrawY=21,OverrideDelta=14)
   InputLinks(1)=(DrawY=42,OverrideDelta=35)
   InputLinks(2)=(DrawY=63,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=26,OverrideDelta=19)
   OutputLinks(1)=(DrawY=58,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2708,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-16
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_78"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_275
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_275"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_275'),DrawX=-2522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-24
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276'),DrawX=30,OverrideDelta=16)
   VariableLinks(1)=(DrawX=81,OverrideDelta=76)
   EventLinks(0)=(DrawX=130,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_276
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_276"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_79
   Duration=5.000000
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32')),DrawY=42,OverrideDelta=19)
   OutputLinks(1)=(DrawY=74,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-156,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-208
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_79"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_76
   Duration=5.000000
   InputLinks(0)=(DrawY=-1419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1377,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=-1414,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1382,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-188,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-240
   ObjPosY=-1456
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_76"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_273
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-32
   ObjPosY=-1312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_273"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-1427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273'),DrawX=-2,OverrideDelta=16)
   VariableLinks(1)=(DrawX=49,OverrideDelta=76)
   EventLinks(0)=(DrawX=98,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-40
   ObjPosY=-1464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=Emitter'FX_Airship.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-512
   ObjPosY=-4568
   ObjComment="Charge End"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   InputLinks(0)=(DrawY=-4875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4833,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33')),DrawY=-4870,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4838,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1892,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1944
   ObjPosY=-4912
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=-4883,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4862,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4841,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4862,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-1690,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1639,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1590,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=-4920
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-4691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-520
   ObjPosY=-4728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-4643,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4601,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4622,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-1842,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1791,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1742,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1880
   ObjPosY=-4680
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_39
   InputLinks(0)=(DrawY=-4666,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34')),DrawY=-4676,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4656,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_96'),DrawX=-747,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_63'),DrawX=-697,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-776
   ObjPosY=-4712
   ObjComment="LightningActive?"
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_39"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_96
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="LightningActivated"
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-800
   ObjPosY=-4584
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_96"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_63
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-4584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_63"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_95
   EventName="LightningGunOff"
   MaxWidth=221
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36',InputLinkIdx=1)),ActivateDelay=0.200000,DrawY=-4622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2050,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-4688
   ObjComment="LightningGunOff"
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_95"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   InputLinks(0)=(DrawY=-4267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4225,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=-4262,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4230,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-4304
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object
