Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'SND_Sanitarium.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_1')),DrawY=213,OverrideDelta=14)
   OutputLinks(1)=(DrawY=234,OverrideDelta=35)
   OutputLinks(2)=(DrawY=255,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Sanitarium.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=144
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=245,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=267,OverrideDelta=36)
   InputLinks(2)=(DrawY=289,OverrideDelta=58)
   InputLinks(3)=(DrawY=311,OverrideDelta=80)
   OutputLinks(0)=(DrawY=278,OverrideDelta=47)
   VariableLinks(0)=(DrawX=749,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Sanitarium.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=208
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_1
   StateGroup="GL_Rain"
   State="Off"
   InputLinks(0)=(DrawY=186,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Sanitarium.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=186,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Sanitarium.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=152
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_1"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object
