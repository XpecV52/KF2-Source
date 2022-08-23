Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'FX_ZedLanding.TheWorld:PersistentLevel.Emitter_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3464
   ObjPosY=1392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=1277,OverrideDelta=14)
   InputLinks(1)=(DrawY=1298,OverrideDelta=35)
   InputLinks(2)=(DrawY=1319,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1298,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=3510,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3561,OverrideDelta=76)
   EventLinks(0)=(DrawX=3610,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3472
   ObjPosY=1240
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'FX_ZedLanding.TheWorld:PersistentLevel.TriggerVolume_12'
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=1285,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1306,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1327,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3286,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3200
   ObjPosY=1216
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'FX_ZedLanding.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=1384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=1269,OverrideDelta=14)
   InputLinks(1)=(DrawY=1290,OverrideDelta=35)
   InputLinks(2)=(DrawY=1311,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1290,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=2982,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3033,OverrideDelta=76)
   EventLinks(0)=(DrawX=3082,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=1232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'FX_ZedLanding.TheWorld:PersistentLevel.TriggerVolume_2'
   bPlayerOnly=False
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=1277,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1298,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1319,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2754,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=1208
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'FX_ZedLanding.TheWorld:PersistentLevel.TriggerVolume_14'
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=1237,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1258,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1279,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2038,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1952
   ObjPosY=1168
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=1229,OverrideDelta=14)
   InputLinks(1)=(DrawY=1250,OverrideDelta=35)
   InputLinks(2)=(DrawY=1271,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1250,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=2262,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2313,OverrideDelta=76)
   EventLinks(0)=(DrawX=2362,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2224
   ObjPosY=1192
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=Emitter'FX_ZedLanding.TheWorld:PersistentLevel.Emitter_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2224
   ObjPosY=1344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
