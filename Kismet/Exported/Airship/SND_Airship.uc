Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=1578
   SizeY=1030
   bDrawBox=True
   FillColor=(B=255,G=15,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2168
   ObjPosY=464
   ObjComment="Water Trap"
   DrawWidth=1578
   DrawHeight=1030
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=5172
   SizeY=8583
   bDrawBox=True
   FillColor=(B=0,G=89,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-1568
   ObjComment="Steam Vent Traps"
   DrawWidth=5172
   DrawHeight=8583
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=10586
   SizeY=3098
   bDrawBox=True
   FillColor=(B=0,G=255,R=28,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-4920
   ObjComment="Electricity Dome"
   DrawWidth=10586
   DrawHeight=3098
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_164
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-4454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8304,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-4488
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_164"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_61
   EventName="Charge0"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),ActivateDelay=0.100000,DrawY=-3918,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5851,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5936
   ObjPosY=-3984
   ObjComment="Charge0"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_61"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_49
   EventName="ArmPosition2Ended"
   MaxWidth=241
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),ActivateDelay=0.100000,DrawY=-6190,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2232,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=-6256
   ObjComment="ArmPosition2Ended"
   DrawWidth=140
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_49"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_50
   EventName="ArmPosition1Ended"
   MaxWidth=241
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20')),ActivateDelay=0.100000,DrawY=-6494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2208,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2088
   ObjPosY=-6560
   ObjComment="ArmPosition1Ended"
   DrawWidth=140
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_50"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_51
   EventName="ArmPosition3Ended"
   MaxWidth=241
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),ActivateDelay=0.100000,DrawY=-5894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2240,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2120
   ObjPosY=-5960
   ObjComment="ArmPosition3Ended"
   DrawWidth=140
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_51"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_52
   EventName="ArmPosition4Ended"
   MaxWidth=241
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),ActivateDelay=0.100000,DrawY=-5598,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2264,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=-5664
   ObjComment="ArmPosition4Ended"
   DrawWidth=140
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_52"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_59
   EventName="ArmPosition4"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28')),ActivateDelay=0.100000,DrawY=-5598,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1020,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=920
   ObjPosY=-5664
   ObjComment="ArmPosition4"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_59"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_58
   EventName="ArmPosition3"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24')),ActivateDelay=0.100000,DrawY=-5910,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1036,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=-5976
   ObjComment="ArmPosition3"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_58"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="ArmPosition1"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25')),ActivateDelay=0.100000,DrawY=-6526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1012,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=-6592
   ObjComment="ArmPosition1"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_56
   EventName="ArmPosition2"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_27')),ActivateDelay=0.100000,DrawY=-6206,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1028,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=-6272
   ObjComment="ArmPosition2"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_56"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=2745
   SizeY=2392
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-4784
   ObjComment="Set Charge Level"
   DrawWidth=2745
   DrawHeight=2392
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=4164
   SizeY=2780
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3064
   ObjPosY=-4712
   ObjComment="Firing Lightning"
   DrawWidth=4164
   DrawHeight=2780
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=1384
   SizeY=1680
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-4800
   ObjComment="Random Lightning Charging"
   DrawWidth=1384
   DrawHeight=1680
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_55
   EventName="LightningCharge"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_164')),ActivateDelay=0.100000,DrawY=-4446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8601,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-4512
   ObjComment="LightningCharge"
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_55"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_40
   EventName="Charge3"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_54')),DrawY=-4134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6227,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=-4200
   ObjComment="Charge3"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_40"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_45
   EventName="Charge2"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_54')),DrawY=-4318,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6219,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-4384
   ObjComment="Charge2"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_45"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_60
   EventName="Charge1"
   MaxWidth=171
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_54')),DrawY=-4486,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6219,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-4552
   ObjComment="Charge1"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_60"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_43
   SizeX=1698
   SizeY=827
   bDrawBox=True
   FillColor=(B=0,G=255,R=251,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2216
   ObjPosY=-4144
   ObjComment="Fog Horn"
   DrawWidth=1698
   DrawHeight=827
   Name="SequenceFrame_43"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=1784
   SizeY=1042
   bDrawBox=True
   FillColor=(B=0,G=255,R=251,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2168
   ObjPosY=-3096
   ObjComment="Fog Lights"
   DrawWidth=1784
   DrawHeight=1042
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=3584
   SizeY=1691
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-416
   ObjPosY=-6728
   ObjComment="Electricity Dome Rotating Arm"
   DrawWidth=3584
   DrawHeight=1691
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Long'
   InputLinks(0)=(DrawY=3002,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3002,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=-7280,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7328
   ObjPosY=2968
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Short'
   InputLinks(0)=(DrawY=3090,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3090,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=-7488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=3056
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_31"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_56
   Duration=3.000000
   InputLinks(0)=(DrawY=2869,OverrideDelta=14)
   InputLinks(1)=(DrawY=2890,OverrideDelta=35)
   InputLinks(2)=(DrawY=2911,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29')),DrawY=2874,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2906,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7484,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=2832
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_56"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="SteamTrap4"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_31'),(LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_56')),ActivateDelay=0.100000,DrawY=3042,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7830,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=2976
   ObjComment="SteamTrap4"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="SteamTrap3"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33'),(LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_57')),ActivateDelay=0.100000,DrawY=1674,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7822,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=1608
   ObjComment="SteamTrap3"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_57
   Duration=3.000000
   InputLinks(0)=(DrawY=1525,OverrideDelta=14)
   InputLinks(1)=(DrawY=1546,OverrideDelta=35)
   InputLinks(2)=(DrawY=1567,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35')),DrawY=1530,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1562,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7532,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=1488
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_57"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Short'
   InputLinks(0)=(DrawY=1730,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1730,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=-7536,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=1696
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Long'
   InputLinks(0)=(DrawY=1650,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1650,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=-7280,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7328
   ObjPosY=1616
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_64
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Long'
   InputLinks(0)=(DrawY=258,OverrideDelta=11)
   OutputLinks(0)=(DrawY=258,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-7264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7312
   ObjPosY=224
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_64"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_57
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Short'
   InputLinks(0)=(DrawY=362,OverrideDelta=11)
   OutputLinks(0)=(DrawY=362,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-7480,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=328
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_57"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_58
   Duration=3.000000
   InputLinks(0)=(DrawY=173,OverrideDelta=14)
   InputLinks(1)=(DrawY=194,OverrideDelta=35)
   InputLinks(2)=(DrawY=215,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_64')),DrawY=178,OverrideDelta=19)
   OutputLinks(1)=(DrawY=210,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7468,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7520
   ObjPosY=136
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_58"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_34
   EventName="SteamTrap2"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_57'),(LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_58')),ActivateDelay=0.100000,DrawY=314,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7846,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=248
   ObjComment="SteamTrap2"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_34"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_41
   EventName="SteamTrap1"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_69'),(LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31')),ActivateDelay=0.100000,DrawY=-974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7902,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8000
   ObjPosY=-1040
   ObjComment="SteamTrap1"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_41"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_31
   Duration=3.000000
   InputLinks(0)=(DrawY=-1131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1089,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_53')),DrawY=-1126,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1094,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7524,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-1168
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_31"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_69
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Short'
   InputLinks(0)=(DrawY=-942,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-942,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-7520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-976
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_69"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_60
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_Airship_Alarm_Klaxon_LP'
   InputLinks(0)=(DrawY=5586,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=2672,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=5552
   ObjComment="Boiler2Warning"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_60"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_61
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_Airship_Alarm_Klaxon_LP'
   InputLinks(0)=(DrawY=4322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4322,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=2536,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=4288
   ObjComment="Boiler1Warning"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_61"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_65
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_Airship_Alarm_Klaxon_LP'
   InputLinks(0)=(DrawY=4378,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=2264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2216
   ObjPosY=4344
   ObjComment="Boiler1Warning"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_65"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_66
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_Airship_Alarm_Klaxon_LP'
   InputLinks(0)=(DrawY=5690,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5690,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=2368,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2320
   ObjPosY=5656
   ObjComment="Boiler2Warning"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_66"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_25
   EventName="Boiler2Ended"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_65')),ActivateDelay=0.100000,DrawY=4442,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1788,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=4376
   ObjComment="Boiler2Ended"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_25"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="Boiler1Ended"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_66')),ActivateDelay=0.100000,DrawY=5658,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2028,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=5592
   ObjComment="Boiler1Ended"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_62
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_Boiler_Active_LP'
   InputLinks(0)=(DrawY=4458,OverrideDelta=11)
   OutputLinks(0)=(DrawY=282,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=2622,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=4424
   ObjComment="Boiler1"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_62"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_42
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_Boiler_Active_LP'
   InputLinks(0)=(DrawY=5730,OverrideDelta=11)
   OutputLinks(0)=(DrawY=282,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=2886,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2840
   ObjPosY=5696
   ObjComment="Boiler2"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_42"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_59
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Boiler_Active_LP'
   InputLinks(0)=(DrawY=5714,OverrideDelta=11)
   OutputLinks(0)=(DrawY=282,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=2582,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=5680
   ObjComment="Boiler2"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_59"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_63
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Boiler_Active_LP'
   InputLinks(0)=(DrawY=4450,OverrideDelta=11)
   OutputLinks(0)=(DrawY=282,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=2422,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2376
   ObjPosY=4416
   ObjComment="Boiler1"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_63"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=5792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=4528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=4450
   SizeY=2668
   bDrawBox=True
   FillColor=(B=226,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1256
   ObjPosY=4008
   ObjComment="Boiler Traps"
   DrawWidth=4450
   DrawHeight=2668
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_53
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Long'
   InputLinks(0)=(DrawY=-950,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-950,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-7256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7304
   ObjPosY=-984
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_53"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_WaterTrap_Spray'
   InputLinks(0)=(DrawY=786,OverrideDelta=11)
   OutputLinks(0)=(DrawY=786,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_280',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281'),DrawX=2968,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=752
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=870
   SizeY=3413
   bDrawBox=True
   FillColor=(B=255,G=100,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=-8744
   ObjComment="Atmospheric Thunder"
   DrawWidth=870
   DrawHeight=3413
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=-6096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-6384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=-6664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2120
   ObjPosY=-6928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2120
   ObjPosY=-7176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-7392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=-7632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=-7856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-8088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-8312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1840,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-6232
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-6486,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6486,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1856,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=-6520
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-6758,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1848,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-6792
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-7022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1856,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=-7056
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-7254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1872,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1920
   ObjPosY=-7288
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-7486,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7486,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1840,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-7520
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-7718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1832,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1880
   ObjPosY=-7752
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-7950,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7950,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1832,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1880
   ObjPosY=-7984
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-8150,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1848,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-8184
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-8382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8382,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1840,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-8416
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1')),ActivateDelay=2.000000,DrawY=-8587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8545,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-8656
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Lighting1"
   bClientSideOnly=True
   MaxWidth=287
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30')),DrawY=-8390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249'),DrawX=-2025,OverrideDelta=111)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-8456
   ObjComment="Lighting1"
   DrawWidth=163
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_18
   EventName="Lightning2"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-8150,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-2029,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-8216
   ObjComment="Lightning2"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_18"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
   EventName="Lightning3"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),ActivateDelay=1.000000,DrawY=-7942,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-2021,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-8008
   ObjComment="Lightning3"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_17"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_26
   EventName="Lightning4"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-7718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=-2021,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-7784
   ObjComment="Lightning4"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_26"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_15
   EventName="Lightning5"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14')),DrawY=-7478,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=-2029,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-7544
   ObjComment="Lightning5"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_15"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
   EventName="Lightning6"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15')),ActivateDelay=1.000000,DrawY=-7262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=-2037,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-7328
   ObjComment="Lightning6"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_14"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
   EventName="Lightning7"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=-7014,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-2037,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-7080
   ObjComment="Lightning7"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_13"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_24
   EventName="Lightning9"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),ActivateDelay=1.000000,DrawY=-6470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-2029,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-6536
   ObjComment="Lightning9"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_24"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_66
   EventName="Lightning8"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),DrawY=-6750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-2021,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-6816
   ObjComment="Lightning8"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_66"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Lightning10"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-6182,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-2017,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-6248
   ObjComment="Lightning10"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_1
   InputLinks(0)=(DrawY=-8611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8589,OverrideDelta=36)
   InputLinks(2)=(DrawY=-8567,OverrideDelta=58)
   InputLinks(3)=(DrawY=-8545,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-8578,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-1667,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1744
   ObjPosY=-8648
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_1"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="Lightning12"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),ActivateDelay=1.000000,DrawY=-5566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-2025,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-5632
   ObjComment="Lightning12"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_12
   EventName="Lightning11"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=-5862,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-2033,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-5928
   ObjComment="Lightning11"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_12"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-5862,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5862,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1768,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1816
   ObjPosY=-5896
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Thunder'
   InputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1752,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=-5600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2120
   ObjPosY=-5776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-5480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_85
   SizeX=303
   SizeY=182
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-8672
   ObjComment="Notes: This is the thunder sounds that accompany the lightning events."
   DrawWidth=303
   DrawHeight=182
   Name="SequenceFrame_85"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Push'
   InputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=3168,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3120
   ObjPosY=-2968
   ObjComment="Button Press"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3064
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Spot_Light_On'
   InputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=2960,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-2968
   ObjComment="Lights On"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Push'
   InputLinks(0)=(DrawY=-2934,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=-2934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=2808,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2760
   ObjPosY=-2968
   ObjComment="Button Press"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_37
   EventName="FoglightsDeactivated"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),ActivateDelay=0.100000,DrawY=-2654,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2424,OverrideDelta=96)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=-2720
   ObjComment="FoglightsDeactivated"
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_37"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_29
   EventName="FoglightsActivated"
   MaxWidth=240
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),ActivateDelay=0.100000,DrawY=-2910,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2448,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2328
   ObjPosY=-2976
   ObjComment="FoglightsActivated"
   DrawWidth=140
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_29"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_67
   EventName="FoghornActivated"
   MaxWidth=234
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_37')),ActivateDelay=0.100000,DrawY=-3990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2461,OverrideDelta=85)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2344
   ObjPosY=-4056
   ObjComment="FoghornActivated"
   DrawWidth=137
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_67"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_37
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Fog_Horn'
   InputLinks(0)=(DrawY=-4006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=2688,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-4040
   ObjComment="Horn"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_37"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-3912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_42
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=2584
   ObjComment="SteamTrap4"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_42"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_44
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8912
   ObjPosY=1248
   ObjComment="SteamTrap3"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_44"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-88
   ObjComment="SteamTrap2"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=-1376
   ObjComment="SteamTrap1"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7424
   ObjPosY=-848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=3160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=1800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_44
   EventName="StartBoilers"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_65')),ActivateDelay=0.100000,DrawY=4274,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1784,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=4208
   ObjComment="StartBoilers"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_44"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_38
   SizeX=3559
   SizeY=967
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=4128
   ObjComment="Boiler 1"
   DrawWidth=3559
   DrawHeight=967
   Name="SequenceFrame_38"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_45
   SizeX=3559
   SizeY=967
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1480
   ObjPosY=5344
   ObjComment="Boiler 2"
   DrawWidth=3559
   DrawHeight=967
   Name="SequenceFrame_45"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_63
   EventName="Boiler2Sealed"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_59'),(LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_60')),ActivateDelay=0.100000,DrawY=5906,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2246,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=5840
   ObjComment="Boiler2Sealed"
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_63"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_62
   EventName="Boiler1Sealed"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_63'),(LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_61')),ActivateDelay=0.100000,DrawY=4586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2126,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2024
   ObjPosY=4520
   ObjComment="Boiler1Sealed"
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_62"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_64
   EventName="WaterTrapActivated"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_14'),(LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23')),ActivateDelay=0.100000,DrawY=818,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2421,OverrideDelta=93)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=752
   ObjComment="WaterTrapActivated"
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_64"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_WaterTrap_Rumble'
   InputLinks(0)=(DrawY=882,OverrideDelta=11)
   OutputLinks(0)=(DrawY=882,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_280',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281'),DrawX=2792,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2744
   ObjPosY=848
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_14
   Duration=2.500000
   InputLinks(0)=(DrawY=733,OverrideDelta=14)
   InputLinks(1)=(DrawY=754,OverrideDelta=35)
   InputLinks(2)=(DrawY=775,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26')),DrawY=738,OverrideDelta=19)
   OutputLinks(1)=(DrawY=770,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2676,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=696
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_14"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_54
   EventName="LightningFired"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_36')),DrawY=-3950,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2704,OverrideDelta=72)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2808
   ObjPosY=-4016
   ObjComment="LightningFired"
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_54"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_51
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_EMP_Fire'
   InputLinks(0)=(DrawY=-4254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244'),DrawX=-2064,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-4288
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_51"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2096
   ObjPosY=-4168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-4232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_45
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Push'
   InputLinks(0)=(DrawY=-4430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240'),DrawX=-3656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-4464
   ObjComment="Button Press"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_45"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_0
   InputLinks(0)=(DrawY=-4342,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-4386,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_45')),DrawY=-4364,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-4342,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_46')),DrawY=-4320,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-4298,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=-3927,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-3902,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-4424
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_0"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_32
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=-4224
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_32"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-4224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_46
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Negative'
   InputLinks(0)=(DrawY=-4350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-4384
   ObjComment="Button Fail"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_46"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=1372
   SizeY=2255
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-4704
   ObjComment="Lever Pulled"
   DrawWidth=1372
   DrawHeight=2255
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=751
   SizeY=417
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2208
   ObjPosY=-4360
   ObjComment="Lightning Gun"
   DrawWidth=751
   DrawHeight=417
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=801
   SizeY=460
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=-3816
   ObjComment="Mini-Ships Electrocuted"
   DrawWidth=801
   DrawHeight=460
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_44
   bReplicateToClients=True
   Event=AkEvent'WW_WEP_EXP_Grenade_EMP.Stop_WEP_EXP_Grenade_EMP_Shock_LP'
   InputLinks(0)=(DrawY=-3710,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_10')),DrawY=-3710,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239'),DrawX=-2032,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-3744
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_44"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_10
   InputLinks(0)=(DrawY=-3707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3665,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3702,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3670,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1836,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-3744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_10"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   bReplicateToClients=True
   Event=AkEvent'WW_WEP_EXP_Grenade_EMP.Stop_WEP_EXP_Grenade_EMP_Shock_LP'
   InputLinks(0)=(DrawY=-3710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3710,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238',SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239'),DrawX=-1632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-3744
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1984
   ObjPosY=-3568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-3568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-3568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1688
   ObjPosY=-3568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_79
   EventName="Lever4Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_9')),ActivateDelay=0.100000,DrawY=-2982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4208,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=-3048
   ObjComment="Lever4Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_79"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_78
   EventName="Lever3Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),ActivateDelay=0.100000,DrawY=-3478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4192,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4288
   ObjPosY=-3544
   ObjComment="Lever3Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_78"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_77
   EventName="Lever2Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_1')),ActivateDelay=0.100000,DrawY=-3918,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4168,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4264
   ObjPosY=-3984
   ObjComment="Lever2Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_77"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_76
   EventName="Lever1Used"
   MaxWidth=193
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_0')),ActivateDelay=0.100000,DrawY=-4350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4160,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-4416
   ObjComment="Lever1Used"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_76"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_47
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Negative'
   InputLinks(0)=(DrawY=-3926,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3926,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-3960
   ObjComment="Button Fail"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_47"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-3800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_2"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_33
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=-3800
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_1
   InputLinks(0)=(DrawY=-3918,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-3962,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_48')),DrawY=-3940,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-3918,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_47')),DrawY=-3896,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-3874,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=-3927,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_2'),DrawX=-3902,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-4000
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_1"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_48
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Push'
   InputLinks(0)=(DrawY=-4006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),DrawX=-3656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-4040
   ObjComment="Button Press"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_48"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-3808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3592
   ObjPosY=-3376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_49
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Push'
   InputLinks(0)=(DrawY=-3574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),DrawX=-3680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3728
   ObjPosY=-3608
   ObjComment="Button Press"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_49"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_2
   InputLinks(0)=(DrawY=-3486,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-3530,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_49')),DrawY=-3508,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-3486,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_50')),DrawY=-3464,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-3442,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34'),DrawX=-3951,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-3926,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-3568
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_2"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=-3368
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_6"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_50
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Negative'
   InputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),DrawX=-3528,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3576
   ObjPosY=-3528
   ObjComment="Button Fail"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_50"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_77
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Negative'
   InputLinks(0)=(DrawY=-2998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2998,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235'),DrawX=-3552,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3600
   ObjPosY=-3032
   ObjComment="Button Fail"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_77"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-2872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_5"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="ChargeCount"
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4040
   ObjPosY=-2872
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_41"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_9
   InputLinks(0)=(DrawY=-2990,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-3034,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_79')),DrawY=-3012,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-2990,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_77')),DrawY=-2968,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-2946,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_41'),DrawX=-3975,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_5'),DrawX=-3950,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4008
   ObjPosY=-3072
   ObjComment="Is there a charge?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_9"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_79
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Button_Push'
   InputLinks(0)=(DrawY=-3078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235'),DrawX=-3704,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3752
   ObjPosY=-3112
   ObjComment="Button Press"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_79"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3616
   ObjPosY=-2880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_54
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_Electrical_ChargeIndication'
   InputLinks(0)=(DrawY=-4222,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4222,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251'),DrawX=-5736,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5784
   ObjPosY=-4256
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_54"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_Electrical_Charge_LP'
   InputLinks(0)=(DrawY=-3998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3998,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251'),DrawX=-5640,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5688
   ObjPosY=-4032
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5768
   ObjPosY=-4136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_32
   EventName="Boiler2Ended"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),ActivateDelay=0.100000,DrawY=6146,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1772,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=6080
   ObjComment="Boiler2Ended"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_32"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_BoilerRoomDoor_Open'
   InputLinks(0)=(DrawY=6122,OverrideDelta=11)
   OutputLinks(0)=(DrawY=6122,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2088
   ObjPosY=6088
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="Boiler1Ended"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),ActivateDelay=0.100000,DrawY=4929,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1968,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1868
   ObjPosY=4863
   ObjComment="Boiler1Ended"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_BoilerRoomDoor_Open'
   InputLinks(0)=(DrawY=4927,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4927,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2282,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2234
   ObjPosY=4893
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-6486,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6486,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2440,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2392
   ObjPosY=-6520
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-6190,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6190,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2480,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=-6224
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-5886,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-5920
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-5590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-5624
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-6510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1232,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=-6544
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_27
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1248,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1200
   ObjPosY=-6232
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_27"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-5590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1232,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=-5624
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Stop_ENV_Airship_DomeArm_LP'
   InputLinks(0)=(DrawY=-5902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1216
   ObjPosY=-5936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=4760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7360
   ObjPosY=6120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=4208
   ObjComment="SteamTrap5"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=4192
   SizeY=1063
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=5544
   ObjComment="SteamTrap6"
   DrawWidth=4192
   DrawHeight=1063
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_67
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Long'
   InputLinks(0)=(DrawY=4610,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4610,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-7136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=4576
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_67"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_68
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Short'
   InputLinks(0)=(DrawY=4690,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4690,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-7392,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=4656
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_68"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_63
   Duration=3.000000
   InputLinks(0)=(DrawY=4485,OverrideDelta=14)
   InputLinks(1)=(DrawY=4506,OverrideDelta=35)
   InputLinks(2)=(DrawY=4527,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_67')),DrawY=4490,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4522,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7388,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=4448
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_63"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_36
   EventName="SteamTrap5"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_68'),(LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_63')),ActivateDelay=0.100000,DrawY=4634,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7678,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=4568
   ObjComment="SteamTrap5"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_36"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_35
   EventName="SteamTrap6"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13'),(LinkedOp=SeqAct_Delay'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_32')),ActivateDelay=0.100000,DrawY=6002,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7686,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7784
   ObjPosY=5936
   ObjComment="SteamTrap6"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_35"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_32
   Duration=3.000000
   InputLinks(0)=(DrawY=5829,OverrideDelta=14)
   InputLinks(1)=(DrawY=5850,OverrideDelta=35)
   InputLinks(2)=(DrawY=5871,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=5834,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5866,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7340,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=5792
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_32"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Short'
   InputLinks(0)=(DrawY=6050,OverrideDelta=11)
   OutputLinks(0)=(DrawY=6050,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-7344,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=6016
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Airship.Play_ENV_Airship_SteamTrap_Long'
   InputLinks(0)=(DrawY=5962,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5962,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-7136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=5928
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_123
   EventName="Boiler2Unsealed"
   MaxWidth=219
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_42')),ActivateDelay=0.100000,DrawY=5994,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2597,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=5928
   ObjComment="Boiler2Unsealed"
   DrawWidth=129
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_123"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_122
   EventName="Boiler1Unsealed"
   MaxWidth=219
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_62')),ActivateDelay=0.100000,DrawY=4737,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2405,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=4671
   ObjComment="Boiler1Unsealed"
   DrawWidth=129
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_122"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_280
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_280"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_281
   ObjValue=TargetPoint'SND_Airship.TheWorld:PersistentLevel.TargetPoint_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_281"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_36
   Duration=2.000000
   InputLinks(0)=(DrawY=-3987,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3966,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3945,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_51'),(LinkedOp=SeqAct_AkPostEvent'SND_Airship.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_44')),DrawY=-3982,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3950,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2396,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Airship.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2448
   ObjPosY=-4024
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_36"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object
