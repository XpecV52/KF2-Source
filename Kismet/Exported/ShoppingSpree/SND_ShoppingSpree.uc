Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=-27,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5,OverrideDelta=36)
   InputLinks(2)=(DrawY=17,OverrideDelta=58)
   InputLinks(3)=(DrawY=39,OverrideDelta=80)
   OutputLinks(0)=(DrawY=6,OverrideDelta=47)
   VariableLinks(0)=(DrawX=1069,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ShoppingSpree.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=992
   ObjPosY=-64
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_ShoppingSpree.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=109,OverrideDelta=14)
   OutputLinks(1)=(DrawY=130,OverrideDelta=35)
   OutputLinks(2)=(DrawY=151,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_ShoppingSpree.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=544
   ObjPosY=40
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object
