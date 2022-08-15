Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=2062
   SizeY=3015
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=-2224
   ObjComment="Portal Entry Spawners"
   DrawWidth=2062
   DrawHeight=3015
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=PrefabSequenceContainer Name=Prefabs
   Begin Object Class=PrefabSequence Name=Windows_Seq_99
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqVar_Bool_8"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_4
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SequenceFrame_4"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_113
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqCond_CompareBool_6')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         ObjName="TriggerVolume_99 Touch"
         Name="SeqEvent_Touch_113"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Toggle_120',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         ObjName="InterpActor_99 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_6
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Toggle_8',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Bool_8'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqCond_CompareBool_6"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Toggle_120',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqEvent_Touch_113'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqAct_Toggle_8"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_120
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqAct_Toggle_120"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Toggle_120'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqEvent_Touch_113'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqCond_CompareBool_6'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqVar_Bool_8'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SequenceFrame_4'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99.SeqAct_Toggle_8'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_99"
      DrawWidth=125
      Name="Windows_Seq_99"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_98
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqVar_Bool_9"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_5
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SequenceFrame_5"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_112
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqCond_CompareBool_7')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         ObjName="TriggerVolume_98 Touch"
         Name="SeqEvent_Touch_112"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Toggle_119',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         ObjName="InterpActor_98 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_7
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Toggle_9',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Bool_9'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqCond_CompareBool_7"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Toggle_119',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqEvent_Touch_112'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqAct_Toggle_9"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_119
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqAct_Toggle_119"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Toggle_119'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqEvent_Touch_112'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqCond_CompareBool_7'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqVar_Bool_9'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SequenceFrame_5'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98.SeqAct_Toggle_9'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_98"
      DrawWidth=125
      Name="Windows_Seq_98"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_97
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqVar_Bool_10"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_6
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SequenceFrame_6"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_111
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqCond_CompareBool_8')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         ObjName="TriggerVolume_97 Touch"
         Name="SeqEvent_Touch_111"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Toggle_118',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         ObjName="InterpActor_97 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_8
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Toggle_10',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Bool_10'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqCond_CompareBool_8"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_118
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqAct_Toggle_118"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Toggle_118',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqEvent_Touch_111'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqAct_Toggle_10"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Toggle_118'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqEvent_Touch_111'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqCond_CompareBool_8'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqVar_Bool_10'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SequenceFrame_6'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97.SeqAct_Toggle_10'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_97"
      DrawWidth=125
      Name="Windows_Seq_97"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_96
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqVar_Bool_11"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_7
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SequenceFrame_7"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_110
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqCond_CompareBool_9')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         ObjName="TriggerVolume_96 Touch"
         Name="SeqEvent_Touch_110"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Toggle_117',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         ObjName="InterpActor_96 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_9
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Toggle_11',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Bool_11'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqCond_CompareBool_9"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_117
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqAct_Toggle_117"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Toggle_117',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqEvent_Touch_110'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqAct_Toggle_11"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Toggle_117'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqEvent_Touch_110'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqCond_CompareBool_9'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqVar_Bool_11'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SequenceFrame_7'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96.SeqAct_Toggle_11'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_96"
      DrawWidth=125
      Name="Windows_Seq_96"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_95
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_12
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqVar_Bool_12"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_8
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SequenceFrame_8"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_109
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqCond_CompareBool_10')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         ObjName="TriggerVolume_95 Touch"
         Name="SeqEvent_Touch_109"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Toggle_116',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         ObjName="InterpActor_95 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_10
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Toggle_12',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Bool_12'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqCond_CompareBool_10"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Toggle_116',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqEvent_Touch_109'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqAct_Toggle_12"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_116
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqAct_Toggle_116"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Toggle_116'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqEvent_Touch_109'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqCond_CompareBool_10'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqVar_Bool_12'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SequenceFrame_8'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95.SeqAct_Toggle_12'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_95"
      DrawWidth=125
      Name="Windows_Seq_95"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_94
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqVar_Bool_13"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_9
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SequenceFrame_9"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_108
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqCond_CompareBool_11')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         ObjName="TriggerVolume_94 Touch"
         Name="SeqEvent_Touch_108"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Toggle_115',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         ObjName="InterpActor_94 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_11
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Toggle_13',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Bool_13'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqCond_CompareBool_11"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Toggle_115',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqEvent_Touch_108'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqAct_Toggle_13"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_115
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqAct_Toggle_115"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Toggle_115'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqEvent_Touch_108'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqCond_CompareBool_11'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqVar_Bool_13'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SequenceFrame_9'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94.SeqAct_Toggle_13'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_94"
      DrawWidth=125
      Name="Windows_Seq_94"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_93
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqVar_Bool_14"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_10
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SequenceFrame_10"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_107
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqCond_CompareBool_12')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         ObjName="TriggerVolume_93 Touch"
         Name="SeqEvent_Touch_107"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Toggle_114',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         ObjName="InterpActor_93 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_12
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Toggle_14',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Bool_14'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqCond_CompareBool_12"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Toggle_114',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqEvent_Touch_107'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqAct_Toggle_14"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_114
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqAct_Toggle_114"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Toggle_114'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqEvent_Touch_107'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqCond_CompareBool_12'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqVar_Bool_14'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SequenceFrame_10'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93.SeqAct_Toggle_14'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_93"
      DrawWidth=125
      Name="Windows_Seq_93"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_92
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqVar_Bool_15"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_11
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SequenceFrame_11"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_106
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqCond_CompareBool_13')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         ObjName="TriggerVolume_92 Touch"
         Name="SeqEvent_Touch_106"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Toggle_113',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         ObjName="InterpActor_92 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_13
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Toggle_15',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Bool_15'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqCond_CompareBool_13"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Toggle_113',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqEvent_Touch_106'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqAct_Toggle_15"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_113
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqAct_Toggle_113"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Toggle_113'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqEvent_Touch_106'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqCond_CompareBool_13'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqVar_Bool_15'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SequenceFrame_11'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92.SeqAct_Toggle_15'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_92"
      DrawWidth=125
      Name="Windows_Seq_92"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_91
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_16
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqVar_Bool_16"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_12
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SequenceFrame_12"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_105
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqCond_CompareBool_14')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         ObjName="TriggerVolume_91 Touch"
         Name="SeqEvent_Touch_105"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Toggle_112',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         ObjName="InterpActor_91 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_14
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Toggle_16',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Bool_16'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqCond_CompareBool_14"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Toggle_112',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqEvent_Touch_105'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqAct_Toggle_16"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_112
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqAct_Toggle_112"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Toggle_112'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqEvent_Touch_105'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqCond_CompareBool_14'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqVar_Bool_16'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SequenceFrame_12'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91.SeqAct_Toggle_16'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_91"
      DrawWidth=125
      Name="Windows_Seq_91"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_90
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_17
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqVar_Bool_17"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_13
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SequenceFrame_13"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_104
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqCond_CompareBool_15')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         ObjName="TriggerVolume_90 Touch"
         Name="SeqEvent_Touch_104"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Toggle_111',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         ObjName="InterpActor_90 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_15
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Toggle_17',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Bool_17'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqCond_CompareBool_15"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Toggle_111',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqEvent_Touch_104'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqAct_Toggle_17"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_111
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqAct_Toggle_111"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Toggle_111'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqEvent_Touch_104'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqCond_CompareBool_15'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqVar_Bool_17'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SequenceFrame_13'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90.SeqAct_Toggle_17'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_90"
      DrawWidth=125
      Name="Windows_Seq_90"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_9
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_18
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqVar_Bool_18"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_14
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SequenceFrame_14"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_103
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqCond_CompareBool_16')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         ObjName="TriggerVolume_9 Touch"
         Name="SeqEvent_Touch_103"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Toggle_110',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         ObjName="InterpActor_9 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_16
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Toggle_18',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Bool_18'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqCond_CompareBool_16"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Toggle_110',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqEvent_Touch_103'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqAct_Toggle_18"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_110
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqAct_Toggle_110"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Toggle_110'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqEvent_Touch_103'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqCond_CompareBool_16'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqVar_Bool_18'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SequenceFrame_14'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9.SeqAct_Toggle_18'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_9"
      DrawWidth=117
      Name="Windows_Seq_9"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_89
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqVar_Bool_19"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_15
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SequenceFrame_15"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_102
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqCond_CompareBool_17')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         ObjName="TriggerVolume_89 Touch"
         Name="SeqEvent_Touch_102"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Toggle_109',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         ObjName="InterpActor_89 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_17
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Toggle_19',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Bool_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqCond_CompareBool_17"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Toggle_109',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqEvent_Touch_102'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqAct_Toggle_19"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_109
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqAct_Toggle_109"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Toggle_109'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqEvent_Touch_102'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqCond_CompareBool_17'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqVar_Bool_19'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SequenceFrame_15'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89.SeqAct_Toggle_19'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_89"
      DrawWidth=125
      Name="Windows_Seq_89"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_88
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_20
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqVar_Bool_20"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_16
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SequenceFrame_16"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_101
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqCond_CompareBool_18')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         ObjName="TriggerVolume_88 Touch"
         Name="SeqEvent_Touch_101"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Toggle_108',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         ObjName="InterpActor_88 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_18
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Toggle_20',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Bool_20'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqCond_CompareBool_18"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Toggle_108',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqEvent_Touch_101'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqAct_Toggle_20"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_108
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqAct_Toggle_108"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Toggle_108'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqEvent_Touch_101'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqCond_CompareBool_18'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqVar_Bool_20'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SequenceFrame_16'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88.SeqAct_Toggle_20'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_88"
      DrawWidth=125
      Name="Windows_Seq_88"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_87
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_21
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqVar_Bool_21"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_17
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SequenceFrame_17"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_100
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqCond_CompareBool_19')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         ObjName="TriggerVolume_87 Touch"
         Name="SeqEvent_Touch_100"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Toggle_107',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         ObjName="InterpActor_87 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_19
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Toggle_21',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Bool_21'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqCond_CompareBool_19"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Toggle_107',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqEvent_Touch_100'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqAct_Toggle_21"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_107
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqAct_Toggle_107"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Toggle_107'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqEvent_Touch_100'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqCond_CompareBool_19'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqVar_Bool_21'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SequenceFrame_17'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87.SeqAct_Toggle_21'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_87"
      DrawWidth=125
      Name="Windows_Seq_87"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_86
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_22
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqVar_Bool_22"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_18
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SequenceFrame_18"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_99
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqCond_CompareBool_20')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         ObjName="TriggerVolume_86 Touch"
         Name="SeqEvent_Touch_99"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Toggle_106',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         ObjName="InterpActor_86 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_20
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Toggle_22',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Bool_22'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqCond_CompareBool_20"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Toggle_106',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqEvent_Touch_99'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqAct_Toggle_22"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_106
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqAct_Toggle_106"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Toggle_106'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqEvent_Touch_99'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqCond_CompareBool_20'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqVar_Bool_22'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SequenceFrame_18'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86.SeqAct_Toggle_22'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_86"
      DrawWidth=125
      Name="Windows_Seq_86"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_85
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_23
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqVar_Bool_23"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SequenceFrame_19"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_98
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqCond_CompareBool_21')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         ObjName="TriggerVolume_85 Touch"
         Name="SeqEvent_Touch_98"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Toggle_105',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         ObjName="InterpActor_85 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_21
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Toggle_23',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Bool_23'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqCond_CompareBool_21"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Toggle_105',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqEvent_Touch_98'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqAct_Toggle_23"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_105
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqAct_Toggle_105"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Toggle_105'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqEvent_Touch_98'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqCond_CompareBool_21'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqVar_Bool_23'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SequenceFrame_19'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85.SeqAct_Toggle_23'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_85"
      DrawWidth=125
      Name="Windows_Seq_85"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_84
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_24
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqVar_Bool_24"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_20
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SequenceFrame_20"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_97
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqCond_CompareBool_22')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         ObjName="TriggerVolume_84 Touch"
         Name="SeqEvent_Touch_97"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Toggle_104',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         ObjName="InterpActor_84 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_22
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Toggle_24',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Bool_24'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqCond_CompareBool_22"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Toggle_104',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqEvent_Touch_97'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqAct_Toggle_24"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_104
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqAct_Toggle_104"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Toggle_104'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqEvent_Touch_97'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqCond_CompareBool_22'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqVar_Bool_24'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SequenceFrame_20'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84.SeqAct_Toggle_24'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_84"
      DrawWidth=125
      Name="Windows_Seq_84"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_83
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_25
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqVar_Bool_25"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_21
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SequenceFrame_21"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_96
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqCond_CompareBool_23')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         ObjName="TriggerVolume_83 Touch"
         Name="SeqEvent_Touch_96"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Toggle_103',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         ObjName="InterpActor_83 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_23
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Toggle_25',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Bool_25'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqCond_CompareBool_23"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Toggle_103',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqEvent_Touch_96'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqAct_Toggle_25"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_103
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqAct_Toggle_103"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Toggle_103'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqEvent_Touch_96'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqCond_CompareBool_23'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqVar_Bool_25'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SequenceFrame_21'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83.SeqAct_Toggle_25'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_83"
      DrawWidth=125
      Name="Windows_Seq_83"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_82
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_26
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqVar_Bool_26"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_22
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SequenceFrame_22"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_95
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqCond_CompareBool_24')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         ObjName="TriggerVolume_82 Touch"
         Name="SeqEvent_Touch_95"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Toggle_102',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         ObjName="InterpActor_82 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_24
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Toggle_26',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Bool_26'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqCond_CompareBool_24"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Toggle_102',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqEvent_Touch_95'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqAct_Toggle_26"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_102
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqAct_Toggle_102"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Toggle_102'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqEvent_Touch_95'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqCond_CompareBool_24'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqVar_Bool_26'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SequenceFrame_22'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82.SeqAct_Toggle_26'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_82"
      DrawWidth=125
      Name="Windows_Seq_82"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_81
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_27
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqVar_Bool_27"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_23
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SequenceFrame_23"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_94
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqCond_CompareBool_25')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         ObjName="TriggerVolume_81 Touch"
         Name="SeqEvent_Touch_94"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Toggle_101',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         ObjName="InterpActor_81 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_25
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Toggle_27',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Bool_27'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqCond_CompareBool_25"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Toggle_101',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqEvent_Touch_94'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqAct_Toggle_27"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_101
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqAct_Toggle_101"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Toggle_101'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqEvent_Touch_94'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqCond_CompareBool_25'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqVar_Bool_27'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SequenceFrame_23'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81.SeqAct_Toggle_27'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_81"
      DrawWidth=125
      Name="Windows_Seq_81"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_80
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_28
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqVar_Bool_28"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_24
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SequenceFrame_24"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_93
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqCond_CompareBool_26')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         ObjName="TriggerVolume_80 Touch"
         Name="SeqEvent_Touch_93"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Toggle_100',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         ObjName="InterpActor_80 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_26
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Toggle_28',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Bool_28'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqCond_CompareBool_26"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Toggle_100',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqEvent_Touch_93'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqAct_Toggle_28"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_100
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqAct_Toggle_100"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Toggle_100'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqEvent_Touch_93'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqCond_CompareBool_26'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqVar_Bool_28'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SequenceFrame_24'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80.SeqAct_Toggle_28'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_80"
      DrawWidth=125
      Name="Windows_Seq_80"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_8
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_29
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqVar_Bool_29"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_25
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SequenceFrame_25"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_92
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqCond_CompareBool_27')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         ObjName="TriggerVolume_8 Touch"
         Name="SeqEvent_Touch_92"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Toggle_99',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         ObjName="InterpActor_105 InterpActor_19 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_27
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Toggle_29',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Bool_29'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqCond_CompareBool_27"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_99
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqAct_Toggle_99"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Toggle_99',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqEvent_Touch_92'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqAct_Toggle_29"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Toggle_99'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqEvent_Touch_92'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqCond_CompareBool_27'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqVar_Bool_29'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SequenceFrame_25'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8.SeqAct_Toggle_29'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_8"
      DrawWidth=117
      Name="Windows_Seq_8"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_79
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_30
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqVar_Bool_30"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_26
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SequenceFrame_26"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_91
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqCond_CompareBool_28')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         ObjName="TriggerVolume_79 Touch"
         Name="SeqEvent_Touch_91"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Toggle_98',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         ObjName="InterpActor_79 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_28
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Toggle_30',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Bool_30'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqCond_CompareBool_28"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_98
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqAct_Toggle_98"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Toggle_98',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqEvent_Touch_91'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqAct_Toggle_30"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Toggle_98'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqEvent_Touch_91'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqCond_CompareBool_28'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqVar_Bool_30'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SequenceFrame_26'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79.SeqAct_Toggle_30'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_79"
      DrawWidth=125
      Name="Windows_Seq_79"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_78
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_31
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqVar_Bool_31"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_27
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SequenceFrame_27"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_90
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqCond_CompareBool_29')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         ObjName="TriggerVolume_78 Touch"
         Name="SeqEvent_Touch_90"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Toggle_97',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         ObjName="InterpActor_78 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_29
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Toggle_31',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Bool_31'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqCond_CompareBool_29"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_97
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqAct_Toggle_97"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Toggle_97',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqEvent_Touch_90'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqAct_Toggle_31"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Toggle_97'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqEvent_Touch_90'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqCond_CompareBool_29'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqVar_Bool_31'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SequenceFrame_27'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78.SeqAct_Toggle_31'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_78"
      DrawWidth=125
      Name="Windows_Seq_78"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_77
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_32
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqVar_Bool_32"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_28
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SequenceFrame_28"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_89
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqCond_CompareBool_30')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         ObjName="TriggerVolume_77 Touch"
         Name="SeqEvent_Touch_89"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Toggle_96',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         ObjName="InterpActor_77 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_30
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Toggle_32',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Bool_32'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqCond_CompareBool_30"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_96
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqAct_Toggle_96"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Toggle_96',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqEvent_Touch_89'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqAct_Toggle_32"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Toggle_96'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqEvent_Touch_89'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqCond_CompareBool_30'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqVar_Bool_32'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SequenceFrame_28'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77.SeqAct_Toggle_32'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_77"
      DrawWidth=125
      Name="Windows_Seq_77"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_76
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_33
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqVar_Bool_33"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_29
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SequenceFrame_29"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_88
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqCond_CompareBool_31')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         ObjName="TriggerVolume_76 Touch"
         Name="SeqEvent_Touch_88"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Toggle_95',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         ObjName="InterpActor_76 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_31
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Toggle_33',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Bool_33'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqCond_CompareBool_31"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_95
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqAct_Toggle_95"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Toggle_95',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqEvent_Touch_88'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqAct_Toggle_33"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Toggle_95'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqEvent_Touch_88'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqCond_CompareBool_31'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqVar_Bool_33'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SequenceFrame_29'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76.SeqAct_Toggle_33'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_76"
      DrawWidth=125
      Name="Windows_Seq_76"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_75
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_34
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqVar_Bool_34"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_30
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SequenceFrame_30"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_87
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqCond_CompareBool_32')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         ObjName="TriggerVolume_75 Touch"
         Name="SeqEvent_Touch_87"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Toggle_94',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         ObjName="InterpActor_75 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_32
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Toggle_34',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Bool_34'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqCond_CompareBool_32"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_94
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqAct_Toggle_94"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Toggle_94',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqEvent_Touch_87'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqAct_Toggle_34"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Toggle_94'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqEvent_Touch_87'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqCond_CompareBool_32'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqVar_Bool_34'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SequenceFrame_30'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75.SeqAct_Toggle_34'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_75"
      DrawWidth=125
      Name="Windows_Seq_75"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_74
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_35
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqVar_Bool_35"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_31
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SequenceFrame_31"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_86
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqCond_CompareBool_33')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         ObjName="TriggerVolume_74 Touch"
         Name="SeqEvent_Touch_86"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Toggle_93',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         ObjName="InterpActor_74 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_33
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Toggle_35',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Bool_35'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqCond_CompareBool_33"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_93
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqAct_Toggle_93"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Toggle_93',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqEvent_Touch_86'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqAct_Toggle_35"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Toggle_93'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqEvent_Touch_86'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqCond_CompareBool_33'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqVar_Bool_35'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SequenceFrame_31'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74.SeqAct_Toggle_35'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_74"
      DrawWidth=125
      Name="Windows_Seq_74"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_73
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_36
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqVar_Bool_36"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_32
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SequenceFrame_32"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_85
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqCond_CompareBool_34')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         ObjName="TriggerVolume_73 Touch"
         Name="SeqEvent_Touch_85"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Toggle_92',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         ObjName="InterpActor_73 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_34
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Toggle_36',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Bool_36'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqCond_CompareBool_34"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqAct_Toggle_92"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Toggle_92',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqEvent_Touch_85'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqAct_Toggle_36"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Toggle_92'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqEvent_Touch_85'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqCond_CompareBool_34'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqVar_Bool_36'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SequenceFrame_32'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73.SeqAct_Toggle_36'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_73"
      DrawWidth=125
      Name="Windows_Seq_73"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_72
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_37
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqVar_Bool_37"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_33
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SequenceFrame_33"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_84
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqCond_CompareBool_35')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         ObjName="TriggerVolume_72 Touch"
         Name="SeqEvent_Touch_84"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Toggle_91',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         ObjName="InterpActor_72 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_35
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Toggle_37',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Bool_37'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqCond_CompareBool_35"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_91
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqAct_Toggle_91"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Toggle_91',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqEvent_Touch_84'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqAct_Toggle_37"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Toggle_91'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqEvent_Touch_84'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqCond_CompareBool_35'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqVar_Bool_37'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SequenceFrame_33'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72.SeqAct_Toggle_37'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_72"
      DrawWidth=125
      Name="Windows_Seq_72"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_71
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_38
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqVar_Bool_38"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_34
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SequenceFrame_34"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_83
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqCond_CompareBool_36')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         ObjName="TriggerVolume_71 Touch"
         Name="SeqEvent_Touch_83"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Toggle_90',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         ObjName="InterpActor_71 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_36
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Toggle_38',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Bool_38'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqCond_CompareBool_36"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_90
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqAct_Toggle_90"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Toggle_90',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqEvent_Touch_83'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqAct_Toggle_38"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Toggle_90'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqEvent_Touch_83'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqCond_CompareBool_36'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqVar_Bool_38'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SequenceFrame_34'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71.SeqAct_Toggle_38'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_71"
      DrawWidth=125
      Name="Windows_Seq_71"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_70
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_39
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqVar_Bool_39"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_35
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SequenceFrame_35"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_82
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqCond_CompareBool_37')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         ObjName="TriggerVolume_70 Touch"
         Name="SeqEvent_Touch_82"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Toggle_89',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         ObjName="InterpActor_70 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_37
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Toggle_39',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Bool_39'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqCond_CompareBool_37"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_89
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqAct_Toggle_89"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Toggle_89',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqEvent_Touch_82'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqAct_Toggle_39"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Toggle_89'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqEvent_Touch_82'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqCond_CompareBool_37'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqVar_Bool_39'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SequenceFrame_35'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70.SeqAct_Toggle_39'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_70"
      DrawWidth=125
      Name="Windows_Seq_70"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_7
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_40
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqVar_Bool_40"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_36
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SequenceFrame_36"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_81
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqCond_CompareBool_38')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         ObjName="TriggerVolume_7 Touch"
         Name="SeqEvent_Touch_81"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Toggle_88',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         ObjName="InterpActor_5 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_38
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Toggle_40',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Bool_40'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqCond_CompareBool_38"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_88
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqAct_Toggle_88"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Toggle_88',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqEvent_Touch_81'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqAct_Toggle_40"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Toggle_88'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqEvent_Touch_81'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqCond_CompareBool_38'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqVar_Bool_40'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SequenceFrame_36'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7.SeqAct_Toggle_40'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_7"
      DrawWidth=117
      Name="Windows_Seq_7"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_69
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_41
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqVar_Bool_41"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_37
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SequenceFrame_37"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_80
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqCond_CompareBool_39')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         ObjName="TriggerVolume_69 Touch"
         Name="SeqEvent_Touch_80"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Toggle_87',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         ObjName="InterpActor_69 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_39
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Toggle_41',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Bool_41'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqCond_CompareBool_39"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_87
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqAct_Toggle_87"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Toggle_87',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqEvent_Touch_80'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqAct_Toggle_41"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Toggle_87'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqEvent_Touch_80'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqCond_CompareBool_39'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqVar_Bool_41'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SequenceFrame_37'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69.SeqAct_Toggle_41'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_69"
      DrawWidth=125
      Name="Windows_Seq_69"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_68
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_42
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqVar_Bool_42"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_38
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SequenceFrame_38"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_79
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqCond_CompareBool_40')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         ObjName="TriggerVolume_68 Touch"
         Name="SeqEvent_Touch_79"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Toggle_86',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         ObjName="InterpActor_68 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_40
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Toggle_42',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Bool_42'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqCond_CompareBool_40"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqAct_Toggle_86"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Toggle_86',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqEvent_Touch_79'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqAct_Toggle_42"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Toggle_86'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqEvent_Touch_79'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqCond_CompareBool_40'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqVar_Bool_42'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SequenceFrame_38'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68.SeqAct_Toggle_42'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_68"
      DrawWidth=125
      Name="Windows_Seq_68"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_67
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_43
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqVar_Bool_43"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_39
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SequenceFrame_39"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_78
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqCond_CompareBool_41')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         ObjName="TriggerVolume_67 Touch"
         Name="SeqEvent_Touch_78"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Toggle_85',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         ObjName="InterpActor_67 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_41
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Toggle_43',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Bool_43'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqCond_CompareBool_41"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqAct_Toggle_85"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Toggle_85',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqEvent_Touch_78'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqAct_Toggle_43"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Toggle_85'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqEvent_Touch_78'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqCond_CompareBool_41'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqVar_Bool_43'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SequenceFrame_39'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67.SeqAct_Toggle_43'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_67"
      DrawWidth=125
      Name="Windows_Seq_67"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_66
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_44
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqVar_Bool_44"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_40
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SequenceFrame_40"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_77
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqCond_CompareBool_42')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         ObjName="TriggerVolume_66 Touch"
         Name="SeqEvent_Touch_77"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Toggle_84',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         ObjName="InterpActor_66 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_42
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Toggle_44',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Bool_44'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqCond_CompareBool_42"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqAct_Toggle_84"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Toggle_84',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqEvent_Touch_77'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqAct_Toggle_44"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Toggle_84'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqEvent_Touch_77'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqCond_CompareBool_42'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqVar_Bool_44'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SequenceFrame_40'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66.SeqAct_Toggle_44'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_66"
      DrawWidth=125
      Name="Windows_Seq_66"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_65
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_45
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqVar_Bool_45"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_41
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SequenceFrame_41"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_76
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqCond_CompareBool_43')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         ObjName="TriggerVolume_65 Touch"
         Name="SeqEvent_Touch_76"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Toggle_83',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         ObjName="InterpActor_65 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_43
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Toggle_45',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Bool_45'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqCond_CompareBool_43"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_83
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqAct_Toggle_83"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Toggle_83',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqEvent_Touch_76'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqAct_Toggle_45"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Toggle_83'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqEvent_Touch_76'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqCond_CompareBool_43'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqVar_Bool_45'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SequenceFrame_41'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65.SeqAct_Toggle_45'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_65"
      DrawWidth=125
      Name="Windows_Seq_65"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_64
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_46
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqVar_Bool_46"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_42
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SequenceFrame_42"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_75
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqCond_CompareBool_44')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         ObjName="TriggerVolume_64 Touch"
         Name="SeqEvent_Touch_75"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Toggle_82',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         ObjName="InterpActor_64 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_44
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Toggle_46',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Bool_46'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqCond_CompareBool_44"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqAct_Toggle_82"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Toggle_82',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqEvent_Touch_75'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqAct_Toggle_46"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Toggle_82'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqEvent_Touch_75'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqCond_CompareBool_44'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqVar_Bool_46'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SequenceFrame_42'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64.SeqAct_Toggle_46'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_64"
      DrawWidth=125
      Name="Windows_Seq_64"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_63
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_47
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqVar_Bool_47"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_43
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SequenceFrame_43"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_74
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqCond_CompareBool_45')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         ObjName="TriggerVolume_63 Touch"
         Name="SeqEvent_Touch_74"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Toggle_81',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         ObjName="InterpActor_63 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_45
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Toggle_47',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Bool_47'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqCond_CompareBool_45"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqAct_Toggle_81"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Toggle_81',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqEvent_Touch_74'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqAct_Toggle_47"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Toggle_81'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqEvent_Touch_74'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqCond_CompareBool_45'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqVar_Bool_47'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SequenceFrame_43'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63.SeqAct_Toggle_47'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_63"
      DrawWidth=125
      Name="Windows_Seq_63"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_62
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_48
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqVar_Bool_48"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_44
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SequenceFrame_44"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_73
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqCond_CompareBool_46')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         ObjName="TriggerVolume_62 Touch"
         Name="SeqEvent_Touch_73"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Toggle_80',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         ObjName="InterpActor_62 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_46
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Toggle_48',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Bool_48'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqCond_CompareBool_46"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqAct_Toggle_80"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Toggle_80',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqEvent_Touch_73'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqAct_Toggle_48"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Toggle_80'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqEvent_Touch_73'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqCond_CompareBool_46'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqVar_Bool_48'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SequenceFrame_44'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62.SeqAct_Toggle_48'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_62"
      DrawWidth=125
      Name="Windows_Seq_62"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_61
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_49
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqVar_Bool_49"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_45
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SequenceFrame_45"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_72
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqCond_CompareBool_47')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         ObjName="TriggerVolume_61 Touch"
         Name="SeqEvent_Touch_72"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Toggle_79',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         ObjName="InterpActor_61 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_47
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Toggle_49',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Bool_49'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqCond_CompareBool_47"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_79
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqAct_Toggle_79"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Toggle_79',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqEvent_Touch_72'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqAct_Toggle_49"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Toggle_79'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqEvent_Touch_72'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqCond_CompareBool_47'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqVar_Bool_49'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SequenceFrame_45'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61.SeqAct_Toggle_49'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_61"
      DrawWidth=125
      Name="Windows_Seq_61"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_60
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_50
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqVar_Bool_50"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_46
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SequenceFrame_46"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_71
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqCond_CompareBool_48')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         ObjName="TriggerVolume_60 Touch"
         Name="SeqEvent_Touch_71"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Toggle_78',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         ObjName="InterpActor_60 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_48
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Toggle_50',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Bool_50'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqCond_CompareBool_48"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_78
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqAct_Toggle_78"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Toggle_78',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqEvent_Touch_71'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqAct_Toggle_50"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Toggle_78'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqEvent_Touch_71'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqCond_CompareBool_48'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqVar_Bool_50'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SequenceFrame_46'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60.SeqAct_Toggle_50'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_60"
      DrawWidth=125
      Name="Windows_Seq_60"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_6
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_51
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqVar_Bool_51"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_47
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SequenceFrame_47"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_70
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqCond_CompareBool_49')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         ObjName="TriggerVolume_4 Touch"
         Name="SeqEvent_Touch_70"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Toggle_77',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         ObjName="InterpActor_6 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_49
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Toggle_51',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Bool_51'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqCond_CompareBool_49"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_77
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqAct_Toggle_77"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Toggle_77',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqEvent_Touch_70'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqAct_Toggle_51"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Toggle_77'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqEvent_Touch_70'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqCond_CompareBool_49'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqVar_Bool_51'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SequenceFrame_47'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6.SeqAct_Toggle_51'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_6"
      DrawWidth=117
      Name="Windows_Seq_6"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_59
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_52
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqVar_Bool_52"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_48
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SequenceFrame_48"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_69
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqCond_CompareBool_50')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         ObjName="TriggerVolume_59 Touch"
         Name="SeqEvent_Touch_69"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Toggle_76',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         ObjName="InterpActor_59 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_50
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Toggle_52',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Bool_52'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqCond_CompareBool_50"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqAct_Toggle_76"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_52
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Toggle_76',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqEvent_Touch_69'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqAct_Toggle_52"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Toggle_76'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqEvent_Touch_69'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqCond_CompareBool_50'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqVar_Bool_52'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SequenceFrame_48'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59.SeqAct_Toggle_52'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_59"
      DrawWidth=125
      Name="Windows_Seq_59"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_58
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_53
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqVar_Bool_53"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_49
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SequenceFrame_49"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_68
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqCond_CompareBool_51')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         ObjName="TriggerVolume_58 Touch"
         Name="SeqEvent_Touch_68"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Toggle_75',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         ObjName="InterpActor_58 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_51
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Toggle_53',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Bool_53'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqCond_CompareBool_51"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqAct_Toggle_75"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_53
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Toggle_75',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqEvent_Touch_68'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqAct_Toggle_53"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Toggle_75'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqEvent_Touch_68'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqCond_CompareBool_51'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqVar_Bool_53'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SequenceFrame_49'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58.SeqAct_Toggle_53'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_58"
      DrawWidth=125
      Name="Windows_Seq_58"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_57
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_54
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqVar_Bool_54"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_50
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SequenceFrame_50"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_67
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqCond_CompareBool_52')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         ObjName="TriggerVolume_57 Touch"
         Name="SeqEvent_Touch_67"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Toggle_74',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         ObjName="InterpActor_57 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_52
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Toggle_54',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Bool_54'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqCond_CompareBool_52"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqAct_Toggle_74"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Toggle_74',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqEvent_Touch_67'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqAct_Toggle_54"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Toggle_74'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqEvent_Touch_67'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqCond_CompareBool_52'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqVar_Bool_54'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SequenceFrame_50'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57.SeqAct_Toggle_54'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_57"
      DrawWidth=125
      Name="Windows_Seq_57"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_56
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_55
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqVar_Bool_55"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_51
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SequenceFrame_51"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_66
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqCond_CompareBool_53')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         ObjName="TriggerVolume_56 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_66"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Toggle_73',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         ObjName="InterpActor_56 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_53
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Toggle_55',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Bool_55'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqCond_CompareBool_53"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqAct_Toggle_73"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Toggle_73',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqEvent_Touch_66'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqAct_Toggle_55"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Toggle_73'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqEvent_Touch_66'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqCond_CompareBool_53'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqVar_Bool_55'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SequenceFrame_51'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56.SeqAct_Toggle_55'
      DefaultViewX=108
      DefaultViewY=-1649
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_56"
      DrawWidth=125
      Name="Windows_Seq_56"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_55
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_56
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqVar_Bool_56"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_52
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SequenceFrame_52"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_65
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqCond_CompareBool_54')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         ObjName="TriggerVolume_55 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_65"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Toggle_72',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         ObjName="InterpActor_55 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_54
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Toggle_56',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Bool_56'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqCond_CompareBool_54"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqAct_Toggle_72"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Toggle_72',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqEvent_Touch_65'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqAct_Toggle_56"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Toggle_72'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqEvent_Touch_65'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqCond_CompareBool_54'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqVar_Bool_56'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SequenceFrame_52'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55.SeqAct_Toggle_56'
      DefaultViewX=116
      DefaultViewY=-1661
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_55"
      DrawWidth=125
      Name="Windows_Seq_55"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_54
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_57
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqVar_Bool_57"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_53
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SequenceFrame_53"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_64
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqCond_CompareBool_55')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         ObjName="TriggerVolume_54 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_64"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Toggle_71',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         ObjName="InterpActor_54 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_55
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Toggle_57',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Bool_57'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqCond_CompareBool_55"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqAct_Toggle_71"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Toggle_71',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqEvent_Touch_64'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqAct_Toggle_57"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Toggle_71'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqEvent_Touch_64'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqCond_CompareBool_55'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqVar_Bool_57'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SequenceFrame_53'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54.SeqAct_Toggle_57'
      DefaultViewX=116
      DefaultViewY=-1661
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_54"
      DrawWidth=125
      Name="Windows_Seq_54"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_53
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_58
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqVar_Bool_58"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_54
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SequenceFrame_54"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_63
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqCond_CompareBool_56')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         ObjName="TriggerVolume_53 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_63"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Toggle_70',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         ObjName="InterpActor_53 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_56
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Toggle_58',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Bool_58'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqCond_CompareBool_56"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqAct_Toggle_70"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Toggle_70',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqEvent_Touch_63'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqAct_Toggle_58"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Toggle_70'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqEvent_Touch_63'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqCond_CompareBool_56'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqVar_Bool_58'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SequenceFrame_54'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53.SeqAct_Toggle_58'
      DefaultViewX=116
      DefaultViewY=-1661
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_53"
      DrawWidth=125
      Name="Windows_Seq_53"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_52
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_59
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqVar_Bool_59"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_55
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SequenceFrame_55"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_62
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqCond_CompareBool_57')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         ObjName="TriggerVolume_52 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_62"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Toggle_69',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         ObjName="InterpActor_52 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_57
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Toggle_59',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Bool_59'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqCond_CompareBool_57"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqAct_Toggle_69"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_59
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Toggle_69',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqEvent_Touch_62'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqAct_Toggle_59"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Toggle_69'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqEvent_Touch_62'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqCond_CompareBool_57'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqVar_Bool_59'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SequenceFrame_55'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52.SeqAct_Toggle_59'
      DefaultViewX=116
      DefaultViewY=-1661
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_52"
      DrawWidth=125
      Name="Windows_Seq_52"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_51
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_60
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqVar_Bool_60"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_56
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SequenceFrame_56"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_61
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqCond_CompareBool_58')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         ObjName="TriggerVolume_51 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_61"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Toggle_68',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         ObjName="InterpActor_51 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_58
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Toggle_60',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Bool_60'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqCond_CompareBool_58"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqAct_Toggle_68"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_60
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Toggle_68',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqEvent_Touch_61'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqAct_Toggle_60"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Toggle_68'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqEvent_Touch_61'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqCond_CompareBool_58'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqVar_Bool_60'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SequenceFrame_56'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51.SeqAct_Toggle_60'
      DefaultViewX=-219
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_51"
      DrawWidth=125
      Name="Windows_Seq_51"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_50
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_61
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqVar_Bool_61"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_57
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SequenceFrame_57"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_60
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqCond_CompareBool_59')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         ObjName="TriggerVolume_50 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_60"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Toggle_67',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         ObjName="InterpActor_50 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_59
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Toggle_61',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Bool_61'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqCond_CompareBool_59"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqAct_Toggle_67"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Toggle_67',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqEvent_Touch_60'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqAct_Toggle_61"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Toggle_67'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqEvent_Touch_60'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqCond_CompareBool_59'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqVar_Bool_61'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SequenceFrame_57'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50.SeqAct_Toggle_61'
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_50"
      DrawWidth=125
      Name="Windows_Seq_50"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_5
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_62
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqVar_Bool_62"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_58
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SequenceFrame_58"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_59
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqCond_CompareBool_60')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         ObjName="TriggerVolume_6 Touch"
         Name="SeqEvent_Touch_59"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Toggle_66',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         ObjName="InterpActor_0 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_60
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Toggle_62',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Bool_62'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqCond_CompareBool_60"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqAct_Toggle_66"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Toggle_66',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqEvent_Touch_59'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqAct_Toggle_62"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Toggle_66'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqEvent_Touch_59'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqCond_CompareBool_60'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqVar_Bool_62'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SequenceFrame_58'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5.SeqAct_Toggle_62'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_5"
      DrawWidth=117
      Name="Windows_Seq_5"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_49
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_63
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqVar_Bool_63"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_59
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SequenceFrame_59"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_58
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqCond_CompareBool_61')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         ObjName="TriggerVolume_49 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_58"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Toggle_65',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         ObjName="InterpActor_49 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_61
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Toggle_63',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Bool_63'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqCond_CompareBool_61"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqAct_Toggle_65"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Toggle_65',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqEvent_Touch_58'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqAct_Toggle_63"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Toggle_65'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqEvent_Touch_58'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqCond_CompareBool_61'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqVar_Bool_63'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SequenceFrame_59'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49.SeqAct_Toggle_63'
      DefaultViewX=-219
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_49"
      DrawWidth=125
      Name="Windows_Seq_49"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_48
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_64
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqVar_Bool_64"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_60
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SequenceFrame_60"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_57
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqCond_CompareBool_62')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         ObjName="TriggerVolume_48 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_57"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Toggle_64',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         ObjName="InterpActor_48 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_62
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Toggle_65',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Bool_64'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqCond_CompareBool_62"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Toggle_64',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqEvent_Touch_57'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqAct_Toggle_65"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqAct_Toggle_64"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Toggle_64'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqEvent_Touch_57'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqCond_CompareBool_62'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqVar_Bool_64'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SequenceFrame_60'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48.SeqAct_Toggle_65'
      DefaultViewX=-218
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_48"
      DrawWidth=125
      Name="Windows_Seq_48"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_47
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_65
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqVar_Bool_65"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_61
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SequenceFrame_61"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_56
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqCond_CompareBool_63')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         ObjName="TriggerVolume_47 Touch"
         Name="SeqEvent_Touch_56"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Toggle_63',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         ObjName="InterpActor_47 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_63
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Toggle_66',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Bool_65'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqCond_CompareBool_63"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Toggle_63',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqEvent_Touch_56'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqAct_Toggle_66"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqAct_Toggle_63"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Toggle_63'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqEvent_Touch_56'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqCond_CompareBool_63'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqVar_Bool_65'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SequenceFrame_61'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47.SeqAct_Toggle_66'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_47"
      DrawWidth=125
      Name="Windows_Seq_47"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_46
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_66
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqVar_Bool_66"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_62
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SequenceFrame_62"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_55
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqCond_CompareBool_64')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         ObjName="TriggerVolume_46 Touch"
         Name="SeqEvent_Touch_55"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Toggle_62',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         ObjName="InterpActor_46 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_64
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Toggle_67',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Bool_66'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqCond_CompareBool_64"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Toggle_62',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqEvent_Touch_55'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqAct_Toggle_67"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqAct_Toggle_62"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Toggle_62'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqEvent_Touch_55'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqCond_CompareBool_64'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqVar_Bool_66'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SequenceFrame_62'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46.SeqAct_Toggle_67'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_46"
      DrawWidth=125
      Name="Windows_Seq_46"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_45
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_67
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqVar_Bool_67"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_63
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SequenceFrame_63"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_54
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqCond_CompareBool_65')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         ObjName="TriggerVolume_45 Touch"
         Name="SeqEvent_Touch_54"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Toggle_61',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         ObjName="InterpActor_45 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_65
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Toggle_68',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Bool_67'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqCond_CompareBool_65"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Toggle_61',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqEvent_Touch_54'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqAct_Toggle_68"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqAct_Toggle_61"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Toggle_61'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqEvent_Touch_54'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqCond_CompareBool_65'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqVar_Bool_67'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SequenceFrame_63'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45.SeqAct_Toggle_68'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_45"
      DrawWidth=125
      Name="Windows_Seq_45"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_44
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_68
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqVar_Bool_68"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_64
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SequenceFrame_64"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_53
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqCond_CompareBool_66')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         ObjName="TriggerVolume_44 Touch"
         Name="SeqEvent_Touch_53"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Toggle_60',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         ObjName="InterpActor_44 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_66
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Toggle_69',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Bool_68'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqCond_CompareBool_66"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Toggle_60',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqEvent_Touch_53'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqAct_Toggle_69"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_60
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqAct_Toggle_60"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Toggle_60'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqEvent_Touch_53'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqCond_CompareBool_66'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqVar_Bool_68'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SequenceFrame_64'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44.SeqAct_Toggle_69'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_44"
      DrawWidth=125
      Name="Windows_Seq_44"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_43
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_69
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqVar_Bool_69"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_65
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SequenceFrame_65"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_52
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqCond_CompareBool_67')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         ObjName="TriggerVolume_43 Touch"
         Name="SeqEvent_Touch_52"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Toggle_59',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         ObjName="InterpActor_43 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_67
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Toggle_70',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Bool_69'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqCond_CompareBool_67"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Toggle_59',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqEvent_Touch_52'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqAct_Toggle_70"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_59
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqAct_Toggle_59"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Toggle_59'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqEvent_Touch_52'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqCond_CompareBool_67'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqVar_Bool_69'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SequenceFrame_65'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43.SeqAct_Toggle_70'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_43"
      DrawWidth=125
      Name="Windows_Seq_43"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_42
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_70
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqVar_Bool_70"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_66
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SequenceFrame_66"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_51
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqCond_CompareBool_68')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         ObjName="TriggerVolume_42 Touch"
         Name="SeqEvent_Touch_51"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Toggle_58',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         ObjName="InterpActor_42 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_68
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Toggle_71',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Bool_70'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqCond_CompareBool_68"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Toggle_58',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqEvent_Touch_51'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqAct_Toggle_71"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqAct_Toggle_58"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Toggle_58'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqEvent_Touch_51'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqCond_CompareBool_68'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqVar_Bool_70'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SequenceFrame_66'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42.SeqAct_Toggle_71'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_42"
      DrawWidth=125
      Name="Windows_Seq_42"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_41
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_71
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqVar_Bool_71"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_67
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SequenceFrame_67"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_50
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqCond_CompareBool_69')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         ObjName="TriggerVolume_41 Touch"
         Name="SeqEvent_Touch_50"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Toggle_57',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         ObjName="InterpActor_41 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_69
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Toggle_72',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Bool_71'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqCond_CompareBool_69"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Toggle_57',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqEvent_Touch_50'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqAct_Toggle_72"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqAct_Toggle_57"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Toggle_57'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqEvent_Touch_50'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqCond_CompareBool_69'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqVar_Bool_71'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SequenceFrame_67'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41.SeqAct_Toggle_72'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_41"
      DrawWidth=125
      Name="Windows_Seq_41"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_40
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_72
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqVar_Bool_72"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_68
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SequenceFrame_68"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_49
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqCond_CompareBool_70')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         ObjName="TriggerVolume_40 Touch"
         Name="SeqEvent_Touch_49"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Toggle_56',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         ObjName="InterpActor_40 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_70
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Toggle_73',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Bool_72'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqCond_CompareBool_70"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Toggle_56',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqEvent_Touch_49'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqAct_Toggle_73"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqAct_Toggle_56"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Toggle_56'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqEvent_Touch_49'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqCond_CompareBool_70'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqVar_Bool_72'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SequenceFrame_68'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40.SeqAct_Toggle_73'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_40"
      DrawWidth=125
      Name="Windows_Seq_40"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_4
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_73
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqVar_Bool_73"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_69
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SequenceFrame_69"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_48
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqCond_CompareBool_71')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         ObjName="TriggerVolume_3 Touch"
         Name="SeqEvent_Touch_48"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Toggle_55',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         ObjName="InterpActor_4 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_71
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Toggle_74',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Bool_73'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqCond_CompareBool_71"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Toggle_55',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqEvent_Touch_48'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqAct_Toggle_74"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqAct_Toggle_55"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Toggle_55'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqEvent_Touch_48'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqCond_CompareBool_71'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqVar_Bool_73'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SequenceFrame_69'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4.SeqAct_Toggle_74'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_4"
      DrawWidth=117
      Name="Windows_Seq_4"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_39
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_74
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqVar_Bool_74"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_70
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SequenceFrame_70"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_47
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqCond_CompareBool_72')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         ObjName="TriggerVolume_39 Touch"
         Name="SeqEvent_Touch_47"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Toggle_54',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         ObjName="InterpActor_39 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_72
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Toggle_75',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Bool_74'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqCond_CompareBool_72"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Toggle_54',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqEvent_Touch_47'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqAct_Toggle_75"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqAct_Toggle_54"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Toggle_54'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqEvent_Touch_47'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqCond_CompareBool_72'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqVar_Bool_74'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SequenceFrame_70'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39.SeqAct_Toggle_75'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_39"
      DrawWidth=125
      Name="Windows_Seq_39"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_38
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_75
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqVar_Bool_75"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_71
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SequenceFrame_71"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_46
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqCond_CompareBool_73')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         ObjName="TriggerVolume_38 Touch"
         Name="SeqEvent_Touch_46"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Toggle_53',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         ObjName="InterpActor_38 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_73
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Toggle_76',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Bool_75'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqCond_CompareBool_73"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Toggle_53',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqEvent_Touch_46'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqAct_Toggle_76"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_53
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqAct_Toggle_53"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Toggle_53'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqEvent_Touch_46'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqCond_CompareBool_73'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqVar_Bool_75'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SequenceFrame_71'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38.SeqAct_Toggle_76'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_38"
      DrawWidth=125
      Name="Windows_Seq_38"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_37
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_76
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqVar_Bool_76"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_72
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SequenceFrame_72"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_45
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqCond_CompareBool_74')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         ObjName="TriggerVolume_37 Touch"
         Name="SeqEvent_Touch_45"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Toggle_52',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         ObjName="InterpActor_37 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_74
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Toggle_77',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Bool_76'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqCond_CompareBool_74"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_77
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Toggle_52',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqEvent_Touch_45'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqAct_Toggle_77"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_52
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqAct_Toggle_52"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Toggle_52'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqEvent_Touch_45'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqCond_CompareBool_74'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqVar_Bool_76'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SequenceFrame_72'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37.SeqAct_Toggle_77'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_37"
      DrawWidth=125
      Name="Windows_Seq_37"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_36
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_77
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqVar_Bool_77"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_73
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SequenceFrame_73"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_44
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqCond_CompareBool_75')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         ObjName="TriggerVolume_36 Touch"
         Name="SeqEvent_Touch_44"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Toggle_51',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         ObjName="InterpActor_36 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_75
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Toggle_78',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Bool_77'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqCond_CompareBool_75"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_78
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Toggle_51',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqEvent_Touch_44'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqAct_Toggle_78"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqAct_Toggle_51"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Toggle_51'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqEvent_Touch_44'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqCond_CompareBool_75'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqVar_Bool_77'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SequenceFrame_73'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36.SeqAct_Toggle_78'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_36"
      DrawWidth=125
      Name="Windows_Seq_36"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_35
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_78
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqVar_Bool_78"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_74
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SequenceFrame_74"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_43
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqCond_CompareBool_76')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         ObjName="TriggerVolume_35 Touch"
         Name="SeqEvent_Touch_43"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Toggle_50',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         ObjName="InterpActor_35 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_76
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Toggle_79',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Bool_78'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqCond_CompareBool_76"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_79
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Toggle_50',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqEvent_Touch_43'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqAct_Toggle_79"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqAct_Toggle_50"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Toggle_50'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqEvent_Touch_43'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqCond_CompareBool_76'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqVar_Bool_78'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SequenceFrame_74'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35.SeqAct_Toggle_79'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_35"
      DrawWidth=125
      Name="Windows_Seq_35"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_34
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_79
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqVar_Bool_79"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_75
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SequenceFrame_75"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_42
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqCond_CompareBool_77')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         ObjName="TriggerVolume_26 Touch"
         Name="SeqEvent_Touch_42"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Toggle_49',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         ObjName="InterpActor_26 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_77
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Toggle_80',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Bool_79'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqCond_CompareBool_77"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Toggle_49',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqEvent_Touch_42'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqAct_Toggle_80"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqAct_Toggle_49"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Toggle_49'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqEvent_Touch_42'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqCond_CompareBool_77'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqVar_Bool_79'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SequenceFrame_75'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34.SeqAct_Toggle_80'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_34"
      DrawWidth=125
      Name="Windows_Seq_34"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_33
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_80
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqVar_Bool_80"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_76
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SequenceFrame_76"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_41
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqCond_CompareBool_78')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         ObjName="TriggerVolume_34 Touch"
         Name="SeqEvent_Touch_41"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Toggle_48',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         ObjName="InterpActor_34 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_78
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Toggle_81',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Bool_80'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqCond_CompareBool_78"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Toggle_48',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqEvent_Touch_41'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqAct_Toggle_81"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqAct_Toggle_48"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Toggle_48'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqEvent_Touch_41'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqCond_CompareBool_78'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqVar_Bool_80'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SequenceFrame_76'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33.SeqAct_Toggle_81'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_33"
      DrawWidth=125
      Name="Windows_Seq_33"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_32
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_81
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqVar_Bool_81"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_77
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SequenceFrame_77"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_40
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqCond_CompareBool_79')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         ObjName="TriggerVolume_33 Touch"
         Name="SeqEvent_Touch_40"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Toggle_47',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         ObjName="InterpActor_33 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_79
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Toggle_82',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Bool_81'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqCond_CompareBool_79"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Toggle_47',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqEvent_Touch_40'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqAct_Toggle_82"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqAct_Toggle_47"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Toggle_47'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqEvent_Touch_40'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqCond_CompareBool_79'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqVar_Bool_81'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SequenceFrame_77'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32.SeqAct_Toggle_82'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_32"
      DrawWidth=125
      Name="Windows_Seq_32"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_31
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_82
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqVar_Bool_82"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_78
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SequenceFrame_78"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_39
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqCond_CompareBool_80')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         ObjName="TriggerVolume_32 Touch"
         Name="SeqEvent_Touch_39"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Toggle_46',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         ObjName="InterpActor_32 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_80
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Toggle_83',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Bool_82'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqCond_CompareBool_80"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_83
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Toggle_46',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqEvent_Touch_39'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqAct_Toggle_83"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqAct_Toggle_46"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Toggle_46'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqEvent_Touch_39'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqCond_CompareBool_80'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqVar_Bool_82'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SequenceFrame_78'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31.SeqAct_Toggle_83'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_31"
      DrawWidth=125
      Name="Windows_Seq_31"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_30
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_83
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqVar_Bool_83"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_79
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SequenceFrame_79"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_38
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqCond_CompareBool_81')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         ObjName="TriggerVolume_31 Touch"
         Name="SeqEvent_Touch_38"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Toggle_45',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         ObjName="InterpActor_31 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_81
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Toggle_84',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Bool_83'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqCond_CompareBool_81"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Toggle_45',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqEvent_Touch_38'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqAct_Toggle_84"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqAct_Toggle_45"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Toggle_45'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqEvent_Touch_38'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqCond_CompareBool_81'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqVar_Bool_83'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SequenceFrame_79'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30.SeqAct_Toggle_84'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_30"
      DrawWidth=125
      Name="Windows_Seq_30"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_3
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_84
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqVar_Bool_84"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_80
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SequenceFrame_80"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_37
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqCond_CompareBool_82')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         ObjName="TriggerVolume_2 Touch"
         Name="SeqEvent_Touch_37"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Toggle_44',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         ObjName="InterpActor_3 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_82
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Toggle_85',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Bool_84'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqCond_CompareBool_82"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Toggle_44',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqEvent_Touch_37'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqAct_Toggle_85"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqAct_Toggle_44"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Toggle_44'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqEvent_Touch_37'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqCond_CompareBool_82'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqVar_Bool_84'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SequenceFrame_80'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3.SeqAct_Toggle_85'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_3"
      DrawWidth=117
      Name="Windows_Seq_3"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_29
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_85
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqVar_Bool_85"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_81
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SequenceFrame_81"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_36
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqCond_CompareBool_83')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         ObjName="TriggerVolume_30 Touch"
         Name="SeqEvent_Touch_36"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Toggle_43',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         ObjName="InterpActor_30 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_83
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Toggle_86',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Bool_85'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqCond_CompareBool_83"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Toggle_43',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqEvent_Touch_36'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqAct_Toggle_86"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqAct_Toggle_43"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Toggle_43'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqEvent_Touch_36'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqCond_CompareBool_83'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqVar_Bool_85'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SequenceFrame_81'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29.SeqAct_Toggle_86'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_29"
      DrawWidth=125
      Name="Windows_Seq_29"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_28
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_86
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqVar_Bool_86"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_82
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SequenceFrame_82"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_35
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqCond_CompareBool_84')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         ObjName="TriggerVolume_29 Touch"
         Name="SeqEvent_Touch_35"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Toggle_42',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         ObjName="InterpActor_29 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_84
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Toggle_87',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Bool_86'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqCond_CompareBool_84"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_87
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Toggle_42',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqEvent_Touch_35'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqAct_Toggle_87"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqAct_Toggle_42"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Toggle_42'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqEvent_Touch_35'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqCond_CompareBool_84'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqVar_Bool_86'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SequenceFrame_82'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28.SeqAct_Toggle_87'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_28"
      DrawWidth=125
      Name="Windows_Seq_28"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_27
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_87
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqVar_Bool_87"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_83
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SequenceFrame_83"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_34
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqCond_CompareBool_85')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         ObjName="TriggerVolume_28 Touch"
         Name="SeqEvent_Touch_34"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Toggle_41',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         ObjName="InterpActor_28 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_85
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Toggle_88',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Bool_87'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqCond_CompareBool_85"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_88
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Toggle_41',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqEvent_Touch_34'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqAct_Toggle_88"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqAct_Toggle_41"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Toggle_41'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqEvent_Touch_34'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqCond_CompareBool_85'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqVar_Bool_87'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SequenceFrame_83'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27.SeqAct_Toggle_88'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_27"
      DrawWidth=125
      Name="Windows_Seq_27"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_26
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_88
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqVar_Bool_88"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_84
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SequenceFrame_84"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_33
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqCond_CompareBool_86')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         ObjName="TriggerVolume_27 Touch"
         Name="SeqEvent_Touch_33"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Toggle_40',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         ObjName="InterpActor_27 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_86
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Toggle_89',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Bool_88'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqCond_CompareBool_86"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_89
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Toggle_40',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqEvent_Touch_33'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqAct_Toggle_89"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqAct_Toggle_40"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Toggle_40'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqEvent_Touch_33'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqCond_CompareBool_86'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqVar_Bool_88'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SequenceFrame_84'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26.SeqAct_Toggle_89'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_26"
      DrawWidth=125
      Name="Windows_Seq_26"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_25
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_89
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqVar_Bool_89"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_85
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SequenceFrame_85"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_32
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqCond_CompareBool_87')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         ObjName="TriggerVolume_25 Touch"
         Name="SeqEvent_Touch_32"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Toggle_39',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         ObjName="InterpActor_25 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_87
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Toggle_90',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Bool_89'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqCond_CompareBool_87"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_90
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Toggle_39',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqEvent_Touch_32'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqAct_Toggle_90"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqAct_Toggle_39"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Toggle_39'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqEvent_Touch_32'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqCond_CompareBool_87'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqVar_Bool_89'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SequenceFrame_85'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25.SeqAct_Toggle_90'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_25"
      DrawWidth=125
      Name="Windows_Seq_25"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_24
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_90
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqVar_Bool_90"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_86
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SequenceFrame_86"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_31
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqCond_CompareBool_88')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         ObjName="TriggerVolume_24 Touch"
         Name="SeqEvent_Touch_31"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Toggle_38',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         ObjName="InterpActor_24 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_88
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Toggle_91',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Bool_90'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqCond_CompareBool_88"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_91
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Toggle_38',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqEvent_Touch_31'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqAct_Toggle_91"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqAct_Toggle_38"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Toggle_38'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqEvent_Touch_31'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqCond_CompareBool_88'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqVar_Bool_90'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SequenceFrame_86'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24.SeqAct_Toggle_91'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_24"
      DrawWidth=125
      Name="Windows_Seq_24"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_23
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_91
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqVar_Bool_91"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_87
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SequenceFrame_87"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_30
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqCond_CompareBool_89')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         ObjName="TriggerVolume_23 Touch"
         Name="SeqEvent_Touch_30"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Toggle_37',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         ObjName="InterpActor_23 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_89
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Toggle_92',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Bool_91'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqCond_CompareBool_89"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Toggle_37',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqEvent_Touch_30'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqAct_Toggle_92"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqAct_Toggle_37"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Toggle_37'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqEvent_Touch_30'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqCond_CompareBool_89'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqVar_Bool_91'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SequenceFrame_87'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23.SeqAct_Toggle_92'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_23"
      DrawWidth=125
      Name="Windows_Seq_23"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_22
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_92
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqVar_Bool_92"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_88
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SequenceFrame_88"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_29
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqCond_CompareBool_90')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         ObjName="TriggerVolume_22 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_29"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Toggle_36',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         ObjName="InterpActor_22 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_90
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Toggle_93',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Bool_92'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqCond_CompareBool_90"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_93
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Toggle_36',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqEvent_Touch_29'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqAct_Toggle_93"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqAct_Toggle_36"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Toggle_36'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqEvent_Touch_29'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqCond_CompareBool_90'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqVar_Bool_92'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SequenceFrame_88'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22.SeqAct_Toggle_93'
      DefaultViewX=-219
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_22"
      DrawWidth=125
      Name="Windows_Seq_22"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_21
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_93
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqVar_Bool_93"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_89
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SequenceFrame_89"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_28
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqCond_CompareBool_91')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         ObjName="TriggerVolume_21 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_28"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Toggle_35',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         ObjName="InterpActor_21 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_91
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Toggle_94',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Bool_93'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqCond_CompareBool_91"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_94
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Toggle_35',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqEvent_Touch_28'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqAct_Toggle_94"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqAct_Toggle_35"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Toggle_35'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqEvent_Touch_28'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqCond_CompareBool_91'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqVar_Bool_93'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SequenceFrame_89'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21.SeqAct_Toggle_94'
      DefaultViewX=-219
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_21"
      DrawWidth=125
      Name="Windows_Seq_21"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_20
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_94
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqVar_Bool_94"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_90
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SequenceFrame_90"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_27
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqCond_CompareBool_92')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         ObjName="TriggerVolume_20 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_27"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Toggle_34',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         ObjName="InterpActor_20 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_92
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Toggle_95',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Bool_94'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqCond_CompareBool_92"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_95
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Toggle_34',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqEvent_Touch_27'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqAct_Toggle_95"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqAct_Toggle_34"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Toggle_34'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqEvent_Touch_27'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqCond_CompareBool_92'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqVar_Bool_94'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SequenceFrame_90'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20.SeqAct_Toggle_95'
      DefaultViewX=-219
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_20"
      DrawWidth=125
      Name="Windows_Seq_20"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_2
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_95
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqVar_Bool_95"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_91
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SequenceFrame_91"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_26
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqCond_CompareBool_93')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         ObjName="TriggerVolume_1 Touch"
         Name="SeqEvent_Touch_26"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Toggle_33',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         ObjName="InterpActor_2 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_93
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Toggle_96',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Bool_95'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqCond_CompareBool_93"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_96
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Toggle_33',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqEvent_Touch_26'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqAct_Toggle_96"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqAct_Toggle_33"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Toggle_33'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqEvent_Touch_26'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqCond_CompareBool_93'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqVar_Bool_95'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SequenceFrame_91'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2.SeqAct_Toggle_96'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_2"
      DrawWidth=117
      Name="Windows_Seq_2"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_19
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_96
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqVar_Bool_96"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_92
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SequenceFrame_92"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_25
         MaxWidth=173
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqCond_CompareBool_94')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         ObjName="TriggerVolume_19 Touch"
         DrawWidth=131
         Name="SeqEvent_Touch_25"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Toggle_32',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_94
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Toggle_97',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Bool_96'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqCond_CompareBool_94"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_97
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Toggle_32',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqEvent_Touch_25'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqAct_Toggle_97"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqAct_Toggle_32"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Toggle_32'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqEvent_Touch_25'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqCond_CompareBool_94'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqVar_Bool_96'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SequenceFrame_92'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19.SeqAct_Toggle_97'
      DefaultViewX=-219
      DefaultViewY=-1715
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_19"
      DrawWidth=125
      Name="Windows_Seq_19"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_17
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_97
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqVar_Bool_97"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_93
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SequenceFrame_93"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqCond_CompareBool_95')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         ObjName="TriggerVolume_17 Touch"
         Name="SeqEvent_Touch_24"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Toggle_31',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         ObjName="InterpActor_17 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_95
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Toggle_98',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Bool_97'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqCond_CompareBool_95"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_98
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Toggle_31',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqEvent_Touch_24'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqAct_Toggle_98"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqAct_Toggle_31"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Toggle_31'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqEvent_Touch_24'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqCond_CompareBool_95'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqVar_Bool_97'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SequenceFrame_93'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17.SeqAct_Toggle_98'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_17"
      DrawWidth=125
      Name="Windows_Seq_17"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_16
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_98
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqVar_Bool_98"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_94
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SequenceFrame_94"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqCond_CompareBool_96')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         ObjName="TriggerVolume_16 Touch"
         Name="SeqEvent_Touch_23"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Toggle_30',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         ObjName="InterpActor_16 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_96
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Toggle_99',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Bool_98'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqCond_CompareBool_96"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_99
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Toggle_30',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqEvent_Touch_23'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqAct_Toggle_99"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqAct_Toggle_30"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Toggle_30'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqEvent_Touch_23'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqCond_CompareBool_96'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqVar_Bool_98'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SequenceFrame_94'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16.SeqAct_Toggle_99'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_16"
      DrawWidth=125
      Name="Windows_Seq_16"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_15
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_99
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqVar_Bool_99"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_95
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SequenceFrame_95"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_22
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqCond_CompareBool_97')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         ObjName="TriggerVolume_15 Touch"
         Name="SeqEvent_Touch_22"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Toggle_29',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         ObjName="InterpActor_15 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_97
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Toggle_100',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Bool_99'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqCond_CompareBool_97"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqAct_Toggle_29"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_100
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Toggle_29',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqEvent_Touch_22'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqAct_Toggle_100"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Toggle_29'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqEvent_Touch_22'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqCond_CompareBool_97'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqVar_Bool_99'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SequenceFrame_95'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15.SeqAct_Toggle_100'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_15"
      DrawWidth=125
      Name="Windows_Seq_15"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_14
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_100
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqVar_Bool_100"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_96
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SequenceFrame_96"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_21
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqCond_CompareBool_98')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         ObjName="TriggerVolume_14 Touch"
         Name="SeqEvent_Touch_21"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Toggle_28',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         ObjName="InterpActor_14 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_98
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Toggle_101',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Bool_100'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqCond_CompareBool_98"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqAct_Toggle_28"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_101
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Toggle_28',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqEvent_Touch_21'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqAct_Toggle_101"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Toggle_28'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqEvent_Touch_21'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqCond_CompareBool_98'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqVar_Bool_100'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SequenceFrame_96'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14.SeqAct_Toggle_101'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_14"
      DrawWidth=125
      Name="Windows_Seq_14"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_13
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_101
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqVar_Bool_101"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_97
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SequenceFrame_97"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqCond_CompareBool_99')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         ObjName="TriggerVolume_13 Touch"
         Name="SeqEvent_Touch_20"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Toggle_27',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         ObjName="InterpActor_13 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_99
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Toggle_102',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Bool_101'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqCond_CompareBool_99"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqAct_Toggle_27"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_102
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Toggle_27',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqEvent_Touch_20'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqAct_Toggle_102"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Toggle_27'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqEvent_Touch_20'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqCond_CompareBool_99'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqVar_Bool_101'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SequenceFrame_97'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13.SeqAct_Toggle_102'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_13"
      DrawWidth=125
      Name="Windows_Seq_13"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_123
      DefaultViewX=108
      DefaultViewY=-1649
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjPosX=-88
      ObjPosY=272
      ObjName="Windows_Seq_123"
      DrawWidth=133
      Name="Windows_Seq_123"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_121
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjPosX=-16
      ObjPosY=144
      ObjName="Windows_Seq_121"
      DrawWidth=133
      Name="Windows_Seq_121"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_120
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjPosY=144
      ObjName="Windows_Seq_120"
      DrawWidth=133
      Name="Windows_Seq_120"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_12
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_102
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqVar_Bool_102"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_98
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SequenceFrame_98"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqCond_CompareBool_100')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         ObjName="TriggerVolume_12 Touch"
         Name="SeqEvent_Touch_19"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Toggle_26',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         ObjName="InterpActor_12 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_100
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Toggle_103',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Bool_102'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqCond_CompareBool_100"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqAct_Toggle_26"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_103
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Toggle_26',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqEvent_Touch_19'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqAct_Toggle_103"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Toggle_26'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqEvent_Touch_19'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqCond_CompareBool_100'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqVar_Bool_102'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SequenceFrame_98'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12.SeqAct_Toggle_103'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_12"
      DrawWidth=125
      Name="Windows_Seq_12"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_119
      DefaultViewX=116
      DefaultViewY=-1661
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_119"
      DrawWidth=133
      Name="Windows_Seq_119"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_118
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_103
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqVar_Bool_103"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_99
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SequenceFrame_99"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqCond_CompareBool_101')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         ObjName="TriggerVolume_118 Touch"
         Name="SeqEvent_Touch_18"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Toggle_25',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         ObjName="InterpActor_118 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_101
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Toggle_104',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Bool_103'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqCond_CompareBool_101"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqAct_Toggle_25"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_104
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Toggle_25',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqEvent_Touch_18'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqAct_Toggle_104"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Toggle_25'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqEvent_Touch_18'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqCond_CompareBool_101'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqVar_Bool_103'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SequenceFrame_99'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118.SeqAct_Toggle_104'
      DefaultViewX=-469
      DefaultViewY=-1943
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_118"
      DrawWidth=133
      Name="Windows_Seq_118"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_112
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_104
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqVar_Bool_104"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_100
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SequenceFrame_100"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqCond_CompareBool_102')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         ObjName="TriggerVolume_112 Touch"
         Name="SeqEvent_Touch_17"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Toggle_24',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         ObjName="InterpActor_112 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_102
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Toggle_105',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Bool_104'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqCond_CompareBool_102"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqAct_Toggle_24"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_105
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Toggle_24',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqEvent_Touch_17'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqAct_Toggle_105"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Toggle_24'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqEvent_Touch_17'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqCond_CompareBool_102'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqVar_Bool_104'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SequenceFrame_100'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112.SeqAct_Toggle_105'
      DefaultViewX=108
      DefaultViewY=-1649
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_112"
      DrawWidth=133
      Name="Windows_Seq_112"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_11
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_105
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqVar_Bool_105"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_101
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SequenceFrame_101"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqCond_CompareBool_103')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         ObjName="TriggerVolume_11 Touch"
         Name="SeqEvent_Touch_16"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Toggle_23',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         ObjName="InterpActor_11 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_103
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Toggle_106',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Bool_105'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqCond_CompareBool_103"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqAct_Toggle_23"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_106
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Toggle_23',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqEvent_Touch_16'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqAct_Toggle_106"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Toggle_23'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqEvent_Touch_16'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqCond_CompareBool_103'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqVar_Bool_105'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SequenceFrame_101'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11.SeqAct_Toggle_106'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_11"
      DrawWidth=125
      Name="Windows_Seq_11"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_107
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         ObjPosX=2456
         ObjPosY=3296
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_106
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqVar_Bool_106"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_102
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SequenceFrame_102"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqCond_CompareBool_104')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         ObjName="TriggerVolume_107 Touch"
         Name="SeqEvent_Touch_15"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Toggle_22',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         ObjName="InterpActor_107 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_104
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Toggle_107',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Bool_106'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqCond_CompareBool_104"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqAct_Toggle_22"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_107
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Toggle_22',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqEvent_Touch_15'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqAct_Toggle_107"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Object_0'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Toggle_22'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqEvent_Touch_15'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqCond_CompareBool_104'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqVar_Bool_106'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SequenceFrame_102'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107.SeqAct_Toggle_107'
      DefaultViewX=-643
      DefaultViewY=-1920
      DefaultViewZoom=0.650345
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_107"
      DrawWidth=133
      Name="Windows_Seq_107"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_104
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_107
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqVar_Bool_107"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_103
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SequenceFrame_103"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqCond_CompareBool_105')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         ObjName="TriggerVolume_104 Touch"
         Name="SeqEvent_Touch_14"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Toggle_21',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         ObjName="InterpActor_104 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_105
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Toggle_108',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Bool_107'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqCond_CompareBool_105"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqAct_Toggle_21"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_108
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Toggle_21',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqEvent_Touch_14'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqAct_Toggle_108"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Toggle_21'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqEvent_Touch_14'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqCond_CompareBool_105'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqVar_Bool_107'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SequenceFrame_103'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104.SeqAct_Toggle_108'
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_104"
      DrawWidth=133
      Name="Windows_Seq_104"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_103
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_108
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqVar_Bool_108"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_104
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SequenceFrame_104"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqCond_CompareBool_106')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         ObjName="TriggerVolume_103 Touch"
         Name="SeqEvent_Touch_13"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Toggle_20',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         ObjName="InterpActor_103 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_106
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Toggle_109',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Bool_108'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqCond_CompareBool_106"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqAct_Toggle_20"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_109
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Toggle_20',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqEvent_Touch_13'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqAct_Toggle_109"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Toggle_20'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqEvent_Touch_13'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqCond_CompareBool_106'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqVar_Bool_108'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SequenceFrame_104'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103.SeqAct_Toggle_109'
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_103"
      DrawWidth=133
      Name="Windows_Seq_103"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_102
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_109
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqVar_Bool_109"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_105
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SequenceFrame_105"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqCond_CompareBool_107')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         ObjName="TriggerVolume_102 Touch"
         Name="SeqEvent_Touch_12"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Toggle_19',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         ObjName="InterpActor_102 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_107
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Toggle_110',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Bool_109'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqCond_CompareBool_107"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqAct_Toggle_19"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_110
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Toggle_19',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqEvent_Touch_12'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqAct_Toggle_110"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Toggle_19'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqEvent_Touch_12'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqCond_CompareBool_107'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqVar_Bool_109'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SequenceFrame_105'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102.SeqAct_Toggle_110'
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_102"
      DrawWidth=133
      Name="Windows_Seq_102"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_101
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_110
         bValue=1
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqVar_Bool_110"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_106
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SequenceFrame_106"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqCond_CompareBool_108')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         ObjName="TriggerVolume_101 Touch"
         Name="SeqEvent_Touch_11"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=212
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Toggle_18',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         ObjName="InterpActor_101 Take Damage"
         DrawWidth=126
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_108
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Toggle_111',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Bool_110'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqCond_CompareBool_108"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqAct_Toggle_18"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_111
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Toggle_18',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqEvent_Touch_11'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqAct_Toggle_111"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Toggle_18'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqEvent_Touch_11'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqCond_CompareBool_108'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqVar_Bool_110'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SequenceFrame_106'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101.SeqAct_Toggle_111'
      DefaultViewX=-219
      DefaultViewY=-1724
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_101"
      DrawWidth=133
      Name="Windows_Seq_101"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_10
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_111
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqVar_Bool_111"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_107
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SequenceFrame_107"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqCond_CompareBool_109')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         ObjName="TriggerVolume_10 Touch"
         Name="SeqEvent_Touch_10"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Toggle_17',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         ObjName="InterpActor_10 Take Damage"
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_109
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Toggle_112',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Bool_111'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqCond_CompareBool_109"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqAct_Toggle_17"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_112
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Toggle_17',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqEvent_Touch_10'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqAct_Toggle_112"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Toggle_17'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqEvent_Touch_10'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqCond_CompareBool_109'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqVar_Bool_111'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SequenceFrame_107'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10.SeqAct_Toggle_112'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_10"
      DrawWidth=125
      Name="Windows_Seq_10"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   Begin Object Class=PrefabSequence Name=Windows_Seq_0
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqVar_Object_19"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqVar_Object_0"
         ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
      End Object
      Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_112
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqVar_Bool_112"
         ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_108
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SequenceFrame_108"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
         MaxWidth=165
         OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqCond_CompareBool_110')))
         OutputLinks(1)=()
         OutputLinks(2)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         ObjName="TriggerVolume_5 Touch"
         DrawWidth=127
         Name="SeqEvent_Touch_9"
         ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
      End Object
      Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
         MaxWidth=196
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Toggle_16',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_PlaySound_0')))
         ObjInstanceVersion=3
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         ObjName="InterpActor_7 Take Damage"
         DrawWidth=118
         Name="SeqEvent_TakeDamage_0"
         ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
      End Object
      Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_110
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Toggle_113',InputLinkIdx=1)))
         OutputLinks(1)=()
         VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Bool_112'))
         VariableLinks(1)=()
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqCond_CompareBool_110"
         ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Object_19'))
         VariableLinks(1)=()
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqAct_Toggle_16"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_113
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Toggle_16',InputLinkIdx=2),(LinkedOp=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Destroy_0'),(LinkedOp=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_PlaySound_0')))
         EventLinks(0)=(LinkedEvents=(SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqEvent_TakeDamage_0',SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqEvent_Touch_9'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqAct_Toggle_113"
         ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
      End Object
      Begin Object Class=SeqAct_PlaySound Name=SeqAct_PlaySound_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Object_19'))
         ObjInstanceVersion=2
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqAct_PlaySound_0"
         ObjectArchetype=SeqAct_PlaySound'Engine.Default__SeqAct_PlaySound'
      End Object
      Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
         VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Object_0'))
         ObjInstanceVersion=1
         ParentSequence=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
         Name="SeqAct_Destroy_0"
         ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
      End Object
      SequenceObjects(0)=SeqAct_Destroy'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Destroy_0'
      SequenceObjects(1)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Object_0'
      SequenceObjects(2)=SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Object_19'
      SequenceObjects(3)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Toggle_16'
      SequenceObjects(4)=SeqEvent_TakeDamage'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqEvent_TakeDamage_0'
      SequenceObjects(5)=SeqAct_PlaySound'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_PlaySound_0'
      SequenceObjects(6)=SeqEvent_Touch'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqEvent_Touch_9'
      SequenceObjects(7)=SeqCond_CompareBool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqCond_CompareBool_110'
      SequenceObjects(8)=SeqVar_Bool'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqVar_Bool_112'
      SequenceObjects(9)=SequenceFrame'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SequenceFrame_108'
      SequenceObjects(10)=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0.SeqAct_Toggle_113'
      ParentSequence=PrefabSequenceContainer'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs'
      ObjName="Windows_Seq_0"
      DrawWidth=117
      Name="Windows_Seq_0"
      ObjectArchetype=PrefabSequence'Engine.Default__PrefabSequence'
   End Object
   SequenceObjects(0)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_2'
   SequenceObjects(1)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_3'
   SequenceObjects(2)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_4'
   SequenceObjects(3)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_6'
   SequenceObjects(4)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_0'
   SequenceObjects(5)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_5'
   SequenceObjects(6)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_7'
   SequenceObjects(7)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_8'
   SequenceObjects(8)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_9'
   SequenceObjects(9)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_10'
   SequenceObjects(10)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_11'
   SequenceObjects(11)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_12'
   SequenceObjects(12)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_13'
   SequenceObjects(13)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_14'
   SequenceObjects(14)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_15'
   SequenceObjects(15)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_16'
   SequenceObjects(16)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_17'
   SequenceObjects(17)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_19'
   SequenceObjects(18)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_20'
   SequenceObjects(19)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_21'
   SequenceObjects(20)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_22'
   SequenceObjects(21)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_23'
   SequenceObjects(22)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_24'
   SequenceObjects(23)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_25'
   SequenceObjects(24)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_26'
   SequenceObjects(25)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_27'
   SequenceObjects(26)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_28'
   SequenceObjects(27)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_29'
   SequenceObjects(28)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_30'
   SequenceObjects(29)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_31'
   SequenceObjects(30)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_32'
   SequenceObjects(31)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_33'
   SequenceObjects(32)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_34'
   SequenceObjects(33)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_35'
   SequenceObjects(34)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_36'
   SequenceObjects(35)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_37'
   SequenceObjects(36)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_38'
   SequenceObjects(37)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_39'
   SequenceObjects(38)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_40'
   SequenceObjects(39)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_41'
   SequenceObjects(40)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_42'
   SequenceObjects(41)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_43'
   SequenceObjects(42)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_44'
   SequenceObjects(43)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_45'
   SequenceObjects(44)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_46'
   SequenceObjects(45)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_47'
   SequenceObjects(46)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_48'
   SequenceObjects(47)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_49'
   SequenceObjects(48)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_50'
   SequenceObjects(49)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_51'
   SequenceObjects(50)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_52'
   SequenceObjects(51)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_53'
   SequenceObjects(52)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_54'
   SequenceObjects(53)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_55'
   SequenceObjects(54)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_56'
   SequenceObjects(55)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_57'
   SequenceObjects(56)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_58'
   SequenceObjects(57)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_59'
   SequenceObjects(58)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_60'
   SequenceObjects(59)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_61'
   SequenceObjects(60)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_62'
   SequenceObjects(61)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_63'
   SequenceObjects(62)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_64'
   SequenceObjects(63)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_65'
   SequenceObjects(64)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_66'
   SequenceObjects(65)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_67'
   SequenceObjects(66)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_68'
   SequenceObjects(67)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_69'
   SequenceObjects(68)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_70'
   SequenceObjects(69)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_71'
   SequenceObjects(70)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_72'
   SequenceObjects(71)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_73'
   SequenceObjects(72)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_74'
   SequenceObjects(73)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_75'
   SequenceObjects(74)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_76'
   SequenceObjects(75)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_77'
   SequenceObjects(76)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_78'
   SequenceObjects(77)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_79'
   SequenceObjects(78)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_80'
   SequenceObjects(79)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_81'
   SequenceObjects(80)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_82'
   SequenceObjects(81)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_83'
   SequenceObjects(82)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_84'
   SequenceObjects(83)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_85'
   SequenceObjects(84)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_86'
   SequenceObjects(85)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_87'
   SequenceObjects(86)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_88'
   SequenceObjects(87)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_89'
   SequenceObjects(88)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_90'
   SequenceObjects(89)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_91'
   SequenceObjects(90)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_92'
   SequenceObjects(91)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_93'
   SequenceObjects(92)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_94'
   SequenceObjects(93)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_95'
   SequenceObjects(94)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_96'
   SequenceObjects(95)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_97'
   SequenceObjects(96)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_98'
   SequenceObjects(97)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_99'
   SequenceObjects(98)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_101'
   SequenceObjects(99)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_102'
   SequenceObjects(100)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_103'
   SequenceObjects(101)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_104'
   SequenceObjects(102)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_107'
   SequenceObjects(103)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_112'
   SequenceObjects(104)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_118'
   SequenceObjects(105)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_119'
   SequenceObjects(106)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_120'
   SequenceObjects(107)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_121'
   SequenceObjects(108)=PrefabSequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.Prefabs.Windows_Seq_123'
   DefaultViewX=562
   DefaultViewY=257
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-72
   ObjPosY=-600
   DrawWidth=64
   DrawHeight=29
   Name="Prefabs"
   ObjectArchetype=PrefabSequenceContainer'Engine.Default__PrefabSequenceContainer'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-1187,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1166,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1145,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1842,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=-1256
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-1291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1249,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=2110,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2161,OverrideDelta=76)
   EventLinks(0)=(DrawX=2210,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2072
   ObjPosY=-1328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2024
   ObjPosY=-1144
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=-1128
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-2019,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1998,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1977,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3162,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-2088
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-2123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=3422,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3473,OverrideDelta=76)
   EventLinks(0)=(DrawX=3522,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3384
   ObjPosY=-2160
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3400
   ObjPosY=-1896
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3536
   ObjPosY=-1912
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-1571,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1550,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1529,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3242,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3160
   ObjPosY=-1640
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-1587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=3502,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3553,OverrideDelta=76)
   EventLinks(0)=(DrawX=3602,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3464
   ObjPosY=-1624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3424
   ObjPosY=-1440
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3512
   ObjPosY=-1440
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-729,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1842,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=-840
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-835,OverrideDelta=14)
   InputLinks(1)=(DrawY=-814,OverrideDelta=35)
   InputLinks(2)=(DrawY=-793,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-814,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=2102,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2153,OverrideDelta=76)
   EventLinks(0)=(DrawX=2202,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=-872
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2016
   ObjPosY=-688
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-1803,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1782,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1761,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1782,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=2102,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2153,OverrideDelta=76)
   EventLinks(0)=(DrawX=2202,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=-1840
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=-1640
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2128
   ObjPosY=-1656
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-1747,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1726,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1705,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1866,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=-1816
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-2163,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2142,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2121,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2142,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=2078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2129,OverrideDelta=76)
   EventLinks(0)=(DrawX=2178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=-2200
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-2043,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2022,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2001,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1842,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=-2112
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2216
   ObjPosY=-1600
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2128
   ObjPosY=-1984
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-2027,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2006,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1985,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2474,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2392
   ObjPosY=-2096
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-2131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2089,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2110,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=2734,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2785,OverrideDelta=76)
   EventLinks(0)=(DrawX=2834,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2696
   ObjPosY=-2168
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-1251,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1230,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1209,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2482,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=-1320
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-1283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1241,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1262,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=2662,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2713,OverrideDelta=76)
   EventLinks(0)=(DrawX=2762,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=-1320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=-1160
   ObjComment="Staircase"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=-1992
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=-2016
   ObjComment="CIC Pit"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=578
   SizeY=395
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-944
   ObjComment="Lab Entrance"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=706
   SizeY=507
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=-2208
   ObjComment="Mess Hall"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=578
   SizeY=397
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-1872
   ObjComment="CIC Back"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=578
   SizeY=417
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-1376
   ObjComment="Upper Corridor"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=576
   SizeY=323
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-2208
   ObjComment="CIC Front"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=701
   SizeY=436
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=-1680
   ObjComment="Side Gate"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=515
   SizeY=396
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=-1048
   ObjComment="Heated Court Yard"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-760
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-883,OverrideDelta=14)
   InputLinks(1)=(DrawY=-862,OverrideDelta=35)
   InputLinks(2)=(DrawY=-841,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-862,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=2670,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2721,OverrideDelta=76)
   EventLinks(0)=(DrawX=2770,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=-920
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-923,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-902,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-881,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2450,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2368
   ObjPosY=-992
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-210,OverrideDelta=15)
   InputLinks(1)=(DrawY=-188,OverrideDelta=37)
   InputLinks(2)=(DrawY=-166,OverrideDelta=59)
   InputLinks(3)=(DrawY=-144,OverrideDelta=81)
   InputLinks(4)=(DrawY=-122,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-194,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-138,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-1755,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="FlyCam",MinVars=0,DrawX=-1700,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=-248
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_2
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_2
         CutTrack(0)=(TargetCamGroup="FlyCam",ShotNumber=10)
         Name="InterpTrackDirector_2"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_2.InterpTrackDirector_2'
      GroupColor=(B=70,G=0,R=225,A=255)
      Name="InterpGroupDirector_2"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=-0.000488,Y=-0.000977,Z=-0.000092),InterpMode=CIM_CurveAutoClamped),(InVal=3.226379,OutVal=(X=493.900635,Y=-53.055664,Z=-0.000031),ArriveTangent=(X=142.710846,Y=-34.312813,Z=0.000047),LeaveTangent=(X=142.710846,Y=-34.312813,Z=0.000047),InterpMode=CIM_CurveAutoClamped),(InVal=6.452757,OutVal=(X=920.877930,Y=-384.042908,Z=7.999939),ArriveTangent=(X=174.792267,Y=0.000000,Z=0.000000),LeaveTangent=(X=174.792267,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.456287,OutVal=(X=1582.840332,Y=-321.116455,Z=2.999939),ArriveTangent=(X=159.591034,Y=29.337988,Z=0.000000),LeaveTangent=(X=159.591034,Y=29.337988,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.880316,OutVal=(X=2106.249756,Y=-151.900208,Z=55.999908),ArriveTangent=(X=117.562836,Y=0.000000,Z=9.789927),LeaveTangent=(X=117.562836,Y=0.000000,Z=9.789927),InterpMode=CIM_CurveAutoClamped),(InVal=18.853695,OutVal=(X=2687.626221,Y=-1109.856812,Z=94.999878),ArriveTangent=(X=134.412582,Y=0.000000,Z=0.000000),LeaveTangent=(X=134.412582,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.227697,OutVal=(X=3497.068115,Y=-900.966309,Z=-47.000122),ArriveTangent=(X=120.057541,Y=74.951439,Z=0.000000),LeaveTangent=(X=120.057541,Y=74.951439,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=29.954384,OutVal=(X=4020.347656,Y=83.712646,Z=28.999908),ArriveTangent=(X=109.000832,Y=14.760971,Z=18.247429),LeaveTangent=(X=109.000832,Y=14.760971,Z=18.247429),InterpMode=CIM_CurveAutoClamped),(InVal=36.765846,OutVal=(X=4863.736816,Y=123.702881,Z=181.999786),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.799294),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.799294),InterpMode=CIM_CurveAutoClamped),(InVal=49.729595,OutVal=(X=4861.525391,Y=-793.277283,Z=225.999725),InterpMode=CIM_CurveAutoClamped),(InVal=58.151089,OutVal=(X=5251.084961,Y=343.346680,Z=179.999725),ArriveTangent=(X=0.000000,Y=90.647247,Z=-1.092252),LeaveTangent=(X=0.000000,Y=90.647247,Z=-1.092252),InterpMode=CIM_CurveAutoClamped),(InVal=66.363022,OutVal=(X=4985.931641,Y=803.733521,Z=175.999664),ArriveTangent=(X=-73.222366,Y=66.367455,Z=-0.249636),LeaveTangent=(X=-73.222366,Y=66.367455,Z=-0.249636),InterpMode=CIM_CurveAutoClamped),(InVal=73.597977,OutVal=(X=2828.895996,Y=1368.517334,Z=174.999542),ArriveTangent=(X=-283.654175,Y=0.000000,Z=-0.397834),LeaveTangent=(X=-283.654175,Y=0.000000,Z=-0.397834),InterpMode=CIM_CurveAutoClamped),(InVal=77.744652,OutVal=(X=1756.657349,Y=875.265015,Z=78.999420),ArriveTangent=(X=0.000000,Y=-147.662613,Z=-20.939272),LeaveTangent=(X=0.000000,Y=-147.662613,Z=-20.939272),InterpMode=CIM_CurveAutoClamped),(InVal=81.477913,OutVal=(X=2044.516357,Y=204.945313,Z=9.999420),ArriveTangent=(X=123.090912,Y=0.000000,Z=-27.744055),LeaveTangent=(X=123.090912,Y=0.000000,Z=-27.744055),InterpMode=CIM_CurveAutoClamped),(InVal=85.467903,OutVal=(X=2767.444092,Y=779.102661,Z=-139.000671),ArriveTangent=(X=157.504639,Y=104.570068,Z=0.000000),LeaveTangent=(X=157.504639,Y=104.570068,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=89.909760,OutVal=(X=3372.571289,Y=1086.664063,Z=-127.000702),ArriveTangent=(X=170.468155,Y=29.355881,Z=0.000000),LeaveTangent=(X=170.468155,Y=29.355881,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=94.178963,OutVal=(X=4252.402344,Y=1150.820801,Z=-294.000763),ArriveTangent=(X=43.014809,Y=0.000000,Z=-40.619064),LeaveTangent=(X=43.014809,Y=0.000000,Z=-40.619064),InterpMode=CIM_CurveAutoClamped),(InVal=98.723358,OutVal=(X=4338.064453,Y=469.027588,Z=-485.000824),ArriveTangent=(X=0.000000,Y=-134.125885,Z=-24.406088),LeaveTangent=(X=0.000000,Y=-134.125885,Z=-24.406088),InterpMode=CIM_CurveAutoClamped),(InVal=103.421257,OutVal=(X=3776.028809,Y=-88.810059,Z=-550.000854),ArriveTangent=(X=-126.990120,Y=-103.328522,Z=0.000000),LeaveTangent=(X=-126.990120,Y=-103.328522,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=107.804550,OutVal=(X=3184.842773,Y=-469.318542,Z=-550.000854),ArriveTangent=(X=-126.480309,Y=0.000000,Z=0.000000),LeaveTangent=(X=-126.480309,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=113.065979,OutVal=(X=2556.161377,Y=-203.979797,Z=-550.000854),ArriveTangent=(X=0.000000,Y=84.065765,Z=0.000000),LeaveTangent=(X=0.000000,Y=84.065765,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=118.349754,OutVal=(X=3384.927490,Y=489.114014,Z=-493.000885),ArriveTangent=(X=160.749847,Y=0.000000,Z=0.000000),LeaveTangent=(X=160.749847,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=122.088257,OutVal=(X=4006.491211,Y=-362.482971,Z=-509.000946),ArriveTangent=(X=26.523064,Y=-201.688889,Z=0.000000),LeaveTangent=(X=26.523064,Y=-201.688889,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=126.852821,OutVal=(X=4058.011719,Y=-1225.860107,Z=-476.001007),ArriveTangent=(X=26.128120,Y=-148.338745,Z=0.000000),LeaveTangent=(X=26.128120,Y=-148.338745,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=130.562439,OutVal=(X=4575.049316,Y=-1632.599854,Z=-476.001068),ArriveTangent=(X=171.441025,Y=-33.070595,Z=-0.000016),LeaveTangent=(X=171.441025,Y=-33.070595,Z=-0.000016),InterpMode=CIM_CurveAutoClamped),(InVal=134.543991,OutVal=(X=5376.593750,Y=-1693.452881,Z=-476.001129),ArriveTangent=(X=0.000000,Y=-35.416283,Z=-0.000015),LeaveTangent=(X=0.000000,Y=-35.416283,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=138.559006,OutVal=(X=5212.545898,Y=-2659.431152,Z=-476.001190),ArriveTangent=(X=-77.295242,Y=-156.937302,Z=-0.000038),LeaveTangent=(X=-77.295242,Y=-156.937302,Z=-0.000038),InterpMode=CIM_CurveAutoClamped),(InVal=142.523804,OutVal=(X=4580.961914,Y=-3036.941895,Z=-613.001221),ArriveTangent=(X=-63.328346,Y=-115.949333,Z=-3.000332),LeaveTangent=(X=-63.328346,Y=-115.949333,Z=-3.000332),InterpMode=CIM_CurveAutoClamped),(InVal=146.528976,OutVal=(X=4454.695313,Y=-3583.543945,Z=-618.001221),InterpMode=CIM_CurveAutoClamped),(InVal=150.560745,OutVal=(X=4705.906738,Y=-3200.582275,Z=-618.001221),ArriveTangent=(X=81.875320,Y=0.000000,Z=0.000000),LeaveTangent=(X=81.875320,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=156.533081,OutVal=(X=5296.456543,Y=-3813.288818,Z=-516.001221),ArriveTangent=(X=88.096962,Y=-92.859314,Z=17.986769),LeaveTangent=(X=88.096962,Y=-92.859314,Z=17.986769),InterpMode=CIM_CurveAutoClamped),(InVal=160.568100,OutVal=(X=5588.519043,Y=-4129.858398,Z=-438.001251),ArriveTangent=(X=73.044426,Y=0.000000,Z=11.120974),LeaveTangent=(X=73.044426,Y=0.000000,Z=11.120974),InterpMode=CIM_CurveAutoClamped),(InVal=164.516190,OutVal=(X=5879.578125,Y=-3915.372314,Z=-413.001312),InterpMode=CIM_CurveAutoClamped),(InVal=170.098572,OutVal=(X=5746.396484,Y=-4807.989258,Z=-475.001373),ArriveTangent=(X=0.000000,Y=-121.805374,Z=-0.000013),LeaveTangent=(X=0.000000,Y=-121.805374,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=175.791443,OutVal=(X=5773.197754,Y=-5288.758789,Z=-475.001404),ArriveTangent=(X=10.902634,Y=-106.568726,Z=-0.000005),LeaveTangent=(X=10.902634,Y=-106.568726,Z=-0.000005),InterpMode=CIM_CurveAutoClamped),(InVal=182.117233,OutVal=(X=6501.428223,Y=-6088.802734,Z=-475.001434),InterpMode=CIM_CurveAutoClamped),(InVal=188.154022,OutVal=(X=6460.002930,Y=-6061.498047,Z=-467.001495),ArriveTangent=(X=-17.354774,Y=5.548107,Z=0.000000),LeaveTangent=(X=-17.354774,Y=5.548107,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=193.261765,OutVal=(X=5226.972656,Y=-6026.971680,Z=-544.001587),ArriveTangent=(X=-223.350983,Y=14.529906,Z=0.000000),LeaveTangent=(X=-223.350983,Y=14.529906,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=198.539352,OutVal=(X=4140.429199,Y=-5744.839844,Z=-398.001617),ArriveTangent=(X=-197.258667,Y=82.835106,Z=31.282623),LeaveTangent=(X=-197.258667,Y=82.835106,Z=31.282623),InterpMode=CIM_CurveAutoClamped),(InVal=204.034515,OutVal=(X=3101.954102,Y=-5107.708008,Z=-207.001678),ArriveTangent=(X=-98.846695,Y=47.396404,Z=23.025660),LeaveTangent=(X=-98.846695,Y=47.396404,Z=23.025660),InterpMode=CIM_CurveAutoClamped),(InVal=208.011765,OutVal=(X=2873.235840,Y=-5005.596191,Z=-148.001709),ArriveTangent=(X=-47.433823,Y=51.404594,Z=19.355745),LeaveTangent=(X=-47.433823,Y=51.404594,Z=19.355745),InterpMode=CIM_CurveAutoClamped),(InVal=213.649185,OutVal=(X=2645.893555,Y=-3830.193359,Z=-18.001770),ArriveTangent=(X=-20.741604,Y=157.969345,Z=22.969688),LeaveTangent=(X=-20.741604,Y=157.969345,Z=22.969688),InterpMode=CIM_CurveAutoClamped),(InVal=220.767700,OutVal=(X=2568.810303,Y=-2990.549316,Z=144.998169),InterpMode=CIM_CurveAutoClamped),(InVal=226.746277,OutVal=(X=3141.661133,Y=-3043.205811,Z=144.998108),ArriveTangent=(X=0.000000,Y=-20.700718,Z=-0.000011),LeaveTangent=(X=0.000000,Y=-20.700718,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=232.350494,OutVal=(X=3130.751221,Y=-3782.424561,Z=144.998047),ArriveTangent=(X=0.000000,Y=-118.792549,Z=-0.000011),LeaveTangent=(X=0.000000,Y=-118.792549,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=237.900970,OutVal=(X=3404.553955,Y=-4368.300293,Z=144.997986),ArriveTangent=(X=90.873291,Y=-54.826004,Z=-0.000011),LeaveTangent=(X=90.873291,Y=-54.826004,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=243.296478,OutVal=(X=4338.859375,Y=-4529.841797,Z=144.997925),ArriveTangent=(X=126.318481,Y=-24.324800,Z=-0.000013),LeaveTangent=(X=126.318481,Y=-24.324800,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=244.941864,OutVal=(X=4505.503418,Y=-4563.730469,Z=144.997894),ArriveTangent=(X=125.893005,Y=-30.180458,Z=0.000000),LeaveTangent=(X=125.893005,Y=-30.180458,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=250.507065,OutVal=(X=5470.465820,Y=-4992.603516,Z=147.997833),InterpMode=CIM_CurveAutoClamped),(InVal=256.126038,OutVal=(X=5257.282227,Y=-4921.749023,Z=147.997803),ArriveTangent=(X=-14.681645,Y=27.343670,Z=0.000000),LeaveTangent=(X=-14.681645,Y=27.343670,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=261.661621,OutVal=(X=5216.886719,Y=-4374.591797,Z=149.997742),ArriveTangent=(X=0.000000,Y=19.536598,Z=0.000000),LeaveTangent=(X=0.000000,Y=19.536598,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=266.904388,OutVal=(X=6044.813965,Y=-4328.618652,Z=18.997681),ArriveTangent=(X=25.565029,Y=20.005356,Z=-9.342840),LeaveTangent=(X=25.565029,Y=20.005356,Z=-9.342840),InterpMode=CIM_CurveAutoClamped),(InVal=272.964172,OutVal=(X=6109.574219,Y=-3137.044922,Z=-8.002411),ArriveTangent=(X=0.000000,Y=133.032806,Z=0.000000),LeaveTangent=(X=0.000000,Y=133.032806,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=280.226288,OutVal=(X=6060.258789,Y=-2550.092529,Z=20.997559),ArriveTangent=(X=0.000000,Y=99.168121,Z=0.000000),LeaveTangent=(X=0.000000,Y=99.168121,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=286.905243,OutVal=(X=6610.748047,Y=-1754.535156,Z=-140.002502),ArriveTangent=(X=0.000000,Y=14.641273,Z=-0.000025),LeaveTangent=(X=0.000000,Y=14.641273,Z=-0.000025),InterpMode=CIM_CurveAutoClamped),(InVal=292.647339,OutVal=(X=6297.160156,Y=-1717.232178,Z=-140.002563),ArriveTangent=(X=0.000000,Y=12.054903,Z=-0.000022),LeaveTangent=(X=0.000000,Y=12.054903,Z=-0.000022),InterpMode=CIM_CurveAutoClamped),(InVal=303.108521,OutVal=(X=6353.962891,Y=-1217.453857,Z=-144.002625),ArriveTangent=(X=0.000000,Y=86.634895,Z=0.000000),LeaveTangent=(X=0.000000,Y=86.634895,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=307.738190,OutVal=(X=6344.440918,Y=-409.837952,Z=-138.002686),ArriveTangent=(X=0.000000,Y=243.471222,Z=0.000000),LeaveTangent=(X=0.000000,Y=243.471222,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=311.913910,OutVal=(X=6452.020020,Y=926.405151,Z=-138.002747),ArriveTangent=(X=0.000000,Y=192.185379,Z=-0.000035),LeaveTangent=(X=0.000000,Y=192.185379,Z=-0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=316.907196,OutVal=(X=5903.696777,Y=1469.220215,Z=-140.002808),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000029),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000029),InterpMode=CIM_CurveAutoClamped),(InVal=322.402710,OutVal=(X=6574.335449,Y=1004.104248,Z=-140.002869),ArriveTangent=(X=139.853271,Y=-38.171383,Z=-0.000029),LeaveTangent=(X=139.853271,Y=-38.171383,Z=-0.000029),InterpMode=CIM_CurveAutoClamped),(InVal=327.554718,OutVal=(X=7392.787598,Y=901.054932,Z=-283.002930),ArriveTangent=(X=163.969437,Y=0.000000,Z=-33.081947),LeaveTangent=(X=163.969437,Y=0.000000,Z=-33.081947),InterpMode=CIM_CurveAutoClamped),(InVal=332.589539,OutVal=(X=8244.664063,Y=941.697021,Z=-477.002991),ArriveTangent=(X=144.007385,Y=17.068775,Z=-11.626637),LeaveTangent=(X=144.007385,Y=17.068775,Z=-11.626637),InterpMode=CIM_CurveAutoClamped),(InVal=339.184082,OutVal=(X=9067.501953,Y=1558.614990,Z=-511.003052),ArriveTangent=(X=87.106888,Y=0.000000,Z=-0.000026),LeaveTangent=(X=87.106888,Y=0.000000,Z=-0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=344.748260,OutVal=(X=9381.084961,Y=495.639282,Z=-511.003113),ArriveTangent=(X=42.336437,Y=-181.892090,Z=-0.000011),LeaveTangent=(X=42.336437,Y=-181.892090,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=350.202698,OutVal=(X=9535.453125,Y=-445.583984,Z=-511.003174),ArriveTangent=(X=31.797718,Y=-160.914688,Z=-0.000012),LeaveTangent=(X=31.797718,Y=-160.914688,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=355.060303,OutVal=(X=9708.984375,Y=-1163.719727,Z=-511.003235),ArriveTangent=(X=39.975613,Y=-134.984650,Z=0.000000),LeaveTangent=(X=39.975613,Y=-134.984650,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=359.623505,OutVal=(X=9912.055664,Y=-1717.248291,Z=-395.003296),ArriveTangent=(X=26.756065,Y=-139.735428,Z=37.771660),LeaveTangent=(X=26.756065,Y=-139.735428,Z=37.771660),InterpMode=CIM_CurveAutoClamped),(InVal=364.746063,OutVal=(X=9990.212891,Y=-2517.163574,Z=-136.003357),ArriveTangent=(X=0.000000,Y=-159.839676,Z=0.000000),LeaveTangent=(X=0.000000,Y=-159.839676,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=370.045258,OutVal=(X=9861.873047,Y=-3383.057861,Z=-176.003418),ArriveTangent=(X=-49.798584,Y=-55.093193,Z=-0.000031),LeaveTangent=(X=-49.798584,Y=-55.093193,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=374.991180,OutVal=(X=9214.869141,Y=-3515.970947,Z=-176.003479),ArriveTangent=(X=-144.097626,Y=-16.270935,Z=0.000000),LeaveTangent=(X=-144.097626,Y=-16.270935,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=379.878204,OutVal=(X=8444.968750,Y=-3562.301025,Z=39.996460),ArriveTangent=(X=-112.538025,Y=0.000000,Z=9.095926),LeaveTangent=(X=-112.538025,Y=0.000000,Z=9.095926),InterpMode=CIM_CurveAutoClamped),(InVal=384.845917,OutVal=(X=8086.583008,Y=-3370.493896,Z=59.996399),ArriveTangent=(X=-42.883614,Y=74.611221,Z=0.000000),LeaveTangent=(X=-42.883614,Y=74.611221,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=389.850708,OutVal=(X=7963.042480,Y=-2540.166504,Z=6.996338),ArriveTangent=(X=0.000000,Y=158.846085,Z=0.000000),LeaveTangent=(X=0.000000,Y=158.846085,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=394.855530,OutVal=(X=7986.946777,Y=-1780.505981,Z=158.996277),ArriveTangent=(X=11.332073,Y=151.715195,Z=0.000000),LeaveTangent=(X=11.332073,Y=151.715195,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=399.978088,OutVal=(X=8607.084961,Y=-1003.688965,Z=158.996216),ArriveTangent=(X=142.697128,Y=21.409931,Z=-0.000012),LeaveTangent=(X=142.697128,Y=21.409931,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=405.007355,OutVal=(X=9435.583008,Y=-957.242371,Z=158.996155),ArriveTangent=(X=174.717361,Y=15.771683,Z=-0.000030),LeaveTangent=(X=174.717361,Y=15.771683,Z=-0.000030),InterpMode=CIM_CurveAutoClamped),(InVal=410.012146,OutVal=(X=10360.208984,Y=-828.770569,Z=148.996094),ArriveTangent=(X=169.548050,Y=42.820702,Z=-0.000031),LeaveTangent=(X=169.548050,Y=42.820702,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=415.016968,OutVal=(X=11132.693359,Y=-494.295258,Z=148.996033),ArriveTangent=(X=151.818848,Y=59.361736,Z=-0.000031),LeaveTangent=(X=151.818848,Y=59.361736,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=420.051178,OutVal=(X=11884.323242,Y=-232.836182,Z=18.995972),ArriveTangent=(X=0.000000,Y=24.939274,Z=-17.379053),LeaveTangent=(X=0.000000,Y=24.939274,Z=-17.379053),InterpMode=CIM_CurveAutoClamped),(InVal=425.085419,OutVal=(X=11350.662109,Y=-166.554077,Z=-35.004089),ArriveTangent=(X=-106.317596,Y=0.000000,Z=-17.336084),LeaveTangent=(X=-106.317596,Y=0.000000,Z=-17.336084),InterpMode=CIM_CurveAutoClamped),(InVal=430.016235,OutVal=(X=10824.862305,Y=-457.402832,Z=-161.004150),ArriveTangent=(X=-11.369221,Y=-72.673645,Z=0.000000),LeaveTangent=(X=-11.369221,Y=-72.673645,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=434.962158,OutVal=(X=10801.179688,Y=-884.332703,Z=-108.004211),ArriveTangent=(X=0.000000,Y=-137.023163,Z=0.000000),LeaveTangent=(X=0.000000,Y=-137.023163,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=439.996368,OutVal=(X=10962.000000,Y=-1880.623047,Z=-127.004272),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000031),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=445.001160,OutVal=(X=10671.612305,Y=-1748.138672,Z=-127.004333),ArriveTangent=(X=-52.179535,Y=0.000000,Z=-0.000012),LeaveTangent=(X=-52.179535,Y=0.000000,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=449.974182,OutVal=(X=10441.362305,Y=-2794.372559,Z=-127.004395),ArriveTangent=(X=-22.397827,Y=-159.397400,Z=-0.000030),LeaveTangent=(X=-22.397827,Y=-159.397400,Z=-0.000030),InterpMode=CIM_CurveAutoClamped),(InVal=455.126160,OutVal=(X=10380.683594,Y=-3362.037354,Z=-150.004456),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.380583),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.380583),InterpMode=CIM_CurveAutoClamped),(InVal=459.954346,OutVal=(X=10860.457031,Y=-3072.438477,Z=-434.004517),ArriveTangent=(X=124.355171,Y=39.400635,Z=-0.499416),LeaveTangent=(X=124.355171,Y=39.400635,Z=-0.499416),InterpMode=CIM_CurveAutoClamped),(InVal=465.012268,OutVal=(X=11610.072266,Y=-2951.961426,Z=-435.004578),ArriveTangent=(X=56.190678,Y=49.834713,Z=-0.483442),LeaveTangent=(X=56.190678,Y=49.834713,Z=-0.483442),InterpMode=CIM_CurveAutoClamped),(InVal=469.958191,OutVal=(X=11747.738281,Y=-2223.414307,Z=-475.004639),ArriveTangent=(X=0.000000,Y=115.931404,Z=0.000000),LeaveTangent=(X=0.000000,Y=115.931404,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=475.051300,OutVal=(X=11721.656250,Y=-1788.122314,Z=-471.649078),ArriveTangent=(X=0.000000,Y=14.598848,Z=0.000000),LeaveTangent=(X=0.000000,Y=14.598848,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=480.014984,OutVal=(X=12226.627930,Y=-1756.306885,Z=-618.649170),ArriveTangent=(X=40.063240,Y=0.000000,Z=-31.566837),LeaveTangent=(X=40.063240,Y=0.000000,Z=-31.566837),InterpMode=CIM_CurveAutoClamped),(InVal=483.002686,OutVal=(X=12294.082031,Y=-2149.050781,Z=-722.649170),ArriveTangent=(X=41.094704,Y=-118.963615,Z=-28.266731),LeaveTangent=(X=41.094704,Y=-118.963615,Z=-28.266731),InterpMode=CIM_CurveAutoClamped),(InVal=485.993744,OutVal=(X=12524.308594,Y=-2467.561768,Z=-787.649170),ArriveTangent=(X=127.664192,Y=0.000000,Z=0.000000),LeaveTangent=(X=127.664192,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=490.007050,OutVal=(X=13402.443359,Y=-2337.347656,Z=-787.649170),ArriveTangent=(X=172.144089,Y=8.901690,Z=0.000000),LeaveTangent=(X=172.144089,Y=8.901690,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=494.520264,OutVal=(X=13992.098633,Y=-2319.280273,Z=-777.649170),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.700265),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.700265),InterpMode=CIM_CurveAutoClamped),(InVal=500.005493,OutVal=(X=13680.592773,Y=-3172.279053,Z=-770.649170),ArriveTangent=(X=-103.108139,Y=-143.633011,Z=0.000000),LeaveTangent=(X=-103.108139,Y=-143.633011,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=504.484283,OutVal=(X=12875.217773,Y=-3750.442383,Z=-839.649170),ArriveTangent=(X=0.000000,Y=-166.964996,Z=0.000000),LeaveTangent=(X=0.000000,Y=-166.964996,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=507.509430,OutVal=(X=13276.116211,Y=-4425.173828,Z=-839.649170),ArriveTangent=(X=98.629250,Y=-192.835831,Z=0.000000),LeaveTangent=(X=98.629250,Y=-192.835831,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=511.992218,OutVal=(X=13615.719727,Y=-5198.241211,Z=-792.649170),ArriveTangent=(X=0.000000,Y=-42.404839,Z=0.000000),LeaveTangent=(X=0.000000,Y=-42.404839,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=516.007019,OutVal=(X=13494.798828,Y=-5277.854492,Z=-795.649170),ArriveTangent=(X=-59.395706,Y=0.000000,Z=-1.261354),LeaveTangent=(X=-59.395706,Y=0.000000,Z=-1.261354),InterpMode=CIM_CurveAutoClamped),(InVal=519.992371,OutVal=(X=12936.954102,Y=-4990.650391,Z=-803.649170),ArriveTangent=(X=-214.823166,Y=32.794540,Z=0.000000),LeaveTangent=(X=-214.823166,Y=32.794540,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=524.007324,OutVal=(X=11751.980469,Y=-4922.458496,Z=-500.649200),ArriveTangent=(X=0.000000,Y=39.705151,Z=8.456768),LeaveTangent=(X=0.000000,Y=39.705151,Z=8.456768),InterpMode=CIM_CurveAutoClamped),(InVal=527.503296,OutVal=(X=12130.838867,Y=-4225.170898,Z=-487.649261),ArriveTangent=(X=118.598793,Y=178.934174,Z=0.000000),LeaveTangent=(X=118.598793,Y=178.934174,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=531.998840,OutVal=(X=12699.764648,Y=-3492.503174,Z=-487.649323),ArriveTangent=(X=54.015160,Y=12.883308,Z=-0.000035),LeaveTangent=(X=54.015160,Y=12.883308,Z=-0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=535.996704,OutVal=(X=12812.397461,Y=-3470.354004,Z=-504.649384),InterpMode=CIM_CurveAutoClamped),(InVal=541.005920,OutVal=(X=12119.884766,Y=-4115.962891,Z=-503.649506),ArriveTangent=(X=-88.831825,Y=-114.461533,Z=0.000000),LeaveTangent=(X=-88.831825,Y=-114.461533,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=544.987793,OutVal=(X=11899.495117,Y=-4499.487793,Z=-505.649567),ArriveTangent=(X=-82.020226,Y=-32.522728,Z=-0.784987),LeaveTangent=(X=-82.020226,Y=-32.522728,Z=-0.784987),InterpMode=CIM_CurveAutoClamped),(InVal=555.093201,OutVal=(X=10316.170898,Y=-4639.203125,Z=-524.649536),ArriveTangent=(X=-148.902191,Y=0.000000,Z=0.000000),LeaveTangent=(X=-148.902191,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=558.921631,OutVal=(X=9782.377930,Y=-4525.075195,Z=-507.150299),ArriveTangent=(X=-163.702759,Y=0.000000,Z=0.000000),LeaveTangent=(X=-163.702759,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=562.401672,OutVal=(X=9119.753906,Y=-5587.076172,Z=-536.649536),ArriveTangent=(X=-194.707291,Y=-194.540771,Z=0.000000),LeaveTangent=(X=-194.707291,Y=-194.540771,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=567.387085,OutVal=(X=8134.092285,Y=-6171.951172,Z=-475.649567),ArriveTangent=(X=-244.963104,Y=-1.026222,Z=0.000000),LeaveTangent=(X=-244.963104,Y=-1.026222,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=571.400879,OutVal=(X=6915.280273,Y=-6173.718750,Z=-501.649628),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.226379,OutVal=(X=0.000000,Y=0.000000,Z=-19.863281),InterpMode=CIM_CurveAutoClamped),(InVal=6.452757,OutVal=(X=0.000000,Y=-1.406250,Z=-4.218750),InterpMode=CIM_CurveAutoClamped),(InVal=9.456287,OutVal=(X=0.000000,Y=0.703125,Z=-24.960938),InterpMode=CIM_CurveAutoClamped),(InVal=13.880316,OutVal=(X=0.000000,Y=-13.710938,Z=-17.402344),ArriveTangent=(X=0.000000,Y=-2.618741,Z=3.817512),LeaveTangent=(X=0.000000,Y=-2.618741,Z=3.817512),InterpMode=CIM_CurveAutoClamped),(InVal=18.853695,OutVal=(X=0.000000,Y=-23.906250,Z=101.601563),InterpMode=CIM_CurveAutoClamped),(InVal=24.227697,OutVal=(X=0.000000,Y=-4.921875,Z=52.734375),ArriveTangent=(X=0.000000,Y=0.299824,Z=-7.822572),LeaveTangent=(X=0.000000,Y=0.299824,Z=-7.822572),InterpMode=CIM_CurveAutoClamped),(InVal=29.954384,OutVal=(X=0.000000,Y=-4.218750,Z=14.765625),InterpMode=CIM_CurveAutoClamped),(InVal=36.765846,OutVal=(X=0.000000,Y=-4.218750,Z=54.667969),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.319933),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.319933),InterpMode=CIM_CurveAutoClamped),(InVal=49.729595,OutVal=(X=0.000000,Y=-1.582031,Z=209.882813),InterpMode=CIM_CurveAutoClamped),(InVal=58.151089,OutVal=(X=0.000000,Y=-5.449219,Z=46.757813),ArriveTangent=(X=0.000000,Y=-0.348742,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.348742,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=66.363022,OutVal=(X=0.000000,Y=-7.382813,Z=156.796875),ArriveTangent=(X=0.000000,Y=-0.382603,Z=11.960085),LeaveTangent=(X=0.000000,Y=-0.382603,Z=11.960085),InterpMode=CIM_CurveAutoClamped),(InVal=73.597977,OutVal=(X=0.000000,Y=-11.425781,Z=231.503906),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.753108),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.753108),InterpMode=CIM_CurveAutoClamped),(InVal=77.744652,OutVal=(X=0.000000,Y=-10.019531,Z=290.566406),ArriveTangent=(X=0.000000,Y=0.000000,Z=15.949823),LeaveTangent=(X=0.000000,Y=0.000000,Z=15.949823),InterpMode=CIM_CurveAutoClamped),(InVal=81.477913,OutVal=(X=0.000000,Y=-11.425781,Z=357.187500),InterpMode=CIM_CurveAutoClamped),(InVal=85.467903,OutVal=(X=0.000000,Y=-2.109375,Z=350.507813),InterpMode=CIM_CurveAutoClamped),(InVal=89.909760,OutVal=(X=0.000000,Y=-11.425781,Z=357.187500),InterpMode=CIM_CurveAutoClamped),(InVal=94.178963,OutVal=(X=0.000000,Y=-3.691406,Z=286.699219),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.718909),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.718909),InterpMode=CIM_CurveAutoClamped),(InVal=98.723358,OutVal=(X=0.000000,Y=-12.656250,Z=227.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.483231),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.483231),InterpMode=CIM_CurveAutoClamped),(InVal=103.421257,OutVal=(X=0.000000,Y=-12.656250,Z=222.363281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.471762),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.471762),InterpMode=CIM_CurveAutoClamped),(InVal=107.804550,OutVal=(X=0.000000,Y=1.406250,Z=171.914063),ArriveTangent=(X=0.000000,Y=3.389969,Z=-16.642214),LeaveTangent=(X=0.000000,Y=3.389969,Z=-16.642214),InterpMode=CIM_CurveAutoClamped),(InVal=113.065979,OutVal=(X=0.000000,Y=20.039063,Z=57.480469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.253525),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.253525),InterpMode=CIM_CurveAutoClamped),(InVal=118.349754,OutVal=(X=0.000000,Y=-7.382813,Z=-62.753906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.144683),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.144683),InterpMode=CIM_CurveAutoClamped),(InVal=122.088257,OutVal=(X=0.000000,Y=-7.382813,Z=-74.355469),InterpMode=CIM_CurveAutoClamped),(InVal=126.852821,OutVal=(X=0.000000,Y=-5.800781,Z=-65.214844),ArriveTangent=(X=0.000000,Y=0.518579,Z=4.327771),LeaveTangent=(X=0.000000,Y=0.518579,Z=4.327771),InterpMode=CIM_CurveAutoClamped),(InVal=130.562439,OutVal=(X=0.000000,Y=-2.988281,Z=-10.898438),InterpMode=CIM_CurveAutoClamped),(InVal=134.543991,OutVal=(X=0.000000,Y=-2.988281,Z=-71.894531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-16.178818),LeaveTangent=(X=0.000000,Y=0.000000,Z=-16.178818),InterpMode=CIM_CurveAutoClamped),(InVal=138.559006,OutVal=(X=0.000000,Y=-2.988281,Z=-140.273438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.345775),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.345775),InterpMode=CIM_CurveAutoClamped),(InVal=142.523804,OutVal=(X=0.000000,Y=-2.988281,Z=-172.089844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.616633),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.616633),InterpMode=CIM_CurveAutoClamped),(InVal=146.528976,OutVal=(X=0.000000,Y=-4.570313,Z=-193.007813),InterpMode=CIM_CurveAutoClamped),(InVal=150.560745,OutVal=(X=0.000000,Y=-4.570313,Z=-57.656250),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.826590),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.826590),InterpMode=CIM_CurveAutoClamped),(InVal=156.533081,OutVal=(X=0.000000,Y=-4.570313,Z=-46.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.562028),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.562028),InterpMode=CIM_CurveAutoClamped),(InVal=160.568100,OutVal=(X=0.000000,Y=-6.679688,Z=33.574219),ArriveTangent=(X=0.000000,Y=-1.171339,Z=17.152916),LeaveTangent=(X=0.000000,Y=-1.171339,Z=17.152916),InterpMode=CIM_CurveAutoClamped),(InVal=164.516190,OutVal=(X=0.000000,Y=-27.421875,Z=90.527344),ArriveTangent=(X=0.000000,Y=0.000000,Z=21.665092),LeaveTangent=(X=0.000000,Y=0.000000,Z=21.665092),InterpMode=CIM_CurveAutoClamped),(InVal=170.098572,OutVal=(X=0.000000,Y=-1.582031,Z=264.023438),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.365034),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.365034),InterpMode=CIM_CurveAutoClamped),(InVal=175.791443,OutVal=(X=0.000000,Y=-1.582031,Z=299.003906),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.610813),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.610813),InterpMode=CIM_CurveAutoClamped),(InVal=182.117233,OutVal=(X=0.000000,Y=14.238281,Z=343.476563),ArriveTangent=(X=0.000000,Y=1.686021,Z=13.580554),LeaveTangent=(X=0.000000,Y=1.686021,Z=13.580554),InterpMode=CIM_CurveAutoClamped),(InVal=188.154022,OutVal=(X=0.000000,Y=20.566406,Z=519.785156),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.134932),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.134932),InterpMode=CIM_CurveAutoClamped),(InVal=193.261765,OutVal=(X=0.000000,Y=0.878906,Z=524.531250),InterpMode=CIM_CurveAutoClamped),(InVal=198.539352,OutVal=(X=0.000000,Y=0.878906,Z=512.050781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.822877),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.822877),InterpMode=CIM_CurveAutoClamped),(InVal=204.034515,OutVal=(X=0.000000,Y=0.878906,Z=494.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.121781),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.121781),InterpMode=CIM_CurveAutoClamped),(InVal=208.011765,OutVal=(X=0.000000,Y=18.632813,Z=463.535156),ArriveTangent=(X=0.000000,Y=1.739766,Z=-4.634978),LeaveTangent=(X=0.000000,Y=1.739766,Z=-4.634978),InterpMode=CIM_CurveAutoClamped),(InVal=213.649185,OutVal=(X=0.000000,Y=23.203125,Z=448.945313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.920101),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.920101),InterpMode=CIM_CurveAutoClamped),(InVal=220.767700,OutVal=(X=0.000000,Y=4.746094,Z=360.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.938437),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.938437),InterpMode=CIM_CurveAutoClamped),(InVal=226.746277,OutVal=(X=0.000000,Y=4.746094,Z=305.683594),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.741414),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.741414),InterpMode=CIM_CurveAutoClamped),(InVal=232.350494,OutVal=(X=0.000000,Y=4.746094,Z=259.453125),InterpMode=CIM_CurveAutoClamped),(InVal=237.900970,OutVal=(X=0.000000,Y=4.746094,Z=332.578125),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.356096),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.356096),InterpMode=CIM_CurveAutoClamped),(InVal=243.296478,OutVal=(X=0.000000,Y=4.746094,Z=354.902344),InterpMode=CIM_CurveAutoClamped),(InVal=244.941864,OutVal=(X=0.000000,Y=4.746094,Z=330.644531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.802016),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.802016),InterpMode=CIM_CurveAutoClamped),(InVal=250.507065,OutVal=(X=0.000000,Y=-12.656250,Z=313.066406),InterpMode=CIM_CurveAutoClamped),(InVal=256.126038,OutVal=(X=0.000000,Y=7.910156,Z=449.472656),InterpMode=CIM_CurveAutoClamped),(InVal=261.661621,OutVal=(X=0.000000,Y=-7.031250,Z=366.328125),InterpMode=CIM_CurveAutoClamped),(InVal=266.904388,OutVal=(X=0.000000,Y=-5.976563,Z=446.660156),ArriveTangent=(X=0.000000,Y=0.371554,Z=10.886646),LeaveTangent=(X=0.000000,Y=0.371554,Z=10.886646),InterpMode=CIM_CurveAutoClamped),(InVal=272.964172,OutVal=(X=0.000000,Y=-1.230469,Z=489.375000),InterpMode=CIM_CurveAutoClamped),(InVal=280.226288,OutVal=(X=0.000000,Y=-5.976563,Z=406.757813),InterpMode=CIM_CurveAutoClamped),(InVal=286.905243,OutVal=(X=0.000000,Y=-4.394531,Z=480.234375),ArriveTangent=(X=0.000000,Y=0.580316,Z=14.505679),LeaveTangent=(X=0.000000,Y=0.580316,Z=14.505679),InterpMode=CIM_CurveAutoClamped),(InVal=292.647339,OutVal=(X=0.000000,Y=22.851563,Z=586.933594),ArriveTangent=(X=0.000000,Y=0.000000,Z=20.037966),LeaveTangent=(X=0.000000,Y=0.000000,Z=20.037966),InterpMode=CIM_CurveAutoClamped),(InVal=303.108521,OutVal=(X=0.000000,Y=-0.703125,Z=805.253906),InterpMode=CIM_CurveAutoClamped),(InVal=307.738190,OutVal=(X=0.000000,Y=11.953125,Z=627.363281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.570837),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.570837),InterpMode=CIM_CurveAutoClamped),(InVal=311.913910,OutVal=(X=0.000000,Y=-3.515625,Z=622.792969),InterpMode=CIM_CurveAutoClamped),(InVal=316.907196,OutVal=(X=0.000000,Y=5.625000,Z=685.371094),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.471668),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.471668),InterpMode=CIM_CurveAutoClamped),(InVal=322.402710,OutVal=(X=0.000000,Y=-10.195313,Z=700.488281),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.922115),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.922115),InterpMode=CIM_CurveAutoClamped),(InVal=327.554718,OutVal=(X=0.000000,Y=-5.273438,Z=716.484375),ArriveTangent=(X=0.000000,Y=1.449482,Z=3.416636),LeaveTangent=(X=0.000000,Y=1.449482,Z=3.416636),InterpMode=CIM_CurveAutoClamped),(InVal=332.589539,OutVal=(X=0.000000,Y=4.570313,Z=735.292969),InterpMode=CIM_CurveAutoClamped),(InVal=339.184082,OutVal=(X=0.000000,Y=-2.812500,Z=658.125000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.240954),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.240954),InterpMode=CIM_CurveAutoClamped),(InVal=344.748260,OutVal=(X=0.000000,Y=7.031250,Z=638.437500),InterpMode=CIM_CurveAutoClamped),(InVal=350.202698,OutVal=(X=0.000000,Y=7.031250,Z=639.140625),InterpMode=CIM_CurveAutoClamped),(InVal=355.060303,OutVal=(X=0.000000,Y=17.929688,Z=627.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.730700),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.730700),InterpMode=CIM_CurveAutoClamped),(InVal=359.623505,OutVal=(X=0.000000,Y=16.523438,Z=572.343750),ArriveTangent=(X=0.000000,Y=-0.571995,Z=-7.752639),LeaveTangent=(X=0.000000,Y=-0.571995,Z=-7.752639),InterpMode=CIM_CurveAutoClamped),(InVal=364.746063,OutVal=(X=0.000000,Y=10.371094,Z=548.964844),ArriveTangent=(X=0.000000,Y=-1.826228,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.826228,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=370.045258,OutVal=(X=0.000000,Y=-2.812500,Z=580.078125),InterpMode=CIM_CurveAutoClamped),(InVal=374.991180,OutVal=(X=0.000000,Y=15.292969,Z=544.042969),InterpMode=CIM_CurveAutoClamped),(InVal=379.878204,OutVal=(X=0.000000,Y=-9.316406,Z=669.550781),ArriveTangent=(X=0.000000,Y=0.000000,Z=31.018951),LeaveTangent=(X=0.000000,Y=0.000000,Z=31.018951),InterpMode=CIM_CurveAutoClamped),(InVal=384.845917,OutVal=(X=0.000000,Y=-5.800781,Z=849.726563),ArriveTangent=(X=0.000000,Y=1.535348,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.535348,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=389.850708,OutVal=(X=0.000000,Y=23.027344,Z=811.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.795210),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.795210),InterpMode=CIM_CurveAutoClamped),(InVal=394.855530,OutVal=(X=0.000000,Y=9.316406,Z=791.718750),ArriveTangent=(X=0.000000,Y=-2.343199,Z=-7.058952),LeaveTangent=(X=0.000000,Y=-2.343199,Z=-7.058952),InterpMode=CIM_CurveAutoClamped),(InVal=399.978088,OutVal=(X=0.000000,Y=-0.703125,Z=724.218750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.480494),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.480494),InterpMode=CIM_CurveAutoClamped),(InVal=405.007355,OutVal=(X=0.000000,Y=-0.703125,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=410.012146,OutVal=(X=0.000000,Y=-0.703125,Z=757.089844),InterpMode=CIM_CurveAutoClamped),(InVal=415.016968,OutVal=(X=0.000000,Y=-19.687500,Z=725.625000),InterpMode=CIM_CurveAutoClamped),(InVal=420.051178,OutVal=(X=0.000000,Y=-17.226563,Z=899.824219),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.117842),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.117842),InterpMode=CIM_CurveAutoClamped),(InVal=425.085419,OutVal=(X=0.000000,Y=-27.421875,Z=902.109375),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.108219),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.108219),InterpMode=CIM_CurveAutoClamped),(InVal=430.016235,OutVal=(X=0.000000,Y=-22.675781,Z=990.527344),ArriveTangent=(X=0.000000,Y=0.765292,Z=15.394835),LeaveTangent=(X=0.000000,Y=0.765292,Z=15.394835),InterpMode=CIM_CurveAutoClamped),(InVal=434.962158,OutVal=(X=0.000000,Y=-19.863281,Z=1054.160156),ArriveTangent=(X=0.000000,Y=0.686912,Z=12.558152),LeaveTangent=(X=0.000000,Y=0.686912,Z=12.558152),InterpMode=CIM_CurveAutoClamped),(InVal=439.996368,OutVal=(X=0.000000,Y=-15.820313,Z=1115.859375),InterpMode=CIM_CurveAutoClamped),(InVal=445.001160,OutVal=(X=0.000000,Y=-15.820313,Z=955.195313),InterpMode=CIM_CurveAutoClamped),(InVal=449.974182,OutVal=(X=0.000000,Y=-15.820313,Z=978.925781),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.586531),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.586531),InterpMode=CIM_CurveAutoClamped),(InVal=455.126160,OutVal=(X=0.000000,Y=-20.214844,Z=1108.125000),InterpMode=CIM_CurveAutoClamped),(InVal=459.954346,OutVal=(X=0.000000,Y=-10.371094,Z=1094.941406),ArriveTangent=(X=0.000000,Y=1.398436,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.398436,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=465.012268,OutVal=(X=0.000000,Y=-5.976563,Z=1113.398438),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.517410),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.517410),InterpMode=CIM_CurveAutoClamped),(InVal=469.958191,OutVal=(X=0.000000,Y=-5.976563,Z=1150.136719),InterpMode=CIM_CurveAutoClamped),(InVal=475.051300,OutVal=(X=0.000000,Y=2.109375,Z=1084.921875),ArriveTangent=(X=0.000000,Y=1.223520,Z=-12.829481),LeaveTangent=(X=0.000000,Y=1.223520,Z=-12.829481),InterpMode=CIM_CurveAutoClamped),(InVal=480.014984,OutVal=(X=0.000000,Y=6.328125,Z=1021.113281),InterpMode=CIM_CurveAutoClamped),(InVal=483.002686,OutVal=(X=0.000000,Y=4.746094,Z=1050.468750),ArriveTangent=(X=0.000000,Y=-0.676222,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.676222,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=485.993744,OutVal=(X=0.000000,Y=2.285156,Z=912.480469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.091805),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.091805),InterpMode=CIM_CurveAutoClamped),(InVal=490.007050,OutVal=(X=0.000000,Y=9.140625,Z=901.054688),InterpMode=CIM_CurveAutoClamped),(InVal=494.520264,OutVal=(X=0.000000,Y=-8.613281,Z=998.085938),InterpMode=CIM_CurveAutoClamped),(InVal=500.005493,OutVal=(X=0.000000,Y=-5.976563,Z=936.386719),ArriveTangent=(X=0.000000,Y=0.952183,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.952183,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=504.484283,OutVal=(X=0.000000,Y=3.164063,Z=1017.070313),ArriveTangent=(X=0.000000,Y=3.209253,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.209253,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=507.509430,OutVal=(X=0.000000,Y=18.105469,Z=1016.542969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.140476),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.140476),InterpMode=CIM_CurveAutoClamped),(InVal=511.992218,OutVal=(X=0.000000,Y=-1.933594,Z=1016.015625),InterpMode=CIM_CurveAutoClamped),(InVal=516.007019,OutVal=(X=0.000000,Y=4.218750,Z=1181.953125),ArriveTangent=(X=0.000000,Y=1.560029,Z=24.957207),LeaveTangent=(X=0.000000,Y=1.560029,Z=24.957207),InterpMode=CIM_CurveAutoClamped),(InVal=519.992371,OutVal=(X=0.000000,Y=10.546875,Z=1239.785156),InterpMode=CIM_CurveAutoClamped),(InVal=524.007324,OutVal=(X=0.000000,Y=10.371094,Z=1204.453125),ArriveTangent=(X=0.000000,Y=-0.111714,Z=-14.691176),LeaveTangent=(X=0.000000,Y=-0.111714,Z=-14.691176),InterpMode=CIM_CurveAutoClamped),(InVal=527.503296,OutVal=(X=0.000000,Y=0.703125,Z=1126.406250),ArriveTangent=(X=0.000000,Y=-1.869658,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.869658,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=531.998840,OutVal=(X=0.000000,Y=-4.570313,Z=1210.781250),ArriveTangent=(X=0.000000,Y=-0.993417,Z=19.619995),LeaveTangent=(X=0.000000,Y=-0.993417,Z=19.619995),InterpMode=CIM_CurveAutoClamped),(InVal=535.996704,OutVal=(X=0.000000,Y=-7.734375,Z=1293.046875),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.092760),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.092760),InterpMode=CIM_CurveAutoClamped),(InVal=541.005920,OutVal=(X=0.000000,Y=8.789063,Z=1295.156250),InterpMode=CIM_CurveAutoClamped),(InVal=544.987793,OutVal=(X=0.000000,Y=4.746094,Z=1294.804688),ArriveTangent=(X=0.000000,Y=-1.196326,Z=-0.155199),LeaveTangent=(X=0.000000,Y=-1.196326,Z=-0.155199),InterpMode=CIM_CurveAutoClamped),(InVal=555.093201,OutVal=(X=0.000000,Y=-9.316406,Z=1283.554688),InterpMode=CIM_CurveAutoClamped),(InVal=558.921631,OutVal=(X=0.000000,Y=8.217773,Z=1311.657715),InterpMode=CIM_CurveAutoClamped),(InVal=562.401672,OutVal=(X=0.000000,Y=5.273438,Z=1297.441406),ArriveTangent=(X=0.000000,Y=-0.846155,Z=-5.693645),LeaveTangent=(X=0.000000,Y=-0.846155,Z=-5.693645),InterpMode=CIM_CurveAutoClamped),(InVal=567.387085,OutVal=(X=0.000000,Y=1.054688,Z=1260.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.680743),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.680743),InterpMode=CIM_CurveAutoClamped),(InVal=571.400879,OutVal=(X=0.000000,Y=19.335938,Z=1244.882813),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.226379),(Time=6.452757),(Time=9.456287),(Time=13.880316),(Time=18.853695),(Time=24.227697),(Time=29.954384),(Time=36.765846),(Time=49.729595),(Time=58.151089),(Time=66.363022),(Time=73.597977),(Time=77.744652),(Time=81.477913),(Time=85.467903),(Time=89.909760),(Time=94.178963),(Time=98.723358),(Time=103.421257),(Time=107.804550),(Time=113.065979),(Time=118.349754),(Time=122.088257),(Time=126.852821),(Time=130.562439),(Time=134.543991),(Time=138.559006),(Time=142.523804),(Time=146.528976),(Time=150.560745),(Time=156.533081),(Time=160.568100),(Time=164.516190),(Time=170.098572),(Time=175.791443),(Time=182.117233),(Time=188.154022),(Time=193.261765),(Time=198.539352),(Time=204.034515),(Time=208.011765),(Time=213.649185),(Time=220.767700),(Time=226.746277),(Time=232.350494),(Time=237.900970),(Time=243.296478),(Time=244.941864),(Time=250.507065),(Time=256.126038),(Time=261.661621),(Time=266.904388),(Time=272.964172),(Time=280.226288),(Time=286.905243),(Time=292.647339),(Time=303.108521),(Time=307.738190),(Time=311.913910),(Time=316.907196),(Time=322.402710),(Time=327.554718),(Time=332.589539),(Time=339.184082),(Time=344.748260),(Time=350.202698),(Time=355.060303),(Time=359.623505),(Time=364.746063),(Time=370.045258),(Time=374.991180),(Time=379.878204),(Time=384.845917),(Time=389.850708),(Time=394.855530),(Time=399.978088),(Time=405.007355),(Time=410.012146),(Time=415.016968),(Time=420.051178),(Time=425.085419),(Time=430.016235),(Time=434.962158),(Time=439.996368),(Time=445.001160),(Time=449.974182),(Time=455.126160),(Time=459.954346),(Time=465.012268),(Time=469.958191),(Time=475.051300),(Time=480.014984),(Time=483.002686),(Time=485.993744),(Time=490.007050),(Time=494.520264),(Time=500.005493),(Time=504.484283),(Time=507.509430),(Time=511.992218),(Time=516.007019),(Time=519.992371),(Time=524.007324),(Time=527.503296),(Time=531.998840),(Time=535.996704),(Time=541.005920),(Time=544.987793),(Time=555.093201),(Time=558.921631),(Time=562.401672),(Time=567.387085),(Time=571.400879)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_2'
      GroupName="FlyCam"
      GroupColor=(B=173,G=0,R=167,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=571.546204
   InterpGroups(0)=InterpGroup'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_2'
   CurveEdSetup=InterpCurveEdSetup'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=-48
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=CameraActor'KF-Outpost.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1732
   ObjPosY=-71
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="PFT"
   EventDesc="Performance Fly Through"
   MaxWidth=144
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2216,OverrideDelta=40)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2288
   ObjPosY=-184
   ObjComment="Performance Fly Through"
   DrawWidth=92
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
   ConsoleEventName="STOP_PFT"
   EventDesc="Stop Performance Fly Through"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=82,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2210,OverrideDelta=62)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2304
   ObjPosY=16
   ObjComment="Stop Performance Fly Through"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_Console_2"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-438,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-438,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-1992,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2056
   ObjPosY=-472
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-362,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-362,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-1715,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1779
   ObjPosY=-396
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0'),(LinkedOp=SeqAct_ConsoleCommand'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-322,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2220,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2315
   ObjPosY=-388
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1920
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2136
   ObjPosY=-1560
   ObjComment="Child - NEW"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3480
   ObjPosY=-1832
   ObjComment="Child - NEW"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=556
   SizeY=451
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=-2200
   ObjComment="CIC Pit"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_9
   SizeX=517
   SizeY=312
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=-1376
   ObjComment="Staircase"
   Name="SequenceFrameWrapped_9"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=357,OverrideDelta=14)
   InputLinks(1)=(DrawY=378,OverrideDelta=35)
   InputLinks(2)=(DrawY=399,OverrideDelta=56)
   OutputLinks(0)=(DrawY=378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1120
   ObjPosY=584
   ObjComment="Courtyard Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=600
   ObjComment="Courtyard Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=624
   ObjComment="Courtyard Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-832
   ObjPosY=576
   ObjComment="Courtyard Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-744
   ObjPosY=600
   ObjComment="Courtyard Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-656
   ObjPosY=624
   ObjComment="Courtyard Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1)),DrawY=546,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1760,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1690,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=480
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=413,OverrideDelta=14)
   InputLinks(1)=(DrawY=434,ActivateDelay=20.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=455,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=434,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-1370,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1319,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1270,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=688
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=544
   ObjComment="Court Yard Spawn Points"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=792
   ObjComment="Helipad Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1464
   ObjPosY=816
   ObjComment="Helipad Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=840
   ObjComment="Helipad Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1280
   ObjPosY=776
   ObjComment="Helipad Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=800
   ObjComment="Helipad Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFPlayerStart'KF-Outpost.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1104
   ObjPosY=832
   ObjComment="Helipad Spawns"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_10
   SizeX=680
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=752
   ObjComment="Helipad Spawns"
   Name="SequenceFrameWrapped_10"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=309,OverrideDelta=14)
   InputLinks(1)=(DrawY=330,OverrideDelta=35)
   InputLinks(2)=(DrawY=351,OverrideDelta=56)
   OutputLinks(0)=(DrawY=330,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-1730,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1679,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=-1630,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1768
   ObjPosY=272
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=237,OverrideDelta=14)
   OutputLinks(1)=(DrawY=258,OverrideDelta=35)
   OutputLinks(2)=(DrawY=279,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2016
   ObjPosY=168
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   ClassProximityTypes(0)=Class'KFGame.KFPawn_Human'
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-954,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-933,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-912,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3186,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3100
   ObjPosY=-1023
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-1018,OverrideDelta=14)
   InputLinks(1)=(DrawY=-997,OverrideDelta=35)
   InputLinks(2)=(DrawY=-976,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-997,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=3434,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3485,OverrideDelta=76)
   EventLinks(0)=(DrawX=3534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3396
   ObjPosY=-1055
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3396
   ObjPosY=-871
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFSpawner'KF-Outpost.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3516
   ObjPosY=-895
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_12
   SizeX=600
   SizeY=368
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-1112
   ObjComment="Top of Ramp"
   Name="SequenceFrameWrapped_12"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-2123,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2102,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2081,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=374,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=-2192
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="MetalDetectorEntranceLeftActivated"
   InputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=738,OverrideDelta=178)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=-2160
   DrawWidth=421
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=777
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=200
   ObjPosY=-2216
   ObjComment="Metal Detector Entrance Left"
   DrawWidth=777
   DrawHeight=236
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-1771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1729,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=366,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=-1840
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="MetalDetectorEntranceRightActivated"
   InputLinks(0)=(DrawY=-1766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1766,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=742,OverrideDelta=182)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=-1800
   DrawWidth=428
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=792
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=192
   ObjPosY=-1864
   ObjComment="Metal Detector Entrance Right"
   DrawWidth=792
   DrawHeight=236
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-Outpost.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-1451,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1430,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1409,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=374,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=-1520
   ObjName="TriggerVolume_15 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="MetalDetectorCICActivated"
   InputLinks(0)=(DrawY=-1438,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1438,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=787,OverrideDelta=147)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-1472
   DrawWidth=359
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=795
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=200
   ObjPosY=-1544
   ObjComment="Metal Detector CIC"
   DrawWidth=795
   DrawHeight=236
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=-1920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=-1600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=-1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
