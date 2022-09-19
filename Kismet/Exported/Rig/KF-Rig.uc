Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-9368,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-9280
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   PlayRate=1.500000
   ConstantCameraAnimRate=3.700000
   InputLinks(0)=(DrawY=-9626,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9604,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9582,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9560,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9538,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2')),DrawY=-9610,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9554,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-9196,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="Camera",MinVars=0,DrawX=-9140,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-9664
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Tabs(0)=(Curves=((CurveObject=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_0',CurveColor=(B=0,G=191,R=145,A=255),CurveName="Camera_TX"),(CurveObject=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_1',CurveColor=(B=0,G=191,R=145,A=255),CurveName="Camera_TY"),(CurveObject=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_2',CurveColor=(B=0,G=191,R=145,A=255),CurveName="Camera_TZ")),ViewStartInput=458.875214,ViewEndInput=6637.561035,ViewStartOutput=-3.232708,ViewEndOutput=2.421946)
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_0
            LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000),(Time=15.000000),(Time=17.500000),(Time=17.500000),(Time=20.000000),(Time=25.000000),(Time=27.500000),(Time=30.000000),(Time=35.000000),(Time=40.000000),(Time=45.000000),(Time=50.000000),(Time=55.000000),(Time=60.000000),(Time=65.000000),(Time=70.000000),(Time=75.000000),(Time=80.000000),(Time=85.000000),(Time=87.500000),(Time=90.000000),(Time=95.000000),(Time=97.500000),(Time=100.000000),(Time=105.000000),(Time=110.000000),(Time=115.000000),(Time=120.000000),(Time=125.000000),(Time=130.000000),(Time=130.000000),(Time=135.000000),(Time=140.000000),(Time=145.000000),(Time=145.000000),(Time=150.000000),(Time=155.000000),(Time=160.000000),(Time=162.500000),(Time=165.000000),(Time=170.000000),(Time=175.000000),(Time=180.000000),(Time=182.500000),(Time=185.000000),(Time=187.500000),(Time=190.000000),(Time=192.000000),(Time=195.000000),(Time=198.500000),(Time=200.000000),(Time=203.000000),(Time=205.000000),(Time=207.000000),(Time=209.500000),(Time=210.000000),(Time=212.000000),(Time=215.000000),(Time=220.000000),(Time=225.000000),(Time=230.500000),(Time=235.000000),(Time=237.000000),(Time=240.000000),(Time=241.500000),(Time=245.000000),(Time=246.500000),(Time=249.000000),(Time=250.000000),(Time=252.000000),(Time=254.000000),(Time=255.000000),(Time=260.000000),(Time=263.000000),(Time=265.000000),(Time=268.000000),(Time=270.000000),(Time=271.000000),(Time=273.500000),(Time=275.000000),(Time=276.000000),(Time=279.000000),(Time=280.000000),(Time=285.000000),(Time=287.500000),(Time=290.000000),(Time=295.000000),(Time=300.000000),(Time=305.000000),(Time=310.000000),(Time=315.000000),(Time=320.000000),(Time=325.000000),(Time=326.500000),(Time=328.500000),(Time=330.000000),(Time=331.500000),(Time=332.000000),(Time=333.500000),(Time=335.000000),(Time=340.000000),(Time=345.000000),(Time=347.000000),(Time=350.000000),(Time=353.500000),(Time=355.000000),(Time=356.500000),(Time=359.000000),(Time=360.000000),(Time=361.500000),(Time=365.000000),(Time=366.000000),(Time=366.500000),(Time=370.000000),(Time=375.000000),(Time=376.500000),(Time=377.500000),(Time=380.000000),(Time=385.000000),(Time=390.000000),(Time=395.000000),(Time=400.000000),(Time=405.000000),(Time=407.500000),(Time=410.000000),(Time=415.000000),(Time=420.000000),(Time=425.000000),(Time=428.000000),(Time=430.000000),(Time=435.000000),(Time=437.000000),(Time=440.000000),(Time=445.000000),(Time=450.000000),(Time=451.500000),(Time=455.000000),(Time=457.000000),(Time=460.000000),(Time=465.000000),(Time=467.500000),(Time=470.000000),(Time=475.000000),(Time=480.000000),(Time=485.000000),(Time=487.000000),(Time=490.000000),(Time=495.000000),(Time=498.000000),(Time=500.000000),(Time=503.000000),(Time=505.000000),(Time=510.000000),(Time=511.500000),(Time=515.000000),(Time=520.000000),(Time=525.000000),(Time=530.000000),(Time=535.000000),(Time=540.000000),(Time=541.500000),(Time=545.000000),(Time=547.500000),(Time=550.000000),(Time=553.000000),(Time=555.000000),(Time=557.500000),(Time=560.000000),(Time=565.000000),(Time=570.000000),(Time=575.000000),(Time=578.500000),(Time=580.000000),(Time=581.500000),(Time=585.000000),(Time=588.500000),(Time=590.000000),(Time=592.000000),(Time=595.000000),(Time=600.000000),(Time=603.000000),(Time=605.000000),(Time=606.500000),(Time=608.500000),(Time=610.000000),(Time=613.000000),(Time=614.500000),(Time=615.000000),(Time=616.500000),(Time=620.000000),(Time=625.000000),(Time=628.000000),(Time=630.000000),(Time=635.000000),(Time=640.000000),(Time=645.000000),(Time=650.000000),(Time=655.000000),(Time=660.000000),(Time=665.000000),(Time=670.000000),(Time=672.500000),(Time=675.000000),(Time=676.500000),(Time=680.000000),(Time=685.000000),(Time=690.000000),(Time=690.000000),(Time=695.000000),(Time=698.000000),(Time=700.000000),(Time=705.000000),(Time=706.500000),(Time=709.000000),(Time=710.000000),(Time=711.500000),(Time=715.000000),(Time=716.500000),(Time=718.500000),(Time=720.000000),(Time=725.000000),(Time=727.000000),(Time=728.500000),(Time=729.500000),(Time=730.000000),(Time=735.000000),(Time=736.000000),(Time=740.000000),(Time=745.000000),(Time=746.000000),(Time=747.000000),(Time=748.000000),(Time=750.000000),(Time=755.000000),(Time=760.000000),(Time=765.000000),(Time=770.000000),(Time=775.000000),(Time=780.000000),(Time=785.000000),(Time=787.000000),(Time=788.000000),(Time=790.000000),(Time=795.000000),(Time=800.000000),(Time=805.000000),(Time=810.000000),(Time=815.000000),(Time=820.000000),(Time=825.000000),(Time=830.000000),(Time=835.000000),(Time=840.000000),(Time=845.000000),(Time=850.000000),(Time=855.000000),(Time=857.500000),(Time=860.000000),(Time=863.500000),(Time=865.000000),(Time=870.000000),(Time=875.000000),(Time=880.000000),(Time=885.000000),(Time=890.000000),(Time=895.000000),(Time=900.000000),(Time=905.000000),(Time=910.000000),(Time=913.500000),(Time=915.000000),(Time=920.000000),(Time=925.000000),(Time=928.500000),(Time=930.000000),(Time=935.000000),(Time=940.000000),(Time=945.000000),(Time=950.000000),(Time=951.500000),(Time=955.000000),(Time=957.000000),(Time=960.000000),(Time=963.000000),(Time=965.000000),(Time=967.000000),(Time=968.500000),(Time=970.000000),(Time=972.000000),(Time=975.000000),(Time=979.000000),(Time=980.000000),(Time=985.000000),(Time=990.000000),(Time=995.000000),(Time=1000.000000),(Time=1005.000000),(Time=1010.000000),(Time=1015.000000),(Time=1020.000000),(Time=1025.000000),(Time=1030.000000),(Time=1035.000000),(Time=1038.500000),(Time=1040.000000),(Time=1041.500000),(Time=1043.500000),(Time=1045.000000),(Time=1046.500000),(Time=1050.000000),(Time=1055.000000),(Time=1060.000000),(Time=1065.000000),(Time=1067.000000),(Time=1070.000000),(Time=1074.000000),(Time=1075.000000),(Time=1080.000000),(Time=1085.000000),(Time=1090.000000),(Time=1093.500000),(Time=1095.000000),(Time=1100.000000),(Time=1105.000000),(Time=1106.000000),(Time=1107.000000),(Time=1110.000000),(Time=1115.000000),(Time=1118.000000),(Time=1120.000000),(Time=1125.000000),(Time=1130.000000),(Time=1135.000000),(Time=1140.000000),(Time=1145.000000),(Time=1146.500000),(Time=1148.500000),(Time=1151.000000),(Time=1153.500000),(Time=1155.000000),(Time=1160.000000),(Time=1165.000000),(Time=1167.500000),(Time=1170.000000),(Time=1175.000000),(Time=1178.000000),(Time=1180.000000),(Time=1182.000000),(Time=1184.000000),(Time=1185.000000),(Time=1190.000000),(Time=1192.500000),(Time=1195.000000),(Time=1200.000000),(Time=1205.000000),(Time=1210.000000),(Time=1215.000000),(Time=1220.000000),(Time=1225.000000),(Time=1230.000000),(Time=1235.000000),(Time=1240.000000),(Time=1245.000000),(Time=1250.000000),(Time=1255.000000),(Time=1260.000000),(Time=1265.000000),(Time=1270.000000),(Time=1275.000000),(Time=1280.000000),(Time=1282.500000),(Time=1284.000000),(Time=1285.000000),(Time=1290.000000),(Time=1292.500000),(Time=1295.000000),(Time=1300.000000)))
            FloatTrack=(Points=((OutVal=160.000244,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=-2080.000488,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=-2080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-3360.000000,ArriveTangent=-274.666809,LeaveTangent=-274.666809,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=-4140.000977,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=-4140.000977,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=-4960.000000,ArriveTangent=-322.666595,LeaveTangent=-322.666595,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=-6560.000488,ArriveTangent=-326.176300,LeaveTangent=-326.176300,InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=-7406.322266,ArriveTangent=-374.400299,LeaveTangent=-374.400299,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=-8432.001953,ArriveTangent=-258.357422,LeaveTangent=-258.357422,InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,OutVal=-9344.002930,ArriveTangent=-129.858398,LeaveTangent=-129.858398,InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,OutVal=-9760.000977,ArriveTangent=-132.588699,LeaveTangent=-132.588699,InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=-10720.003906,ArriveTangent=-192.000290,LeaveTangent=-192.000290,InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=-11680.003906,ArriveTangent=-160.000198,LeaveTangent=-160.000198,InterpMode=CIM_CurveAutoClamped),(InVal=55.000000,OutVal=-12320.005859,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=-12320.007813,InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=-11408.010742,ArriveTangent=176.799713,LeaveTangent=176.799713,InterpMode=CIM_CurveAutoClamped),(InVal=70.000000,OutVal=-10552.010742,ArriveTangent=213.599701,LeaveTangent=213.599701,InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=-9272.013672,ArriveTangent=130.506821,LeaveTangent=130.506821,InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=-8920.014648,InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=-8976.017578,InterpMode=CIM_CurveAutoClamped),(InVal=87.500000,OutVal=-7871.990234,ArriveTangent=272.443878,LeaveTangent=272.443878,InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=-7472.015625,ArriveTangent=13.592087,LeaveTangent=13.592087,InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,OutVal=-7448.018555,InterpMode=CIM_CurveAutoClamped),(InVal=97.500000,OutVal=-7930.057617,ArriveTangent=-275.200378,LeaveTangent=-275.200378,InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=-8824.020508,ArriveTangent=-179.995178,LeaveTangent=-179.995178,InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=-9280.021484,ArriveTangent=-93.600296,LeaveTangent=-93.600296,InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=-9760.023438,InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=-9360.025391,ArriveTangent=63.999611,LeaveTangent=63.999611,InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=-9120.027344,InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,OutVal=-9680.029297,ArriveTangent=-104.000389,LeaveTangent=-104.000389,InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=-10160.031250),(InVal=130.000000,OutVal=-10160.031250,InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=-10160.033203,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=-10560.035156,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=-10560.037109),(InVal=145.000000,OutVal=-10560.037109,InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=-10080.039063,InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=-10080.041016,InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=-9600.043945,ArriveTangent=131.193497,LeaveTangent=131.193497,InterpMode=CIM_CurveAutoClamped),(InVal=162.500000,OutVal=-9096.089844,ArriveTangent=191.999603,LeaveTangent=191.999603,InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=-8640.045898,ArriveTangent=188.595459,LeaveTangent=188.595459,InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=-7680.049316,ArriveTangent=247.999603,LeaveTangent=247.999603,InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=-6160.049805,ArriveTangent=295.999847,LeaveTangent=295.999847,InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=-4720.050781,ArriveTangent=40.919022,LeaveTangent=40.919022,InterpMode=CIM_CurveAutoClamped),(InVal=182.500000,OutVal=-4665.992188,ArriveTangent=51.509964,LeaveTangent=51.509964,InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=-3360.051758,ArriveTangent=387.446838,LeaveTangent=387.446838,InterpMode=CIM_CurveAutoClamped),(InVal=187.500000,OutVal=-2720.337646,ArriveTangent=239.999908,LeaveTangent=239.999908,InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=-2160.052246,ArriveTangent=231.499130,LeaveTangent=231.499130,InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=-1678.591553,ArriveTangent=191.999924,LeaveTangent=191.999924,InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=-1200.052612,InterpMode=CIM_CurveAutoClamped),(InVal=198.500000,OutVal=-2160.098633,ArriveTangent=-304.000061,LeaveTangent=-304.000061,InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=-2720.052979,ArriveTangent=-284.938599,LeaveTangent=-284.938599,InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=-3442.322266,ArriveTangent=-256.000153,LeaveTangent=-256.000153,InterpMode=CIM_CurveAutoClamped),(InVal=205.000000,OutVal=-4000.053711,ArriveTangent=-305.250000,LeaveTangent=-305.250000,InterpMode=CIM_CurveAutoClamped),(InVal=207.000000,OutVal=-4663.322266,ArriveTangent=-320.457886,LeaveTangent=-320.457886,InterpMode=CIM_CurveAutoClamped),(InVal=209.500000,OutVal=-5442.114258,ArriveTangent=-312.244476,LeaveTangent=-312.244476,InterpMode=CIM_CurveAutoClamped),(InVal=210.000000,OutVal=-5600.055664,ArriveTangent=-18.033737,LeaveTangent=-18.033737,InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=-5611.317871,ArriveTangent=-12.097618,LeaveTangent=-12.097618,InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=-6240.057129,ArriveTangent=-268.044891,LeaveTangent=-268.044891,InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=-7840.059082,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,OutVal=-7840.061035,ArriveTangent=-0.000372,LeaveTangent=-0.000372,InterpMode=CIM_CurveAutoClamped),(InVal=230.500000,OutVal=-7840.062988,ArriveTangent=-0.000293,LeaveTangent=-0.000293,InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,OutVal=-7840.063965,InterpMode=CIM_CurveAutoClamped),(InVal=237.000000,OutVal=-7351.217773,ArriveTangent=313.764923,LeaveTangent=313.764923,InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,OutVal=-6240.065918,ArriveTangent=369.647797,LeaveTangent=369.647797,InterpMode=CIM_CurveAutoClamped),(InVal=241.500000,OutVal=-5687.783203,ArriveTangent=319.999695,LeaveTangent=319.999695,InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=-4640.067383,ArriveTangent=89.813477,LeaveTangent=89.813477,InterpMode=CIM_CurveAutoClamped),(InVal=246.500000,OutVal=-4560.274902,ArriveTangent=98.152611,LeaveTangent=98.152611,InterpMode=CIM_CurveAutoClamped),(InVal=249.000000,OutVal=-3787.271973,ArriveTangent=342.916168,LeaveTangent=342.916168,InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,OutVal=-3360.068359,ArriveTangent=382.516998,LeaveTangent=382.516998,InterpMode=CIM_CurveAutoClamped),(InVal=252.000000,OutVal=-2639.720947,ArriveTangent=287.938782,LeaveTangent=287.938782,InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=-2208.313232,ArriveTangent=168.367035,LeaveTangent=168.367035,InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,OutVal=-2080.069092,InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=-2080.069824,InterpMode=CIM_CurveAutoClamped),(InVal=263.000000,OutVal=-1494.982666,ArriveTangent=53.362213,LeaveTangent=53.362213,InterpMode=CIM_CurveAutoClamped),(InVal=265.000000,OutVal=-1440.070313,ArriveTangent=45.428089,LeaveTangent=45.428089,InterpMode=CIM_CurveAutoClamped),(InVal=268.000000,OutVal=-1193.314697,ArriveTangent=166.964584,LeaveTangent=166.964584,InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,OutVal=-480.070557,ArriveTangent=115.490906,LeaveTangent=115.490906,InterpMode=CIM_CurveAutoClamped),(InVal=271.000000,OutVal=-413.930664,InterpMode=CIM_CurveAutoClamped),(InVal=273.500000,OutVal=-499.942993,InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=-320.070557,ArriveTangent=134.563034,LeaveTangent=134.563034,InterpMode=CIM_CurveAutoClamped),(InVal=276.000000,OutVal=-163.535400,ArriveTangent=25.364779,LeaveTangent=25.364779,InterpMode=CIM_CurveAutoClamped),(InVal=279.000000,OutVal=-136.448486,ArriveTangent=24.871569,LeaveTangent=24.871569,InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=-0.070557,InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,OutVal=-1920.070801,ArriveTangent=-295.948334,LeaveTangent=-295.948334,InterpMode=CIM_CurveAutoClamped),(InVal=287.500000,OutVal=-2478.875000,ArriveTangent=-320.000092,LeaveTangent=-320.000092,InterpMode=CIM_CurveAutoClamped),(InVal=290.000000,OutVal=-3520.071289,ArriveTangent=-352.159637,LeaveTangent=-352.159637,InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=-5120.072266,InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,OutVal=-4320.073242,ArriveTangent=143.999802,LeaveTangent=143.999802,InterpMode=CIM_CurveAutoClamped),(InVal=305.000000,OutVal=-3680.074219,ArriveTangent=143.999802,LeaveTangent=143.999802,InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,OutVal=-2880.075195,ArriveTangent=143.999832,LeaveTangent=143.999832,InterpMode=CIM_CurveAutoClamped),(InVal=315.000000,OutVal=-2240.075928,ArriveTangent=95.999878,LeaveTangent=95.999878,InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,OutVal=-1920.076416,ArriveTangent=130.527893,LeaveTangent=130.527893,InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,OutVal=-160.076660,InterpMode=CIM_CurveAutoClamped),(InVal=326.500000,OutVal=-199.898682,InterpMode=CIM_CurveAutoClamped),(InVal=328.500000,OutVal=-192.140137,InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,OutVal=-320.076660,ArriveTangent=-108.973267,LeaveTangent=-108.973267,InterpMode=CIM_CurveAutoClamped),(InVal=331.500000,OutVal=-519.059937,InterpMode=CIM_CurveAutoClamped),(InVal=332.000000,OutVal=-513.016357,ArriveTangent=12.998276,LeaveTangent=12.998276,InterpMode=CIM_CurveAutoClamped),(InVal=333.500000,OutVal=-492.187500,ArriveTangent=10.979899,LeaveTangent=10.979899,InterpMode=CIM_CurveAutoClamped),(InVal=335.000000,OutVal=-480.076660,InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=-1600.076904,ArriveTangent=-0.000237,LeaveTangent=-0.000237,InterpMode=CIM_CurveAutoClamped),(InVal=345.000000,OutVal=-1600.077393,InterpMode=CIM_CurveAutoClamped),(InVal=347.000000,OutVal=-1459.037598,ArriveTangent=117.893204,LeaveTangent=117.893204,InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=-800.077759,ArriveTangent=221.941406,LeaveTangent=221.941406,InterpMode=CIM_CurveAutoClamped),(InVal=353.500000,OutVal=-16.418457,ArriveTangent=158.622437,LeaveTangent=158.622437,InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,OutVal=159.922119,ArriveTangent=4.468590,LeaveTangent=4.468590,InterpMode=CIM_CurveAutoClamped),(InVal=356.500000,OutVal=162.651611,InterpMode=CIM_CurveAutoClamped),(InVal=359.000000,OutVal=-577.999634,ArriveTangent=-258.783691,LeaveTangent=-258.783691,InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,OutVal=-800.078003,ArriveTangent=-214.295853,LeaveTangent=-214.295853,InterpMode=CIM_CurveAutoClamped),(InVal=361.500000,OutVal=-1113.739258,InterpMode=CIM_CurveAutoClamped),(InVal=365.000000,OutVal=-480.078125,InterpMode=CIM_CurveAutoClamped),(InVal=366.000000,OutVal=-480.078125,InterpMode=CIM_CurveAutoClamped),(InVal=366.500000,OutVal=-480.078125,InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,OutVal=-480.078125,InterpMode=CIM_CurveAutoClamped),(InVal=375.000000,OutVal=-2080.078369,ArriveTangent=-227.462433,LeaveTangent=-227.462433,InterpMode=CIM_CurveAutoClamped),(InVal=376.500000,OutVal=-2351.377686,ArriveTangent=-168.292191,LeaveTangent=-168.292191,InterpMode=CIM_CurveAutoClamped),(InVal=377.500000,OutVal=-2500.808838,ArriveTangent=-105.343193,LeaveTangent=-105.343193,InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=-2720.078857,ArriveTangent=-0.000292,LeaveTangent=-0.000292,InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,OutVal=-2720.079346,ArriveTangent=-0.000252,LeaveTangent=-0.000252,InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,OutVal=-3680.080078,ArriveTangent=-0.000496,LeaveTangent=-0.000496,InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,OutVal=-3680.081055,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=-4960.082031,ArriveTangent=-0.000496,LeaveTangent=-0.000496,InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,OutVal=-4960.083008,InterpMode=CIM_CurveAutoClamped),(InVal=407.500000,OutVal=-4603.806641,ArriveTangent=220.354614,LeaveTangent=220.354614,InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=-3840.083984,ArriveTangent=251.162918,LeaveTangent=251.162918,InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,OutVal=-2720.084717,InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,OutVal=-2720.085205,ArriveTangent=-0.000244,LeaveTangent=-0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,OutVal=-3360.085938,ArriveTangent=-55.754086,LeaveTangent=-55.754086,InterpMode=CIM_CurveAutoClamped),(InVal=428.000000,OutVal=-3456.629639,InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=-3360.086914,ArriveTangent=65.414635,LeaveTangent=65.414635,InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,OutVal=-2880.087891,InterpMode=CIM_CurveAutoClamped),(InVal=437.000000,OutVal=-2880.088867,InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=-2880.088867,InterpMode=CIM_CurveAutoClamped),(InVal=445.000000,OutVal=-2560.089600,InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=-2560.090332,ArriveTangent=-0.000484,LeaveTangent=-0.000484,InterpMode=CIM_CurveAutoClamped),(InVal=451.500000,OutVal=-2889.400879,InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,OutVal=-2880.090820,ArriveTangent=7.627121,LeaveTangent=7.627121,InterpMode=CIM_CurveAutoClamped),(InVal=457.000000,OutVal=-2249.385986,ArriveTangent=287.999847,LeaveTangent=287.999847,InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=-1440.091553,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=-1440.092041,ArriveTangent=-0.000298,LeaveTangent=-0.000298,InterpMode=CIM_CurveAutoClamped),(InVal=467.500000,OutVal=-2232.327637,ArriveTangent=-288.000153,LeaveTangent=-288.000153,InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,OutVal=-2880.092773,ArriveTangent=-0.000587,LeaveTangent=-0.000587,InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,OutVal=-2880.093750,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,OutVal=-4320.094727,ArriveTangent=-240.000198,LeaveTangent=-240.000198,InterpMode=CIM_CurveAutoClamped),(InVal=485.000000,OutVal=-5280.095703,ArriveTangent=-0.001816,LeaveTangent=-0.001816,InterpMode=CIM_CurveAutoClamped),(InVal=487.000000,OutVal=-5280.097656,InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,OutVal=-5280.097656,InterpMode=CIM_CurveAutoClamped),(InVal=495.000000,OutVal=-4160.099121,ArriveTangent=241.485168,LeaveTangent=241.485168,InterpMode=CIM_CurveAutoClamped),(InVal=498.000000,OutVal=-3348.216309,ArriveTangent=211.839600,LeaveTangent=211.839600,InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,OutVal=-3040.100098,InterpMode=CIM_CurveAutoClamped),(InVal=503.000000,OutVal=-3040.101074,InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,OutVal=-3040.101074,InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,OutVal=-2880.102051,InterpMode=CIM_CurveAutoClamped),(InVal=511.500000,OutVal=-2880.102539,ArriveTangent=-0.000195,LeaveTangent=-0.000195,InterpMode=CIM_CurveAutoClamped),(InVal=515.000000,OutVal=-2880.103027,InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=-2080.103760,InterpMode=CIM_CurveAutoClamped),(InVal=525.000000,OutVal=-2080.104248,ArriveTangent=-0.000229,LeaveTangent=-0.000229,InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=-3680.105469,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=535.000000,OutVal=-3680.106445,InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=-2400.107178,ArriveTangent=26.406464,LeaveTangent=26.406464,InterpMode=CIM_CurveAutoClamped),(InVal=541.500000,OutVal=-2375.915039,ArriveTangent=29.193298,LeaveTangent=29.193298,InterpMode=CIM_CurveAutoClamped),(InVal=545.000000,OutVal=-1600.107666,InterpMode=CIM_CurveAutoClamped),(InVal=547.500000,OutVal=-3121.081055,InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,OutVal=-3040.108398,ArriveTangent=69.264969,LeaveTangent=69.264969,InterpMode=CIM_CurveAutoClamped),(InVal=553.000000,OutVal=-2047.387451,InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,OutVal=-2080.109131,ArriveTangent=-33.884754,LeaveTangent=-33.884754,InterpMode=CIM_CurveAutoClamped),(InVal=557.500000,OutVal=-2420.191650,InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,OutVal=-2400.109619,InterpMode=CIM_CurveAutoClamped),(InVal=565.000000,OutVal=-2400.110107,InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,OutVal=-1120.110474,ArriveTangent=223.999954,LeaveTangent=223.999954,InterpMode=CIM_CurveAutoClamped),(InVal=575.000000,OutVal=-160.110596,InterpMode=CIM_CurveAutoClamped),(InVal=578.500000,OutVal=-1157.971436,ArriveTangent=-320.000061,LeaveTangent=-320.000061,InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,OutVal=-1760.110840,ArriveTangent=-396.137207,LeaveTangent=-396.137207,InterpMode=CIM_CurveAutoClamped),(InVal=581.500000,OutVal=-2346.383057,ArriveTangent=-352.000092,LeaveTangent=-352.000092,InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,OutVal=-3520.111328,ArriveTangent=-303.314209,LeaveTangent=-303.314209,InterpMode=CIM_CurveAutoClamped),(InVal=588.500000,OutVal=-4469.582520,ArriveTangent=-164.125580,LeaveTangent=-164.125580,InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=-4640.112305,InterpMode=CIM_CurveAutoClamped),(InVal=592.000000,OutVal=-4609.768555,ArriveTangent=32.316269,LeaveTangent=32.316269,InterpMode=CIM_CurveAutoClamped),(InVal=595.000000,OutVal=-3360.113281,ArriveTangent=276.206818,LeaveTangent=276.206818,InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=-2400.114014,ArriveTangent=232.764679,LeaveTangent=232.764679,InterpMode=CIM_CurveAutoClamped),(InVal=603.000000,OutVal=-1497.995850,ArriveTangent=248.391815,LeaveTangent=248.391815,InterpMode=CIM_CurveAutoClamped),(InVal=605.000000,OutVal=-1120.114380,InterpMode=CIM_CurveAutoClamped),(InVal=606.500000,OutVal=-1451.917969,ArriveTangent=-297.910339,LeaveTangent=-297.910339,InterpMode=CIM_CurveAutoClamped),(InVal=608.500000,OutVal=-2179.869385,ArriveTangent=-233.382172,LeaveTangent=-233.382172,InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,OutVal=-2400.114746,ArriveTangent=-93.363174,LeaveTangent=-93.363174,InterpMode=CIM_CurveAutoClamped),(InVal=613.000000,OutVal=-2600.003662,ArriveTangent=-15.105244,LeaveTangent=-15.105244,InterpMode=CIM_CurveAutoClamped),(InVal=614.500000,OutVal=-2612.416016,InterpMode=CIM_CurveAutoClamped),(InVal=615.000000,OutVal=-2400.115234,ArriveTangent=381.223145,LeaveTangent=381.223145,InterpMode=CIM_CurveAutoClamped),(InVal=616.500000,OutVal=-1849.969727,ArriveTangent=68.815071,LeaveTangent=68.815071,InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,OutVal=-1760.115723,InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,OutVal=-1760.116211,ArriveTangent=-0.000122,LeaveTangent=-0.000122,InterpMode=CIM_CurveAutoClamped),(InVal=628.000000,OutVal=-1760.116699,InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=-1760.116699,InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,OutVal=-2720.117188,ArriveTangent=-0.000252,LeaveTangent=-0.000252,InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,OutVal=-2720.117676,ArriveTangent=-0.000244,LeaveTangent=-0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,OutVal=-3360.118164,ArriveTangent=-149.595261,LeaveTangent=-149.595261,InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=-4216.070313,ArriveTangent=-160.000198,LeaveTangent=-160.000198,InterpMode=CIM_CurveAutoClamped),(InVal=655.000000,OutVal=-4960.120117,InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=-3680.121094,ArriveTangent=207.999802,LeaveTangent=207.999802,InterpMode=CIM_CurveAutoClamped),(InVal=665.000000,OutVal=-2880.122070,InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=-2880.123047,ArriveTangent=-0.000587,LeaveTangent=-0.000587,InterpMode=CIM_CurveAutoClamped),(InVal=672.500000,OutVal=-3711.496826,ArriveTangent=-384.000183,LeaveTangent=-384.000183,InterpMode=CIM_CurveAutoClamped),(InVal=675.000000,OutVal=-4800.124023,ArriveTangent=-271.083984,LeaveTangent=-271.083984,InterpMode=CIM_CurveAutoClamped),(InVal=676.500000,OutVal=-5064.182617,ArriveTangent=-96.000198,LeaveTangent=-96.000198,InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=-5280.125000,ArriveTangent=-0.001083,LeaveTangent=-0.001083,InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,OutVal=-5280.126953,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=690.000000,OutVal=-5920.128906),(InVal=690.000000,OutVal=-5920.129883,InterpMode=CIM_CurveAutoClamped),(InVal=695.000000,OutVal=-5920.130859,InterpMode=CIM_CurveAutoClamped),(InVal=698.000000,OutVal=-5909.638184,InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=-6880.132813,ArriveTangent=-275.785217,LeaveTangent=-275.785217,InterpMode=CIM_CurveAutoClamped),(InVal=705.000000,OutVal=-7840.134766,InterpMode=CIM_CurveAutoClamped),(InVal=706.500000,OutVal=-7453.509766,ArriveTangent=341.086761,LeaveTangent=341.086761,InterpMode=CIM_CurveAutoClamped),(InVal=709.000000,OutVal=-6393.905273,ArriveTangent=227.183167,LeaveTangent=227.183167,InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,OutVal=-6240.136719,InterpMode=CIM_CurveAutoClamped),(InVal=711.500000,OutVal=-6295.185547,ArriveTangent=-65.969833,LeaveTangent=-65.969833,InterpMode=CIM_CurveAutoClamped),(InVal=715.000000,OutVal=-7840.138672,InterpMode=CIM_CurveAutoClamped),(InVal=716.500000,OutVal=-7430.212891,ArriveTangent=410.867615,LeaveTangent=410.867615,InterpMode=CIM_CurveAutoClamped),(InVal=718.500000,OutVal=-6269.083008,ArriveTangent=370.594849,LeaveTangent=370.594849,InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=-5920.140625,InterpMode=CIM_CurveAutoClamped),(InVal=725.000000,OutVal=-5920.141602,InterpMode=CIM_CurveAutoClamped),(InVal=727.000000,OutVal=-5900.608887,InterpMode=CIM_CurveAutoClamped),(InVal=728.500000,OutVal=-6241.860352,InterpMode=CIM_CurveAutoClamped),(InVal=729.500000,OutVal=-5875.932617,InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=-5920.143555,InterpMode=CIM_CurveAutoClamped),(InVal=735.000000,OutVal=-4800.145020,InterpMode=CIM_CurveAutoClamped),(InVal=736.000000,OutVal=-4802.418945,InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,OutVal=-4800.145996,InterpMode=CIM_CurveAutoClamped),(InVal=745.000000,OutVal=-4800.146973,ArriveTangent=-0.000684,LeaveTangent=-0.000684,InterpMode=CIM_CurveAutoClamped),(InVal=746.000000,OutVal=-4815.618164,InterpMode=CIM_CurveAutoClamped),(InVal=747.000000,OutVal=-4566.357422,InterpMode=CIM_CurveAutoClamped),(InVal=748.000000,OutVal=-4960.565918,InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,OutVal=-4960.147949,ArriveTangent=0.388092,LeaveTangent=0.388092,InterpMode=CIM_CurveAutoClamped),(InVal=755.000000,OutVal=-3680.148926,ArriveTangent=121.657349,LeaveTangent=121.657349,InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,OutVal=-3360.149902,ArriveTangent=95.999878,LeaveTangent=95.999878,InterpMode=CIM_CurveAutoClamped),(InVal=765.000000,OutVal=-2720.150146,InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,OutVal=-2720.150635,InterpMode=CIM_CurveAutoClamped),(InVal=775.000000,OutVal=-2240.151123,InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,OutVal=-2240.151611,ArriveTangent=-0.000244,LeaveTangent=-0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=785.000000,OutVal=-4000.152344,ArriveTangent=-0.000687,LeaveTangent=-0.000687,InterpMode=CIM_CurveAutoClamped),(InVal=787.000000,OutVal=-4000.153076,ArriveTangent=-0.000305,LeaveTangent=-0.000305,InterpMode=CIM_CurveAutoClamped),(InVal=788.000000,OutVal=-4000.153320,InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,OutVal=-4000.153320,InterpMode=CIM_CurveAutoClamped),(InVal=795.000000,OutVal=-4960.154297,InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,OutVal=-4640.155273,InterpMode=CIM_CurveAutoClamped),(InVal=805.000000,OutVal=-5280.156250,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=810.000000,OutVal=-5280.158203,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=815.000000,OutVal=-5920.160156,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=820.000000,OutVal=-5920.162109,ArriveTangent=-0.000391,LeaveTangent=-0.000391,InterpMode=CIM_CurveAutoClamped),(InVal=825.000000,OutVal=-5920.164063,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,OutVal=-7360.166016,InterpMode=CIM_CurveAutoClamped),(InVal=835.000000,OutVal=-5920.166992,InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,OutVal=-5920.169922,InterpMode=CIM_CurveAutoClamped),(InVal=845.000000,OutVal=-5280.170898,InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,OutVal=-5280.172852,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=855.000000,OutVal=-5920.174805,InterpMode=CIM_CurveAutoClamped),(InVal=857.500000,OutVal=-5849.657227,ArriveTangent=61.226700,LeaveTangent=61.226700,InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,OutVal=-5280.176758,InterpMode=CIM_CurveAutoClamped),(InVal=863.500000,OutVal=-5280.178711,InterpMode=CIM_CurveAutoClamped),(InVal=865.000000,OutVal=-5280.178711,InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,OutVal=-5280.180664,InterpMode=CIM_CurveAutoClamped),(InVal=875.000000,OutVal=-3840.182129,ArriveTangent=255.999786,LeaveTangent=255.999786,InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,OutVal=-2720.182861,InterpMode=CIM_CurveAutoClamped),(InVal=885.000000,OutVal=-4320.183594,ArriveTangent=-256.000183,LeaveTangent=-256.000183,InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,OutVal=-5280.184570,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=895.000000,OutVal=-5280.186523,InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=-4000.187988,ArriveTangent=223.999756,LeaveTangent=223.999756,InterpMode=CIM_CurveAutoClamped),(InVal=905.000000,OutVal=-3040.188965,ArriveTangent=112.047836,LeaveTangent=112.047836,InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,OutVal=-2720.189697,InterpMode=CIM_CurveAutoClamped),(InVal=913.500000,OutVal=-2720.190186,InterpMode=CIM_CurveAutoClamped),(InVal=915.000000,OutVal=-2720.190186,InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,OutVal=-2720.190674,ArriveTangent=-0.000244,LeaveTangent=-0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=925.000000,OutVal=-3520.191406,ArriveTangent=-116.158165,LeaveTangent=-116.158165,InterpMode=CIM_CurveAutoClamped),(InVal=928.500000,OutVal=-3798.291992,ArriveTangent=-42.115273,LeaveTangent=-42.115273,InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,OutVal=-3840.192383,ArriveTangent=-0.000647,LeaveTangent=-0.000647,InterpMode=CIM_CurveAutoClamped),(InVal=935.000000,OutVal=-3840.193359,InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,OutVal=-3200.194336,InterpMode=CIM_CurveAutoClamped),(InVal=945.000000,OutVal=-3200.195313,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,OutVal=-3520.196289,ArriveTangent=-114.621208,LeaveTangent=-114.621208,InterpMode=CIM_CurveAutoClamped),(InVal=951.500000,OutVal=-3945.233154,ArriveTangent=-43.315384,LeaveTangent=-43.315384,InterpMode=CIM_CurveAutoClamped),(InVal=955.000000,OutVal=-4000.197266,InterpMode=CIM_CurveAutoClamped),(InVal=957.000000,OutVal=-3905.854980,ArriveTangent=91.900970,LeaveTangent=91.900970,InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,OutVal=-2880.198242,ArriveTangent=358.271484,LeaveTangent=358.271484,InterpMode=CIM_CurveAutoClamped),(InVal=963.000000,OutVal=-1756.226196,InterpMode=CIM_CurveAutoClamped),(InVal=965.000000,OutVal=-1920.198975,InterpMode=CIM_CurveAutoClamped),(InVal=967.000000,OutVal=-1424.414795,ArriveTangent=365.153625,LeaveTangent=365.153625,InterpMode=CIM_CurveAutoClamped),(InVal=968.500000,OutVal=-642.161255,ArriveTangent=348.985382,LeaveTangent=348.985382,InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,OutVal=-320.199219,InterpMode=CIM_CurveAutoClamped),(InVal=972.000000,OutVal=-336.928833,ArriveTangent=-17.887329,LeaveTangent=-17.887329,InterpMode=CIM_CurveAutoClamped),(InVal=975.000000,OutVal=-1120.199341,ArriveTangent=-0.000160,LeaveTangent=-0.000160,InterpMode=CIM_CurveAutoClamped),(InVal=979.000000,OutVal=-1120.199585,InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,OutVal=-1120.199585,InterpMode=CIM_CurveAutoClamped),(InVal=985.000000,OutVal=-2880.200195,ArriveTangent=-352.000153,LeaveTangent=-352.000153,InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,OutVal=-4640.201172,ArriveTangent=-304.000183,LeaveTangent=-304.000183,InterpMode=CIM_CurveAutoClamped),(InVal=995.000000,OutVal=-5920.202148,ArriveTangent=-121.658241,LeaveTangent=-121.658241,InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,OutVal=-6240.204102,ArriveTangent=-0.000977,LeaveTangent=-0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=1005.000000,OutVal=-6240.206055,InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,OutVal=-4640.207031,InterpMode=CIM_CurveAutoClamped),(InVal=1015.000000,OutVal=-4640.208008,InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,OutVal=-2880.208984,ArriveTangent=319.999817,LeaveTangent=319.999817,InterpMode=CIM_CurveAutoClamped),(InVal=1025.000000,OutVal=-1440.209717,InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,OutVal=-1440.210205,InterpMode=CIM_CurveAutoClamped),(InVal=1035.000000,OutVal=-800.210571,ArriveTangent=61.995903,LeaveTangent=61.995903,InterpMode=CIM_CurveAutoClamped),(InVal=1038.500000,OutVal=-676.140991,InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,OutVal=-960.210815,ArriveTangent=-149.645187,LeaveTangent=-149.645187,InterpMode=CIM_CurveAutoClamped),(InVal=1041.500000,OutVal=-1125.076538,InterpMode=CIM_CurveAutoClamped),(InVal=1043.500000,OutVal=-1114.250977,ArriveTangent=13.633797,LeaveTangent=13.633797,InterpMode=CIM_CurveAutoClamped),(InVal=1045.000000,OutVal=-960.211060,ArriveTangent=105.101685,LeaveTangent=105.101685,InterpMode=CIM_CurveAutoClamped),(InVal=1046.500000,OutVal=-798.945923,ArriveTangent=163.690277,LeaveTangent=163.690277,InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,OutVal=319.788818,ArriveTangent=263.380585,LeaveTangent=263.380585,InterpMode=CIM_CurveAutoClamped),(InVal=1055.000000,OutVal=1439.789063,InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,OutVal=-480.210693,ArriveTangent=-336.000000,LeaveTangent=-336.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1065.000000,OutVal=-1920.210938,ArriveTangent=-322.649139,LeaveTangent=-322.649139,InterpMode=CIM_CurveAutoClamped),(InVal=1067.000000,OutVal=-2738.754639,ArriveTangent=-352.000153,LeaveTangent=-352.000153,InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,OutVal=-3680.211670,ArriveTangent=-281.860321,LeaveTangent=-281.860321,InterpMode=CIM_CurveAutoClamped),(InVal=1074.000000,OutVal=-4711.776855,ArriveTangent=-120.580894,LeaveTangent=-120.580894,InterpMode=CIM_CurveAutoClamped),(InVal=1075.000000,OutVal=-4800.212891,InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,OutVal=-4640.213867,InterpMode=CIM_CurveAutoClamped),(InVal=1085.000000,OutVal=-4800.214844,InterpMode=CIM_CurveAutoClamped),(InVal=1090.000000,OutVal=-4640.215820,ArriveTangent=66.729492,LeaveTangent=66.729492,InterpMode=CIM_CurveAutoClamped),(InVal=1093.500000,OutVal=-4094.836426,ArriveTangent=91.902588,LeaveTangent=91.902588,InterpMode=CIM_CurveAutoClamped),(InVal=1095.000000,OutVal=-4000.216797,ArriveTangent=92.037437,LeaveTangent=92.037437,InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,OutVal=-2880.217773,ArriveTangent=255.999832,LeaveTangent=255.999832,InterpMode=CIM_CurveAutoClamped),(InVal=1105.000000,OutVal=-1440.218506,ArriveTangent=127.698029,LeaveTangent=127.698029,InterpMode=CIM_CurveAutoClamped),(InVal=1106.000000,OutVal=-1342.748047,ArriveTangent=204.786255,LeaveTangent=204.786255,InterpMode=CIM_CurveAutoClamped),(InVal=1107.000000,OutVal=-709.358887,ArriveTangent=68.142311,LeaveTangent=68.142311,InterpMode=CIM_CurveAutoClamped),(InVal=1110.000000,OutVal=-640.218872,InterpMode=CIM_CurveAutoClamped),(InVal=1115.000000,OutVal=-1120.219116,InterpMode=CIM_CurveAutoClamped),(InVal=1118.000000,OutVal=-1114.091553,InterpMode=CIM_CurveAutoClamped),(InVal=1120.000000,OutVal=-1280.219360,ArriveTangent=-122.112762,LeaveTangent=-122.112762,InterpMode=CIM_CurveAutoClamped),(InVal=1125.000000,OutVal=-2400.219727,ArriveTangent=-0.000237,LeaveTangent=-0.000237,InterpMode=CIM_CurveAutoClamped),(InVal=1130.000000,OutVal=-2400.220215,ArriveTangent=-0.000244,LeaveTangent=-0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=1135.000000,OutVal=-3840.220947,ArriveTangent=-224.000153,LeaveTangent=-224.000153,InterpMode=CIM_CurveAutoClamped),(InVal=1140.000000,OutVal=-4640.221680,ArriveTangent=-240.000168,LeaveTangent=-240.000168,InterpMode=CIM_CurveAutoClamped),(InVal=1145.000000,OutVal=-6240.222656,InterpMode=CIM_CurveAutoClamped),(InVal=1146.500000,OutVal=-6235.439453,InterpMode=CIM_CurveAutoClamped),(InVal=1148.500000,OutVal=-6241.654297,ArriveTangent=-7.072525,LeaveTangent=-7.072525,InterpMode=CIM_CurveAutoClamped),(InVal=1151.000000,OutVal=-6553.610352,ArriveTangent=-5.882538,LeaveTangent=-5.882538,InterpMode=CIM_CurveAutoClamped),(InVal=1153.500000,OutVal=-6559.625977,ArriveTangent=-0.743181,LeaveTangent=-0.743181,InterpMode=CIM_CurveAutoClamped),(InVal=1155.000000,OutVal=-6560.227539,InterpMode=CIM_CurveAutoClamped),(InVal=1160.000000,OutVal=-5920.229492,InterpMode=CIM_CurveAutoClamped),(InVal=1165.000000,OutVal=-5920.231445,InterpMode=CIM_CurveAutoClamped),(InVal=1167.500000,OutVal=-5890.468262,ArriveTangent=26.455772,LeaveTangent=26.455772,InterpMode=CIM_CurveAutoClamped),(InVal=1170.000000,OutVal=-5600.234375,InterpMode=CIM_CurveAutoClamped),(InVal=1175.000000,OutVal=-5600.236328,InterpMode=CIM_CurveAutoClamped),(InVal=1178.000000,OutVal=-4756.412598,ArriveTangent=319.999695,LeaveTangent=319.999695,InterpMode=CIM_CurveAutoClamped),(InVal=1180.000000,OutVal=-4000.237793,ArriveTangent=452.157227,LeaveTangent=452.157227,InterpMode=CIM_CurveAutoClamped),(InVal=1182.000000,OutVal=-2947.783691,ArriveTangent=486.503296,LeaveTangent=486.503296,InterpMode=CIM_CurveAutoClamped),(InVal=1184.000000,OutVal=-2054.224609,ArriveTangent=369.712250,LeaveTangent=369.712250,InterpMode=CIM_CurveAutoClamped),(InVal=1185.000000,OutVal=-1760.238525,InterpMode=CIM_CurveAutoClamped),(InVal=1190.000000,OutVal=-1760.239014,ArriveTangent=-0.000294,LeaveTangent=-0.000294,InterpMode=CIM_CurveAutoClamped),(InVal=1192.500000,OutVal=-2182.381348,ArriveTangent=-224.000153,LeaveTangent=-224.000153,InterpMode=CIM_CurveAutoClamped),(InVal=1195.000000,OutVal=-2880.239746,ArriveTangent=-303.984589,LeaveTangent=-303.984589,InterpMode=CIM_CurveAutoClamped),(InVal=1200.000000,OutVal=-4480.240723,ArriveTangent=-256.000336,LeaveTangent=-256.000336,InterpMode=CIM_CurveAutoClamped),(InVal=1205.000000,OutVal=-5440.243164,ArriveTangent=-112.048599,LeaveTangent=-112.048599,InterpMode=CIM_CurveAutoClamped),(InVal=1210.000000,OutVal=-5760.245117,InterpMode=CIM_CurveAutoClamped),(InVal=1215.000000,OutVal=-4800.246582,InterpMode=CIM_CurveAutoClamped),(InVal=1220.000000,OutVal=-4800.247559,InterpMode=CIM_CurveAutoClamped),(InVal=1225.000000,OutVal=-3520.248535,ArriveTangent=161.519806,LeaveTangent=161.519806,InterpMode=CIM_CurveAutoClamped),(InVal=1230.000000,OutVal=-3040.249512,InterpMode=CIM_CurveAutoClamped),(InVal=1235.000000,OutVal=-3040.250488,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=1240.000000,OutVal=-3200.251953,ArriveTangent=-71.312622,LeaveTangent=-71.312622,InterpMode=CIM_CurveAutoClamped),(InVal=1245.000000,OutVal=-4800.252930,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=1250.000000,OutVal=-4800.253906,InterpMode=CIM_CurveAutoClamped),(InVal=1255.000000,OutVal=-3360.254883,ArriveTangent=239.999832,LeaveTangent=239.999832,InterpMode=CIM_CurveAutoClamped),(InVal=1260.000000,OutVal=-2400.255615,ArriveTangent=287.999908,LeaveTangent=287.999908,InterpMode=CIM_CurveAutoClamped),(InVal=1265.000000,OutVal=-480.255859,ArriveTangent=384.000000,LeaveTangent=384.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1270.000000,OutVal=1439.744385,ArriveTangent=212.384552,LeaveTangent=212.384552,InterpMode=CIM_CurveAutoClamped),(InVal=1275.000000,OutVal=2031.744873,InterpMode=CIM_CurveAutoClamped),(InVal=1280.000000,OutVal=639.744629,ArriveTangent=-300.700958,LeaveTangent=-300.700958,InterpMode=CIM_CurveAutoClamped),(InVal=1282.500000,OutVal=-223.512207,ArriveTangent=-367.885315,LeaveTangent=-367.885315,InterpMode=CIM_CurveAutoClamped),(InVal=1284.000000,OutVal=-831.796631,ArriveTangent=-356.308350,LeaveTangent=-356.308350,InterpMode=CIM_CurveAutoClamped),(InVal=1285.000000,OutVal=-1120.255493,ArriveTangent=-0.000172,LeaveTangent=-0.000172,InterpMode=CIM_CurveAutoClamped),(InVal=1290.000000,OutVal=-1120.255737,InterpMode=CIM_CurveAutoClamped),(InVal=1292.500000,OutVal=-359.679810,ArriveTangent=37.113914,LeaveTangent=37.113914,InterpMode=CIM_CurveAutoClamped),(InVal=1295.000000,OutVal=-320.255859,InterpMode=CIM_CurveAutoClamped),(InVal=1300.000000,OutVal=-320.255859,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_0"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_1
            MoveAxis=AXIS_TranslationY
            LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000),(Time=15.000000),(Time=17.500000),(Time=17.500000),(Time=20.000000),(Time=25.000000),(Time=27.500000),(Time=30.000000),(Time=35.000000),(Time=40.000000),(Time=45.000000),(Time=50.000000),(Time=55.000000),(Time=60.000000),(Time=65.000000),(Time=70.000000),(Time=75.000000),(Time=80.000000),(Time=85.000000),(Time=87.500000),(Time=90.000000),(Time=95.000000),(Time=97.500000),(Time=100.000000),(Time=105.000000),(Time=110.000000),(Time=115.000000),(Time=120.000000),(Time=125.000000),(Time=130.000000),(Time=130.000000),(Time=135.000000),(Time=140.000000),(Time=145.000000),(Time=145.000000),(Time=150.000000),(Time=155.000000),(Time=160.000000),(Time=162.500000),(Time=165.000000),(Time=170.000000),(Time=175.000000),(Time=180.000000),(Time=182.500000),(Time=185.000000),(Time=187.500000),(Time=190.000000),(Time=192.000000),(Time=195.000000),(Time=198.500000),(Time=200.000000),(Time=203.000000),(Time=205.000000),(Time=207.000000),(Time=209.500000),(Time=210.000000),(Time=212.000000),(Time=215.000000),(Time=220.000000),(Time=225.000000),(Time=230.500000),(Time=235.000000),(Time=237.000000),(Time=240.000000),(Time=241.500000),(Time=245.000000),(Time=246.500000),(Time=249.000000),(Time=250.000000),(Time=252.000000),(Time=254.000000),(Time=255.000000),(Time=260.000000),(Time=263.000000),(Time=265.000000),(Time=268.000000),(Time=270.000000),(Time=271.000000),(Time=273.500000),(Time=275.000000),(Time=276.000000),(Time=279.000000),(Time=280.000000),(Time=285.000000),(Time=287.500000),(Time=290.000000),(Time=295.000000),(Time=300.000000),(Time=305.000000),(Time=310.000000),(Time=315.000000),(Time=320.000000),(Time=325.000000),(Time=326.500000),(Time=328.500000),(Time=330.000000),(Time=331.500000),(Time=332.000000),(Time=333.500000),(Time=335.000000),(Time=340.000000),(Time=345.000000),(Time=347.000000),(Time=350.000000),(Time=353.500000),(Time=355.000000),(Time=356.500000),(Time=359.000000),(Time=360.000000),(Time=361.500000),(Time=365.000000),(Time=366.000000),(Time=366.500000),(Time=370.000000),(Time=375.000000),(Time=376.500000),(Time=377.500000),(Time=380.000000),(Time=385.000000),(Time=390.000000),(Time=395.000000),(Time=400.000000),(Time=405.000000),(Time=407.500000),(Time=410.000000),(Time=415.000000),(Time=420.000000),(Time=425.000000),(Time=428.000000),(Time=430.000000),(Time=435.000000),(Time=437.000000),(Time=440.000000),(Time=445.000000),(Time=450.000000),(Time=451.500000),(Time=455.000000),(Time=457.000000),(Time=460.000000),(Time=465.000000),(Time=467.500000),(Time=470.000000),(Time=475.000000),(Time=480.000000),(Time=485.000000),(Time=487.000000),(Time=490.000000),(Time=495.000000),(Time=498.000000),(Time=500.000000),(Time=503.000000),(Time=505.000000),(Time=510.000000),(Time=511.500000),(Time=515.000000),(Time=520.000000),(Time=525.000000),(Time=530.000000),(Time=535.000000),(Time=540.000000),(Time=541.500000),(Time=545.000000),(Time=547.500000),(Time=550.000000),(Time=553.000000),(Time=555.000000),(Time=557.500000),(Time=560.000000),(Time=565.000000),(Time=570.000000),(Time=575.000000),(Time=578.500000),(Time=580.000000),(Time=581.500000),(Time=585.000000),(Time=588.500000),(Time=590.000000),(Time=592.000000),(Time=595.000000),(Time=600.000000),(Time=603.000000),(Time=605.000000),(Time=606.500000),(Time=608.500000),(Time=610.000000),(Time=613.000000),(Time=614.500000),(Time=615.000000),(Time=616.500000),(Time=620.000000),(Time=625.000000),(Time=628.000000),(Time=630.000000),(Time=635.000000),(Time=640.000000),(Time=645.000000),(Time=650.000000),(Time=655.000000),(Time=660.000000),(Time=665.000000),(Time=670.000000),(Time=672.500000),(Time=675.000000),(Time=676.500000),(Time=680.000000),(Time=685.000000),(Time=690.000000),(Time=690.000000),(Time=695.000000),(Time=698.000000),(Time=700.000000),(Time=705.000000),(Time=706.500000),(Time=709.000000),(Time=710.000000),(Time=711.500000),(Time=715.000000),(Time=716.500000),(Time=718.500000),(Time=720.000000),(Time=725.000000),(Time=727.000000),(Time=728.500000),(Time=729.500000),(Time=730.000000),(Time=735.000000),(Time=736.000000),(Time=740.000000),(Time=745.000000),(Time=746.000000),(Time=747.000000),(Time=748.000000),(Time=750.000000),(Time=755.000000),(Time=760.000000),(Time=765.000000),(Time=770.000000),(Time=775.000000),(Time=780.000000),(Time=785.000000),(Time=787.000000),(Time=788.000000),(Time=790.000000),(Time=795.000000),(Time=800.000000),(Time=805.000000),(Time=810.000000),(Time=815.000000),(Time=820.000000),(Time=825.000000),(Time=830.000000),(Time=835.000000),(Time=840.000000),(Time=845.000000),(Time=850.000000),(Time=855.000000),(Time=857.500000),(Time=860.000000),(Time=863.500000),(Time=865.000000),(Time=870.000000),(Time=875.000000),(Time=880.000000),(Time=885.000000),(Time=890.000000),(Time=895.000000),(Time=900.000000),(Time=905.000000),(Time=910.000000),(Time=913.500000),(Time=915.000000),(Time=920.000000),(Time=925.000000),(Time=928.500000),(Time=930.000000),(Time=935.000000),(Time=940.000000),(Time=945.000000),(Time=950.000000),(Time=951.500000),(Time=955.000000),(Time=957.000000),(Time=960.000000),(Time=963.000000),(Time=965.000000),(Time=967.000000),(Time=968.500000),(Time=970.000000),(Time=972.000000),(Time=975.000000),(Time=979.000000),(Time=980.000000),(Time=985.000000),(Time=990.000000),(Time=995.000000),(Time=1000.000000),(Time=1005.000000),(Time=1010.000000),(Time=1015.000000),(Time=1020.000000),(Time=1025.000000),(Time=1030.000000),(Time=1035.000000),(Time=1038.500000),(Time=1040.000000),(Time=1041.500000),(Time=1043.500000),(Time=1045.000000),(Time=1046.500000),(Time=1050.000000),(Time=1055.000000),(Time=1060.000000),(Time=1065.000000),(Time=1067.000000),(Time=1070.000000),(Time=1074.000000),(Time=1075.000000),(Time=1080.000000),(Time=1085.000000),(Time=1090.000000),(Time=1093.500000),(Time=1095.000000),(Time=1100.000000),(Time=1105.000000),(Time=1106.000000),(Time=1107.000000),(Time=1110.000000),(Time=1115.000000),(Time=1118.000000),(Time=1120.000000),(Time=1125.000000),(Time=1130.000000),(Time=1135.000000),(Time=1140.000000),(Time=1145.000000),(Time=1146.500000),(Time=1148.500000),(Time=1151.000000),(Time=1153.500000),(Time=1155.000000),(Time=1160.000000),(Time=1165.000000),(Time=1167.500000),(Time=1170.000000),(Time=1175.000000),(Time=1178.000000),(Time=1180.000000),(Time=1182.000000),(Time=1184.000000),(Time=1185.000000),(Time=1190.000000),(Time=1192.500000),(Time=1195.000000),(Time=1200.000000),(Time=1205.000000),(Time=1210.000000),(Time=1215.000000),(Time=1220.000000),(Time=1225.000000),(Time=1230.000000),(Time=1235.000000),(Time=1240.000000),(Time=1245.000000),(Time=1250.000000),(Time=1255.000000),(Time=1260.000000),(Time=1265.000000),(Time=1270.000000),(Time=1275.000000),(Time=1280.000000),(Time=1282.500000),(Time=1284.000000),(Time=1285.000000),(Time=1290.000000),(Time=1292.500000),(Time=1295.000000),(Time=1300.000000)))
            FloatTrack=(Points=((OutVal=-0.000366,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=-0.000366,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=-1920.000732,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-1920.000732,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=-1517.375610,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=-1517.375610,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=-1920.000732,ArriveTangent=-139.016678,LeaveTangent=-139.016678,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=-2560.000732,InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=-2085.424805,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=-2240.000977,InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,OutVal=-584.000610,ArriveTangent=288.000061,LeaveTangent=288.000061,InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,OutVal=639.999695,InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=-320.000244,InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=-320.000244,InterpMode=CIM_CurveAutoClamped),(InVal=55.000000,OutVal=319.999878,ArriveTangent=160.000061,LeaveTangent=160.000061,InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=1280.000366,ArriveTangent=174.400085,LeaveTangent=174.400085,InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=2064.000732,InterpMode=CIM_CurveAutoClamped),(InVal=70.000000,OutVal=1392.000854,ArriveTangent=-182.399979,LeaveTangent=-182.399979,InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=240.000977,InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=1496.001587,ArriveTangent=321.600250,LeaveTangent=321.600250,InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=3456.003418,InterpMode=CIM_CurveAutoClamped),(InVal=87.500000,OutVal=3280.331543,ArriveTangent=-26.312361,LeaveTangent=-26.312361,InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=3248.002930,InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,OutVal=3280.004395,InterpMode=CIM_CurveAutoClamped),(InVal=97.500000,OutVal=3274.191406,InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=3432.004883,ArriveTangent=43.441860,LeaveTangent=43.441860,InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=3600.005371,InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=3200.006348,InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=4080.007324,InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=3840.008301,ArriveTangent=-80.759773,LeaveTangent=-80.759773,InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,OutVal=3200.009277,ArriveTangent=-103.999832,LeaveTangent=-103.999832,InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=2800.010010),(InVal=130.000000,OutVal=2800.010010,InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=1520.010254,ArriveTangent=-247.999954,LeaveTangent=-247.999954,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=320.010376,InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=1280.010498),(InVal=145.000000,OutVal=1280.010498,InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=240.010620,ArriveTangent=-208.000000,LeaveTangent=-208.000000,InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=-799.989502,ArriveTangent=-200.000031,LeaveTangent=-200.000031,InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=-1759.989746,ArriveTangent=-186.456482,LeaveTangent=-186.456482,InterpMode=CIM_CurveAutoClamped),(InVal=162.500000,OutVal=-2202.376953,ArriveTangent=-176.000046,LeaveTangent=-176.000046,InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=-2639.989990,ArriveTangent=-90.348663,LeaveTangent=-90.348663,InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=-2879.991943,ArriveTangent=-0.000244,LeaveTangent=-0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=-2879.992432,ArriveTangent=-0.000146,LeaveTangent=-0.000146,InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=-2879.993408,InterpMode=CIM_CurveAutoClamped),(InVal=182.500000,OutVal=-2585.877441,ArriveTangent=23.383835,LeaveTangent=23.383835,InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=-2559.994385,InterpMode=CIM_CurveAutoClamped),(InVal=187.500000,OutVal=-2559.995605,InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=-2559.995361,InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=-2559.997559,InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=-2559.996338,InterpMode=CIM_CurveAutoClamped),(InVal=198.500000,OutVal=-2559.998047,InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=-2559.997314,InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=-2559.998535,InterpMode=CIM_CurveAutoClamped),(InVal=205.000000,OutVal=-2559.998291,InterpMode=CIM_CurveAutoClamped),(InVal=207.000000,OutVal=-2560.000488,InterpMode=CIM_CurveAutoClamped),(InVal=209.500000,OutVal=-2560.000488,InterpMode=CIM_CurveAutoClamped),(InVal=210.000000,OutVal=-2559.999756,InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=-2885.495605,InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=-2880.000732,InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=-2880.001709,ArriveTangent=-0.000488,LeaveTangent=-0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,OutVal=-3200.002686,ArriveTangent=-0.000458,LeaveTangent=-0.000458,InterpMode=CIM_CurveAutoClamped),(InVal=230.500000,OutVal=-3200.003662,ArriveTangent=-0.000146,LeaveTangent=-0.000146,InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,OutVal=-3200.004150,InterpMode=CIM_CurveAutoClamped),(InVal=237.000000,OutVal=-2861.018066,InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,OutVal=-2880.005127,ArriveTangent=-0.001629,LeaveTangent=-0.001629,InterpMode=CIM_CurveAutoClamped),(InVal=241.500000,OutVal=-2880.006348,InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=-2880.006104,ArriveTangent=0.000214,LeaveTangent=0.000214,InterpMode=CIM_CurveAutoClamped),(InVal=246.500000,OutVal=-2575.428223,ArriveTangent=16.250832,LeaveTangent=16.250832,InterpMode=CIM_CurveAutoClamped),(InVal=249.000000,OutVal=-2560.586426,ArriveTangent=1.011065,LeaveTangent=1.011065,InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,OutVal=-2560.007080,InterpMode=CIM_CurveAutoClamped),(InVal=252.000000,OutVal=-2560.007813,ArriveTangent=-0.000305,LeaveTangent=-0.000305,InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=-2560.008301,InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,OutVal=-2560.008057,ArriveTangent=0.000366,LeaveTangent=0.000366,InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=-960.008789,ArriveTangent=332.722565,LeaveTangent=332.722565,InterpMode=CIM_CurveAutoClamped),(InVal=263.000000,OutVal=101.772461,ArriveTangent=320.000061,LeaveTangent=320.000061,InterpMode=CIM_CurveAutoClamped),(InVal=265.000000,OutVal=639.991394,ArriveTangent=243.749603,LeaveTangent=243.749603,InterpMode=CIM_CurveAutoClamped),(InVal=268.000000,OutVal=1320.520508,InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,OutVal=1279.991577,ArriveTangent=-50.625092,LeaveTangent=-50.625092,InterpMode=CIM_CurveAutoClamped),(InVal=271.000000,OutVal=1078.930908,ArriveTangent=-272.722382,LeaveTangent=-272.722382,InterpMode=CIM_CurveAutoClamped),(InVal=273.500000,OutVal=76.229980,ArriveTangent=-244.667267,LeaveTangent=-244.667267,InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=-160.008301,InterpMode=CIM_CurveAutoClamped),(InVal=276.000000,OutVal=-73.080078,ArriveTangent=132.998169,LeaveTangent=132.998169,InterpMode=CIM_CurveAutoClamped),(InVal=279.000000,OutVal=1022.403870,ArriveTangent=303.711914,LeaveTangent=303.711914,InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=1279.991821,ArriveTangent=0.000175,LeaveTangent=0.000175,InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,OutVal=1279.992065,InterpMode=CIM_CurveAutoClamped),(InVal=287.500000,OutVal=350.760498,InterpMode=CIM_CurveAutoClamped),(InVal=290.000000,OutVal=479.992188,InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=479.992188,InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,OutVal=1599.992310,ArriveTangent=208.000046,LeaveTangent=208.000046,InterpMode=CIM_CurveAutoClamped),(InVal=305.000000,OutVal=2559.992676,ArriveTangent=160.000092,LeaveTangent=160.000092,InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,OutVal=3199.993164,InterpMode=CIM_CurveAutoClamped),(InVal=315.000000,OutVal=2079.993896,ArriveTangent=-191.999893,LeaveTangent=-191.999893,InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,OutVal=1279.994263,InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,OutVal=1279.994507,ArriveTangent=0.000160,LeaveTangent=0.000160,InterpMode=CIM_CurveAutoClamped),(InVal=326.500000,OutVal=1764.842529,ArriveTangent=341.440613,LeaveTangent=341.440613,InterpMode=CIM_CurveAutoClamped),(InVal=328.500000,OutVal=2475.036621,ArriveTangent=247.710205,LeaveTangent=247.710205,InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,OutVal=2719.994873,InterpMode=CIM_CurveAutoClamped),(InVal=331.500000,OutVal=2707.101318,ArriveTangent=-26.577232,LeaveTangent=-26.577232,InterpMode=CIM_CurveAutoClamped),(InVal=332.000000,OutVal=2478.499023,ArriveTangent=-482.973267,LeaveTangent=-482.973267,InterpMode=CIM_CurveAutoClamped),(InVal=333.500000,OutVal=1718.472412,ArriveTangent=-399.501251,LeaveTangent=-399.501251,InterpMode=CIM_CurveAutoClamped),(InVal=335.000000,OutVal=1279.995239,InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=1279.995483,ArriveTangent=0.000122,LeaveTangent=0.000122,InterpMode=CIM_CurveAutoClamped),(InVal=345.000000,OutVal=2559.995850,ArriveTangent=270.489410,LeaveTangent=270.489410,InterpMode=CIM_CurveAutoClamped),(InVal=347.000000,OutVal=3173.421387,ArriveTangent=23.714874,LeaveTangent=23.714874,InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=3199.996582,ArriveTangent=0.000730,LeaveTangent=0.000730,InterpMode=CIM_CurveAutoClamped),(InVal=353.500000,OutVal=3199.997559,InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,OutVal=3199.997559,InterpMode=CIM_CurveAutoClamped),(InVal=356.500000,OutVal=2547.465332,InterpMode=CIM_CurveAutoClamped),(InVal=359.000000,OutVal=2557.107666,ArriveTangent=3.368684,LeaveTangent=3.368684,InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,OutVal=2559.998291,InterpMode=CIM_CurveAutoClamped),(InVal=361.500000,OutVal=2317.383789,ArriveTangent=-215.393768,LeaveTangent=-215.393768,InterpMode=CIM_CurveAutoClamped),(InVal=365.000000,OutVal=1279.998657,ArriveTangent=-234.479584,LeaveTangent=-234.479584,InterpMode=CIM_CurveAutoClamped),(InVal=366.000000,OutVal=1082.451660,ArriveTangent=-219.255859,LeaveTangent=-219.255859,InterpMode=CIM_CurveAutoClamped),(InVal=366.500000,OutVal=951.114868,ArriveTangent=-190.613220,LeaveTangent=-190.613220,InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,OutVal=319.998779,InterpMode=CIM_CurveAutoClamped),(InVal=375.000000,OutVal=319.998779,InterpMode=CIM_CurveAutoClamped),(InVal=376.500000,OutVal=319.998779,InterpMode=CIM_CurveAutoClamped),(InVal=377.500000,OutVal=319.998779,InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=319.998779,InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,OutVal=-640.001343,ArriveTangent=-0.000114,LeaveTangent=-0.000114,InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,OutVal=-640.001587,InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,OutVal=479.998291,ArriveTangent=117.386749,LeaveTangent=117.386749,InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=799.998352,ArriveTangent=105.184059,LeaveTangent=105.184059,InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,OutVal=1599.998535,ArriveTangent=0.000298,LeaveTangent=0.000298,InterpMode=CIM_CurveAutoClamped),(InVal=407.500000,OutVal=1599.998901,InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=1599.998779,ArriveTangent=-0.000099,LeaveTangent=-0.000099,InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,OutVal=1279.999023,InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,OutVal=2399.999512,ArriveTangent=117.386856,LeaveTangent=117.386856,InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,OutVal=2720.000000,ArriveTangent=116.252380,LeaveTangent=116.252380,InterpMode=CIM_CurveAutoClamped),(InVal=428.000000,OutVal=3330.018555,ArriveTangent=141.351898,LeaveTangent=141.351898,InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=3520.000488,ArriveTangent=0.000614,LeaveTangent=0.000614,InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,OutVal=3520.001465,InterpMode=CIM_CurveAutoClamped),(InVal=437.000000,OutVal=3363.325195,ArriveTangent=-114.847221,LeaveTangent=-114.847221,InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=2880.002441,ArriveTangent=-180.415253,LeaveTangent=-180.415253,InterpMode=CIM_CurveAutoClamped),(InVal=445.000000,OutVal=1920.003174,ArriveTangent=-239.999908,LeaveTangent=-239.999908,InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=480.003418,ArriveTangent=-254.868195,LeaveTangent=-254.868195,InterpMode=CIM_CurveAutoClamped),(InVal=451.500000,OutVal=137.384766,ArriveTangent=-192.000031,LeaveTangent=-192.000031,InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,OutVal=-479.996704,ArriveTangent=-55.967186,LeaveTangent=-55.967186,InterpMode=CIM_CurveAutoClamped),(InVal=457.000000,OutVal=-541.501099,ArriveTangent=-49.942207,LeaveTangent=-49.942207,InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=-799.996948,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=-319.997192,InterpMode=CIM_CurveAutoClamped),(InVal=467.500000,OutVal=-542.341431,InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,OutVal=-479.997437,ArriveTangent=45.333397,LeaveTangent=45.333397,InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,OutVal=480.002441,InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,OutVal=480.002441,InterpMode=CIM_CurveAutoClamped),(InVal=485.000000,OutVal=800.002502,ArriveTangent=139.365799,LeaveTangent=139.365799,InterpMode=CIM_CurveAutoClamped),(InVal=487.000000,OutVal=1473.334473,ArriveTangent=352.000092,LeaveTangent=352.000092,InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,OutVal=2560.002930,ArriveTangent=0.000290,LeaveTangent=0.000290,InterpMode=CIM_CurveAutoClamped),(InVal=495.000000,OutVal=2560.003418,ArriveTangent=0.000122,LeaveTangent=0.000122,InterpMode=CIM_CurveAutoClamped),(InVal=498.000000,OutVal=2560.003906,InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,OutVal=2560.003906,InterpMode=CIM_CurveAutoClamped),(InVal=503.000000,OutVal=2074.384521,ArriveTangent=-159.999908,LeaveTangent=-159.999908,InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,OutVal=1760.004395,InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,OutVal=3520.004883,ArriveTangent=373.698303,LeaveTangent=373.698303,InterpMode=CIM_CurveAutoClamped),(InVal=511.500000,OutVal=4189.043457,ArriveTangent=384.000183,LeaveTangent=384.000183,InterpMode=CIM_CurveAutoClamped),(InVal=515.000000,OutVal=5440.005859,ArriveTangent=0.000534,LeaveTangent=0.000534,InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=5440.006836,InterpMode=CIM_CurveAutoClamped),(InVal=525.000000,OutVal=4480.007813,ArriveTangent=-112.047668,LeaveTangent=-112.047668,InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=4160.009277,InterpMode=CIM_CurveAutoClamped),(InVal=535.000000,OutVal=5760.010254,InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=4960.011230,ArriveTangent=-213.202301,LeaveTangent=-213.202301,InterpMode=CIM_CurveAutoClamped),(InVal=541.500000,OutVal=4374.195313,ArriveTangent=-140.633270,LeaveTangent=-140.633270,InterpMode=CIM_CurveAutoClamped),(InVal=545.000000,OutVal=4160.012207,InterpMode=CIM_CurveAutoClamped),(InVal=547.500000,OutVal=4178.441895,InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,OutVal=3840.013184,ArriveTangent=-42.251232,LeaveTangent=-42.251232,InterpMode=CIM_CurveAutoClamped),(InVal=553.000000,OutVal=3782.433594,InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,OutVal=4480.014160,ArriveTangent=115.506081,LeaveTangent=115.506081,InterpMode=CIM_CurveAutoClamped),(InVal=557.500000,OutVal=4611.800781,ArriveTangent=113.238892,LeaveTangent=113.238892,InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,OutVal=5600.015137,ArriveTangent=281.095367,LeaveTangent=281.095367,InterpMode=CIM_CurveAutoClamped),(InVal=565.000000,OutVal=6720.016113,InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,OutVal=6400.017090,InterpMode=CIM_CurveAutoClamped),(InVal=575.000000,OutVal=6720.018066,InterpMode=CIM_CurveAutoClamped),(InVal=578.500000,OutVal=6451.617676,InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,OutVal=6720.019043,InterpMode=CIM_CurveAutoClamped),(InVal=581.500000,OutVal=6644.391602,ArriveTangent=-60.057350,LeaveTangent=-60.057350,InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,OutVal=6400.020020,InterpMode=CIM_CurveAutoClamped),(InVal=588.500000,OutVal=6400.020996,InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=6400.020996,InterpMode=CIM_CurveAutoClamped),(InVal=592.000000,OutVal=6705.556152,ArriveTangent=12.855530,LeaveTangent=12.855530,InterpMode=CIM_CurveAutoClamped),(InVal=595.000000,OutVal=6720.021973,ArriveTangent=0.000562,LeaveTangent=0.000562,InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=6720.022949,ArriveTangent=0.000244,LeaveTangent=0.000244,InterpMode=CIM_CurveAutoClamped),(InVal=603.000000,OutVal=6720.023926,InterpMode=CIM_CurveAutoClamped),(InVal=605.000000,OutVal=6720.023926,InterpMode=CIM_CurveAutoClamped),(InVal=606.500000,OutVal=6381.983887,InterpMode=CIM_CurveAutoClamped),(InVal=608.500000,OutVal=6394.399414,ArriveTangent=5.065246,LeaveTangent=5.065246,InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,OutVal=6400.024902,InterpMode=CIM_CurveAutoClamped),(InVal=613.000000,OutVal=5420.751953,ArriveTangent=-377.702148,LeaveTangent=-377.702148,InterpMode=CIM_CurveAutoClamped),(InVal=614.500000,OutVal=4700.365234,ArriveTangent=-550.363037,LeaveTangent=-550.363037,InterpMode=CIM_CurveAutoClamped),(InVal=615.000000,OutVal=4320.025879,ArriveTangent=-367.076416,LeaveTangent=-367.076416,InterpMode=CIM_CurveAutoClamped),(InVal=616.500000,OutVal=3966.212402,ArriveTangent=-274.335449,LeaveTangent=-274.335449,InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,OutVal=2880.026855,ArriveTangent=-240.727631,LeaveTangent=-240.727631,InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,OutVal=1920.027588,ArriveTangent=-177.384888,LeaveTangent=-177.384888,InterpMode=CIM_CurveAutoClamped),(InVal=628.000000,OutVal=1456.724609,ArriveTangent=-121.223267,LeaveTangent=-121.223267,InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=1280.027954,InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,OutVal=1280.028198,InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,OutVal=640.028381,InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,OutVal=640.028503,InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=623.740723,ArriveTangent=-7.982803,LeaveTangent=-7.982803,InterpMode=CIM_CurveAutoClamped),(InVal=655.000000,OutVal=-319.971313,ArriveTangent=-0.000114,LeaveTangent=-0.000114,InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=-319.971558,InterpMode=CIM_CurveAutoClamped),(InVal=665.000000,OutVal=640.028381,InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=-479.971680,InterpMode=CIM_CurveAutoClamped),(InVal=672.500000,OutVal=84.364990,ArriveTangent=64.963684,LeaveTangent=64.963684,InterpMode=CIM_CurveAutoClamped),(InVal=675.000000,OutVal=160.028198,ArriveTangent=58.337276,LeaveTangent=58.337276,InterpMode=CIM_CurveAutoClamped),(InVal=676.500000,OutVal=323.705444,InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=320.028198,InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,OutVal=1600.028320,ArriveTangent=0.000114,LeaveTangent=0.000114,InterpMode=CIM_CurveAutoClamped),(InVal=690.000000,OutVal=1600.028564),(InVal=690.000000,OutVal=1600.028687,ArriveTangent=-1.220764,LeaveTangent=-1.220764,InterpMode=CIM_CurveAutoClamped),(InVal=695.000000,OutVal=-479.971436,InterpMode=CIM_CurveAutoClamped),(InVal=698.000000,OutVal=710.526672,InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=640.028503,InterpMode=CIM_CurveAutoClamped),(InVal=705.000000,OutVal=960.028687,ArriveTangent=0.000278,LeaveTangent=0.000278,InterpMode=CIM_CurveAutoClamped),(InVal=706.500000,OutVal=960.028931,ArriveTangent=0.000092,LeaveTangent=0.000092,InterpMode=CIM_CurveAutoClamped),(InVal=709.000000,OutVal=960.029053,InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,OutVal=960.028931,ArriveTangent=-0.000275,LeaveTangent=-0.000275,InterpMode=CIM_CurveAutoClamped),(InVal=711.500000,OutVal=632.848633,InterpMode=CIM_CurveAutoClamped),(InVal=715.000000,OutVal=800.029114,InterpMode=CIM_CurveAutoClamped),(InVal=716.500000,OutVal=653.279419,ArriveTangent=-26.195881,LeaveTangent=-26.195881,InterpMode=CIM_CurveAutoClamped),(InVal=718.500000,OutVal=630.645264,ArriveTangent=-28.428947,LeaveTangent=-28.428947,InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=320.029175,ArriveTangent=-195.479416,LeaveTangent=-195.479416,InterpMode=CIM_CurveAutoClamped),(InVal=725.000000,OutVal=-639.970947,InterpMode=CIM_CurveAutoClamped),(InVal=727.000000,OutVal=120.074463,ArriveTangent=428.017731,LeaveTangent=428.017731,InterpMode=CIM_CurveAutoClamped),(InVal=728.500000,OutVal=858.091125,ArriveTangent=493.864441,LeaveTangent=493.864441,InterpMode=CIM_CurveAutoClamped),(InVal=729.500000,OutVal=1354.735596,ArriveTangent=494.596497,LeaveTangent=494.596497,InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=1600.029297,ArriveTangent=160.962585,LeaveTangent=160.962585,InterpMode=CIM_CurveAutoClamped),(InVal=735.000000,OutVal=2240.029785,ArriveTangent=149.956467,LeaveTangent=149.956467,InterpMode=CIM_CurveAutoClamped),(InVal=736.000000,OutVal=2499.768066,ArriveTangent=128.000092,LeaveTangent=128.000092,InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,OutVal=2880.030273,InterpMode=CIM_CurveAutoClamped),(InVal=745.000000,OutVal=1280.030884,ArriveTangent=-334.404175,LeaveTangent=-334.404175,InterpMode=CIM_CurveAutoClamped),(InVal=746.000000,OutVal=873.605164,ArriveTangent=-435.621063,LeaveTangent=-435.621063,InterpMode=CIM_CurveAutoClamped),(InVal=747.000000,OutVal=408.788757,ArriveTangent=-400.899994,LeaveTangent=-400.899994,InterpMode=CIM_CurveAutoClamped),(InVal=748.000000,OutVal=71.805176,ArriveTangent=-349.143799,LeaveTangent=-349.143799,InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,OutVal=-639.969116,ArriveTangent=-0.000153,LeaveTangent=-0.000153,InterpMode=CIM_CurveAutoClamped),(InVal=755.000000,OutVal=-639.969360,InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,OutVal=960.030884,ArriveTangent=0.000061,LeaveTangent=0.000061,InterpMode=CIM_CurveAutoClamped),(InVal=765.000000,OutVal=960.031006,InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,OutVal=320.031006,InterpMode=CIM_CurveAutoClamped),(InVal=775.000000,OutVal=320.031006,InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,OutVal=1280.031250,ArriveTangent=0.000114,LeaveTangent=0.000114,InterpMode=CIM_CurveAutoClamped),(InVal=785.000000,OutVal=1280.031494,ArriveTangent=0.000153,LeaveTangent=0.000153,InterpMode=CIM_CurveAutoClamped),(InVal=787.000000,OutVal=1919.197266,ArriveTangent=358.889069,LeaveTangent=358.889069,InterpMode=CIM_CurveAutoClamped),(InVal=788.000000,OutVal=2356.698730,ArriveTangent=426.944916,LeaveTangent=426.944916,InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,OutVal=3200.031982,ArriveTangent=0.000473,LeaveTangent=0.000473,InterpMode=CIM_CurveAutoClamped),(InVal=795.000000,OutVal=3200.032715,InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,OutVal=2080.033447,InterpMode=CIM_CurveAutoClamped),(InVal=805.000000,OutVal=2240.033936,ArriveTangent=66.320206,LeaveTangent=66.320206,InterpMode=CIM_CurveAutoClamped),(InVal=810.000000,OutVal=3200.034668,ArriveTangent=0.000496,LeaveTangent=0.000496,InterpMode=CIM_CurveAutoClamped),(InVal=815.000000,OutVal=3200.035645,InterpMode=CIM_CurveAutoClamped),(InVal=820.000000,OutVal=2240.036377,ArriveTangent=-223.999908,LeaveTangent=-223.999908,InterpMode=CIM_CurveAutoClamped),(InVal=825.000000,OutVal=960.036743,ArriveTangent=-121.657608,LeaveTangent=-121.657608,InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,OutVal=640.036926,InterpMode=CIM_CurveAutoClamped),(InVal=835.000000,OutVal=640.036987,InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,OutVal=-1919.963257,InterpMode=CIM_CurveAutoClamped),(InVal=845.000000,OutVal=-1919.963257,InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,OutVal=160.036621,ArriveTangent=320.000000,LeaveTangent=320.000000,InterpMode=CIM_CurveAutoClamped),(InVal=855.000000,OutVal=1280.036743,ArriveTangent=249.279953,LeaveTangent=249.279953,InterpMode=CIM_CurveAutoClamped),(InVal=857.500000,OutVal=2029.636230,InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,OutVal=1920.037109,ArriveTangent=-89.287628,LeaveTangent=-89.287628,InterpMode=CIM_CurveAutoClamped),(InVal=863.500000,OutVal=495.707397,ArriveTangent=-371.964355,LeaveTangent=-371.964355,InterpMode=CIM_CurveAutoClamped),(InVal=865.000000,OutVal=0.037354,ArriveTangent=-223.949249,LeaveTangent=-223.949249,InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,OutVal=-959.962769,ArriveTangent=-0.000114,LeaveTangent=-0.000114,InterpMode=CIM_CurveAutoClamped),(InVal=875.000000,OutVal=-959.963013,InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,OutVal=-959.963013,InterpMode=CIM_CurveAutoClamped),(InVal=885.000000,OutVal=-959.963013,InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,OutVal=-959.963013,InterpMode=CIM_CurveAutoClamped),(InVal=895.000000,OutVal=0.037109,InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=0.037109,InterpMode=CIM_CurveAutoClamped),(InVal=905.000000,OutVal=640.037170,ArriveTangent=0.000057,LeaveTangent=0.000057,InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,OutVal=640.037292,ArriveTangent=0.000069,LeaveTangent=0.000069,InterpMode=CIM_CurveAutoClamped),(InVal=913.500000,OutVal=1426.501953,ArriveTangent=256.000061,LeaveTangent=256.000061,InterpMode=CIM_CurveAutoClamped),(InVal=915.000000,OutVal=1920.037598,ArriveTangent=272.851715,LeaveTangent=272.851715,InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,OutVal=3200.038086,InterpMode=CIM_CurveAutoClamped),(InVal=925.000000,OutVal=2880.039063,InterpMode=CIM_CurveAutoClamped),(InVal=928.500000,OutVal=2880.187012,InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,OutVal=2880.040039,InterpMode=CIM_CurveAutoClamped),(InVal=935.000000,OutVal=4000.041016,ArriveTangent=0.000504,LeaveTangent=0.000504,InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,OutVal=4000.041992,ArriveTangent=0.000488,LeaveTangent=0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=945.000000,OutVal=5600.042969,ArriveTangent=304.000183,LeaveTangent=304.000183,InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,OutVal=7040.043945,ArriveTangent=249.964981,LeaveTangent=249.964981,InterpMode=CIM_CurveAutoClamped),(InVal=951.500000,OutVal=7371.550293,ArriveTangent=223.667282,LeaveTangent=223.667282,InterpMode=CIM_CurveAutoClamped),(InVal=955.000000,OutVal=8160.045410,ArriveTangent=278.883270,LeaveTangent=278.883270,InterpMode=CIM_CurveAutoClamped),(InVal=957.000000,OutVal=8905.408203,ArriveTangent=47.294228,LeaveTangent=47.294228,InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,OutVal=8960.047852,InterpMode=CIM_CurveAutoClamped),(InVal=963.000000,OutVal=8801.606445,ArriveTangent=-116.562714,LeaveTangent=-116.562714,InterpMode=CIM_CurveAutoClamped),(InVal=965.000000,OutVal=8160.049805,InterpMode=CIM_CurveAutoClamped),(InVal=967.000000,OutVal=8209.629883,ArriveTangent=36.516182,LeaveTangent=36.516182,InterpMode=CIM_CurveAutoClamped),(InVal=968.500000,OutVal=8287.856445,ArriveTangent=34.898144,LeaveTangent=34.898144,InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,OutVal=8320.051758,InterpMode=CIM_CurveAutoClamped),(InVal=972.000000,OutVal=7870.255859,ArriveTangent=-255.999710,LeaveTangent=-255.999710,InterpMode=CIM_CurveAutoClamped),(InVal=975.000000,OutVal=7040.053223,ArriveTangent=-243.653946,LeaveTangent=-243.653946,InterpMode=CIM_CurveAutoClamped),(InVal=979.000000,OutVal=6164.678223,ArriveTangent=-113.048019,LeaveTangent=-113.048019,InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,OutVal=6080.054199,InterpMode=CIM_CurveAutoClamped),(InVal=985.000000,OutVal=6080.055176,ArriveTangent=0.000195,LeaveTangent=0.000195,InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,OutVal=6080.056152,ArriveTangent=0.000195,LeaveTangent=0.000195,InterpMode=CIM_CurveAutoClamped),(InVal=995.000000,OutVal=6080.057129,ArriveTangent=0.000195,LeaveTangent=0.000195,InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,OutVal=6080.058105,ArriveTangent=0.000504,LeaveTangent=0.000504,InterpMode=CIM_CurveAutoClamped),(InVal=1005.000000,OutVal=8000.059570,ArriveTangent=0.000992,LeaveTangent=0.000992,InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,OutVal=8000.061523,ArriveTangent=0.000992,LeaveTangent=0.000992,InterpMode=CIM_CurveAutoClamped),(InVal=1015.000000,OutVal=9600.063477,ArriveTangent=0.001953,LeaveTangent=0.001953,InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,OutVal=9600.067383,ArriveTangent=0.000781,LeaveTangent=0.000781,InterpMode=CIM_CurveAutoClamped),(InVal=1025.000000,OutVal=9600.071289,ArriveTangent=0.001957,LeaveTangent=0.001957,InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,OutVal=10240.075195,ArriveTangent=0.001953,LeaveTangent=0.001953,InterpMode=CIM_CurveAutoClamped),(InVal=1035.000000,OutVal=10240.079102,InterpMode=CIM_CurveAutoClamped),(InVal=1038.500000,OutVal=9311.658203,ArriveTangent=-37.935074,LeaveTangent=-37.935074,InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,OutVal=9280.083008,InterpMode=CIM_CurveAutoClamped),(InVal=1041.500000,OutVal=9472.595703,ArriveTangent=209.247452,LeaveTangent=209.247452,InterpMode=CIM_CurveAutoClamped),(InVal=1043.500000,OutVal=10160.540039,ArriveTangent=310.711212,LeaveTangent=310.711212,InterpMode=CIM_CurveAutoClamped),(InVal=1045.000000,OutVal=10560.084961,InterpMode=CIM_CurveAutoClamped),(InVal=1046.500000,OutVal=10172.456055,ArriveTangent=-66.615860,LeaveTangent=-66.615860,InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,OutVal=10080.088867,InterpMode=CIM_CurveAutoClamped),(InVal=1055.000000,OutVal=10880.092773,ArriveTangent=0.001953,LeaveTangent=0.001953,InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,OutVal=10880.096680,ArriveTangent=0.001953,LeaveTangent=0.001953,InterpMode=CIM_CurveAutoClamped),(InVal=1065.000000,OutVal=11680.100586,InterpMode=CIM_CurveAutoClamped),(InVal=1067.000000,OutVal=11374.735352,InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,OutVal=11840.104492,ArriveTangent=0.003975,LeaveTangent=0.003975,InterpMode=CIM_CurveAutoClamped),(InVal=1074.000000,OutVal=11840.110352,InterpMode=CIM_CurveAutoClamped),(InVal=1075.000000,OutVal=11840.108398,ArriveTangent=-0.002930,LeaveTangent=-0.002930,InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,OutVal=10560.112305,ArriveTangent=-271.999207,LeaveTangent=-271.999207,InterpMode=CIM_CurveAutoClamped),(InVal=1085.000000,OutVal=9120.116211,ArriveTangent=-255.999420,LeaveTangent=-255.999420,InterpMode=CIM_CurveAutoClamped),(InVal=1090.000000,OutVal=8000.118164,InterpMode=CIM_CurveAutoClamped),(InVal=1093.500000,OutVal=9019.306641,ArriveTangent=287.087311,LeaveTangent=287.087311,InterpMode=CIM_CurveAutoClamped),(InVal=1095.000000,OutVal=9440.120117,ArriveTangent=0.001297,LeaveTangent=0.001297,InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,OutVal=9440.122070,ArriveTangent=0.000391,LeaveTangent=0.000391,InterpMode=CIM_CurveAutoClamped),(InVal=1105.000000,OutVal=9440.124023,InterpMode=CIM_CurveAutoClamped),(InVal=1106.000000,OutVal=8994.540039,ArriveTangent=-38.239639,LeaveTangent=-38.239639,InterpMode=CIM_CurveAutoClamped),(InVal=1107.000000,OutVal=8978.591797,ArriveTangent=-27.259766,LeaveTangent=-27.259766,InterpMode=CIM_CurveAutoClamped),(InVal=1110.000000,OutVal=7840.125977,ArriveTangent=-80.218025,LeaveTangent=-80.218025,InterpMode=CIM_CurveAutoClamped),(InVal=1115.000000,OutVal=7680.127930,ArriveTangent=-75.234657,LeaveTangent=-75.234657,InterpMode=CIM_CurveAutoClamped),(InVal=1118.000000,OutVal=6926.268066,ArriveTangent=-255.999710,LeaveTangent=-255.999710,InterpMode=CIM_CurveAutoClamped),(InVal=1120.000000,OutVal=6400.129395,InterpMode=CIM_CurveAutoClamped),(InVal=1125.000000,OutVal=6400.130371,ArriveTangent=0.000496,LeaveTangent=0.000496,InterpMode=CIM_CurveAutoClamped),(InVal=1130.000000,OutVal=7520.131836,ArriveTangent=0.000977,LeaveTangent=0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=1135.000000,OutVal=7520.133789,ArriveTangent=0.000977,LeaveTangent=0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=1140.000000,OutVal=8160.135742,InterpMode=CIM_CurveAutoClamped),(InVal=1145.000000,OutVal=8000.137695,ArriveTangent=-78.969292,LeaveTangent=-78.969292,InterpMode=CIM_CurveAutoClamped),(InVal=1146.500000,OutVal=7589.624023,ArriveTangent=-345.321991,LeaveTangent=-345.321991,InterpMode=CIM_CurveAutoClamped),(InVal=1148.500000,OutVal=6791.510742,ArriveTangent=-52.756943,LeaveTangent=-52.756943,InterpMode=CIM_CurveAutoClamped),(InVal=1151.000000,OutVal=6738.345215,InterpMode=CIM_CurveAutoClamped),(InVal=1153.500000,OutVal=7534.776367,ArriveTangent=315.449097,LeaveTangent=315.449097,InterpMode=CIM_CurveAutoClamped),(InVal=1155.000000,OutVal=8000.141602,ArriveTangent=0.001289,LeaveTangent=0.001289,InterpMode=CIM_CurveAutoClamped),(InVal=1160.000000,OutVal=8000.143555,ArriveTangent=0.000977,LeaveTangent=0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=1165.000000,OutVal=9440.145508,ArriveTangent=314.008331,LeaveTangent=314.008331,InterpMode=CIM_CurveAutoClamped),(InVal=1167.500000,OutVal=10355.206055,ArriveTangent=160.019653,LeaveTangent=160.019653,InterpMode=CIM_CurveAutoClamped),(InVal=1170.000000,OutVal=10560.149414,ArriveTangent=69.992966,LeaveTangent=69.992966,InterpMode=CIM_CurveAutoClamped),(InVal=1175.000000,OutVal=10880.153320,ArriveTangent=0.002769,LeaveTangent=0.002769,InterpMode=CIM_CurveAutoClamped),(InVal=1178.000000,OutVal=10880.157227,InterpMode=CIM_CurveAutoClamped),(InVal=1180.000000,OutVal=10880.157227,InterpMode=CIM_CurveAutoClamped),(InVal=1182.000000,OutVal=10880.159180,ArriveTangent=0.001465,LeaveTangent=0.001465,InterpMode=CIM_CurveAutoClamped),(InVal=1184.000000,OutVal=10880.163086,InterpMode=CIM_CurveAutoClamped),(InVal=1185.000000,OutVal=10880.161133,ArriveTangent=-0.002930,LeaveTangent=-0.002930,InterpMode=CIM_CurveAutoClamped),(InVal=1190.000000,OutVal=9760.165039,InterpMode=CIM_CurveAutoClamped),(InVal=1192.500000,OutVal=9767.788086,ArriveTangent=7.409492,LeaveTangent=7.409492,InterpMode=CIM_CurveAutoClamped),(InVal=1195.000000,OutVal=10080.168945,InterpMode=CIM_CurveAutoClamped),(InVal=1200.000000,OutVal=9760.172852,ArriveTangent=-105.182999,LeaveTangent=-105.182999,InterpMode=CIM_CurveAutoClamped),(InVal=1205.000000,OutVal=8960.177734,ArriveTangent=-258.921387,LeaveTangent=-258.921387,InterpMode=CIM_CurveAutoClamped),(InVal=1210.000000,OutVal=7040.179199,InterpMode=CIM_CurveAutoClamped),(InVal=1215.000000,OutVal=7040.180176,ArriveTangent=0.000488,LeaveTangent=0.000488,InterpMode=CIM_CurveAutoClamped),(InVal=1220.000000,OutVal=8320.181641,ArriveTangent=0.000992,LeaveTangent=0.000992,InterpMode=CIM_CurveAutoClamped),(InVal=1225.000000,OutVal=8320.183594,ArriveTangent=0.000391,LeaveTangent=0.000391,InterpMode=CIM_CurveAutoClamped),(InVal=1230.000000,OutVal=8320.185547,ArriveTangent=0.000977,LeaveTangent=0.000977,InterpMode=CIM_CurveAutoClamped),(InVal=1235.000000,OutVal=9440.187500,ArriveTangent=256.000671,LeaveTangent=256.000671,InterpMode=CIM_CurveAutoClamped),(InVal=1240.000000,OutVal=10880.192383,ArriveTangent=0.001968,LeaveTangent=0.001968,InterpMode=CIM_CurveAutoClamped),(InVal=1245.000000,OutVal=10880.196289,ArriveTangent=0.001953,LeaveTangent=0.001953,InterpMode=CIM_CurveAutoClamped),(InVal=1250.000000,OutVal=11840.200195,ArriveTangent=0.001953,LeaveTangent=0.001953,InterpMode=CIM_CurveAutoClamped),(InVal=1255.000000,OutVal=11840.204102,InterpMode=CIM_CurveAutoClamped),(InVal=1260.000000,OutVal=10880.208008,InterpMode=CIM_CurveAutoClamped),(InVal=1265.000000,OutVal=10880.211914,ArriveTangent=0.000781,LeaveTangent=0.000781,InterpMode=CIM_CurveAutoClamped),(InVal=1270.000000,OutVal=10880.215820,InterpMode=CIM_CurveAutoClamped),(InVal=1275.000000,OutVal=10184.221680,InterpMode=CIM_CurveAutoClamped),(InVal=1280.000000,OutVal=10560.223633,InterpMode=CIM_CurveAutoClamped),(InVal=1282.500000,OutVal=9946.203125,InterpMode=CIM_CurveAutoClamped),(InVal=1284.000000,OutVal=10277.385742,InterpMode=CIM_CurveAutoClamped),(InVal=1285.000000,OutVal=10240.227539,ArriveTangent=-51.597725,LeaveTangent=-51.597725,InterpMode=CIM_CurveAutoClamped),(InVal=1290.000000,OutVal=9280.231445,ArriveTangent=-163.408234,LeaveTangent=-163.408234,InterpMode=CIM_CurveAutoClamped),(InVal=1292.500000,OutVal=8947.646484,ArriveTangent=-228.981216,LeaveTangent=-228.981216,InterpMode=CIM_CurveAutoClamped),(InVal=1295.000000,OutVal=8000.234375,ArriveTangent=-232.988083,LeaveTangent=-232.988083,InterpMode=CIM_CurveAutoClamped),(InVal=1300.000000,OutVal=7200.235840,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_1"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_2
            MoveAxis=AXIS_TranslationZ
            LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000),(Time=15.000000),(Time=17.500000),(Time=17.500000),(Time=20.000000),(Time=25.000000),(Time=27.500000),(Time=30.000000),(Time=35.000000),(Time=40.000000),(Time=45.000000),(Time=50.000000),(Time=55.000000),(Time=60.000000),(Time=65.000000),(Time=70.000000),(Time=75.000000),(Time=80.000000),(Time=85.000000),(Time=87.500000),(Time=90.000000),(Time=95.000000),(Time=97.500000),(Time=100.000000),(Time=105.000000),(Time=110.000000),(Time=115.000000),(Time=120.000000),(Time=125.000000),(Time=130.000000),(Time=130.000000),(Time=135.000000),(Time=140.000000),(Time=145.000000),(Time=145.000000),(Time=150.000000),(Time=155.000000),(Time=155.500000),(Time=160.000000),(Time=162.500000),(Time=165.000000),(Time=170.000000),(Time=175.000000),(Time=176.500000),(Time=180.000000),(Time=182.500000),(Time=185.000000),(Time=187.500000),(Time=190.000000),(Time=192.000000),(Time=195.000000),(Time=198.500000),(Time=200.000000),(Time=203.000000),(Time=205.000000),(Time=207.000000),(Time=209.500000),(Time=210.000000),(Time=212.000000),(Time=215.000000),(Time=220.000000),(Time=225.000000),(Time=226.500000),(Time=235.000000),(Time=237.000000),(Time=240.000000),(Time=241.500000),(Time=245.000000),(Time=246.500000),(Time=249.000000),(Time=250.000000),(Time=252.000000),(Time=254.000000),(Time=255.000000),(Time=260.000000),(Time=263.000000),(Time=265.000000),(Time=268.000000),(Time=270.000000),(Time=271.000000),(Time=273.500000),(Time=275.000000),(Time=276.000000),(Time=279.000000),(Time=280.000000),(Time=285.000000),(Time=287.500000),(Time=290.000000),(Time=295.000000),(Time=300.000000),(Time=305.000000),(Time=310.000000),(Time=315.000000),(Time=320.000000),(Time=325.000000),(Time=326.500000),(Time=328.500000),(Time=330.000000),(Time=331.500000),(Time=332.000000),(Time=333.500000),(Time=335.000000),(Time=340.000000),(Time=345.000000),(Time=347.000000),(Time=350.000000),(Time=353.500000),(Time=355.000000),(Time=356.500000),(Time=359.000000),(Time=360.000000),(Time=361.500000),(Time=365.000000),(Time=366.000000),(Time=366.500000),(Time=370.000000),(Time=375.000000),(Time=376.500000),(Time=377.500000),(Time=380.000000),(Time=385.000000),(Time=390.000000),(Time=395.000000),(Time=400.000000),(Time=405.000000),(Time=407.500000),(Time=410.000000),(Time=415.000000),(Time=420.000000),(Time=425.000000),(Time=428.000000),(Time=430.000000),(Time=435.000000),(Time=437.000000),(Time=438.000000),(Time=440.000000),(Time=442.000000),(Time=445.000000),(Time=450.000000),(Time=451.500000),(Time=455.000000),(Time=457.000000),(Time=460.000000),(Time=465.000000),(Time=467.500000),(Time=470.000000),(Time=475.000000),(Time=480.000000),(Time=485.000000),(Time=487.000000),(Time=490.000000),(Time=495.000000),(Time=498.000000),(Time=500.000000),(Time=503.000000),(Time=505.000000),(Time=510.000000),(Time=511.500000),(Time=515.000000),(Time=520.000000),(Time=525.000000),(Time=530.000000),(Time=535.000000),(Time=540.000000),(Time=541.500000),(Time=545.000000),(Time=547.500000),(Time=550.000000),(Time=553.000000),(Time=555.000000),(Time=557.500000),(Time=560.000000),(Time=565.000000),(Time=570.000000),(Time=575.000000),(Time=578.500000),(Time=580.000000),(Time=581.500000),(Time=585.000000),(Time=588.500000),(Time=590.000000),(Time=592.000000),(Time=595.000000),(Time=600.000000),(Time=603.000000),(Time=605.000000),(Time=606.500000),(Time=608.500000),(Time=610.000000),(Time=613.000000),(Time=614.500000),(Time=615.000000),(Time=616.500000),(Time=620.000000),(Time=625.000000),(Time=628.000000),(Time=630.000000),(Time=635.000000),(Time=640.000000),(Time=645.000000),(Time=650.000000),(Time=655.000000),(Time=660.000000),(Time=665.000000),(Time=670.000000),(Time=672.500000),(Time=675.000000),(Time=676.500000),(Time=680.000000),(Time=685.000000),(Time=690.000000),(Time=690.000000),(Time=695.000000),(Time=698.000000),(Time=700.000000),(Time=705.000000),(Time=706.500000),(Time=709.000000),(Time=710.000000),(Time=711.500000),(Time=715.000000),(Time=716.500000),(Time=718.500000),(Time=720.000000),(Time=725.000000),(Time=727.000000),(Time=728.500000),(Time=729.500000),(Time=730.000000),(Time=735.000000),(Time=737.000000),(Time=740.000000),(Time=745.000000),(Time=746.000000),(Time=747.000000),(Time=748.000000),(Time=750.000000),(Time=755.000000),(Time=760.000000),(Time=765.000000),(Time=770.000000),(Time=775.000000),(Time=780.000000),(Time=785.000000),(Time=787.000000),(Time=788.000000),(Time=790.000000),(Time=795.000000),(Time=800.000000),(Time=805.000000),(Time=810.000000),(Time=815.000000),(Time=820.000000),(Time=825.000000),(Time=830.000000),(Time=835.000000),(Time=840.000000),(Time=845.000000),(Time=850.000000),(Time=855.000000),(Time=857.500000),(Time=860.000000),(Time=863.500000),(Time=865.000000),(Time=870.000000),(Time=875.000000),(Time=880.000000),(Time=885.000000),(Time=890.000000),(Time=895.000000),(Time=900.000000),(Time=905.000000),(Time=910.000000),(Time=913.500000),(Time=915.000000),(Time=920.000000),(Time=925.000000),(Time=928.500000),(Time=930.000000),(Time=935.000000),(Time=940.000000),(Time=945.000000),(Time=950.000000),(Time=951.500000),(Time=955.000000),(Time=957.000000),(Time=960.000000),(Time=963.000000),(Time=965.000000),(Time=967.000000),(Time=968.500000),(Time=970.000000),(Time=972.000000),(Time=975.000000),(Time=979.000000),(Time=980.000000),(Time=985.000000),(Time=990.000000),(Time=995.000000),(Time=1000.000000),(Time=1005.000000),(Time=1010.000000),(Time=1015.000000),(Time=1020.000000),(Time=1025.000000),(Time=1030.000000),(Time=1035.000000),(Time=1038.500000),(Time=1040.000000),(Time=1041.500000),(Time=1043.500000),(Time=1045.000000),(Time=1046.500000),(Time=1050.000000),(Time=1055.000000),(Time=1060.000000),(Time=1065.000000),(Time=1067.000000),(Time=1070.000000),(Time=1074.000000),(Time=1075.000000),(Time=1080.000000),(Time=1085.000000),(Time=1090.000000),(Time=1093.500000),(Time=1095.000000),(Time=1100.000000),(Time=1105.000000),(Time=1106.000000),(Time=1107.000000),(Time=1110.000000),(Time=1115.000000),(Time=1118.000000),(Time=1120.000000),(Time=1125.000000),(Time=1130.000000),(Time=1135.000000),(Time=1140.000000),(Time=1145.000000),(Time=1146.500000),(Time=1148.500000),(Time=1151.000000),(Time=1153.500000),(Time=1155.000000),(Time=1160.000000),(Time=1165.000000),(Time=1167.500000),(Time=1170.000000),(Time=1175.000000),(Time=1178.000000),(Time=1180.000000),(Time=1182.000000),(Time=1184.000000),(Time=1185.000000),(Time=1190.000000),(Time=1192.500000),(Time=1195.000000),(Time=1200.000000),(Time=1205.000000),(Time=1210.000000),(Time=1215.000000),(Time=1220.000000),(Time=1225.000000),(Time=1229.000000),(Time=1230.000000),(Time=1232.500000),(Time=1233.500000),(Time=1235.000000),(Time=1240.000000),(Time=1245.000000),(Time=1250.000000),(Time=1255.000000),(Time=1260.000000),(Time=1265.000000),(Time=1267.000000),(Time=1268.000000),(Time=1269.500000),(Time=1270.000000),(Time=1275.000000),(Time=1280.000000),(Time=1282.500000),(Time=1284.000000),(Time=1285.000000),(Time=1290.000000),(Time=1292.500000),(Time=1295.000000),(Time=1300.000000)))
            FloatTrack=(Points=((OutVal=-2.000061,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=-2.000183,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=-2.000153,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-2.000183,ArriveTangent=-0.000013,LeaveTangent=-0.000013,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=-2.000259,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=-2.000259,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=-2.000214,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=-2.000244,ArriveTangent=-0.000010,LeaveTangent=-0.000010,InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=-2.000290,ArriveTangent=-0.000011,LeaveTangent=-0.000011,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=-2.000305,ArriveTangent=-0.000010,LeaveTangent=-0.000010,InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,OutVal=-2.000427,InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,OutVal=-2.000336,InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=-2.000427,InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=-2.000427,InterpMode=CIM_CurveAutoClamped),(InVal=55.000000,OutVal=-2.000488,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=-2.000549,ArriveTangent=-0.000015,LeaveTangent=-0.000015,InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=-2.000641,ArriveTangent=-0.000011,LeaveTangent=-0.000011,InterpMode=CIM_CurveAutoClamped),(InVal=70.000000,OutVal=-2.000671,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=-2.000824,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=-2.000854,ArriveTangent=-0.000011,LeaveTangent=-0.000011,InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=-2.000946,InterpMode=CIM_CurveAutoClamped),(InVal=87.500000,OutVal=-2.000809,InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=-66.000854,InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,OutVal=-10.000931,ArriveTangent=5.202008,LeaveTangent=5.202008,InterpMode=CIM_CurveAutoClamped),(InVal=97.500000,OutVal=-2.000916,InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=-2.000977,InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=-2.000977,InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=-322.001068,ArriveTangent=-0.000059,LeaveTangent=-0.000059,InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=-322.001190,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=-322.001312,ArriveTangent=-0.000061,LeaveTangent=-0.000061,InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,OutVal=-962.001526,ArriveTangent=-0.000118,LeaveTangent=-0.000118,InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=-962.001770),(InVal=130.000000,OutVal=-962.001770,InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=-962.002014,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=-962.002258,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=-962.002502),(InVal=145.000000,OutVal=-962.002502,InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=-962.002747,ArriveTangent=-0.000067,LeaveTangent=-0.000067,InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=-962.003174,InterpMode=CIM_CurveAutoClamped),(InVal=155.500000,OutVal=-864.822510,ArriveTangent=31.999950,LeaveTangent=31.999950,InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=-802.003418,InterpMode=CIM_CurveAutoClamped),(InVal=162.500000,OutVal=-838.258423,InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=-642.003540,InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=-642.004028,ArriveTangent=-0.000046,LeaveTangent=-0.000046,InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=-642.004150,InterpMode=CIM_CurveAutoClamped),(InVal=176.500000,OutVal=-322.004333,InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=-322.004456,ArriveTangent=-0.000096,LeaveTangent=-0.000096,InterpMode=CIM_CurveAutoClamped),(InVal=182.500000,OutVal=-336.337524,InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=-322.004395,ArriveTangent=0.026903,LeaveTangent=0.026903,InterpMode=CIM_CurveAutoClamped),(InVal=187.500000,OutVal=-321.977448,ArriveTangent=0.026962,LeaveTangent=0.026962,InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=-2.004456,ArriveTangent=36.107235,LeaveTangent=36.107235,InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=33.484360,InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=-482.004578,ArriveTangent=-9.545265,LeaveTangent=-9.545265,InterpMode=CIM_CurveAutoClamped),(InVal=198.500000,OutVal=-495.145355,ArriveTangent=-11.183868,LeaveTangent=-11.183868,InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=-802.004761,InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=-791.709473,InterpMode=CIM_CurveAutoClamped),(InVal=205.000000,OutVal=-962.005066,InterpMode=CIM_CurveAutoClamped),(InVal=207.000000,OutVal=-925.189453,ArriveTangent=39.736946,LeaveTangent=39.736946,InterpMode=CIM_CurveAutoClamped),(InVal=209.500000,OutVal=-333.721008,ArriveTangent=33.792023,LeaveTangent=33.792023,InterpMode=CIM_CurveAutoClamped),(InVal=210.000000,OutVal=-322.005341,ArriveTangent=13.163172,LeaveTangent=13.163172,InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=-300.813080,InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=-642.005737,ArriveTangent=-0.000214,LeaveTangent=-0.000214,InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=-642.006104,ArriveTangent=-0.000061,LeaveTangent=-0.000061,InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,OutVal=-642.006348,ArriveTangent=-0.000160,LeaveTangent=-0.000160,InterpMode=CIM_CurveAutoClamped),(InVal=226.500000,OutVal=-1282.006714,ArriveTangent=-0.000099,LeaveTangent=-0.000099,InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,OutVal=-1282.006958,InterpMode=CIM_CurveAutoClamped),(InVal=237.000000,OutVal=-1281.531738,InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,OutVal=-1282.007446,InterpMode=CIM_CurveAutoClamped),(InVal=241.500000,OutVal=-911.202637,InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=-962.007874,InterpMode=CIM_CurveAutoClamped),(InVal=246.500000,OutVal=-939.953979,ArriveTangent=5.234118,LeaveTangent=5.234118,InterpMode=CIM_CurveAutoClamped),(InVal=249.000000,OutVal=-934.139038,ArriveTangent=7.020763,LeaveTangent=7.020763,InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,OutVal=-802.008057,ArriveTangent=42.615425,LeaveTangent=42.615425,InterpMode=CIM_CurveAutoClamped),(InVal=252.000000,OutVal=-765.842407,ArriveTangent=39.330963,LeaveTangent=39.330963,InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=-469.327667,InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,OutVal=-482.008301,ArriveTangent=-0.000128,LeaveTangent=-0.000128,InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=-482.008484,ArriveTangent=-0.000046,LeaveTangent=-0.000046,InterpMode=CIM_CurveAutoClamped),(InVal=263.000000,OutVal=-482.008667,InterpMode=CIM_CurveAutoClamped),(InVal=265.000000,OutVal=-482.008606,ArriveTangent=0.000067,LeaveTangent=0.000067,InterpMode=CIM_CurveAutoClamped),(InVal=268.000000,OutVal=-471.240784,InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,OutVal=-482.008728,InterpMode=CIM_CurveAutoClamped),(InVal=271.000000,OutVal=-477.352875,InterpMode=CIM_CurveAutoClamped),(InVal=273.500000,OutVal=-756.876221,ArriveTangent=-51.410881,LeaveTangent=-51.410881,InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=-802.008911,ArriveTangent=-4.823744,LeaveTangent=-4.823744,InterpMode=CIM_CurveAutoClamped),(InVal=276.000000,OutVal=-804.359009,ArriveTangent=-4.057190,LeaveTangent=-4.057190,InterpMode=CIM_CurveAutoClamped),(InVal=279.000000,OutVal=-1091.725464,ArriveTangent=-44.349239,LeaveTangent=-44.349239,InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=-1122.009277,ArriveTangent=-0.000171,LeaveTangent=-0.000171,InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,OutVal=-1122.009521,ArriveTangent=-0.000147,LeaveTangent=-0.000147,InterpMode=CIM_CurveAutoClamped),(InVal=287.500000,OutVal=-1122.819702,InterpMode=CIM_CurveAutoClamped),(InVal=290.000000,OutVal=-1122.009766,InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=-1122.010010,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,OutVal=-1122.010254,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=305.000000,OutVal=-1122.010498,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,OutVal=-1122.010742,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=315.000000,OutVal=-1122.010986,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,OutVal=-1122.011230,ArriveTangent=-0.000049,LeaveTangent=-0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,OutVal=-1122.011475,InterpMode=CIM_CurveAutoClamped),(InVal=326.500000,OutVal=-1067.127319,ArriveTangent=66.176041,LeaveTangent=66.176041,InterpMode=CIM_CurveAutoClamped),(InVal=328.500000,OutVal=-777.487061,InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,OutVal=-802.011719,InterpMode=CIM_CurveAutoClamped),(InVal=331.500000,OutVal=-789.020630,ArriveTangent=19.960836,LeaveTangent=19.960836,InterpMode=CIM_CurveAutoClamped),(InVal=332.000000,OutVal=-760.837769,ArriveTangent=84.309723,LeaveTangent=84.309723,InterpMode=CIM_CurveAutoClamped),(InVal=333.500000,OutVal=-457.110596,InterpMode=CIM_CurveAutoClamped),(InVal=335.000000,OutVal=-482.011902,ArriveTangent=-0.000081,LeaveTangent=-0.000081,InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=-482.012024,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=345.000000,OutVal=-482.012146,InterpMode=CIM_CurveAutoClamped),(InVal=347.000000,OutVal=-303.665894,InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=-322.012268,InterpMode=CIM_CurveAutoClamped),(InVal=353.500000,OutVal=20.469879,InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,OutVal=-2.012360,InterpMode=CIM_CurveAutoClamped),(InVal=356.500000,OutVal=17.023804,ArriveTangent=24.802593,LeaveTangent=24.802593,InterpMode=CIM_CurveAutoClamped),(InVal=359.000000,OutVal=330.837006,InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,OutVal=317.987640,InterpMode=CIM_CurveAutoClamped),(InVal=361.500000,OutVal=317.987640,InterpMode=CIM_CurveAutoClamped),(InVal=365.000000,OutVal=317.987640,InterpMode=CIM_CurveAutoClamped),(InVal=366.000000,OutVal=296.225494,ArriveTangent=-60.392517,LeaveTangent=-60.392517,InterpMode=CIM_CurveAutoClamped),(InVal=366.500000,OutVal=29.947678,ArriveTangent=-30.186913,LeaveTangent=-30.186913,InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,OutVal=-2.012405,ArriveTangent=-0.000034,LeaveTangent=-0.000034,InterpMode=CIM_CurveAutoClamped),(InVal=375.000000,OutVal=-2.012466,InterpMode=CIM_CurveAutoClamped),(InVal=376.500000,OutVal=35.971802,ArriveTangent=55.400780,LeaveTangent=55.400780,InterpMode=CIM_CurveAutoClamped),(InVal=377.500000,OutVal=183.757233,InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=157.987488,InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,OutVal=157.987488,InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,OutVal=157.987488,InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,OutVal=157.987488,InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=157.987488,InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,OutVal=157.987488,InterpMode=CIM_CurveAutoClamped),(InVal=407.500000,OutVal=162.050934,InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=-2.012527,ArriveTangent=-0.000034,LeaveTangent=-0.000034,InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,OutVal=-2.012589,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,OutVal=-2.012650,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,OutVal=-2.012711,InterpMode=CIM_CurveAutoClamped),(InVal=428.000000,OutVal=304.048370,ArriveTangent=14.429508,LeaveTangent=14.429508,InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=317.987274,InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,OutVal=317.987274,InterpMode=CIM_CurveAutoClamped),(InVal=437.000000,OutVal=344.262421,InterpMode=CIM_CurveAutoClamped),(InVal=438.000000,OutVal=-322.012817,InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=-309.963043,InterpMode=CIM_CurveAutoClamped),(InVal=442.000000,OutVal=-487.256775,InterpMode=CIM_CurveAutoClamped),(InVal=445.000000,OutVal=-482.012939,InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=-482.013123,InterpMode=CIM_CurveAutoClamped),(InVal=451.500000,OutVal=-480.590027,InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,OutVal=-482.013245,InterpMode=CIM_CurveAutoClamped),(InVal=457.000000,OutVal=-472.920593,InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=-482.013367,ArriveTangent=-0.000070,LeaveTangent=-0.000070,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=-482.013489,ArriveTangent=-0.000033,LeaveTangent=-0.000033,InterpMode=CIM_CurveAutoClamped),(InVal=467.500000,OutVal=-482.013611,InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,OutVal=-482.013611,InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,OutVal=-482.013733,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,OutVal=-482.013855,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=485.000000,OutVal=-482.013977,ArriveTangent=-0.000076,LeaveTangent=-0.000076,InterpMode=CIM_CurveAutoClamped),(InVal=487.000000,OutVal=-743.439209,ArriveTangent=-43.972458,LeaveTangent=-43.972458,InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,OutVal=-802.014160,ArriveTangent=-0.000141,LeaveTangent=-0.000141,InterpMode=CIM_CurveAutoClamped),(InVal=495.000000,OutVal=-802.014404,InterpMode=CIM_CurveAutoClamped),(InVal=498.000000,OutVal=-489.233948,ArriveTangent=7.701084,LeaveTangent=7.701084,InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,OutVal=-482.014587,ArriveTangent=6.203440,LeaveTangent=6.203440,InterpMode=CIM_CurveAutoClamped),(InVal=503.000000,OutVal=-444.315247,InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,OutVal=-1122.014893,ArriveTangent=-0.000153,LeaveTangent=-0.000153,InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,OutVal=-1122.015137,ArriveTangent=-0.000162,LeaveTangent=-0.000162,InterpMode=CIM_CurveAutoClamped),(InVal=511.500000,OutVal=-1280.948730,ArriveTangent=-0.939287,LeaveTangent=-0.939287,InterpMode=CIM_CurveAutoClamped),(InVal=515.000000,OutVal=-1282.015381,InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=-1122.015869,ArriveTangent=47.999928,LeaveTangent=47.999928,InterpMode=CIM_CurveAutoClamped),(InVal=525.000000,OutVal=-802.016113,InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=-802.016479,InterpMode=CIM_CurveAutoClamped),(InVal=535.000000,OutVal=-322.016663,InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=-322.016785,ArriveTangent=-0.000081,LeaveTangent=-0.000081,InterpMode=CIM_CurveAutoClamped),(InVal=541.500000,OutVal=-322.142334,InterpMode=CIM_CurveAutoClamped),(InVal=545.000000,OutVal=-322.016907,InterpMode=CIM_CurveAutoClamped),(InVal=547.500000,OutVal=-322.016968,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,OutVal=-322.017029,ArriveTangent=-0.000057,LeaveTangent=-0.000057,InterpMode=CIM_CurveAutoClamped),(InVal=553.000000,OutVal=-604.715088,ArriveTangent=-96.000038,LeaveTangent=-96.000038,InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,OutVal=-802.017212,InterpMode=CIM_CurveAutoClamped),(InVal=557.500000,OutVal=-759.044067,InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,OutVal=-802.017456,ArriveTangent=-0.000146,LeaveTangent=-0.000146,InterpMode=CIM_CurveAutoClamped),(InVal=565.000000,OutVal=-802.017700,ArriveTangent=-0.000123,LeaveTangent=-0.000123,InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,OutVal=-962.017944,ArriveTangent=-0.000125,LeaveTangent=-0.000125,InterpMode=CIM_CurveAutoClamped),(InVal=575.000000,OutVal=-962.018188,ArriveTangent=-0.000072,LeaveTangent=-0.000072,InterpMode=CIM_CurveAutoClamped),(InVal=578.500000,OutVal=-962.018555,InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,OutVal=-962.018433,ArriveTangent=0.000202,LeaveTangent=0.000202,InterpMode=CIM_CurveAutoClamped),(InVal=581.500000,OutVal=-826.249512,ArriveTangent=18.327639,LeaveTangent=18.327639,InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,OutVal=-802.018677,ArriveTangent=16.324558,LeaveTangent=16.324558,InterpMode=CIM_CurveAutoClamped),(InVal=588.500000,OutVal=-319.232056,InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=-322.018860,InterpMode=CIM_CurveAutoClamped),(InVal=592.000000,OutVal=-321.405334,InterpMode=CIM_CurveAutoClamped),(InVal=595.000000,OutVal=-322.018982,ArriveTangent=-0.000070,LeaveTangent=-0.000070,InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=-322.019104,InterpMode=CIM_CurveAutoClamped),(InVal=603.000000,OutVal=24.132446,InterpMode=CIM_CurveAutoClamped),(InVal=605.000000,OutVal=-2.019196,InterpMode=CIM_CurveAutoClamped),(InVal=606.500000,OutVal=13.908829,ArriveTangent=22.626068,LeaveTangent=22.626068,InterpMode=CIM_CurveAutoClamped),(InVal=608.500000,OutVal=304.159821,ArriveTangent=19.814735,LeaveTangent=19.814735,InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=613.000000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=614.500000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=615.000000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=616.500000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,OutVal=317.980804,InterpMode=CIM_CurveAutoClamped),(InVal=628.000000,OutVal=624.827271,ArriveTangent=13.665001,LeaveTangent=13.665001,InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=637.980835,ArriveTangent=0.000154,LeaveTangent=0.000154,InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,OutVal=637.981079,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,OutVal=637.981323,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,OutVal=637.981567,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=637.981812,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=655.000000,OutVal=637.982056,ArriveTangent=0.000122,LeaveTangent=0.000122,InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=1117.982178,InterpMode=CIM_CurveAutoClamped),(InVal=665.000000,OutVal=1117.982178,InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=1117.982178,InterpMode=CIM_CurveAutoClamped),(InVal=672.500000,OutVal=1117.982178,InterpMode=CIM_CurveAutoClamped),(InVal=675.000000,OutVal=1117.982178,InterpMode=CIM_CurveAutoClamped),(InVal=676.500000,OutVal=1110.419800,InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=1117.982178,InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,OutVal=637.982178,InterpMode=CIM_CurveAutoClamped),(InVal=690.000000,OutVal=637.982422),(InVal=690.000000,OutVal=637.982544,InterpMode=CIM_CurveAutoClamped),(InVal=695.000000,OutVal=637.982666,ArriveTangent=0.000070,LeaveTangent=0.000070,InterpMode=CIM_CurveAutoClamped),(InVal=698.000000,OutVal=655.840698,InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=637.982910,InterpMode=CIM_CurveAutoClamped),(InVal=705.000000,OutVal=637.983154,ArriveTangent=0.000161,LeaveTangent=0.000161,InterpMode=CIM_CurveAutoClamped),(InVal=706.500000,OutVal=665.180176,ArriveTangent=35.506950,LeaveTangent=35.506950,InterpMode=CIM_CurveAutoClamped),(InVal=709.000000,OutVal=1124.686890,InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=711.500000,OutVal=1130.163574,InterpMode=CIM_CurveAutoClamped),(InVal=715.000000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=716.500000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=718.500000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=725.000000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=727.000000,OutVal=1118.153442,ArriveTangent=0.072409,LeaveTangent=0.072409,InterpMode=CIM_CurveAutoClamped),(InVal=728.500000,OutVal=1118.237305,InterpMode=CIM_CurveAutoClamped),(InVal=729.500000,OutVal=1118.071045,ArriveTangent=-0.169271,LeaveTangent=-0.169271,InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=735.000000,OutVal=1117.983398,InterpMode=CIM_CurveAutoClamped),(InVal=737.000000,OutVal=640.391724,ArriveTangent=-2.237122,LeaveTangent=-2.237122,InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,OutVal=637.983398,InterpMode=CIM_CurveAutoClamped),(InVal=745.000000,OutVal=637.983643,ArriveTangent=0.000081,LeaveTangent=0.000081,InterpMode=CIM_CurveAutoClamped),(InVal=746.000000,OutVal=637.983887,ArriveTangent=0.000183,LeaveTangent=0.000183,InterpMode=CIM_CurveAutoClamped),(InVal=747.000000,OutVal=637.984009,InterpMode=CIM_CurveAutoClamped),(InVal=748.000000,OutVal=637.984009,InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,OutVal=637.983887,ArriveTangent=-0.000114,LeaveTangent=-0.000114,InterpMode=CIM_CurveAutoClamped),(InVal=755.000000,OutVal=157.984009,InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,OutVal=157.984009,InterpMode=CIM_CurveAutoClamped),(InVal=765.000000,OutVal=157.984009,InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,OutVal=157.984009,InterpMode=CIM_CurveAutoClamped),(InVal=775.000000,OutVal=-2.016006,ArriveTangent=-0.000030,LeaveTangent=-0.000030,InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,OutVal=-2.016068,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=785.000000,OutVal=-2.016129,InterpMode=CIM_CurveAutoClamped),(InVal=787.000000,OutVal=31.229660,ArriveTangent=44.823448,LeaveTangent=44.823448,InterpMode=CIM_CurveAutoClamped),(InVal=788.000000,OutVal=324.769440,InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,OutVal=317.983856,InterpMode=CIM_CurveAutoClamped),(InVal=795.000000,OutVal=637.983887,ArriveTangent=0.000124,LeaveTangent=0.000124,InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,OutVal=637.984131,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=805.000000,OutVal=637.984375,InterpMode=CIM_CurveAutoClamped),(InVal=810.000000,OutVal=317.984528,InterpMode=CIM_CurveAutoClamped),(InVal=815.000000,OutVal=317.984528,InterpMode=CIM_CurveAutoClamped),(InVal=820.000000,OutVal=-2.015518,ArriveTangent=-0.000029,LeaveTangent=-0.000029,InterpMode=CIM_CurveAutoClamped),(InVal=825.000000,OutVal=-2.015579,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,OutVal=-2.015640,ArriveTangent=-0.000009,LeaveTangent=-0.000009,InterpMode=CIM_CurveAutoClamped),(InVal=835.000000,OutVal=-2.015671,ArriveTangent=-0.000011,LeaveTangent=-0.000011,InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,OutVal=-2.015762,ArriveTangent=-0.000011,LeaveTangent=-0.000011,InterpMode=CIM_CurveAutoClamped),(InVal=845.000000,OutVal=-2.015793,ArriveTangent=-0.000009,LeaveTangent=-0.000009,InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,OutVal=-2.015854,ArriveTangent=-0.000012,LeaveTangent=-0.000012,InterpMode=CIM_CurveAutoClamped),(InVal=855.000000,OutVal=-2.015915,InterpMode=CIM_CurveAutoClamped),(InVal=857.500000,OutVal=-1.129562,InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,OutVal=-2.015976,InterpMode=CIM_CurveAutoClamped),(InVal=863.500000,OutVal=654.452393,InterpMode=CIM_CurveAutoClamped),(InVal=865.000000,OutVal=637.984009,InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,OutVal=637.984253,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=875.000000,OutVal=637.984497,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,OutVal=637.984741,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=885.000000,OutVal=637.984985,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,OutVal=637.985229,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=895.000000,OutVal=637.985474,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=637.985718,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=905.000000,OutVal=637.985962,ArriveTangent=0.000049,LeaveTangent=0.000049,InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,OutVal=637.986206,ArriveTangent=0.000135,LeaveTangent=0.000135,InterpMode=CIM_CurveAutoClamped),(InVal=913.500000,OutVal=723.628906,ArriveTangent=56.240299,LeaveTangent=56.240299,InterpMode=CIM_CurveAutoClamped),(InVal=915.000000,OutVal=957.986328,InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,OutVal=957.986328,InterpMode=CIM_CurveAutoClamped),(InVal=925.000000,OutVal=957.986328,InterpMode=CIM_CurveAutoClamped),(InVal=928.500000,OutVal=1020.583252,InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=935.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=945.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=951.500000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=955.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=957.000000,OutVal=319.003357,InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=963.000000,OutVal=324.797791,InterpMode=CIM_CurveAutoClamped),(InVal=965.000000,OutVal=317.986298,InterpMode=CIM_CurveAutoClamped),(InVal=967.000000,OutVal=327.223267,ArriveTangent=12.098038,LeaveTangent=12.098038,InterpMode=CIM_CurveAutoClamped),(InVal=968.500000,OutVal=605.375610,ArriveTangent=47.532806,LeaveTangent=47.532806,InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,OutVal=637.986328,ArriveTangent=0.000333,LeaveTangent=0.000333,InterpMode=CIM_CurveAutoClamped),(InVal=972.000000,OutVal=637.986572,InterpMode=CIM_CurveAutoClamped),(InVal=975.000000,OutVal=637.986572,InterpMode=CIM_CurveAutoClamped),(InVal=979.000000,OutVal=993.188477,InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=985.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=995.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1005.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1015.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1025.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1035.000000,OutVal=957.986816,InterpMode=CIM_CurveAutoClamped),(InVal=1038.500000,OutVal=658.841797,ArriveTangent=-23.707806,LeaveTangent=-23.707806,InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,OutVal=637.986816,ArriveTangent=-15.721477,LeaveTangent=-15.721477,InterpMode=CIM_CurveAutoClamped),(InVal=1041.500000,OutVal=611.677368,ArriveTangent=-35.366379,LeaveTangent=-35.366379,InterpMode=CIM_CurveAutoClamped),(InVal=1043.500000,OutVal=346.050262,ArriveTangent=-37.418701,LeaveTangent=-37.418701,InterpMode=CIM_CurveAutoClamped),(InVal=1045.000000,OutVal=317.986969,InterpMode=CIM_CurveAutoClamped),(InVal=1046.500000,OutVal=317.986969,InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,OutVal=317.986969,InterpMode=CIM_CurveAutoClamped),(InVal=1055.000000,OutVal=317.986969,InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,OutVal=-322.013123,ArriveTangent=-0.000057,LeaveTangent=-0.000057,InterpMode=CIM_CurveAutoClamped),(InVal=1065.000000,OutVal=-322.013245,ArriveTangent=-0.000077,LeaveTangent=-0.000077,InterpMode=CIM_CurveAutoClamped),(InVal=1067.000000,OutVal=-323.145599,InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,OutVal=-322.013367,InterpMode=CIM_CurveAutoClamped),(InVal=1074.000000,OutVal=-322.013519,InterpMode=CIM_CurveAutoClamped),(InVal=1075.000000,OutVal=-322.013489,InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,OutVal=-322.013611,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1085.000000,OutVal=-322.013733,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1090.000000,OutVal=-322.013855,ArriveTangent=-0.000029,LeaveTangent=-0.000029,InterpMode=CIM_CurveAutoClamped),(InVal=1093.500000,OutVal=-322.013977,InterpMode=CIM_CurveAutoClamped),(InVal=1095.000000,OutVal=-322.013977,InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,OutVal=-322.014099,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1105.000000,OutVal=-322.014221,InterpMode=CIM_CurveAutoClamped),(InVal=1106.000000,OutVal=-320.195129,ArriveTangent=4.166605,LeaveTangent=4.166605,InterpMode=CIM_CurveAutoClamped),(InVal=1107.000000,OutVal=-296.126343,InterpMode=CIM_CurveAutoClamped),(InVal=1110.000000,OutVal=-322.014343,ArriveTangent=-0.000070,LeaveTangent=-0.000070,InterpMode=CIM_CurveAutoClamped),(InVal=1115.000000,OutVal=-322.014465,InterpMode=CIM_CurveAutoClamped),(InVal=1118.000000,OutVal=3.159622,InterpMode=CIM_CurveAutoClamped),(InVal=1120.000000,OutVal=-2.014557,InterpMode=CIM_CurveAutoClamped),(InVal=1125.000000,OutVal=317.985443,InterpMode=CIM_CurveAutoClamped),(InVal=1130.000000,OutVal=317.985443,InterpMode=CIM_CurveAutoClamped),(InVal=1135.000000,OutVal=317.985443,InterpMode=CIM_CurveAutoClamped),(InVal=1140.000000,OutVal=317.985443,InterpMode=CIM_CurveAutoClamped),(InVal=1145.000000,OutVal=317.985443,InterpMode=CIM_CurveAutoClamped),(InVal=1146.500000,OutVal=325.288086,ArriveTangent=10.784027,LeaveTangent=10.784027,InterpMode=CIM_CurveAutoClamped),(InVal=1148.500000,OutVal=622.960449,ArriveTangent=16.651001,LeaveTangent=16.651001,InterpMode=CIM_CurveAutoClamped),(InVal=1151.000000,OutVal=639.546143,ArriveTangent=15.501980,LeaveTangent=15.501980,InterpMode=CIM_CurveAutoClamped),(InVal=1153.500000,OutVal=925.091431,ArriveTangent=39.822155,LeaveTangent=39.822155,InterpMode=CIM_CurveAutoClamped),(InVal=1155.000000,OutVal=957.985596,InterpMode=CIM_CurveAutoClamped),(InVal=1160.000000,OutVal=957.985596,InterpMode=CIM_CurveAutoClamped),(InVal=1165.000000,OutVal=957.985596,InterpMode=CIM_CurveAutoClamped),(InVal=1167.500000,OutVal=954.933228,InterpMode=CIM_CurveAutoClamped),(InVal=1170.000000,OutVal=957.985596,InterpMode=CIM_CurveAutoClamped),(InVal=1175.000000,OutVal=957.985596,InterpMode=CIM_CurveAutoClamped),(InVal=1178.000000,OutVal=905.997070,ArriveTangent=-40.099121,LeaveTangent=-40.099121,InterpMode=CIM_CurveAutoClamped),(InVal=1180.000000,OutVal=637.985596,ArriveTangent=-47.095528,LeaveTangent=-47.095528,InterpMode=CIM_CurveAutoClamped),(InVal=1182.000000,OutVal=592.365723,ArriveTangent=-48.334869,LeaveTangent=-48.334869,InterpMode=CIM_CurveAutoClamped),(InVal=1184.000000,OutVal=279.800629,InterpMode=CIM_CurveAutoClamped),(InVal=1185.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1190.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1192.500000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1195.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1200.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1205.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1210.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1215.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1220.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1225.000000,OutVal=317.985748,InterpMode=CIM_CurveAutoClamped),(InVal=1229.000000,OutVal=347.893097,InterpMode=CIM_CurveAutoClamped),(InVal=1230.000000,OutVal=-162.014313,InterpMode=CIM_CurveAutoClamped),(InVal=1232.500000,OutVal=-130.740463,InterpMode=CIM_CurveAutoClamped),(InVal=1233.500000,OutVal=-362.962555,InterpMode=CIM_CurveAutoClamped),(InVal=1235.000000,OutVal=-322.014404,InterpMode=CIM_CurveAutoClamped),(InVal=1240.000000,OutVal=-322.014587,ArriveTangent=-0.000031,LeaveTangent=-0.000031,InterpMode=CIM_CurveAutoClamped),(InVal=1245.000000,OutVal=-322.014709,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1250.000000,OutVal=-322.014832,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1255.000000,OutVal=-322.014954,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1260.000000,OutVal=-322.015076,ArriveTangent=-0.000024,LeaveTangent=-0.000024,InterpMode=CIM_CurveAutoClamped),(InVal=1265.000000,OutVal=-322.015198,InterpMode=CIM_CurveAutoClamped),(InVal=1267.000000,OutVal=-6.983826,ArriveTangent=40.201424,LeaveTangent=40.201424,InterpMode=CIM_CurveAutoClamped),(InVal=1268.000000,OutVal=15.319946,ArriveTangent=44.422050,LeaveTangent=44.422050,InterpMode=CIM_CurveAutoClamped),(InVal=1269.500000,OutVal=312.694733,ArriveTangent=17.967773,LeaveTangent=17.967773,InterpMode=CIM_CurveAutoClamped),(InVal=1270.000000,OutVal=317.984772,InterpMode=CIM_CurveAutoClamped),(InVal=1275.000000,OutVal=317.984772,InterpMode=CIM_CurveAutoClamped),(InVal=1280.000000,OutVal=317.984772,InterpMode=CIM_CurveAutoClamped),(InVal=1282.500000,OutVal=317.984772,InterpMode=CIM_CurveAutoClamped),(InVal=1284.000000,OutVal=317.984772,InterpMode=CIM_CurveAutoClamped),(InVal=1285.000000,OutVal=317.984772,InterpMode=CIM_CurveAutoClamped),(InVal=1290.000000,OutVal=637.984863,ArriveTangent=0.000294,LeaveTangent=0.000294,InterpMode=CIM_CurveAutoClamped),(InVal=1292.500000,OutVal=637.985229,InterpMode=CIM_CurveAutoClamped),(InVal=1295.000000,OutVal=637.985229,InterpMode=CIM_CurveAutoClamped),(InVal=1300.000000,OutVal=637.985474,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_2"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_3
            MoveAxis=AXIS_RotationX
            LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000),(Time=15.000000),(Time=17.500000),(Time=20.000000),(Time=25.000000),(Time=30.000000),(Time=35.000000),(Time=40.000000),(Time=45.000000),(Time=50.000000),(Time=55.000000),(Time=60.000000),(Time=65.000000),(Time=70.000000),(Time=75.000000),(Time=80.000000),(Time=85.000000),(Time=90.000000),(Time=95.000000),(Time=100.000000),(Time=105.000000),(Time=110.000000),(Time=115.000000),(Time=120.000000),(Time=125.000000),(Time=130.000000),(Time=130.000000),(Time=135.000000),(Time=140.000000),(Time=145.000000),(Time=145.000000),(Time=150.000000),(Time=155.000000),(Time=160.000000),(Time=165.000000),(Time=170.000000),(Time=175.000000),(Time=180.000000),(Time=185.000000),(Time=190.000000),(Time=195.000000),(Time=200.000000),(Time=205.000000),(Time=210.000000),(Time=215.000000),(Time=220.000000),(Time=225.000000),(Time=230.500000),(Time=235.000000),(Time=240.000000),(Time=245.000000),(Time=250.000000),(Time=255.000000),(Time=260.000000),(Time=265.000000),(Time=270.000000),(Time=275.000000),(Time=280.000000),(Time=285.000000),(Time=290.000000),(Time=295.000000),(Time=300.000000),(Time=305.000000),(Time=310.000000),(Time=315.000000),(Time=320.000000),(Time=325.000000),(Time=330.000000),(Time=335.000000),(Time=340.000000),(Time=345.000000),(Time=350.000000),(Time=355.000000),(Time=360.000000),(Time=365.000000),(Time=370.000000),(Time=375.000000),(Time=380.000000),(Time=385.000000),(Time=390.000000),(Time=395.000000),(Time=400.000000),(Time=405.000000),(Time=410.000000),(Time=415.000000),(Time=420.000000),(Time=425.000000),(Time=430.000000),(Time=435.000000),(Time=440.000000),(Time=445.000000),(Time=450.000000),(Time=455.000000),(Time=460.000000),(Time=465.000000),(Time=470.000000),(Time=475.000000),(Time=480.000000),(Time=485.000000),(Time=490.000000),(Time=495.000000),(Time=500.000000),(Time=505.000000),(Time=510.000000),(Time=515.000000),(Time=520.000000),(Time=525.000000),(Time=530.000000),(Time=535.000000),(Time=540.000000),(Time=545.000000),(Time=550.000000),(Time=555.000000),(Time=560.000000),(Time=565.000000),(Time=570.000000),(Time=575.000000),(Time=580.000000),(Time=585.000000),(Time=590.000000),(Time=595.000000),(Time=600.000000),(Time=605.000000),(Time=610.000000),(Time=615.000000),(Time=620.000000),(Time=625.000000),(Time=630.000000),(Time=635.000000),(Time=640.000000),(Time=645.000000),(Time=650.000000),(Time=655.000000),(Time=660.000000),(Time=665.000000),(Time=670.000000),(Time=675.000000),(Time=680.000000),(Time=685.000000),(Time=690.000000),(Time=690.000000),(Time=695.000000),(Time=700.000000),(Time=705.000000),(Time=710.000000),(Time=715.000000),(Time=720.000000),(Time=725.000000),(Time=730.000000),(Time=735.000000),(Time=740.000000),(Time=745.000000),(Time=750.000000),(Time=755.000000),(Time=760.000000),(Time=765.000000),(Time=770.000000),(Time=775.000000),(Time=780.000000),(Time=785.000000),(Time=790.000000),(Time=795.000000),(Time=800.000000),(Time=805.000000),(Time=810.000000),(Time=815.000000),(Time=820.000000),(Time=825.000000),(Time=830.000000),(Time=835.000000),(Time=840.000000),(Time=845.000000),(Time=850.000000),(Time=855.000000),(Time=860.000000),(Time=865.000000),(Time=870.000000),(Time=875.000000),(Time=880.000000),(Time=885.000000),(Time=890.000000),(Time=895.000000),(Time=900.000000),(Time=905.000000),(Time=910.000000),(Time=915.000000),(Time=920.000000),(Time=925.000000),(Time=930.000000),(Time=935.000000),(Time=940.000000),(Time=945.000000),(Time=950.000000),(Time=955.000000),(Time=960.000000),(Time=965.000000),(Time=970.000000),(Time=975.000000),(Time=980.000000),(Time=985.000000),(Time=990.000000),(Time=995.000000),(Time=1000.000000),(Time=1005.000000),(Time=1010.000000),(Time=1015.000000),(Time=1020.000000),(Time=1025.000000),(Time=1030.000000),(Time=1035.000000),(Time=1040.000000),(Time=1045.000000),(Time=1050.000000),(Time=1055.000000),(Time=1060.000000),(Time=1065.000000),(Time=1070.000000),(Time=1075.000000),(Time=1080.000000),(Time=1085.000000),(Time=1090.000000),(Time=1095.000000),(Time=1100.000000),(Time=1105.000000),(Time=1110.000000),(Time=1115.000000),(Time=1120.000000),(Time=1125.000000),(Time=1130.000000),(Time=1135.000000),(Time=1140.000000),(Time=1145.000000),(Time=1149.500000),(Time=1155.000000),(Time=1160.000000),(Time=1165.000000),(Time=1170.000000),(Time=1175.000000),(Time=1180.000000),(Time=1185.000000),(Time=1190.000000),(Time=1195.000000),(Time=1200.000000),(Time=1205.000000),(Time=1210.000000),(Time=1215.000000),(Time=1220.000000),(Time=1225.000000),(Time=1230.000000),(Time=1235.000000),(Time=1240.000000),(Time=1245.000000),(Time=1250.000000),(Time=1255.000000),(Time=1260.000000),(Time=1265.000000),(Time=1270.000000),(Time=1275.000000),(Time=1280.000000),(Time=1285.000000),(Time=1290.000000),(Time=1295.000000),(Time=1300.000000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,InterpMode=CIM_CurveAutoClamped),(InVal=55.000000,InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,InterpMode=CIM_CurveAutoClamped),(InVal=70.000000,InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,InterpMode=CIM_CurveAutoClamped),(InVal=130.000000),(InVal=130.000000,InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,InterpMode=CIM_CurveAutoClamped),(InVal=145.000000),(InVal=145.000000,InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,InterpMode=CIM_CurveAutoClamped),(InVal=205.000000,InterpMode=CIM_CurveAutoClamped),(InVal=210.000000,InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,InterpMode=CIM_CurveAutoClamped),(InVal=230.500000,InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,InterpMode=CIM_CurveAutoClamped),(InVal=265.000000,InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,InterpMode=CIM_CurveAutoClamped),(InVal=290.000000,InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,InterpMode=CIM_CurveAutoClamped),(InVal=305.000000,InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,InterpMode=CIM_CurveAutoClamped),(InVal=315.000000,InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,InterpMode=CIM_CurveAutoClamped),(InVal=335.000000,InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,InterpMode=CIM_CurveAutoClamped),(InVal=345.000000,InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,InterpMode=CIM_CurveAutoClamped),(InVal=365.000000,InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,InterpMode=CIM_CurveAutoClamped),(InVal=375.000000,InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,InterpMode=CIM_CurveAutoClamped),(InVal=445.000000,InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,InterpMode=CIM_CurveAutoClamped),(InVal=485.000000,InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,InterpMode=CIM_CurveAutoClamped),(InVal=495.000000,InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,InterpMode=CIM_CurveAutoClamped),(InVal=515.000000,InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,InterpMode=CIM_CurveAutoClamped),(InVal=525.000000,InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,InterpMode=CIM_CurveAutoClamped),(InVal=535.000000,InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=545.000000,InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,InterpMode=CIM_CurveAutoClamped),(InVal=565.000000,InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,InterpMode=CIM_CurveAutoClamped),(InVal=575.000000,InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,InterpMode=CIM_CurveAutoClamped),(InVal=595.000000,InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,InterpMode=CIM_CurveAutoClamped),(InVal=605.000000,InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,InterpMode=CIM_CurveAutoClamped),(InVal=615.000000,InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,InterpMode=CIM_CurveAutoClamped),(InVal=655.000000,InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,InterpMode=CIM_CurveAutoClamped),(InVal=665.000000,InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,InterpMode=CIM_CurveAutoClamped),(InVal=675.000000,InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,InterpMode=CIM_CurveAutoClamped),(InVal=690.000000),(InVal=690.000000,InterpMode=CIM_CurveAutoClamped),(InVal=695.000000,InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,InterpMode=CIM_CurveAutoClamped),(InVal=705.000000,InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,InterpMode=CIM_CurveAutoClamped),(InVal=715.000000,InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,InterpMode=CIM_CurveAutoClamped),(InVal=725.000000,InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,InterpMode=CIM_CurveAutoClamped),(InVal=735.000000,InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,InterpMode=CIM_CurveAutoClamped),(InVal=745.000000,InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,InterpMode=CIM_CurveAutoClamped),(InVal=755.000000,InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,InterpMode=CIM_CurveAutoClamped),(InVal=765.000000,InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,InterpMode=CIM_CurveAutoClamped),(InVal=775.000000,InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,InterpMode=CIM_CurveAutoClamped),(InVal=785.000000,InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,InterpMode=CIM_CurveAutoClamped),(InVal=795.000000,InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,InterpMode=CIM_CurveAutoClamped),(InVal=805.000000,InterpMode=CIM_CurveAutoClamped),(InVal=810.000000,InterpMode=CIM_CurveAutoClamped),(InVal=815.000000,InterpMode=CIM_CurveAutoClamped),(InVal=820.000000,InterpMode=CIM_CurveAutoClamped),(InVal=825.000000,InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,InterpMode=CIM_CurveAutoClamped),(InVal=835.000000,InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,InterpMode=CIM_CurveAutoClamped),(InVal=845.000000,InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,InterpMode=CIM_CurveAutoClamped),(InVal=855.000000,InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,InterpMode=CIM_CurveAutoClamped),(InVal=865.000000,InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,InterpMode=CIM_CurveAutoClamped),(InVal=875.000000,InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,InterpMode=CIM_CurveAutoClamped),(InVal=885.000000,InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,InterpMode=CIM_CurveAutoClamped),(InVal=895.000000,InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,InterpMode=CIM_CurveAutoClamped),(InVal=905.000000,InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,InterpMode=CIM_CurveAutoClamped),(InVal=915.000000,InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,InterpMode=CIM_CurveAutoClamped),(InVal=925.000000,InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,InterpMode=CIM_CurveAutoClamped),(InVal=935.000000,InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,InterpMode=CIM_CurveAutoClamped),(InVal=945.000000,InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,InterpMode=CIM_CurveAutoClamped),(InVal=955.000000,InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,InterpMode=CIM_CurveAutoClamped),(InVal=965.000000,InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,InterpMode=CIM_CurveAutoClamped),(InVal=975.000000,InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,InterpMode=CIM_CurveAutoClamped),(InVal=985.000000,InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,InterpMode=CIM_CurveAutoClamped),(InVal=995.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1005.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1015.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1025.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1035.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1045.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1055.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1065.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1075.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1085.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1090.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1095.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1105.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1110.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1115.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1120.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1125.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1130.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1135.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1140.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1145.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1149.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1155.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1160.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1165.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1170.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1175.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1180.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1185.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1190.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1195.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1200.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1205.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1210.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1215.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1220.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1225.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1230.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1235.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1240.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1245.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1250.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1255.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1260.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1265.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1270.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1275.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1285.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1290.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1295.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1300.000000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_3"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_4
            MoveAxis=AXIS_RotationY
            LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000),(Time=15.000000),(Time=17.500000),(Time=20.000000),(Time=25.000000),(Time=30.000000),(Time=35.000000),(Time=40.000000),(Time=45.000000),(Time=50.000000),(Time=55.000000),(Time=60.000000),(Time=65.000000),(Time=70.000000),(Time=75.000000),(Time=80.000000),(Time=85.000000),(Time=90.000000),(Time=95.000000),(Time=100.000000),(Time=105.000000),(Time=110.000000),(Time=115.000000),(Time=120.000000),(Time=125.000000),(Time=130.000000),(Time=130.000000),(Time=135.000000),(Time=140.000000),(Time=145.000000),(Time=145.000000),(Time=150.000000),(Time=154.000000),(Time=155.000000),(Time=157.500000),(Time=160.000000),(Time=165.000000),(Time=170.000000),(Time=175.000000),(Time=175.750000),(Time=176.500000),(Time=180.000000),(Time=185.000000),(Time=190.000000),(Time=191.000000),(Time=195.000000),(Time=200.000000),(Time=205.000000),(Time=207.000000),(Time=208.500000),(Time=210.000000),(Time=212.000000),(Time=213.500000),(Time=215.000000),(Time=218.000000),(Time=220.000000),(Time=222.500000),(Time=225.000000),(Time=226.500000),(Time=228.000000),(Time=230.500000),(Time=235.000000),(Time=240.000000),(Time=245.000000),(Time=250.000000),(Time=255.000000),(Time=260.000000),(Time=265.000000),(Time=270.000000),(Time=275.000000),(Time=280.000000),(Time=285.000000),(Time=290.000000),(Time=295.000000),(Time=300.000000),(Time=305.000000),(Time=310.000000),(Time=315.000000),(Time=320.000000),(Time=325.000000),(Time=330.000000),(Time=335.000000),(Time=340.000000),(Time=345.000000),(Time=350.000000),(Time=355.000000),(Time=360.000000),(Time=365.000000),(Time=366.000000),(Time=367.000000),(Time=370.000000),(Time=375.000000),(Time=380.000000),(Time=385.000000),(Time=390.000000),(Time=395.000000),(Time=400.000000),(Time=405.000000),(Time=410.000000),(Time=415.000000),(Time=420.000000),(Time=425.000000),(Time=430.000000),(Time=435.000000),(Time=437.000000),(Time=439.000000),(Time=440.000000),(Time=445.000000),(Time=450.000000),(Time=455.000000),(Time=460.000000),(Time=465.000000),(Time=470.000000),(Time=475.000000),(Time=480.000000),(Time=485.000000),(Time=490.000000),(Time=495.000000),(Time=500.000000),(Time=502.000000),(Time=503.500000),(Time=505.000000),(Time=510.000000),(Time=515.000000),(Time=520.000000),(Time=525.000000),(Time=530.000000),(Time=535.000000),(Time=540.000000),(Time=545.000000),(Time=550.000000),(Time=555.000000),(Time=560.000000),(Time=565.000000),(Time=570.000000),(Time=575.000000),(Time=580.000000),(Time=585.000000),(Time=590.000000),(Time=595.000000),(Time=600.000000),(Time=605.000000),(Time=610.000000),(Time=615.000000),(Time=620.000000),(Time=625.000000),(Time=630.000000),(Time=635.000000),(Time=640.000000),(Time=645.000000),(Time=650.000000),(Time=655.000000),(Time=660.000000),(Time=665.000000),(Time=670.000000),(Time=675.000000),(Time=680.000000),(Time=685.000000),(Time=690.000000),(Time=690.000000),(Time=695.000000),(Time=700.000000),(Time=705.000000),(Time=710.000000),(Time=714.000000),(Time=714.750000),(Time=715.500000),(Time=720.000000),(Time=725.000000),(Time=730.000000),(Time=734.000000),(Time=736.000000),(Time=738.000000),(Time=740.000000),(Time=745.000000),(Time=750.000000),(Time=755.000000),(Time=760.000000),(Time=765.000000),(Time=770.000000),(Time=775.000000),(Time=780.000000),(Time=785.000000),(Time=790.000000),(Time=795.000000),(Time=800.000000),(Time=805.000000),(Time=810.000000),(Time=815.000000),(Time=820.000000),(Time=825.000000),(Time=830.000000),(Time=835.000000),(Time=840.000000),(Time=845.000000),(Time=850.000000),(Time=855.000000),(Time=860.000000),(Time=865.000000),(Time=870.000000),(Time=875.000000),(Time=880.000000),(Time=885.000000),(Time=890.000000),(Time=895.000000),(Time=900.000000),(Time=905.000000),(Time=910.000000),(Time=915.000000),(Time=920.000000),(Time=925.000000),(Time=928.500000),(Time=930.000000),(Time=931.000000),(Time=935.000000),(Time=940.000000),(Time=945.000000),(Time=950.000000),(Time=955.000000),(Time=960.000000),(Time=965.000000),(Time=970.000000),(Time=975.000000),(Time=980.000000),(Time=985.000000),(Time=990.000000),(Time=995.000000),(Time=1000.000000),(Time=1005.000000),(Time=1010.000000),(Time=1015.000000),(Time=1020.000000),(Time=1025.000000),(Time=1030.000000),(Time=1035.000000),(Time=1040.000000),(Time=1045.000000),(Time=1050.000000),(Time=1055.000000),(Time=1060.000000),(Time=1065.000000),(Time=1070.000000),(Time=1075.000000),(Time=1080.000000),(Time=1085.000000),(Time=1090.000000),(Time=1095.000000),(Time=1100.000000),(Time=1105.000000),(Time=1110.000000),(Time=1115.000000),(Time=1120.000000),(Time=1125.000000),(Time=1130.000000),(Time=1135.000000),(Time=1140.000000),(Time=1145.000000),(Time=1149.500000),(Time=1155.000000),(Time=1160.000000),(Time=1165.000000),(Time=1170.000000),(Time=1175.000000),(Time=1180.000000),(Time=1185.000000),(Time=1190.000000),(Time=1195.000000),(Time=1200.000000),(Time=1205.000000),(Time=1210.000000),(Time=1215.000000),(Time=1220.000000),(Time=1225.000000),(Time=1230.000000),(Time=1235.000000),(Time=1240.000000),(Time=1245.000000),(Time=1250.000000),(Time=1255.000000),(Time=1260.000000),(Time=1265.000000),(Time=1270.000000),(Time=1275.000000),(Time=1280.000000),(Time=1285.000000),(Time=1290.000000),(Time=1295.000000),(Time=1300.000000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=0.351563,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,InterpMode=CIM_CurveAutoClamped),(InVal=55.000000,InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,InterpMode=CIM_CurveAutoClamped),(InVal=70.000000,InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=-30.761719,InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,InterpMode=CIM_CurveAutoClamped),(InVal=130.000000),(InVal=130.000000,InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,InterpMode=CIM_CurveAutoClamped),(InVal=145.000000),(InVal=145.000000,InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,InterpMode=CIM_CurveAutoClamped),(InVal=154.000000,InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=13.007813,InterpMode=CIM_CurveAutoClamped),(InVal=157.500000,OutVal=-3.911133,InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,InterpMode=CIM_CurveAutoClamped),(InVal=175.750000,OutVal=18.281250,InterpMode=CIM_CurveAutoClamped),(InVal=176.500000,InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,InterpMode=CIM_CurveAutoClamped),(InVal=191.000000,OutVal=-19.511719,InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,InterpMode=CIM_CurveAutoClamped),(InVal=205.000000,InterpMode=CIM_CurveAutoClamped),(InVal=207.000000,InterpMode=CIM_CurveAutoClamped),(InVal=208.500000,OutVal=20.917969,InterpMode=CIM_CurveAutoClamped),(InVal=210.000000,InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,InterpMode=CIM_CurveAutoClamped),(InVal=213.500000,OutVal=-27.949219,InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=-51.679688,ArriveTangent=-7.028707,LeaveTangent=-7.028707,InterpMode=CIM_CurveAutoClamped),(InVal=222.500000,OutVal=-59.392090,InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,InterpMode=CIM_CurveAutoClamped),(InVal=226.500000,OutVal=-36.210938,InterpMode=CIM_CurveAutoClamped),(InVal=228.000000,OutVal=0.637207,InterpMode=CIM_CurveAutoClamped),(InVal=230.500000,InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,InterpMode=CIM_CurveAutoClamped),(InVal=265.000000,InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,InterpMode=CIM_CurveAutoClamped),(InVal=290.000000,InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,InterpMode=CIM_CurveAutoClamped),(InVal=305.000000,InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,InterpMode=CIM_CurveAutoClamped),(InVal=315.000000,InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,InterpMode=CIM_CurveAutoClamped),(InVal=335.000000,InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,InterpMode=CIM_CurveAutoClamped),(InVal=345.000000,InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,InterpMode=CIM_CurveAutoClamped),(InVal=365.000000,InterpMode=CIM_CurveAutoClamped),(InVal=366.000000,OutVal=-39.902344,InterpMode=CIM_CurveAutoClamped),(InVal=367.000000,OutVal=4.614258,InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,InterpMode=CIM_CurveAutoClamped),(InVal=375.000000,InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,InterpMode=CIM_CurveAutoClamped),(InVal=437.000000,OutVal=-51.855469,InterpMode=CIM_CurveAutoClamped),(InVal=439.000000,OutVal=4.064941,InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,InterpMode=CIM_CurveAutoClamped),(InVal=445.000000,InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,InterpMode=CIM_CurveAutoClamped),(InVal=485.000000,InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,InterpMode=CIM_CurveAutoClamped),(InVal=495.000000,InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,InterpMode=CIM_CurveAutoClamped),(InVal=502.000000,InterpMode=CIM_CurveAutoClamped),(InVal=503.500000,OutVal=-37.968750,InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,InterpMode=CIM_CurveAutoClamped),(InVal=515.000000,InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,InterpMode=CIM_CurveAutoClamped),(InVal=525.000000,InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,InterpMode=CIM_CurveAutoClamped),(InVal=535.000000,InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=545.000000,InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,InterpMode=CIM_CurveAutoClamped),(InVal=565.000000,InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,InterpMode=CIM_CurveAutoClamped),(InVal=575.000000,InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,InterpMode=CIM_CurveAutoClamped),(InVal=595.000000,InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,InterpMode=CIM_CurveAutoClamped),(InVal=605.000000,InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,InterpMode=CIM_CurveAutoClamped),(InVal=615.000000,InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,InterpMode=CIM_CurveAutoClamped),(InVal=655.000000,OutVal=-2.285156,InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,InterpMode=CIM_CurveAutoClamped),(InVal=665.000000,InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,InterpMode=CIM_CurveAutoClamped),(InVal=675.000000,InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,InterpMode=CIM_CurveAutoClamped),(InVal=690.000000),(InVal=690.000000,InterpMode=CIM_CurveAutoClamped),(InVal=695.000000,InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,InterpMode=CIM_CurveAutoClamped),(InVal=705.000000,InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,InterpMode=CIM_CurveAutoClamped),(InVal=714.000000,InterpMode=CIM_CurveAutoClamped),(InVal=714.750000,OutVal=-15.117188,InterpMode=CIM_CurveAutoClamped),(InVal=715.500000,OutVal=-0.769043,ArriveTangent=0.584683,LeaveTangent=0.584683,InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,InterpMode=CIM_CurveAutoClamped),(InVal=725.000000,InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,InterpMode=CIM_CurveAutoClamped),(InVal=734.000000,InterpMode=CIM_CurveAutoClamped),(InVal=736.000000,OutVal=-45.878906,InterpMode=CIM_CurveAutoClamped),(InVal=738.000000,OutVal=3.801270,InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,InterpMode=CIM_CurveAutoClamped),(InVal=745.000000,InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,InterpMode=CIM_CurveAutoClamped),(InVal=755.000000,InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,InterpMode=CIM_CurveAutoClamped),(InVal=765.000000,InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,InterpMode=CIM_CurveAutoClamped),(InVal=775.000000,InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,InterpMode=CIM_CurveAutoClamped),(InVal=785.000000,InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,InterpMode=CIM_CurveAutoClamped),(InVal=795.000000,InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,InterpMode=CIM_CurveAutoClamped),(InVal=805.000000,InterpMode=CIM_CurveAutoClamped),(InVal=810.000000,InterpMode=CIM_CurveAutoClamped),(InVal=815.000000,InterpMode=CIM_CurveAutoClamped),(InVal=820.000000,InterpMode=CIM_CurveAutoClamped),(InVal=825.000000,InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,InterpMode=CIM_CurveAutoClamped),(InVal=835.000000,InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,InterpMode=CIM_CurveAutoClamped),(InVal=845.000000,InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,InterpMode=CIM_CurveAutoClamped),(InVal=855.000000,InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,InterpMode=CIM_CurveAutoClamped),(InVal=865.000000,InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,InterpMode=CIM_CurveAutoClamped),(InVal=875.000000,InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,InterpMode=CIM_CurveAutoClamped),(InVal=885.000000,InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,InterpMode=CIM_CurveAutoClamped),(InVal=895.000000,InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,InterpMode=CIM_CurveAutoClamped),(InVal=905.000000,InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,InterpMode=CIM_CurveAutoClamped),(InVal=915.000000,InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,InterpMode=CIM_CurveAutoClamped),(InVal=925.000000,InterpMode=CIM_CurveAutoClamped),(InVal=928.500000,InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,OutVal=-55.019531,InterpMode=CIM_CurveAutoClamped),(InVal=931.000000,OutVal=0.461426,InterpMode=CIM_CurveAutoClamped),(InVal=935.000000,InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,InterpMode=CIM_CurveAutoClamped),(InVal=945.000000,InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,InterpMode=CIM_CurveAutoClamped),(InVal=955.000000,InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,InterpMode=CIM_CurveAutoClamped),(InVal=965.000000,InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,InterpMode=CIM_CurveAutoClamped),(InVal=975.000000,InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,InterpMode=CIM_CurveAutoClamped),(InVal=985.000000,InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,InterpMode=CIM_CurveAutoClamped),(InVal=995.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1005.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1015.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1025.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1035.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1045.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1055.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1065.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1075.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1085.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1090.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1095.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1105.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1110.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1115.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1120.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1125.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1130.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1135.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1140.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1145.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1149.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1155.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1160.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1165.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1170.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1175.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1180.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1185.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1190.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1195.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1200.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1205.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1210.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1215.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1220.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1225.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1230.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1235.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1240.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1245.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1250.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1255.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1260.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1265.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1270.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1275.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1285.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1290.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1295.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1300.000000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_4"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_5
            MoveAxis=AXIS_RotationZ
            LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000),(Time=15.000000),(Time=17.500000),(Time=20.000000),(Time=21.000000),(Time=24.000000),(Time=25.000000),(Time=30.000000),(Time=32.500000),(Time=35.000000),(Time=40.000000),(Time=45.000000),(Time=50.000000),(Time=55.000000),(Time=56.000000),(Time=56.000000),(Time=59.000000),(Time=60.000000),(Time=65.000000),(Time=70.000000),(Time=75.000000),(Time=80.000000),(Time=85.000000),(Time=87.500000),(Time=92.500000),(Time=95.000000),(Time=97.500000),(Time=100.000000),(Time=105.000000),(Time=107.500000),(Time=110.000000),(Time=115.000000),(Time=120.000000),(Time=130.000000),(Time=140.000000),(Time=140.000000),(Time=145.000000),(Time=150.000000),(Time=155.000000),(Time=157.500000),(Time=162.500000),(Time=167.500000),(Time=177.000000),(Time=180.000000),(Time=183.500000),(Time=195.000000),(Time=197.500000),(Time=200.000000),(Time=210.000000),(Time=211.000000),(Time=212.000000),(Time=218.000000),(Time=220.000000),(Time=228.000000),(Time=230.500000),(Time=235.000000),(Time=237.000000),(Time=243.500000),(Time=246.500000),(Time=254.000000),(Time=256.000000),(Time=260.000000),(Time=263.000000),(Time=266.500000),(Time=269.000000),(Time=272.000000),(Time=275.000000),(Time=277.500000),(Time=279.000000),(Time=281.500000),(Time=283.500000),(Time=284.500000),(Time=287.500000),(Time=288.500000),(Time=295.000000),(Time=305.000000),(Time=310.000000),(Time=317.500000),(Time=321.000000),(Time=324.000000),(Time=326.500000),(Time=327.500000),(Time=330.000000),(Time=331.500000),(Time=334.000000),(Time=336.500000),(Time=338.500000),(Time=341.500000),(Time=344.500000),(Time=345.500000),(Time=348.000000),(Time=353.500000),(Time=356.500000),(Time=358.000000),(Time=360.000000),(Time=361.500000),(Time=365.000000),(Time=369.500000),(Time=371.000000),(Time=377.500000),(Time=380.000000),(Time=383.000000),(Time=385.000000),(Time=388.000000),(Time=390.000000),(Time=392.000000),(Time=395.000000),(Time=398.000000),(Time=400.000000),(Time=403.000000),(Time=405.000000),(Time=412.500000),(Time=415.000000),(Time=418.500000),(Time=420.000000),(Time=423.000000),(Time=425.000000),(Time=427.000000),(Time=430.000000),(Time=433.500000),(Time=435.000000),(Time=440.000000),(Time=442.500000),(Time=445.000000),(Time=447.500000),(Time=450.000000),(Time=451.500000),(Time=453.000000),(Time=455.000000),(Time=456.500000),(Time=458.000000),(Time=461.000000),(Time=466.500000),(Time=468.500000),(Time=470.000000),(Time=473.000000),(Time=475.000000),(Time=477.000000),(Time=481.500000),(Time=485.000000),(Time=487.000000),(Time=488.500000),(Time=491.500000),(Time=495.000000),(Time=499.000000),(Time=502.000000),(Time=505.000000),(Time=507.500000),(Time=514.000000),(Time=516.500000),(Time=518.500000),(Time=521.500000),(Time=523.000000),(Time=526.000000),(Time=528.000000),(Time=531.000000),(Time=534.000000),(Time=536.500000),(Time=540.000000),(Time=543.500000),(Time=546.000000),(Time=547.500000),(Time=550.000000),(Time=552.000000),(Time=554.000000),(Time=558.500000),(Time=562.500000),(Time=566.000000),(Time=571.500000),(Time=575.000000),(Time=579.000000),(Time=580.000000),(Time=587.000000),(Time=590.000000),(Time=592.000000),(Time=602.500000),(Time=605.000000),(Time=607.000000),(Time=608.000000),(Time=611.500000),(Time=613.500000),(Time=615.000000),(Time=616.500000),(Time=618.500000),(Time=627.500000),(Time=630.000000),(Time=632.500000),(Time=635.000000),(Time=638.000000),(Time=640.000000),(Time=650.000000),(Time=652.500000),(Time=655.000000),(Time=659.000000),(Time=661.500000),(Time=663.500000),(Time=666.000000),(Time=668.000000),(Time=670.000000),(Time=672.500000),(Time=677.500000),(Time=680.000000),(Time=683.000000),(Time=685.000000),(Time=688.000000),(Time=690.000000),(Time=694.000000),(Time=696.000000),(Time=697.500000),(Time=699.000000),(Time=703.000000),(Time=706.500000),(Time=708.500000),(Time=710.000000),(Time=711.500000),(Time=714.000000),(Time=715.500000),(Time=717.000000),(Time=718.500000),(Time=720.000000),(Time=724.000000),(Time=726.000000),(Time=728.500000),(Time=730.000000),(Time=732.500000),(Time=735.000000),(Time=738.000000),(Time=741.000000),(Time=748.500000),(Time=750.000000),(Time=753.500000),(Time=755.000000),(Time=758.500000),(Time=760.000000),(Time=763.500000),(Time=765.000000),(Time=768.000000),(Time=770.000000),(Time=773.000000),(Time=775.000000),(Time=778.000000),(Time=780.000000),(Time=782.500000),(Time=785.000000),(Time=788.500000),(Time=790.000000),(Time=793.500000),(Time=795.000000),(Time=798.500000),(Time=800.000000),(Time=803.500000),(Time=805.000000),(Time=808.500000),(Time=810.000000),(Time=815.000000),(Time=823.500000),(Time=825.000000),(Time=829.000000),(Time=831.500000),(Time=833.500000),(Time=835.000000),(Time=839.000000),(Time=841.000000),(Time=844.000000),(Time=846.500000),(Time=856.000000),(Time=860.000000),(Time=868.500000),(Time=872.000000),(Time=878.500000),(Time=881.500000),(Time=887.000000),(Time=892.500000),(Time=895.000000),(Time=900.000000),(Time=902.500000),(Time=905.000000),(Time=908.000000),(Time=910.000000),(Time=917.500000),(Time=920.500000),(Time=922.500000),(Time=925.000000),(Time=928.500000),(Time=930.500000),(Time=933.500000),(Time=938.000000),(Time=941.500000),(Time=947.000000),(Time=955.000000),(Time=958.000000),(Time=960.000000),(Time=964.000000),(Time=966.000000),(Time=968.500000),(Time=970.500000),(Time=973.500000),(Time=975.000000),(Time=979.000000),(Time=981.000000),(Time=982.500000),(Time=983.500000),(Time=986.500000),(Time=987.500000),(Time=989.000000),(Time=991.000000),(Time=994.000000),(Time=995.500000),(Time=998.000000),(Time=1001.500000),(Time=1003.500000),(Time=1006.000000),(Time=1007.000000),(Time=1008.500000),(Time=1010.000000),(Time=1013.500000),(Time=1016.000000),(Time=1024.000000),(Time=1026.000000),(Time=1029.000000),(Time=1030.500000),(Time=1032.500000),(Time=1035.000000),(Time=1037.000000),(Time=1038.500000),(Time=1040.000000),(Time=1041.500000),(Time=1043.500000),(Time=1044.500000),(Time=1045.500000),(Time=1047.000000),(Time=1050.000000),(Time=1051.500000),(Time=1053.000000),(Time=1055.000000),(Time=1056.000000),(Time=1060.000000),(Time=1061.500000),(Time=1063.000000),(Time=1066.500000),(Time=1076.000000),(Time=1088.000000),(Time=1092.000000),(Time=1093.500000),(Time=1096.000000),(Time=1097.500000),(Time=1099.000000),(Time=1100.000000),(Time=1101.500000),(Time=1104.000000),(Time=1105.000000),(Time=1106.500000),(Time=1108.000000),(Time=1109.500000),(Time=1114.000000),(Time=1116.000000),(Time=1118.000000),(Time=1120.000000),(Time=1124.000000),(Time=1126.000000),(Time=1129.000000),(Time=1134.000000),(Time=1137.000000),(Time=1139.000000),(Time=1142.000000),(Time=1144.000000),(Time=1146.000000),(Time=1148.000000),(Time=1149.500000),(Time=1151.500000),(Time=1152.500000),(Time=1155.500000),(Time=1158.500000),(Time=1161.000000),(Time=1166.000000),(Time=1169.000000),(Time=1170.000000),(Time=1173.000000),(Time=1176.000000),(Time=1178.500000),(Time=1181.000000),(Time=1182.500000),(Time=1184.000000),(Time=1186.000000),(Time=1189.000000),(Time=1191.500000),(Time=1198.500000),(Time=1201.500000),(Time=1203.500000),(Time=1205.000000),(Time=1208.500000),(Time=1210.500000),(Time=1214.000000),(Time=1216.000000),(Time=1219.000000),(Time=1221.000000),(Time=1229.000000),(Time=1232.500000),(Time=1239.000000),(Time=1240.500000),(Time=1244.000000),(Time=1246.000000),(Time=1249.000000),(Time=1251.000000),(Time=1254.500000),(Time=1255.500000),(Time=1259.500000),(Time=1261.000000),(Time=1269.000000),(Time=1271.000000),(Time=1273.500000),(Time=1276.500000),(Time=1279.000000),(Time=1281.000000),(Time=1282.000000),(Time=1283.500000),(Time=1284.000000),(Time=1286.000000),(Time=1289.000000),(Time=1291.000000),(Time=1292.000000),(Time=1293.000000),(Time=1294.000000),(Time=1295.500000),(Time=1298.000000),(Time=1300.000000)))
            FloatTrack=(Points=((OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=622.792969,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=457.207031,ArriveTangent=-9.972141,LeaveTangent=-9.972141,InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=446.967773,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=32.500000,OutVal=458.789063,ArriveTangent=-7.488672,LeaveTangent=-7.488672,InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,OutVal=450.351563,InterpMode=CIM_CurveAutoClamped),(InVal=40.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=540.000000,InterpMode=CIM_CurveAutoClamped),(InVal=55.000000,OutVal=475.312500,ArriveTangent=-28.714600,LeaveTangent=-28.714600,InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=367.712402,InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=367.712402,InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=362.856445,InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=402.539063,InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=373.183594,ArriveTangent=-8.958219,LeaveTangent=-8.958219,InterpMode=CIM_CurveAutoClamped),(InVal=70.000000,OutVal=312.187500,InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=411.328125,ArriveTangent=3.823828,LeaveTangent=3.823828,InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=419.765625,InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=372.480469,ArriveTangent=-7.215335,LeaveTangent=-7.215335,InterpMode=CIM_CurveAutoClamped),(InVal=87.500000,OutVal=358.945313,InterpMode=CIM_CurveAutoClamped),(InVal=92.500000,OutVal=417.480469,ArriveTangent=24.245398,LeaveTangent=24.245398,InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,OutVal=547.756348,InterpMode=CIM_CurveAutoClamped),(InVal=97.500000,OutVal=544.196777,ArriveTangent=-3.271279,LeaveTangent=-3.271279,InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=495.351563,InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=579.726563,InterpMode=CIM_CurveAutoClamped),(InVal=107.500000,OutVal=579.704590,ArriveTangent=-0.021978,LeaveTangent=-0.021978,InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=494.582520,ArriveTangent=-23.466797,LeaveTangent=-23.466797,InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=403.703613,ArriveTangent=-26.121094,LeaveTangent=-26.121094,InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=233.371582,InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=267.341309,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=179.450684,InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=179.450684,InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=77.849121,ArriveTangent=-26.804443,LeaveTangent=-26.804443,InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=-88.593750,InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=-88.571777,ArriveTangent=0.013185,LeaveTangent=0.013185,InterpMode=CIM_CurveAutoClamped),(InVal=157.500000,OutVal=-50.053711,ArriveTangent=3.263106,LeaveTangent=3.263106,InterpMode=CIM_CurveAutoClamped),(InVal=162.500000,OutVal=-43.725586,ArriveTangent=2.685456,LeaveTangent=2.685456,InterpMode=CIM_CurveAutoClamped),(InVal=167.500000,InterpMode=CIM_CurveAutoClamped),(InVal=177.000000,InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=52.207031,InterpMode=CIM_CurveAutoClamped),(InVal=183.500000,OutVal=2.460938,InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=2.460938,InterpMode=CIM_CurveAutoClamped),(InVal=197.500000,OutVal=-101.777344,ArriveTangent=-36.281250,LeaveTangent=-36.281250,InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=-178.945313,InterpMode=CIM_CurveAutoClamped),(InVal=210.000000,OutVal=-178.945313,InterpMode=CIM_CurveAutoClamped),(InVal=211.000000,OutVal=-138.339844,InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=-179.121094,InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=-179.121094,InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=-95.273438,InterpMode=CIM_CurveAutoClamped),(InVal=228.000000,OutVal=-95.273438,InterpMode=CIM_CurveAutoClamped),(InVal=230.500000,OutVal=-197.226563,ArriveTangent=-36.336494,LeaveTangent=-36.336494,InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,OutVal=-349.628906,ArriveTangent=-8.572941,LeaveTangent=-8.572941,InterpMode=CIM_CurveAutoClamped),(InVal=237.000000,OutVal=-359.472656,InterpMode=CIM_CurveAutoClamped),(InVal=243.500000,OutVal=-327.656250,InterpMode=CIM_CurveAutoClamped),(InVal=246.500000,OutVal=-357.363281,InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=-357.363281,InterpMode=CIM_CurveAutoClamped),(InVal=256.000000,OutVal=-273.691406,InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=-273.691406,InterpMode=CIM_CurveAutoClamped),(InVal=263.000000,OutVal=-317.812500,InterpMode=CIM_CurveAutoClamped),(InVal=266.500000,OutVal=-271.054688,InterpMode=CIM_CurveAutoClamped),(InVal=269.000000,OutVal=-361.406250,ArriveTangent=-32.535511,LeaveTangent=-32.535511,InterpMode=CIM_CurveAutoClamped),(InVal=272.000000,OutVal=-450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=-365.625000,ArriveTangent=30.010653,LeaveTangent=30.010653,InterpMode=CIM_CurveAutoClamped),(InVal=277.500000,OutVal=-284.941406,ArriveTangent=36.254883,LeaveTangent=36.254883,InterpMode=CIM_CurveAutoClamped),(InVal=279.000000,OutVal=-220.605469,ArriveTangent=25.400391,LeaveTangent=25.400391,InterpMode=CIM_CurveAutoClamped),(InVal=281.500000,OutVal=-183.339844,ArriveTangent=2.578625,LeaveTangent=2.578625,InterpMode=CIM_CurveAutoClamped),(InVal=283.500000,OutVal=-180.944824,ArriveTangent=3.403531,LeaveTangent=3.403531,InterpMode=CIM_CurveAutoClamped),(InVal=284.500000,OutVal=-138.339844,InterpMode=CIM_CurveAutoClamped),(InVal=287.500000,OutVal=-182.636719,ArriveTangent=-25.927734,LeaveTangent=-25.927734,InterpMode=CIM_CurveAutoClamped),(InVal=288.500000,OutVal=-242.050781,ArriveTangent=-18.796875,LeaveTangent=-18.796875,InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=-323.613281,ArriveTangent=-11.580256,LeaveTangent=-11.580256,InterpMode=CIM_CurveAutoClamped),(InVal=305.000000,OutVal=-433.125000,ArriveTangent=-8.021024,LeaveTangent=-8.021024,InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,OutVal=-462.480469,ArriveTangent=-8.379690,LeaveTangent=-8.379690,InterpMode=CIM_CurveAutoClamped),(InVal=317.500000,OutVal=-547.031250,ArriveTangent=-23.390266,LeaveTangent=-23.390266,InterpMode=CIM_CurveAutoClamped),(InVal=321.000000,OutVal=-723.515625,InterpMode=CIM_CurveAutoClamped),(InVal=324.000000,OutVal=-723.515625,InterpMode=CIM_CurveAutoClamped),(InVal=326.500000,OutVal=-632.285156,InterpMode=CIM_CurveAutoClamped),(InVal=327.500000,OutVal=-632.285156,InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,OutVal=-547.734375,ArriveTangent=45.175781,LeaveTangent=45.175781,InterpMode=CIM_CurveAutoClamped),(InVal=331.500000,OutVal=-451.582031,InterpMode=CIM_CurveAutoClamped),(InVal=334.000000,OutVal=-490.957031,ArriveTangent=-17.648438,LeaveTangent=-17.648438,InterpMode=CIM_CurveAutoClamped),(InVal=336.500000,OutVal=-539.824219,ArriveTangent=-21.796875,LeaveTangent=-21.796875,InterpMode=CIM_CurveAutoClamped),(InVal=338.500000,OutVal=-589.042969,ArriveTangent=-18.175781,LeaveTangent=-18.175781,InterpMode=CIM_CurveAutoClamped),(InVal=341.500000,OutVal=-630.703125,ArriveTangent=-0.539368,LeaveTangent=-0.539368,InterpMode=CIM_CurveAutoClamped),(InVal=344.500000,OutVal=-631.362305,ArriveTangent=-0.701851,LeaveTangent=-0.701851,InterpMode=CIM_CurveAutoClamped),(InVal=345.500000,OutVal=-664.804688,ArriveTangent=-24.722378,LeaveTangent=-24.722378,InterpMode=CIM_CurveAutoClamped),(InVal=348.000000,OutVal=-717.890625,ArriveTangent=-13.161621,LeaveTangent=-13.161621,InterpMode=CIM_CurveAutoClamped),(InVal=353.500000,OutVal=-770.097656,ArriveTangent=-16.978401,LeaveTangent=-16.978401,InterpMode=CIM_CurveAutoClamped),(InVal=356.500000,OutVal=-862.207031,ArriveTangent=-28.343586,LeaveTangent=-28.343586,InterpMode=CIM_CurveAutoClamped),(InVal=358.000000,OutVal=-899.824219,InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,OutVal=-847.441406,ArriveTangent=32.393974,LeaveTangent=32.393974,InterpMode=CIM_CurveAutoClamped),(InVal=361.500000,OutVal=-786.445313,InterpMode=CIM_CurveAutoClamped),(InVal=365.000000,OutVal=-814.218750,ArriveTangent=-9.799805,LeaveTangent=-9.799805,InterpMode=CIM_CurveAutoClamped),(InVal=369.500000,OutVal=-864.843750,ArriveTangent=-14.355469,LeaveTangent=-14.355469,InterpMode=CIM_CurveAutoClamped),(InVal=371.000000,OutVal=-900.351563,InterpMode=CIM_CurveAutoClamped),(InVal=377.500000,OutVal=-900.351563,InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=-812.812500,InterpMode=CIM_CurveAutoClamped),(InVal=383.000000,OutVal=-812.812500,InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,OutVal=-897.363281,InterpMode=CIM_CurveAutoClamped),(InVal=388.000000,OutVal=-897.363281,InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,OutVal=-984.550781,InterpMode=CIM_CurveAutoClamped),(InVal=392.000000,OutVal=-984.550781,InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,OutVal=-908.085938,InterpMode=CIM_CurveAutoClamped),(InVal=398.000000,OutVal=-908.085938,InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=-1004.238281,InterpMode=CIM_CurveAutoClamped),(InVal=403.000000,OutVal=-1004.238281,InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,OutVal=-1080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=412.500000,OutVal=-1080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,OutVal=-990.000000,InterpMode=CIM_CurveAutoClamped),(InVal=418.500000,OutVal=-990.000000,InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,OutVal=-943.769531,InterpMode=CIM_CurveAutoClamped),(InVal=423.000000,OutVal=-982.968750,ArriveTangent=-12.304688,LeaveTangent=-12.304688,InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,OutVal=-1005.292969,InterpMode=CIM_CurveAutoClamped),(InVal=427.000000,OutVal=-1005.292969,InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=-1076.660156,InterpMode=CIM_CurveAutoClamped),(InVal=433.500000,OutVal=-1076.660156,InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,OutVal=-1170.000000,InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=-1170.000000,InterpMode=CIM_CurveAutoClamped),(InVal=442.500000,OutVal=-1151.894531,InterpMode=CIM_CurveAutoClamped),(InVal=445.000000,OutVal=-1223.437500,ArriveTangent=-25.031250,LeaveTangent=-25.031250,InterpMode=CIM_CurveAutoClamped),(InVal=447.500000,OutVal=-1277.050781,InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=-1216.054688,ArriveTangent=25.927734,LeaveTangent=25.927734,InterpMode=CIM_CurveAutoClamped),(InVal=451.500000,OutVal=-1173.339844,InterpMode=CIM_CurveAutoClamped),(InVal=453.000000,OutVal=-1173.339844,InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,OutVal=-1092.304688,ArriveTangent=15.513138,LeaveTangent=15.513138,InterpMode=CIM_CurveAutoClamped),(InVal=456.500000,OutVal=-1080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=458.000000,OutVal=-1080.000000,InterpMode=CIM_CurveAutoClamped),(InVal=461.000000,OutVal=-989.824219,ArriveTangent=20.680147,LeaveTangent=20.680147,InterpMode=CIM_CurveAutoClamped),(InVal=466.500000,OutVal=-904.218750,InterpMode=CIM_CurveAutoClamped),(InVal=468.500000,OutVal=-904.218750,InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,OutVal=-988.945313,InterpMode=CIM_CurveAutoClamped),(InVal=473.000000,OutVal=-988.945313,InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,OutVal=-907.031250,InterpMode=CIM_CurveAutoClamped),(InVal=477.000000,OutVal=-907.031250,InterpMode=CIM_CurveAutoClamped),(InVal=481.500000,OutVal=-961.809082,ArriveTangent=-10.502930,LeaveTangent=-10.502930,InterpMode=CIM_CurveAutoClamped),(InVal=485.000000,OutVal=-991.054688,ArriveTangent=-0.964818,LeaveTangent=-0.964818,InterpMode=CIM_CurveAutoClamped),(InVal=487.000000,OutVal=-992.021484,ArriveTangent=-1.277893,LeaveTangent=-1.277893,InterpMode=CIM_CurveAutoClamped),(InVal=488.500000,OutVal=-1031.132813,ArriveTangent=-27.825184,LeaveTangent=-27.825184,InterpMode=CIM_CurveAutoClamped),(InVal=491.500000,OutVal=-1117.792969,InterpMode=CIM_CurveAutoClamped),(InVal=495.000000,OutVal=-1079.121094,InterpMode=CIM_CurveAutoClamped),(InVal=499.000000,OutVal=-1079.121094,InterpMode=CIM_CurveAutoClamped),(InVal=502.000000,OutVal=-1172.109375,ArriveTangent=-32.373047,LeaveTangent=-32.373047,InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,OutVal=-1273.359375,ArriveTangent=-32.407669,LeaveTangent=-32.407669,InterpMode=CIM_CurveAutoClamped),(InVal=507.500000,OutVal=-1350.351563,InterpMode=CIM_CurveAutoClamped),(InVal=514.000000,OutVal=-1350.351563,InterpMode=CIM_CurveAutoClamped),(InVal=516.500000,OutVal=-1437.187500,InterpMode=CIM_CurveAutoClamped),(InVal=518.500000,OutVal=-1437.187500,InterpMode=CIM_CurveAutoClamped),(InVal=521.500000,OutVal=-1527.890625,InterpMode=CIM_CurveAutoClamped),(InVal=523.000000,OutVal=-1527.890625,InterpMode=CIM_CurveAutoClamped),(InVal=526.000000,OutVal=-1620.527344,InterpMode=CIM_CurveAutoClamped),(InVal=528.000000,OutVal=-1615.385742,InterpMode=CIM_CurveAutoClamped),(InVal=531.000000,OutVal=-1708.374023,ArriveTangent=-25.253906,LeaveTangent=-25.253906,InterpMode=CIM_CurveAutoClamped),(InVal=534.000000,OutVal=-1766.909180,ArriveTangent=-27.166193,LeaveTangent=-27.166193,InterpMode=CIM_CurveAutoClamped),(InVal=536.500000,OutVal=-1857.788086,ArriveTangent=-18.283369,LeaveTangent=-18.283369,InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=-1890.483398,InterpMode=CIM_CurveAutoClamped),(InVal=543.500000,OutVal=-1815.073242,ArriveTangent=29.794922,LeaveTangent=29.794922,InterpMode=CIM_CurveAutoClamped),(InVal=546.000000,OutVal=-1711.713867,ArriveTangent=52.690430,LeaveTangent=52.690430,InterpMode=CIM_CurveAutoClamped),(InVal=547.500000,OutVal=-1604.311523,ArriveTangent=66.093750,LeaveTangent=66.093750,InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,OutVal=-1447.338867,ArriveTangent=7.388056,LeaveTangent=7.388056,InterpMode=CIM_CurveAutoClamped),(InVal=552.000000,OutVal=-1440.659180,ArriveTangent=7.753483,LeaveTangent=7.753483,InterpMode=CIM_CurveAutoClamped),(InVal=554.000000,OutVal=-1335.893555,InterpMode=CIM_CurveAutoClamped),(InVal=558.500000,OutVal=-1355.756836,InterpMode=CIM_CurveAutoClamped),(InVal=562.500000,OutVal=-1355.756836,InterpMode=CIM_CurveAutoClamped),(InVal=566.000000,OutVal=-1443.823242,ArriveTangent=-19.316406,LeaveTangent=-19.316406,InterpMode=CIM_CurveAutoClamped),(InVal=571.500000,OutVal=-1529.604492,ArriveTangent=-18.750000,LeaveTangent=-18.750000,InterpMode=CIM_CurveAutoClamped),(InVal=575.000000,OutVal=-1612.573242,ArriveTangent=-10.309321,LeaveTangent=-10.309321,InterpMode=CIM_CurveAutoClamped),(InVal=579.000000,OutVal=-1633.139648,InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,OutVal=-1618.022461,InterpMode=CIM_CurveAutoClamped),(InVal=587.000000,OutVal=-1618.022461,InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=-1710.659180,ArriveTangent=-36.070313,LeaveTangent=-36.070313,InterpMode=CIM_CurveAutoClamped),(InVal=592.000000,OutVal=-1798.374023,InterpMode=CIM_CurveAutoClamped),(InVal=602.500000,OutVal=-1798.374023,InterpMode=CIM_CurveAutoClamped),(InVal=605.000000,OutVal=-1908.940430,ArriveTangent=-40.195313,LeaveTangent=-40.195313,InterpMode=CIM_CurveAutoClamped),(InVal=607.000000,OutVal=-1979.252930,InterpMode=CIM_CurveAutoClamped),(InVal=608.000000,OutVal=-1979.252930,InterpMode=CIM_CurveAutoClamped),(InVal=611.500000,OutVal=-1896.108398,InterpMode=CIM_CurveAutoClamped),(InVal=613.500000,OutVal=-1896.108398,InterpMode=CIM_CurveAutoClamped),(InVal=615.000000,OutVal=-1857.788086,InterpMode=CIM_CurveAutoClamped),(InVal=616.500000,OutVal=-1891.801758,InterpMode=CIM_CurveAutoClamped),(InVal=618.500000,OutVal=-1891.186523,InterpMode=CIM_CurveAutoClamped),(InVal=627.500000,OutVal=-1891.186523,InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=-1976.264648,InterpMode=CIM_CurveAutoClamped),(InVal=632.500000,OutVal=-1976.264648,InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,OutVal=-1894.702148,InterpMode=CIM_CurveAutoClamped),(InVal=638.000000,OutVal=-1894.702148,InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,OutVal=-1980.307617,InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=-1980.307617,InterpMode=CIM_CurveAutoClamped),(InVal=652.500000,OutVal=-1930.561523,ArriveTangent=33.180599,LeaveTangent=33.180599,InterpMode=CIM_CurveAutoClamped),(InVal=655.000000,OutVal=-1801.186523,InterpMode=CIM_CurveAutoClamped),(InVal=659.000000,OutVal=-1801.186523,InterpMode=CIM_CurveAutoClamped),(InVal=661.500000,OutVal=-1751.088867,InterpMode=CIM_CurveAutoClamped),(InVal=663.500000,OutVal=-1751.088867,InterpMode=CIM_CurveAutoClamped),(InVal=666.000000,OutVal=-1840.913086,ArriveTangent=-31.640625,LeaveTangent=-31.640625,InterpMode=CIM_CurveAutoClamped),(InVal=668.000000,OutVal=-1893.471680,ArriveTangent=-40.608707,LeaveTangent=-40.608707,InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=-2005.971680,InterpMode=CIM_CurveAutoClamped),(InVal=672.500000,OutVal=-1983.295898,InterpMode=CIM_CurveAutoClamped),(InVal=677.500000,OutVal=-1983.295898,InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=-2068.374023,InterpMode=CIM_CurveAutoClamped),(InVal=683.000000,OutVal=-2068.374023,InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,OutVal=-1982.768555,InterpMode=CIM_CurveAutoClamped),(InVal=688.000000,OutVal=-1982.768555,InterpMode=CIM_CurveAutoClamped),(InVal=690.000000,OutVal=-1897.690430,InterpMode=CIM_CurveAutoClamped),(InVal=694.000000,OutVal=-1897.690430,InterpMode=CIM_CurveAutoClamped),(InVal=696.000000,OutVal=-2074.526367,InterpMode=CIM_CurveAutoClamped),(InVal=697.500000,OutVal=-2074.526367,InterpMode=CIM_CurveAutoClamped),(InVal=699.000000,OutVal=-1980.659180,InterpMode=CIM_CurveAutoClamped),(InVal=703.000000,OutVal=-1980.659180,InterpMode=CIM_CurveAutoClamped),(InVal=706.500000,OutVal=-1801.186523,InterpMode=CIM_CurveAutoClamped),(InVal=708.500000,OutVal=-1801.186523,InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,OutVal=-1886.440430,ArriveTangent=-59.003906,LeaveTangent=-59.003906,InterpMode=CIM_CurveAutoClamped),(InVal=711.500000,OutVal=-1978.198242,ArriveTangent=-25.234058,LeaveTangent=-25.234058,InterpMode=CIM_CurveAutoClamped),(InVal=714.000000,OutVal=-2007.553711,InterpMode=CIM_CurveAutoClamped),(InVal=715.500000,OutVal=-1957.104492,ArriveTangent=59.186886,LeaveTangent=59.186886,InterpMode=CIM_CurveAutoClamped),(InVal=717.000000,OutVal=-1803.295898,InterpMode=CIM_CurveAutoClamped),(InVal=718.500000,OutVal=-1803.295898,InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=-1887.495117,InterpMode=CIM_CurveAutoClamped),(InVal=724.000000,OutVal=-1887.495117,InterpMode=CIM_CurveAutoClamped),(InVal=726.000000,OutVal=-1713.647461,InterpMode=CIM_CurveAutoClamped),(InVal=728.500000,OutVal=-1713.647461,InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=-1746.342773,InterpMode=CIM_CurveAutoClamped),(InVal=732.500000,OutVal=-1746.342773,InterpMode=CIM_CurveAutoClamped),(InVal=735.000000,OutVal=-1708.901367,InterpMode=CIM_CurveAutoClamped),(InVal=738.000000,OutVal=-1708.901367,InterpMode=CIM_CurveAutoClamped),(InVal=741.000000,OutVal=-1532.768555,InterpMode=CIM_CurveAutoClamped),(InVal=748.500000,OutVal=-1532.768555,InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,OutVal=-1440.483398,InterpMode=CIM_CurveAutoClamped),(InVal=753.500000,OutVal=-1440.483398,InterpMode=CIM_CurveAutoClamped),(InVal=755.000000,OutVal=-1350.659180,InterpMode=CIM_CurveAutoClamped),(InVal=758.500000,OutVal=-1350.659180,InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,OutVal=-1442.065430,InterpMode=CIM_CurveAutoClamped),(InVal=763.500000,OutVal=-1442.065430,InterpMode=CIM_CurveAutoClamped),(InVal=765.000000,OutVal=-1531.010742,InterpMode=CIM_CurveAutoClamped),(InVal=768.000000,OutVal=-1531.010742,InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,OutVal=-1441.538086,InterpMode=CIM_CurveAutoClamped),(InVal=773.000000,OutVal=-1441.538086,InterpMode=CIM_CurveAutoClamped),(InVal=775.000000,OutVal=-1352.944336,InterpMode=CIM_CurveAutoClamped),(InVal=778.000000,OutVal=-1352.944336,InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,OutVal=-1263.295898,InterpMode=CIM_CurveAutoClamped),(InVal=782.500000,OutVal=-1263.295898,InterpMode=CIM_CurveAutoClamped),(InVal=785.000000,OutVal=-1348.022461,InterpMode=CIM_CurveAutoClamped),(InVal=788.500000,OutVal=-1348.022461,InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,OutVal=-1259.604492,InterpMode=CIM_CurveAutoClamped),(InVal=793.500000,OutVal=-1259.604492,InterpMode=CIM_CurveAutoClamped),(InVal=795.000000,OutVal=-1171.538086,InterpMode=CIM_CurveAutoClamped),(InVal=798.500000,OutVal=-1171.538086,InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,OutVal=-1261.186523,InterpMode=CIM_CurveAutoClamped),(InVal=803.500000,OutVal=-1261.186523,InterpMode=CIM_CurveAutoClamped),(InVal=805.000000,OutVal=-1349.956055,InterpMode=CIM_CurveAutoClamped),(InVal=808.500000,OutVal=-1349.956055,InterpMode=CIM_CurveAutoClamped),(InVal=810.000000,OutVal=-1261.186523,ArriveTangent=27.557091,LeaveTangent=27.557091,InterpMode=CIM_CurveAutoClamped),(InVal=815.000000,OutVal=-1170.834961,InterpMode=CIM_CurveAutoClamped),(InVal=823.500000,OutVal=-1170.834961,InterpMode=CIM_CurveAutoClamped),(InVal=825.000000,OutVal=-1261.362305,InterpMode=CIM_CurveAutoClamped),(InVal=829.000000,OutVal=-1261.362305,InterpMode=CIM_CurveAutoClamped),(InVal=831.500000,OutVal=-1082.065430,InterpMode=CIM_CurveAutoClamped),(InVal=833.500000,OutVal=-1082.065430,InterpMode=CIM_CurveAutoClamped),(InVal=835.000000,OutVal=-1168.374023,InterpMode=CIM_CurveAutoClamped),(InVal=839.000000,OutVal=-1168.374023,InterpMode=CIM_CurveAutoClamped),(InVal=841.000000,OutVal=-1083.471680,InterpMode=CIM_CurveAutoClamped),(InVal=844.000000,OutVal=-1083.471680,InterpMode=CIM_CurveAutoClamped),(InVal=846.500000,OutVal=-989.604492,InterpMode=CIM_CurveAutoClamped),(InVal=856.000000,OutVal=-989.604492,InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,OutVal=-1168.901367,InterpMode=CIM_CurveAutoClamped),(InVal=868.500000,OutVal=-1168.901367,InterpMode=CIM_CurveAutoClamped),(InVal=872.000000,OutVal=-1079.604492,InterpMode=CIM_CurveAutoClamped),(InVal=878.500000,OutVal=-1079.604492,InterpMode=CIM_CurveAutoClamped),(InVal=881.500000,OutVal=-1258.549805,InterpMode=CIM_CurveAutoClamped),(InVal=887.000000,OutVal=-1258.549805,InterpMode=CIM_CurveAutoClamped),(InVal=892.500000,OutVal=-1348.198242,ArriveTangent=-22.653809,LeaveTangent=-22.653809,InterpMode=CIM_CurveAutoClamped),(InVal=895.000000,OutVal=-1439.780273,InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=-1439.780273,InterpMode=CIM_CurveAutoClamped),(InVal=902.500000,OutVal=-1416.049805,InterpMode=CIM_CurveAutoClamped),(InVal=905.000000,OutVal=-1442.241211,InterpMode=CIM_CurveAutoClamped),(InVal=908.000000,OutVal=-1442.241211,InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,OutVal=-1351.186523,InterpMode=CIM_CurveAutoClamped),(InVal=917.500000,OutVal=-1351.186523,InterpMode=CIM_CurveAutoClamped),(InVal=920.500000,OutVal=-1238.334961,InterpMode=CIM_CurveAutoClamped),(InVal=922.500000,OutVal=-1238.334961,InterpMode=CIM_CurveAutoClamped),(InVal=925.000000,OutVal=-1260.307617,InterpMode=CIM_CurveAutoClamped),(InVal=928.500000,OutVal=-1260.307617,InterpMode=CIM_CurveAutoClamped),(InVal=930.500000,OutVal=-1350.834961,InterpMode=CIM_CurveAutoClamped),(InVal=933.500000,OutVal=-1350.834961,InterpMode=CIM_CurveAutoClamped),(InVal=938.000000,OutVal=-1438.549805,InterpMode=CIM_CurveAutoClamped),(InVal=941.500000,OutVal=-1353.295898,InterpMode=CIM_CurveAutoClamped),(InVal=947.000000,OutVal=-1353.295898,InterpMode=CIM_CurveAutoClamped),(InVal=955.000000,OutVal=-1353.295898,InterpMode=CIM_CurveAutoClamped),(InVal=958.000000,OutVal=-1446.811523,ArriveTangent=-35.753906,LeaveTangent=-35.753906,InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,OutVal=-1532.065430,InterpMode=CIM_CurveAutoClamped),(InVal=964.000000,OutVal=-1532.065430,InterpMode=CIM_CurveAutoClamped),(InVal=966.000000,OutVal=-1442.944336,InterpMode=CIM_CurveAutoClamped),(InVal=968.500000,OutVal=-1442.944336,InterpMode=CIM_CurveAutoClamped),(InVal=970.500000,OutVal=-1558.256836,InterpMode=CIM_CurveAutoClamped),(InVal=973.500000,OutVal=-1558.256836,InterpMode=CIM_CurveAutoClamped),(InVal=975.000000,OutVal=-1532.065430,InterpMode=CIM_CurveAutoClamped),(InVal=979.000000,OutVal=-1532.065430,InterpMode=CIM_CurveAutoClamped),(InVal=981.000000,OutVal=-1621.186523,InterpMode=CIM_CurveAutoClamped),(InVal=982.500000,OutVal=-1621.186523,InterpMode=CIM_CurveAutoClamped),(InVal=983.500000,OutVal=-1552.631836,ArriveTangent=29.707031,LeaveTangent=29.707031,InterpMode=CIM_CurveAutoClamped),(InVal=986.500000,OutVal=-1502.358398,InterpMode=CIM_CurveAutoClamped),(InVal=987.500000,OutVal=-1619.780273,InterpMode=CIM_CurveAutoClamped),(InVal=989.000000,OutVal=-1619.780273,InterpMode=CIM_CurveAutoClamped),(InVal=991.000000,OutVal=-1703.803711,ArriveTangent=-12.713692,LeaveTangent=-12.713692,InterpMode=CIM_CurveAutoClamped),(InVal=994.000000,OutVal=-1720.327148,InterpMode=CIM_CurveAutoClamped),(InVal=995.500000,OutVal=-1622.416992,InterpMode=CIM_CurveAutoClamped),(InVal=998.000000,OutVal=-1622.416992,InterpMode=CIM_CurveAutoClamped),(InVal=1001.500000,OutVal=-1710.307617,InterpMode=CIM_CurveAutoClamped),(InVal=1003.500000,OutVal=-1710.307617,InterpMode=CIM_CurveAutoClamped),(InVal=1006.000000,OutVal=-1799.956055,ArriveTangent=-49.199917,LeaveTangent=-49.199917,InterpMode=CIM_CurveAutoClamped),(InVal=1007.000000,OutVal=-1882.507324,InterpMode=CIM_CurveAutoClamped),(InVal=1008.500000,OutVal=-1707.319336,InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,OutVal=-1711.713867,InterpMode=CIM_CurveAutoClamped),(InVal=1013.500000,OutVal=-1711.713867,InterpMode=CIM_CurveAutoClamped),(InVal=1016.000000,OutVal=-1800.834961,InterpMode=CIM_CurveAutoClamped),(InVal=1024.000000,OutVal=-1800.834961,InterpMode=CIM_CurveAutoClamped),(InVal=1026.000000,OutVal=-1718.217773,InterpMode=CIM_CurveAutoClamped),(InVal=1029.000000,OutVal=-1718.217773,InterpMode=CIM_CurveAutoClamped),(InVal=1030.500000,OutVal=-1800.131836,InterpMode=CIM_CurveAutoClamped),(InVal=1032.500000,OutVal=-1739.311523,InterpMode=CIM_CurveAutoClamped),(InVal=1035.000000,OutVal=-1889.780273,InterpMode=CIM_CurveAutoClamped),(InVal=1037.000000,OutVal=-1889.780273,InterpMode=CIM_CurveAutoClamped),(InVal=1038.500000,OutVal=-1981.362305,InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,OutVal=-1981.362305,InterpMode=CIM_CurveAutoClamped),(InVal=1041.500000,OutVal=-2071.186523,InterpMode=CIM_CurveAutoClamped),(InVal=1043.500000,OutVal=-2071.186523,InterpMode=CIM_CurveAutoClamped),(InVal=1044.500000,OutVal=-2048.862305,InterpMode=CIM_CurveAutoClamped),(InVal=1045.500000,OutVal=-2098.432617,ArriveTangent=-45.562500,LeaveTangent=-45.562500,InterpMode=CIM_CurveAutoClamped),(InVal=1047.000000,OutVal=-2162.768555,InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,OutVal=-2162.768555,InterpMode=CIM_CurveAutoClamped),(InVal=1051.500000,OutVal=-2134.467773,InterpMode=CIM_CurveAutoClamped),(InVal=1053.000000,OutVal=-2206.538086,InterpMode=CIM_CurveAutoClamped),(InVal=1055.000000,OutVal=-2117.768555,ArriveTangent=75.058594,LeaveTangent=75.058594,InterpMode=CIM_CurveAutoClamped),(InVal=1056.000000,OutVal=-1981.362305,InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,OutVal=-1981.362305,InterpMode=CIM_CurveAutoClamped),(InVal=1061.500000,OutVal=-2017.749023,InterpMode=CIM_CurveAutoClamped),(InVal=1063.000000,OutVal=-2017.749023,InterpMode=CIM_CurveAutoClamped),(InVal=1066.500000,OutVal=-1986.459961,ArriveTangent=9.576346,LeaveTangent=9.576346,InterpMode=CIM_CurveAutoClamped),(InVal=1076.000000,OutVal=-1890.307617,InterpMode=CIM_CurveAutoClamped),(InVal=1088.000000,OutVal=-1890.307617,InterpMode=CIM_CurveAutoClamped),(InVal=1092.000000,OutVal=-1743.178711,InterpMode=CIM_CurveAutoClamped),(InVal=1093.500000,OutVal=-1743.178711,InterpMode=CIM_CurveAutoClamped),(InVal=1096.000000,OutVal=-1799.780273,InterpMode=CIM_CurveAutoClamped),(InVal=1097.500000,OutVal=-1799.780273,InterpMode=CIM_CurveAutoClamped),(InVal=1099.000000,OutVal=-1887.846680,InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,OutVal=-1887.846680,InterpMode=CIM_CurveAutoClamped),(InVal=1101.500000,OutVal=-1800.131836,InterpMode=CIM_CurveAutoClamped),(InVal=1104.000000,OutVal=-1800.131836,InterpMode=CIM_CurveAutoClamped),(InVal=1105.000000,OutVal=-1879.936523,InterpMode=CIM_CurveAutoClamped),(InVal=1106.500000,OutVal=-1807.163086,InterpMode=CIM_CurveAutoClamped),(InVal=1108.000000,OutVal=-1900.854492,ArriveTangent=-79.921875,LeaveTangent=-79.921875,InterpMode=CIM_CurveAutoClamped),(InVal=1109.500000,OutVal=-2046.928711,InterpMode=CIM_CurveAutoClamped),(InVal=1114.000000,OutVal=-2046.928711,InterpMode=CIM_CurveAutoClamped),(InVal=1116.000000,OutVal=-1889.956055,InterpMode=CIM_CurveAutoClamped),(InVal=1118.000000,OutVal=-1889.956055,InterpMode=CIM_CurveAutoClamped),(InVal=1120.000000,OutVal=-1980.659180,InterpMode=CIM_CurveAutoClamped),(InVal=1124.000000,OutVal=-1980.659180,InterpMode=CIM_CurveAutoClamped),(InVal=1126.000000,OutVal=-2084.194336,InterpMode=CIM_CurveAutoClamped),(InVal=1129.000000,OutVal=-2084.194336,InterpMode=CIM_CurveAutoClamped),(InVal=1134.000000,OutVal=-1975.209961,InterpMode=CIM_CurveAutoClamped),(InVal=1137.000000,OutVal=-2042.709961,InterpMode=CIM_CurveAutoClamped),(InVal=1139.000000,OutVal=-2042.709961,InterpMode=CIM_CurveAutoClamped),(InVal=1142.000000,OutVal=-1976.088867,InterpMode=CIM_CurveAutoClamped),(InVal=1144.000000,OutVal=-1981.889648,InterpMode=CIM_CurveAutoClamped),(InVal=1146.000000,OutVal=-1888.901367,InterpMode=CIM_CurveAutoClamped),(InVal=1148.000000,OutVal=-1888.901367,InterpMode=CIM_CurveAutoClamped),(InVal=1149.500000,OutVal=-1974.506836,ArriveTangent=-51.579243,LeaveTangent=-51.579243,InterpMode=CIM_CurveAutoClamped),(InVal=1151.500000,OutVal=-2069.428711,InterpMode=CIM_CurveAutoClamped),(InVal=1152.500000,OutVal=-1982.768555,InterpMode=CIM_CurveAutoClamped),(InVal=1155.500000,OutVal=-2159.780273,InterpMode=CIM_CurveAutoClamped),(InVal=1158.500000,OutVal=-2159.780273,InterpMode=CIM_CurveAutoClamped),(InVal=1161.000000,OutVal=-2071.713867,InterpMode=CIM_CurveAutoClamped),(InVal=1166.000000,OutVal=-2071.713867,InterpMode=CIM_CurveAutoClamped),(InVal=1169.000000,OutVal=-2089.643555,InterpMode=CIM_CurveAutoClamped),(InVal=1170.000000,OutVal=-2070.307617,InterpMode=CIM_CurveAutoClamped),(InVal=1173.000000,OutVal=-2070.307617,InterpMode=CIM_CurveAutoClamped),(InVal=1176.000000,OutVal=-2158.374023,InterpMode=CIM_CurveAutoClamped),(InVal=1178.500000,OutVal=-2158.374023,InterpMode=CIM_CurveAutoClamped),(InVal=1181.000000,OutVal=-2002.631836,InterpMode=CIM_CurveAutoClamped),(InVal=1182.500000,OutVal=-2002.631836,InterpMode=CIM_CurveAutoClamped),(InVal=1184.000000,OutVal=-2158.725586,ArriveTangent=-70.563614,LeaveTangent=-70.563614,InterpMode=CIM_CurveAutoClamped),(InVal=1186.000000,OutVal=-2249.604492,InterpMode=CIM_CurveAutoClamped),(InVal=1189.000000,OutVal=-2249.604492,InterpMode=CIM_CurveAutoClamped),(InVal=1191.500000,OutVal=-2339.604492,InterpMode=CIM_CurveAutoClamped),(InVal=1198.500000,OutVal=-2339.604492,InterpMode=CIM_CurveAutoClamped),(InVal=1201.500000,OutVal=-2297.065430,ArriveTangent=13.042969,LeaveTangent=13.042969,InterpMode=CIM_CurveAutoClamped),(InVal=1203.500000,OutVal=-2274.389648,ArriveTangent=12.806920,LeaveTangent=12.806920,InterpMode=CIM_CurveAutoClamped),(InVal=1205.000000,OutVal=-2252.241211,InterpMode=CIM_CurveAutoClamped),(InVal=1208.500000,OutVal=-2252.241211,InterpMode=CIM_CurveAutoClamped),(InVal=1210.500000,OutVal=-2163.120117,InterpMode=CIM_CurveAutoClamped),(InVal=1214.000000,OutVal=-2163.120117,InterpMode=CIM_CurveAutoClamped),(InVal=1216.000000,OutVal=-2077.514648,InterpMode=CIM_CurveAutoClamped),(InVal=1219.000000,OutVal=-2077.514648,InterpMode=CIM_CurveAutoClamped),(InVal=1221.000000,OutVal=-2161.889648,InterpMode=CIM_CurveAutoClamped),(InVal=1229.000000,OutVal=-2161.889648,InterpMode=CIM_CurveAutoClamped),(InVal=1232.500000,OutVal=-2074.702148,InterpMode=CIM_CurveAutoClamped),(InVal=1239.000000,OutVal=-2074.702148,InterpMode=CIM_CurveAutoClamped),(InVal=1240.500000,OutVal=-1983.120117,InterpMode=CIM_CurveAutoClamped),(InVal=1244.000000,OutVal=-1983.120117,InterpMode=CIM_CurveAutoClamped),(InVal=1246.000000,OutVal=-2069.077148,InterpMode=CIM_CurveAutoClamped),(InVal=1249.000000,OutVal=-2069.077148,InterpMode=CIM_CurveAutoClamped),(InVal=1251.000000,OutVal=-2161.889648,InterpMode=CIM_CurveAutoClamped),(InVal=1254.500000,OutVal=-2161.889648,InterpMode=CIM_CurveAutoClamped),(InVal=1255.500000,OutVal=-2191.596680,InterpMode=CIM_CurveAutoClamped),(InVal=1259.500000,OutVal=-2191.596680,InterpMode=CIM_CurveAutoClamped),(InVal=1261.000000,OutVal=-2163.647461,InterpMode=CIM_CurveAutoClamped),(InVal=1269.000000,OutVal=-2163.647461,InterpMode=CIM_CurveAutoClamped),(InVal=1271.000000,OutVal=-2206.713867,InterpMode=CIM_CurveAutoClamped),(InVal=1273.500000,OutVal=-2206.713867,InterpMode=CIM_CurveAutoClamped),(InVal=1276.500000,OutVal=-2367.905273,InterpMode=CIM_CurveAutoClamped),(InVal=1279.000000,OutVal=-2367.905273,InterpMode=CIM_CurveAutoClamped),(InVal=1281.000000,OutVal=-2320.620117,InterpMode=CIM_CurveAutoClamped),(InVal=1282.000000,OutVal=-2320.620117,InterpMode=CIM_CurveAutoClamped),(InVal=1283.500000,OutVal=-2341.538086,InterpMode=CIM_CurveAutoClamped),(InVal=1284.000000,OutVal=-2341.538086,InterpMode=CIM_CurveAutoClamped),(InVal=1286.000000,OutVal=-2248.549805,InterpMode=CIM_CurveAutoClamped),(InVal=1289.000000,OutVal=-2248.549805,InterpMode=CIM_CurveAutoClamped),(InVal=1291.000000,OutVal=-2208.295898,InterpMode=CIM_CurveAutoClamped),(InVal=1292.000000,OutVal=-2208.295898,InterpMode=CIM_CurveAutoClamped),(InVal=1293.000000,OutVal=-2252.944336,InterpMode=CIM_CurveAutoClamped),(InVal=1294.000000,OutVal=-2252.944336,InterpMode=CIM_CurveAutoClamped),(InVal=1295.500000,OutVal=-2191.948242,ArriveTangent=53.091835,LeaveTangent=53.091835,InterpMode=CIM_CurveAutoClamped),(InVal=1298.000000,OutVal=-2029.702148,ArriveTangent=39.767517,LeaveTangent=39.767517,InterpMode=CIM_CurveAutoClamped),(InVal=1300.000000,OutVal=-1981.362305,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_5"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         MoveFrame=IMF_RelativeToInitial
         SubTracks(0)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_0'
         SubTracks(1)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_1'
         SubTracks(2)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_2'
         SubTracks(3)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_3'
         SubTracks(4)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_4'
         SubTracks(5)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2.InterpTrackMoveAxis_5'
         SubTrackGroups(0)=(GroupName="Translation",TrackIndices=(0,1,2),bIsCollapsed=True)
         SubTrackGroups(1)=(GroupName="Rotation",TrackIndices=(3,4,5),bIsCollapsed=True)
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2'
      GroupName="Camera"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=2185.342529
   InterpGroups(0)=InterpGroup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2185.342529
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9272
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9622,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-9622,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-9408,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9472
   ObjPosY=-9656
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-8880,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=-9640
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-9536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3'),(LinkedOp=SeqAct_ConsoleCommand'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-9622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9665,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9760
   ObjPosY=-9688
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=1156
   SizeY=655
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-9744
   ObjComment="Benchmark"
   DrawWidth=1156
   DrawHeight=655
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=CameraActor'KF-RIG.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5248
   ObjPosY=-9592
   ObjComment="Portal spawn: ceiling"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-9491,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9470,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-4858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=-9528
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-9592
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-9499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=-9536
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-9592
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-9499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-9536
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-9608
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-9515,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9494,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9473,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9494,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-7066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-9552
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-9131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9089,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9110,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=-7066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-9168
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-9224
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-6627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6585,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=-6664
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-9208
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-9115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=-9152
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-9208
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-9107,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9086,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9065,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9086,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-4858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=-9144
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5248
   ObjPosY=-9208
   ObjComment="Portal spawn: ceiling"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-8731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-7066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-8768
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-8824
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-8715,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8694,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8673,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8694,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=-8752
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-8808
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-7968
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=-7875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7833,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7854,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=-7912
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_32
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-7984
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_32"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-7891,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7870,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7849,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7870,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=-7066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-7928
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-8368
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=-8275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=-8312
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-8384
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=-8291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8249,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=-7066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-8328
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_41"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-6611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6569,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=-7058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-6648
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-6704
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
   InputLinks(0)=(DrawY=-6211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6169,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6190,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-7058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-6248
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_42"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-6304
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-7144
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-7051,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7030,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7009,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7030,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=-7058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-7088
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-7528
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-7435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-5594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5489,OverrideDelta=130)
   EventLinks(0)=(DrawX=-5537,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-7472
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-7544
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-7451,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7430,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7409,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7430,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=-7058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-7488
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-5912
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-5811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5769,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5790,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-7050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-5848
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-9515,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9494,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9473,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7334,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=-9584
   ObjName="TriggerVolume_2 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=-9499,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9478,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9457,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6554,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6640
   ObjPosY=-9568
   ObjName="TriggerVolume_20 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-9499,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9478,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9457,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5850,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5936
   ObjPosY=-9568
   ObjName="TriggerVolume_22 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-9491,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5106,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-9560
   ObjName="TriggerVolume_13 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-9408
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-9376
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-9384
   ObjComment="PARENT - wall high spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4888
   ObjPosY=-9376
   ObjComment="PARENT - ceiling spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4888
   ObjPosY=-8992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=-9107,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9086,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9065,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5098,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5184
   ObjPosY=-9176
   ObjName="TriggerVolume_21 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_23'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),DrawY=-6627,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6606,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6585,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-6696
   ObjName="TriggerVolume_23 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-6512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-9008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-8608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-8168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-7768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5624
   ObjPosY=-7328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_24'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=-9115,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-9184
   ObjName="TriggerVolume_24 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_25'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32')),DrawY=-8715,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8694,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8673,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-8784
   ObjName="TriggerVolume_25 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39')),DrawY=-8275,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8254,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8233,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-8344
   ObjName="TriggerVolume_27 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_26'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=-7875,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7854,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7833,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-7944
   ObjName="TriggerVolume_26 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_26
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-7435,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7414,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7393,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5838,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-7504
   ObjName="TriggerVolume_8 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_26"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-6496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-6096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-9008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-5688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-8608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-8176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-7768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-7336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-6936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-9131,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9110,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9089,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7314,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-9200
   ObjName="TriggerVolume_10 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=-8731,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8710,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8689,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7310,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-8800
   ObjName="TriggerVolume_7 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41')),DrawY=-8291,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8270,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8249,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-8360
   ObjName="TriggerVolume_16 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=-7891,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7870,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7849,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-7960
   ObjName="TriggerVolume_15 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_21
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-7315,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7294,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7273,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7290,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-7384
   ObjName="TriggerVolume_18 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_21"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_22
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_57'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=-7051,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7030,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7009,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7290,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-7120
   ObjName="TriggerVolume_57 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_22"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_52'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-6611,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6590,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6569,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7298,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-6680
   ObjName="TriggerVolume_52 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_23"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_42')),DrawY=-6211,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6190,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6169,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7314,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-6280
   ObjName="TriggerVolume_17 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_24"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_25
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),DrawY=-5811,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5790,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5769,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7294,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-5880
   ObjName="TriggerVolume_0 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_25"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_1
   InputLinks(0)=(DrawY=-9052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-4973,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-9088
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_1"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   FloatValue=5.000000
   VarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6120
   ObjPosY=-9832
   ObjComment="Disable Timer for Portal Spawners"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5000
   ObjPosY=-8976
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=452
   SizeY=206
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=-9896
   ObjComment="Portal Spawn Controls"
   DrawWidth=452
   DrawHeight=206
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-9360
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_2
   InputLinks(0)=(DrawY=-9436,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9416,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9426,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-4979,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5014
   ObjPosY=-9472
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_2"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-9376
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_3
   InputLinks(0)=(DrawY=-9452,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9432,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9442,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5723,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5758
   ObjPosY=-9488
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_3"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-8992
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_4"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_4
   InputLinks(0)=(DrawY=-9068,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9048,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9058,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5717,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-9104
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_4"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-8592
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_5"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_5
   InputLinks(0)=(DrawY=-8668,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8648,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8658,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5725,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5760
   ObjPosY=-8704
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_5"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-8160
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_6"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_6
   InputLinks(0)=(DrawY=-8236,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8216,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8226,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5717,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-8272
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_6"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-7760
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_7"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_7
   InputLinks(0)=(DrawY=-7836,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7816,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-7826,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5717,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-7872
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_7"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_20
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-7328
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_20"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_20
   InputLinks(0)=(DrawY=-7396,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7376,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-7386,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5709,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-7432
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_20"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_23
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=-9360
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_23"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_9
   InputLinks(0)=(DrawY=-9436,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9416,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9426,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-6435,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6470
   ObjPosY=-9472
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_9"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_22
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-6488
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_22"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_22
   InputLinks(0)=(DrawY=-6564,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6544,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6554,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5709,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-6600
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_22"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-9384
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_11"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_11
   InputLinks(0)=(DrawY=-9460,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9440,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9450,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7203,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7238
   ObjPosY=-9496
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_11"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_12
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-9008
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_12"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_12
   InputLinks(0)=(DrawY=-9084,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9064,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9074,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7189,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=-9120
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_12"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-8600
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_13
   InputLinks(0)=(DrawY=-8676,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8656,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8666,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7181,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-8712
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_13"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-8160
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_14"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_14
   InputLinks(0)=(DrawY=-8236,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8216,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8226,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7181,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-8272
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_14"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-7768
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_15"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_15
   InputLinks(0)=(DrawY=-7844,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7824,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-7834,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7189,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=-7880
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_15"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-7328
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_16
   InputLinks(0)=(DrawY=-7404,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7384,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-7394,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7173,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-7440
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_16"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_17
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-6912
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_17"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_17
   InputLinks(0)=(DrawY=-6988,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6968,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6978,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7173,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-7024
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_17"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_18
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-6472
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_18"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_18
   InputLinks(0)=(DrawY=-6548,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6528,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6538,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7181,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-6584
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_18"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_19
   InputLinks(0)=(DrawY=-6164,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6144,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6154,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7181,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-6200
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_19"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_19
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-6088
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_19"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_23
   InputLinks(0)=(DrawY=-5756,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5736,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5746,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-7165,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-5792
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_23"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=-5680
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=2839
   SizeY=5122
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-9976
   ObjComment="Spawner Portals"
   DrawWidth=2839
   DrawHeight=5122
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-8811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8769,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8790,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=-8546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8848
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-8667,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8646,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8625,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8646,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134'),DrawX=-8546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8704
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-8523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=-8546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-8379,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8358,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8337,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8358,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),DrawX=-8546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-8235,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8214,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8193,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8214,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-8546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8272
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=KFPlayerStart'KF-RIG.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxTriggerCount=2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2'),(LinkedOp=SeqAct_ConsoleCommand'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-8603,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8582,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-8561,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-8672
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnOFF"
   MaxWidth=187
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=-8350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9035,OverrideDelta=61)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-8416
   ObjComment="SpawnOFF"
   DrawWidth=113
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="SpawnOFF"
   InputLinks(0)=(DrawY=-8710,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),ActivateDelay=1.000000,DrawY=-8710,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9340,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-8744
   ObjComment="SpawnOFF"
   DrawWidth=248
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_2
   LinkCount=5
   IncrementAmount=0
   InputLinks(0)=(DrawY=-8594,OverrideDelta=31)
   InputLinks(1)=(DrawY=-8538,OverrideDelta=87)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-8610,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),LinkDesc="Link 2",DrawY=-8588,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),LinkDesc="Link 3",DrawY=-8566,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),LinkDesc="Link 4",DrawY=-8544,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),LinkDesc="Link 5",DrawY=-8522,OverrideDelta=103)
   VariableLinks(0)=(DrawX=-9044,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-8648
   DrawWidth=89
   DrawHeight=173
   Name="SeqAct_RandomSwitch_2"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=1830
   SizeY=829
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-8872
   ObjComment="Player Start Team Random Location"
   DrawWidth=1830
   DrawHeight=829
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_8
   InputLinks(0)=(DrawY=-6996,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6976,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6986,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-5701,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-7032
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_8"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5728
   ObjPosY=-6928
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_8"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-7035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7014,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6993,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7014,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=-5586,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5481,OverrideDelta=130)
   EventLinks(0)=(DrawX=-5529,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5624
   ObjPosY=-7072
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_27
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-7035,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7014,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6993,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5850,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5936
   ObjPosY=-7104
   ObjName="TriggerVolume_11 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_27"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5568
   ObjPosY=-6920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5464
   ObjPosY=-6920
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=596
   SizeY=308
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-7128
   ObjComment="Portal spawm: wall high"
   DrawWidth=596
   DrawHeight=308
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7032
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6936
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_28
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-9115,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6554,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6640
   ObjPosY=-9184
   ObjName="TriggerVolume_14 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_28"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-9115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=-6330,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6225,OverrideDelta=130)
   EventLinks(0)=(DrawX=-6273,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-9152
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_10
   InputLinks(0)=(DrawY=-9052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-6437,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6472
   ObjPosY=-9088
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_10"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=-8976
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_10"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6256
   ObjPosY=-8984
   ObjComment="Child spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6984
   ObjPosY=-8176
   ObjComment="Child spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-8168
   ObjComment="Child spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5440
   ObjPosY=-8168
   ObjComment="Child spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5336
   ObjPosY=-8168
   ObjComment="Child spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5528
   ObjPosY=-6512
   ObjComment="Child spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_29
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_29'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=-8699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8678,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8657,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6578,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6664
   ObjPosY=-8768
   ObjName="TriggerVolume_29 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_29"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-8576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Timer Name=SeqAct_Timer_21
   InputLinks(0)=(DrawY=-8628,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8608,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8618,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-6437,OverrideDelta=20)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6472
   ObjPosY=-8664
   DrawWidth=72
   DrawHeight=85
   Name="SeqAct_Timer_21"
   ObjectArchetype=SeqAct_Timer'Engine.Default__SeqAct_Timer'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_21
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_disable_portal_spawns"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=-8552
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_21"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-8699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8657,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8678,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76'),DrawX=-6314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-8736
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-8576
   ObjComment="Child node"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=596
   SizeY=308
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-6728
   ObjComment="Portal spawm: wall high"
   DrawWidth=596
   DrawHeight=308
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=554
   SizeY=341
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-8824
   ObjComment="Portal spawm: wall (248 UU)"
   DrawWidth=554
   DrawHeight=341
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5528
   ObjPosY=-7328
   ObjComment="Child node"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_30'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=-5427,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5406,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5385,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7322,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-5496
   ObjName="TriggerVolume_30 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-5427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-7050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-5464
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-5091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=-7050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-5128
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-5312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_30
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_28'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-5091,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5070,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5049,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7322,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-5160
   ObjName="TriggerVolume_28 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_30"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-4968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=10
   IncrementAmount=0
   InputLinks(0)=(DrawY=-7388,OverrideDelta=61)
   InputLinks(1)=(DrawY=-7272,OverrideDelta=177)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-7433,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),LinkDesc="Link 2",DrawY=-7410,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 3",DrawY=-7387,OverrideDelta=62)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),LinkDesc="Link 4",DrawY=-7364,OverrideDelta=85)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),LinkDesc="Link 5",DrawY=-7341,OverrideDelta=108)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),LinkDesc="Link 6",DrawY=-7318,OverrideDelta=131)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),LinkDesc="Link 7",DrawY=-7295,OverrideDelta=154)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),LinkDesc="Link 8",DrawY=-7272,OverrideDelta=177)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="Link 9",DrawY=-7249,OverrideDelta=200)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),LinkDesc="Link 10",DrawY=-7226,OverrideDelta=223)
   VariableLinks(0)=(DrawX=-9152,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-7472
   DrawWidth=97
   DrawHeight=293
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Lighting_1"
   InputLinks(0)=(DrawY=-7758,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7792
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_SequenceActivated Name=SeqEvent_SequenceActivated_1
   bClientSideOnly=True
   MaxWidth=283
   OutputLinks(0)=(DrawY=-7670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9643,OverrideDelta=109)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-7736
   DrawWidth=161
   DrawHeight=128
   Name="SeqEvent_SequenceActivated_1"
   ObjectArchetype=SeqEvent_SequenceActivated'Engine.Default__SeqEvent_SequenceActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6992
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_13',CurveColor=(B=0,G=192,R=143,A=255),CurveName="Door_Open0_TY")),ViewStartInput=-0.052422,ViewEndInput=0.547578,ViewStartOutput=-19.824362,ViewEndOutput=152.975800)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      GroupName="Door_Open"
      GroupColor=(B=0,G=171,R=169,A=255)
      bIsFolder=True
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_12
            LookupTrack=(Points=(,(Time=0.500000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=0.000244,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_12"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_13
            MoveAxis=AXIS_TranslationY
            LookupTrack=(Points=(,(Time=0.500000)))
            FloatTrack=(Points=((ArriveTangent=890.040710,LeaveTangent=890.040710,InterpMode=CIM_CurveUser),(InVal=0.500000,OutVal=144.000000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_13"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_14
            MoveAxis=AXIS_TranslationZ
            LookupTrack=(Points=(,(Time=0.500000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=-0.000122,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_14"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_15
            MoveAxis=AXIS_RotationX
            LookupTrack=(Points=(,(Time=0.500000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_15"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_16
            MoveAxis=AXIS_RotationY
            LookupTrack=(Points=(,(Time=0.500000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_16"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_17
            MoveAxis=AXIS_RotationZ
            LookupTrack=(Points=(,(Time=0.500000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_17"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         MoveFrame=IMF_RelativeToInitial
         SubTracks(0)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_12'
         SubTracks(1)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_13'
         SubTracks(2)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_14'
         SubTracks(3)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_15'
         SubTracks(4)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_16'
         SubTracks(5)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1.InterpTrackMoveAxis_17'
         SubTrackGroups(0)=(GroupName="Translation",TrackIndices=(0,1,2))
         SubTrackGroups(1)=(GroupName="Rotation",TrackIndices=(3,4,5))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1'
      GroupName="Door_Open0"
      GroupColor=(B=0,G=192,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=0,G=99,R=216,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=0.500000
   InterpGroups(0)=InterpGroup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0'
   InterpGroups(2)=InterpGroup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-888
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_34
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_38'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_17',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_79',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_84',InputLinkIdx=1)),DrawY=-2531,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2510,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_17')),DrawY=-2489,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4170,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-2600
   ObjName="TriggerVolume_38 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_34"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2354,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2332,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2310,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2288,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2266,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2338,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2282,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-4193,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),LinkDesc="Door_Open0",MinVars=0,DrawX=-4140,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4240
   ObjPosY=-2392
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4152
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_40
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_44'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_14',InputLinkIdx=1)),DrawY=1629,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1650,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_14')),DrawY=1671,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8392
   ObjPosY=1560
   ObjName="TriggerVolume_44 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_40"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=1798,OverrideDelta=15)
   InputLinks(1)=(DrawY=1820,OverrideDelta=37)
   InputLinks(2)=(DrawY=1842,OverrideDelta=59)
   InputLinks(3)=(DrawY=1864,OverrideDelta=81)
   InputLinks(4)=(DrawY=1886,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1814,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1870,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8329,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8276,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=1760
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_41
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_64'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_37',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_83',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_82',InputLinkIdx=1)),DrawY=-2939,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2918,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_37')),DrawY=-2897,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4194,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-3008
   ObjName="TriggerVolume_64 Touch"
   ObjComment="Room Trigger"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_41"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_42
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_41'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_18',InputLinkIdx=1)),DrawY=1090,OverrideDelta=35)
   OutputLinks(1)=(DrawY=1111,OverrideDelta=56)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_18')),DrawY=1069,OverrideDelta=14)
   VariableLinks(0)=(DrawX=-7666,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=1000
   ObjName="TriggerVolume_41 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_42"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2762,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2740,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2718,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2696,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2674,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2746,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2690,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-4193,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102'),LinkDesc="Door_Open0",MinVars=0,DrawX=-4140,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4240
   ObjPosY=-2800
   ObjComment="Door Opening Animation"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_16
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=1246,OverrideDelta=15)
   InputLinks(1)=(DrawY=1268,OverrideDelta=37)
   InputLinks(2)=(DrawY=1290,OverrideDelta=59)
   InputLinks(3)=(DrawY=1312,OverrideDelta=81)
   InputLinks(4)=(DrawY=1334,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1262,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1318,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7697,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),LinkDesc="Door_Open0",MinVars=0,DrawX=-7644,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=1208
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_16"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_46
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_48'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_20'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_30',InputLinkIdx=1)),DrawY=2461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2482,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_30')),DrawY=2503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9354,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=2392
   ObjName="TriggerVolume_48 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_46"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_47
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_49'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_21'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_29',InputLinkIdx=1)),DrawY=2461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2482,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_29')),DrawY=2503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9162,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=2392
   ObjName="TriggerVolume_49 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_47"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_48
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_55'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28',InputLinkIdx=1)),DrawY=2461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2482,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28')),DrawY=2503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8978,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=2392
   ObjName="TriggerVolume_55 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_48"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_49
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_51'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_27',InputLinkIdx=1)),DrawY=2461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2482,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_27')),DrawY=2503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8634,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=2392
   ObjName="TriggerVolume_51 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_49"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_50
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_31'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_25'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_26',InputLinkIdx=1)),DrawY=2461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2482,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_26')),DrawY=2503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8458,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=2392
   ObjName="TriggerVolume_31 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_50"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_20
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2668,OverrideDelta=37)
   InputLinks(1)=(DrawY=2690,OverrideDelta=59)
   InputLinks(2)=(DrawY=2712,OverrideDelta=81)
   InputLinks(3)=(DrawY=2734,OverrideDelta=103)
   InputLinks(4)=(DrawY=2646,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2662,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2718,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-9401,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),LinkDesc="Door_Open0",MinVars=0,DrawX=-9348,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=2608
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_20"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_21
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2668,OverrideDelta=37)
   InputLinks(1)=(DrawY=2690,OverrideDelta=59)
   InputLinks(2)=(DrawY=2712,OverrideDelta=81)
   InputLinks(3)=(DrawY=2734,OverrideDelta=103)
   InputLinks(4)=(DrawY=2646,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2662,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2718,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-9225,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),LinkDesc="Door_Open0",MinVars=0,DrawX=-9172,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9272
   ObjPosY=2608
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_21"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_22
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2676,OverrideDelta=37)
   InputLinks(1)=(DrawY=2698,OverrideDelta=59)
   InputLinks(2)=(DrawY=2720,OverrideDelta=81)
   InputLinks(3)=(DrawY=2742,OverrideDelta=103)
   InputLinks(4)=(DrawY=2654,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2670,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2726,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-9025,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8972,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9072
   ObjPosY=2616
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_22"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_23
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2668,OverrideDelta=37)
   InputLinks(1)=(DrawY=2690,OverrideDelta=59)
   InputLinks(2)=(DrawY=2712,OverrideDelta=81)
   InputLinks(3)=(DrawY=2734,OverrideDelta=103)
   InputLinks(4)=(DrawY=2646,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2662,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2718,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8673,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8620,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=2608
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_23"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_25
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2668,OverrideDelta=37)
   InputLinks(1)=(DrawY=2690,OverrideDelta=59)
   InputLinks(2)=(DrawY=2712,OverrideDelta=81)
   InputLinks(3)=(DrawY=2734,OverrideDelta=103)
   InputLinks(4)=(DrawY=2646,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2662,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2718,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8497,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8444,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=2608
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_25"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8448
   ObjPosY=2856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8344
   ObjPosY=2856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=2848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=2848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9008
   ObjPosY=2832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=2824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=2832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=1968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-2624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7664
   ObjPosY=1408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_51
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_47'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_26'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_22',InputLinkIdx=1)),DrawY=1677,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1698,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_22')),DrawY=1719,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7722,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7808
   ObjPosY=1608
   ObjName="TriggerVolume_47 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_51"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_26
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=1860,OverrideDelta=37)
   InputLinks(1)=(DrawY=1882,OverrideDelta=59)
   InputLinks(2)=(DrawY=1904,OverrideDelta=81)
   InputLinks(3)=(DrawY=1926,OverrideDelta=103)
   InputLinks(4)=(DrawY=1838,OverrideDelta=15)
   OutputLinks(0)=(DrawY=1854,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1910,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7761,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106'),LinkDesc="Door_Open0",MinVars=0,DrawX=-7708,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7808
   ObjPosY=1800
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_26"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7720
   ObjPosY=2032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_35
   SizeX=6360
   SizeY=6218
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9600
   ObjPosY=-3088
   ObjComment="Doors - Automatic Opening for Zeds"
   DrawWidth=6360
   DrawHeight=6218
   Name="SequenceFrame_35"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_52
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(DrawY=-8675,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8633,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5114,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5200
   ObjPosY=-8744
   ObjName="TriggerVolume_12 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_52"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-8707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8665,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=-4858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=-8744
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-8560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7368
   ObjPosY=2792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7272
   ObjPosY=2792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_24
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2636,OverrideDelta=37)
   InputLinks(1)=(DrawY=2658,OverrideDelta=59)
   InputLinks(2)=(DrawY=2680,OverrideDelta=81)
   InputLinks(3)=(DrawY=2702,OverrideDelta=103)
   InputLinks(4)=(DrawY=2614,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2630,OverrideDelta=31)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24',InputLinkIdx=2)),DrawY=2686,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7369,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),LinkDesc="Door_Open0",MinVars=0,DrawX=-7316,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=2576
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_24"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_53
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_45'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_25',InputLinkIdx=1)),DrawY=2461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2482,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_25')),DrawY=2503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7346,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7432
   ObjPosY=2392
   ObjName="TriggerVolume_45 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_53"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_54
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33')),DrawY=-5707,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5686,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5665,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5674,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5760
   ObjPosY=-5776
   ObjName="TriggerVolume_27 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_54"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=-5707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5665,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-5514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-5744
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-5592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5456
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5352
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5256
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5152
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-5512
   ObjComment="Child Spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_55
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_56'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34')),DrawY=-6179,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6158,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6137,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-6248
   ObjName="TriggerVolume_56 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_55"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=984
   SizeY=448
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5912
   ObjPosY=-5832
   ObjComment="Under Heliport Gate Portal Spawns"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-6179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),DrawX=-5658,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5607,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5558,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5696
   ObjPosY=-6216
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5688
   ObjPosY=-6048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_56
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_53'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=-6179,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6158,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6137,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5392
   ObjPosY=-6248
   ObjName="TriggerVolume_53 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_56"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-6179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159'),DrawX=-5154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-6216
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5184
   ObjPosY=-6040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5088
   ObjPosY=-6040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_57
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38')),DrawY=-8283,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8262,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8241,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6562,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-8352
   ObjName="TriggerVolume_19 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_57"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=-8283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8241,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8262,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-8320
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6400
   ObjPosY=-8152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=-8152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_58
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_52'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=-7995,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7974,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7953,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6562,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-8064
   ObjName="TriggerVolume_52 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_58"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6328
   ObjPosY=-7848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=-7848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=-7995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),DrawX=-6338,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6287,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6238,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6376
   ObjPosY=-8032
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7016
   ObjPosY=-5656
   ObjComment="Child Nodes"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-5656
   ObjComment="Child Nodes"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5280
   ObjPosY=-5944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-5944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5080
   ObjPosY=-5944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6992
   ObjPosY=-6088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6688
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_27
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2060,OverrideDelta=37)
   InputLinks(1)=(DrawY=2082,OverrideDelta=59)
   InputLinks(2)=(DrawY=2104,OverrideDelta=81)
   InputLinks(3)=(DrawY=2126,OverrideDelta=103)
   InputLinks(4)=(DrawY=2038,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2054,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2110,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-6721,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),LinkDesc="Door_Open0",MinVars=0,DrawX=-6668,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=2000
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_27"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6680
   ObjPosY=2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_18
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=2628,OverrideDelta=37)
   InputLinks(1)=(DrawY=2650,OverrideDelta=59)
   InputLinks(2)=(DrawY=2672,OverrideDelta=81)
   InputLinks(3)=(DrawY=2694,OverrideDelta=103)
   InputLinks(4)=(DrawY=2606,OverrideDelta=15)
   OutputLinks(0)=(DrawY=2622,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2678,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-6713,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),LinkDesc="Door_Open0",MinVars=0,DrawX=-6660,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=2568
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_18"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_59
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_33'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_27'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_23',InputLinkIdx=1)),DrawY=1853,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1874,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_23')),DrawY=1895,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6690,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=1784
   ObjName="TriggerVolume_33 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_59"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_60
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_59'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24',InputLinkIdx=1)),DrawY=2445,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2466,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=2487,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6682,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=2376
   ObjName="TriggerVolume_59 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_60"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_29
   bLooping=True
   InputLinks(0)=(DrawY=-9674,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9652,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9630,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9608,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9586,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9658,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9602,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=-8185,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),LinkDesc="Waves_Ship_Movement",MinVars=0,DrawX=-8101,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-9712
   DrawWidth=183
   DrawHeight=173
   Name="SeqAct_Interp_29"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_11',CurveColor=(B=221,G=84,R=0,A=255),CurveName="Waves_Ship_Movement_RZ")),ViewStartInput=-3.000000,ViewEndInput=33.000000,ViewStartOutput=-5.671692,ViewEndOutput=6.490173)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_10
            MoveAxis=AXIS_RotationY
            LookupTrack=(Points=(,(Time=7.500000),(Time=15.000000),(Time=22.500000),(Time=30.000000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=-5.537109,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-0.049438,InterpMode=CIM_CurveAutoClamped),(InVal=22.500000,OutVal=-5.614014,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=-0.219727,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_10"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_11
            MoveAxis=AXIS_RotationZ
            LookupTrack=(Points=(,(Time=2.500000),(Time=5.000000),(Time=7.500000),(Time=10.000000),(Time=12.500000),(Time=15.000000),(Time=17.500000),(Time=20.000000),(Time=22.500000),(Time=25.000000),(Time=27.500000),(Time=30.000000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=0.192261,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=0.192261,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped),(InVal=12.500000,OutVal=0.192261,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped),(InVal=17.500000,OutVal=0.192261,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,InterpMode=CIM_CurveAutoClamped),(InVal=22.500000,OutVal=0.192261,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=0.192261,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=-0.093384,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_11"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_6
            LookupTrack=(Points=(,(Time=15.000000),(Time=30.000000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-1275.147461,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_6"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_7
            MoveAxis=AXIS_TranslationY
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_7"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_8
            MoveAxis=AXIS_TranslationZ
            LookupTrack=(Points=(,(Time=2.500000),(Time=5.000000),(Time=7.500000),(Time=10.000000),(Time=12.500000),(Time=15.000000),(Time=17.500000),(Time=20.000000),(Time=22.500000),(Time=25.000000),(Time=27.500000),(Time=30.000000)))
            FloatTrack=(Points=((ArriveTangent=-0.004393,LeaveTangent=-0.004393,InterpMode=CIM_CurveUser),(InVal=2.500000,OutVal=236.034119,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,ArriveTangent=-0.004286,LeaveTangent=-0.004286,InterpMode=CIM_CurveUser),(InVal=7.500000,OutVal=236.034119,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=-0.000092,ArriveTangent=-0.004286,LeaveTangent=-0.004286,InterpMode=CIM_CurveUser),(InVal=12.500000,OutVal=236.034119,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,ArriveTangent=-0.004286,LeaveTangent=-0.004286,InterpMode=CIM_CurveUser),(InVal=17.500000,OutVal=236.033752,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,ArriveTangent=-0.004286,LeaveTangent=-0.004286,InterpMode=CIM_CurveUser),(InVal=22.500000,OutVal=236.033752,InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,ArriveTangent=-0.004286,LeaveTangent=-0.004286,InterpMode=CIM_CurveUser),(InVal=27.500000,OutVal=236.033630,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,ArriveTangent=-0.004286,LeaveTangent=-0.004286,InterpMode=CIM_CurveUser)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_8"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_9
            MoveAxis=AXIS_RotationX
            LookupTrack=(Points=(,(Time=15.000000),(Time=30.000000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-5.646973,InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=-0.071411,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_9"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         MoveFrame=IMF_RelativeToInitial
         SubTracks(0)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_6'
         SubTracks(1)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_7'
         SubTracks(2)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_8'
         SubTracks(3)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_9'
         SubTracks(4)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_10'
         SubTracks(5)=InterpTrackMoveAxis'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0.InterpTrackMoveAxis_11'
         SubTrackGroups(0)=(GroupName="Translation",TrackIndices=(0,1,2))
         SubTrackGroups(1)=(GroupName="Rotation",TrackIndices=(3,4,5))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0'
      GroupName="Waves_Ship_Movement"
      GroupColor=(B=221,G=84,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=30.000000
   InterpGroups(0)=InterpGroup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=30.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=-9472
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-9504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_29')),DrawY=-9523,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9502,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9481,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-9592
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=604
   SizeY=364
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=-9744
   ObjComment="Ship Animation"
   DrawWidth=604
   DrawHeight=364
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=1283
   SizeY=844
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-7816
   ObjComment="Lightning"
   DrawWidth=1283
   DrawHeight=844
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5696
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=KFSpawner'KF-RIG.TheWorld:PersistentLevel.KFSpawner_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5496
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Lighting_2"
   InputLinks(0)=(DrawY=-7670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7704
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="Lighting_3"
   InputLinks(0)=(DrawY=-7590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7624
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="Lighting_4"
   InputLinks(0)=(DrawY=-7510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7544
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="Lighting_5"
   InputLinks(0)=(DrawY=-7430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7464
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="Lighting_6"
   InputLinks(0)=(DrawY=-7350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7384
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
   EventName="Lighting_7"
   InputLinks(0)=(DrawY=-7270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7304
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_8"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="Lighting_8"
   InputLinks(0)=(DrawY=-7190,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7190,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7224
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="Lighting_9"
   InputLinks(0)=(DrawY=-7110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7144
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="Lighting_10"
   InputLinks(0)=(DrawY=-7030,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7030,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8746,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-7064
   ObjComment="Lighting_1"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_14
   Duration=2.000000
   InputLinks(0)=(DrawY=1621,OverrideDelta=14)
   InputLinks(1)=(DrawY=1642,OverrideDelta=35)
   InputLinks(2)=(DrawY=1663,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=1)),DrawY=1626,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1658,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_29'),DrawX=-8092,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8144
   ObjPosY=1584
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_14"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_17
   Duration=2.000000
   InputLinks(0)=(DrawY=-2419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2377,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_79')),DrawY=-2414,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2382,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=-3940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=-2456
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_17"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_18
   Duration=2.000000
   InputLinks(0)=(DrawY=1077,OverrideDelta=14)
   InputLinks(1)=(DrawY=1098,OverrideDelta=35)
   InputLinks(2)=(DrawY=1119,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16',InputLinkIdx=1)),DrawY=1082,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1114,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=-7868,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=1040
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_18"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_37
   Duration=2.000000
   InputLinks(0)=(DrawY=-2875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2833,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_83')),DrawY=-2870,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2838,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34'),DrawX=-3932,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-2912
   ObjComment="Room Trigger Delay Action"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_37"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_22
   Duration=2.000000
   InputLinks(0)=(DrawY=1677,OverrideDelta=14)
   InputLinks(1)=(DrawY=1698,OverrideDelta=35)
   InputLinks(2)=(DrawY=1719,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_26',InputLinkIdx=1)),DrawY=1682,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1714,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_37'),DrawX=-7532,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=1640
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_22"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_23
   Duration=2.000000
   InputLinks(0)=(DrawY=1845,OverrideDelta=14)
   InputLinks(1)=(DrawY=1866,OverrideDelta=35)
   InputLinks(2)=(DrawY=1887,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_27',InputLinkIdx=1)),DrawY=1850,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1882,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_38'),DrawX=-6876,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6928
   ObjPosY=1808
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_23"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_24
   Duration=2.000000
   InputLinks(0)=(DrawY=2429,OverrideDelta=14)
   InputLinks(1)=(DrawY=2450,OverrideDelta=35)
   InputLinks(2)=(DrawY=2471,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=1)),DrawY=2434,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2466,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_39'),DrawX=-6844,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=2392
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_24"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_25
   Duration=2.000000
   InputLinks(0)=(DrawY=2453,OverrideDelta=14)
   InputLinks(1)=(DrawY=2474,OverrideDelta=35)
   InputLinks(2)=(DrawY=2495,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24',InputLinkIdx=1)),DrawY=2458,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2490,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_40'),DrawX=-7148,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=2416
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_25"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_26
   Duration=2.000000
   InputLinks(0)=(DrawY=2285,OverrideDelta=14)
   InputLinks(1)=(DrawY=2306,OverrideDelta=35)
   InputLinks(2)=(DrawY=2327,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_25',InputLinkIdx=1)),DrawY=2290,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2322,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_41'),DrawX=-8428,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=2248
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_26"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_27
   Duration=2.000000
   InputLinks(0)=(DrawY=2285,OverrideDelta=14)
   InputLinks(1)=(DrawY=2306,OverrideDelta=35)
   InputLinks(2)=(DrawY=2327,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23',InputLinkIdx=1)),DrawY=2290,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2322,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_42'),DrawX=-8620,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=2248
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_27"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_28
   Duration=2.000000
   InputLinks(0)=(DrawY=2277,OverrideDelta=14)
   InputLinks(1)=(DrawY=2298,OverrideDelta=35)
   InputLinks(2)=(DrawY=2319,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22',InputLinkIdx=1)),DrawY=2282,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2314,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_42'),DrawX=-8964,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9016
   ObjPosY=2240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_28"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_29
   Duration=2.000000
   InputLinks(0)=(DrawY=2285,OverrideDelta=14)
   InputLinks(1)=(DrawY=2306,OverrideDelta=35)
   InputLinks(2)=(DrawY=2327,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_21',InputLinkIdx=1)),DrawY=2290,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2322,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=-9148,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=2248
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_29"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_30
   Duration=2.000000
   InputLinks(0)=(DrawY=2285,OverrideDelta=14)
   InputLinks(1)=(DrawY=2306,OverrideDelta=35)
   InputLinks(2)=(DrawY=2327,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_20',InputLinkIdx=1)),DrawY=2290,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2322,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=-9340,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=2248
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_30"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_1
   FloatValue=1.500000
   VarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=1728
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_29"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_31
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=1192
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_31"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_33
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3968
   ObjPosY=-2304
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-2768
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=1800
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_37"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=1960
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_38"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_39
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6880
   ObjPosY=2544
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_39"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=2552
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_40"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=2392
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_41"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_42
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=2392
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_42"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9520
   ObjPosY=2384
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_43"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_61
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_61'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_32',InputLinkIdx=1)),DrawY=3469,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3490,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_32')),DrawY=3511,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9530,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9616
   ObjPosY=3400
   ObjName="TriggerVolume_61 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_61"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=DynamicBlockingVolume'KF-RIG.TheWorld:PersistentLevel.DynamicBlockingVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=3552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
   InputLinks(0)=(DrawY=3445,OverrideDelta=14)
   InputLinks(1)=(DrawY=3466,OverrideDelta=35)
   InputLinks(2)=(DrawY=3487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169'),DrawX=-9058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=3408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_44"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_32
   Duration=2.000000
   InputLinks(0)=(DrawY=3525,OverrideDelta=14)
   InputLinks(1)=(DrawY=3546,OverrideDelta=35)
   InputLinks(2)=(DrawY=3567,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44')),DrawY=3530,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3562,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=3488
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_32"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_62
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_50'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40',InputLinkIdx=1)),DrawY=3685,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3706,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=3727,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9530,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9616
   ObjPosY=3616
   ObjName="TriggerVolume_50 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_62"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=2.000000
   InputLinks(0)=(DrawY=3725,OverrideDelta=14)
   InputLinks(1)=(DrawY=3746,OverrideDelta=35)
   InputLinks(2)=(DrawY=3767,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40')),DrawY=3730,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3762,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=3688
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=DynamicBlockingVolume'KF-RIG.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=3792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=3685,OverrideDelta=14)
   InputLinks(1)=(DrawY=3706,OverrideDelta=35)
   InputLinks(2)=(DrawY=3727,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3706,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),DrawX=-9058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=3648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=753
   SizeY=516
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9640
   ObjPosY=3376
   ObjComment="Rig B North Platform Dynamic Blocking Volumes for Zed Rooms."
   DrawWidth=753
   DrawHeight=516
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_63
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_62'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_34',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46',InputLinkIdx=1)),DrawY=3453,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3474,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_34')),DrawY=3495,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8682,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=3384
   ObjName="TriggerVolume_62 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_63"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_34
   Duration=2.000000
   InputLinks(0)=(DrawY=3501,OverrideDelta=14)
   InputLinks(1)=(DrawY=3522,OverrideDelta=35)
   InputLinks(2)=(DrawY=3543,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46')),DrawY=3506,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3538,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8484,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=3464
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_34"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=3437,OverrideDelta=14)
   InputLinks(1)=(DrawY=3458,OverrideDelta=35)
   InputLinks(2)=(DrawY=3479,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3458,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171'),DrawX=-8282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=3400
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=DynamicBlockingVolume'KF-RIG.TheWorld:PersistentLevel.DynamicBlockingVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=3536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_28
   SizeX=681
   SizeY=276
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=3360
   ObjComment="Main Control Room Zed Room Dynamic Blocking Volume"
   DrawWidth=681
   DrawHeight=276
   Name="SequenceFrame_28"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=DynamicBlockingVolume'KF-RIG.TheWorld:PersistentLevel.DynamicBlockingVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=3792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=3685,OverrideDelta=14)
   InputLinks(1)=(DrawY=3706,OverrideDelta=35)
   InputLinks(2)=(DrawY=3727,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3706,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),DrawX=-8282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=3648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_31
   Duration=2.000000
   InputLinks(0)=(DrawY=3781,OverrideDelta=14)
   InputLinks(1)=(DrawY=3802,OverrideDelta=35)
   InputLinks(2)=(DrawY=3823,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43')),DrawY=3786,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3818,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8476,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8528
   ObjPosY=3744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_31"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_64
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_63'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31',InputLinkIdx=1)),DrawY=3725,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3746,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31')),DrawY=3767,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8682,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=3656
   ObjName="TriggerVolume_63 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_64"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_29
   SizeX=681
   SizeY=268
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=3616
   ObjComment="Rig B Top - Container Spawn Point A Dynamic Volume"
   DrawWidth=681
   DrawHeight=268
   Name="SequenceFrame_29"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=DynamicBlockingVolume'KF-RIG.TheWorld:PersistentLevel.DynamicBlockingVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=3560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
   InputLinks(0)=(DrawY=3445,OverrideDelta=14)
   InputLinks(1)=(DrawY=3466,OverrideDelta=35)
   InputLinks(2)=(DrawY=3487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168'),DrawX=-7602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7640
   ObjPosY=3408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_45"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_33
   Duration=2.000000
   InputLinks(0)=(DrawY=3501,OverrideDelta=14)
   InputLinks(1)=(DrawY=3522,OverrideDelta=35)
   InputLinks(2)=(DrawY=3543,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45')),DrawY=3506,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3538,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7804,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7856
   ObjPosY=3464
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_33"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_65
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_60'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_33',InputLinkIdx=1)),DrawY=3453,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3474,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_33')),DrawY=3495,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7978,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=3384
   ObjName="TriggerVolume_60 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_65"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_31
   SizeX=657
   SizeY=300
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8088
   ObjPosY=3368
   ObjComment="Rig B Top - Container Spawn Point B Dynamic Volume"
   DrawWidth=657
   DrawHeight=300
   Name="SequenceFrame_31"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=1860
   SizeY=884
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9688
   ObjPosY=-6104
   ObjComment="Ambient Sounds & Ambient Animations"
   DrawWidth=1860
   DrawHeight=884
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-5494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-5528
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_BioticsLab.WwiseDefaultBank_WW_ENV_BioticsLab'
   InputLinks(0)=(DrawY=-5596,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5576,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5586,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=-5632
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_1
   Bank=AkBank'WW_ENV_Rig.WwiseDefaultBank_WW_ENV_Rig'
   InputLinks(0)=(DrawY=-5692,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5672,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1')),DrawY=-5682,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=-5728
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_1"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_1
   InputLinks(0)=(DrawY=-5819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5797,OverrideDelta=36)
   InputLinks(2)=(DrawY=-5775,OverrideDelta=58)
   InputLinks(3)=(DrawY=-5753,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-5786,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-8963,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-5856
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_1"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_1'),(LinkedOp=SeqAct_AkLoadBank'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0'),(LinkedOp=SeqAct_AkStartAmbientSound'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-5763,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5742,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5721,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9568
   ObjPosY=-5832
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=AkAmbientSound'KF-RIG.TheWorld:PersistentLevel.AkAmbientSound_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-5992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=4565
   SizeY=1024
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9640
   ObjPosY=-4496
   ObjComment="Lab Decontamination Room Sprinklers"
   DrawWidth=4565
   DrawHeight=1024
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5616
   ObjPosY=-3808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-3808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5800
   ObjPosY=-3800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=-3883,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3862,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3841,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6446,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6528
   ObjPosY=-3952
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-3915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3873,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=-3894,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),DrawX=-5738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5776
   ObjPosY=-3952
   bDrawLast=True
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=-3874,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-3884,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_7')),DrawY=-3864,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=-6195,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6145,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-3920
   bDrawLast=True
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6000
   ObjPosY=-3712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_7
   InputLinks(0)=(DrawY=-3878,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=2)),DrawY=-3878,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_10'),DrawX=-5990,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=-5934,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=-3912
   bDrawLast=True
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_7"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=-3832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_10"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=3.000000
   InputLinks(0)=(DrawY=-3907,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3886,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3865,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=-3902,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3870,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5452,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5504
   ObjPosY=-3944
   bDrawLast=True
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=-3918,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3918,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_9'),DrawX=-5262,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=-5206,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5296
   ObjPosY=-3952
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5296
   ObjPosY=-3872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-3766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3766,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-5448,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5496
   ObjPosY=-3800
   ObjComment="playsound"
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5664
   ObjPosY=-4264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-4264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5848
   ObjPosY=-4264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_5')),DrawY=-4371,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4350,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4329,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6438,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-4440
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-4254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-5440,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5488
   ObjPosY=-4288
   ObjComment="playsound"
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5288
   ObjPosY=-4360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_17"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_11
   InputLinks(0)=(DrawY=-4406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4406,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_17'),DrawX=-5254,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=-5198,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5288
   ObjPosY=-4440
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_11"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   Duration=3.000000
   InputLinks(0)=(DrawY=-4395,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4374,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4353,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_11')),DrawY=-4390,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4358,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5496
   ObjPosY=-4432
   bDrawLast=True
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_16
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=-4320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_16"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_10
   InputLinks(0)=(DrawY=-4366,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7',InputLinkIdx=2)),DrawY=-4366,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_16'),DrawX=-5998,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=-5942,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=-4400
   bDrawLast=True
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_10"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjPosY=-4200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_15"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
   InputLinks(0)=(DrawY=-4362,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-4372,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_10')),DrawY=-4352,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=-6203,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6153,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-4408
   bDrawLast=True
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_5"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-4403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4361,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-4382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=-5746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5784
   ObjPosY=-4440
   bDrawLast=True
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7256
   ObjPosY=-3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-3787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7974,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8056
   ObjPosY=-3856
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-3646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-6992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7040
   ObjPosY=-3680
   ObjComment="playsound"
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-3776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=-3822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=-6806,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=-6750,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-3856
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=3.000000
   InputLinks(0)=(DrawY=-3811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3769,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=-3806,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3774,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6996,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7048
   ObjPosY=-3848
   bDrawLast=True
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-3736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=-3782,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=2)),DrawY=-3782,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=-7558,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=-7502,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-3816
   bDrawLast=True
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-3616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-3778,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-3788,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=-3768,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=-7763,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7713,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7792
   ObjPosY=-3824
   bDrawLast=True
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-3819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3777,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-3798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-7306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7344
   ObjPosY=-3856
   bDrawLast=True
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=-4395,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4374,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4353,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7934,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8016
   ObjPosY=-4464
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7248
   ObjPosY=-4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7344
   ObjPosY=-4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-4411,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4369,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=-4390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),DrawX=-7274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7312
   ObjPosY=-4448
   bDrawLast=True
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=-4370,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-4380,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_9')),DrawY=-4360,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=-7731,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7681,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-4416
   bDrawLast=True
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=-4208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_14"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_9
   InputLinks(0)=(DrawY=-4374,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=2)),DrawY=-4374,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_13'),DrawX=-7526,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=-7470,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-4408
   bDrawLast=True
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_9"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-4328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_13"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=3.000000
   InputLinks(0)=(DrawY=-4403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4361,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=-4398,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4366,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6964,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7016
   ObjPosY=-4440
   bDrawLast=True
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_8
   InputLinks(0)=(DrawY=-4414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_12'),DrawX=-6774,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=-6718,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-4448
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_8"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_12
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-4368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_12"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-4238,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4238,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-6960,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7008
   ObjPosY=-4272
   ObjComment="playsound"
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-3728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=-3728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-3728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-3702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-8504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-3736
   ObjComment="playsound"
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-3824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=-3870,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3870,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=-8318,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=-8262,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-3904
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=3.000000
   InputLinks(0)=(DrawY=-3859,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3838,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3817,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=-3854,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3822,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8508,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8560
   ObjPosY=-3896
   bDrawLast=True
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_7
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-3784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_7"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_4
   InputLinks(0)=(DrawY=-3830,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9',InputLinkIdx=2)),DrawY=-3830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_7'),DrawX=-9070,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=-9014,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-3864
   bDrawLast=True
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_4"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-3664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=-3826,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-3836,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4')),DrawY=-3816,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=-9275,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9225,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-3872
   bDrawLast=True
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-3867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3825,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=-3846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-8818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-3904
   bDrawLast=True
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=-3827,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3806,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3785,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9534,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9616
   ObjPosY=-3896
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-4427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4385,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1'),(LinkedOp=SeqAct_AkPostEvent'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-4406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-8818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-4464
   bDrawLast=True
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-4386,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-4396,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_3')),DrawY=-4376,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=-9275,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9225,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-4432
   bDrawLast=True
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-4224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_5"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_3
   InputLinks(0)=(DrawY=-4390,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8',InputLinkIdx=2)),DrawY=-4390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=-9070,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=-9014,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-4424
   bDrawLast=True
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_3"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-4344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=3.000000
   InputLinks(0)=(DrawY=-4419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4377,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2')),DrawY=-4414,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4382,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8508,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8560
   ObjPosY=-4456
   bDrawLast=True
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=-4430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=-8318,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=-8262,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-4464
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-4384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=-4270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-8504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-4304
   ObjComment="playsound"
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=Emitter'KF-RIG.TheWorld:PersistentLevel.Emitter_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8912
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-4387,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4366,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4345,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9534,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9616
   ObjPosY=-4456
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-8272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="disableallscreenmessages"
   InputLinks(0)=(DrawY=-8358,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-9424,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-8392
   ObjComment="Disable All Screen Messages"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=249
   SizeY=304
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-8448
   ObjComment="Disable All Screen Messages"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_42
   bLooping=True
   InputLinks(0)=(DrawY=-2786,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2764,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2742,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2720,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2698,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2770,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2714,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-3427,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),LinkDesc="Trigger",MinVars=0,DrawX=-3372,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3472
   ObjPosY=-2824
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_42"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      GroupName="Trigger_Scan"
      GroupColor=(B=0,G=172,R=167,A=255)
      bIsFolder=True
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-80.000000,Y=0.000244,Z=-0.000244)),(InVal=1.000000,OutVal=(X=480.000000,Y=0.000366,Z=-0.000366))))
         EulerTrack=(Points=(,(InVal=1.000000)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackMove_0'
      GroupName="Trigger"
      GroupColor=(B=228,G=58,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=31,G=0,R=231,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroupDirector'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(2)=InterpGroup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-1080
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3360
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_66
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_1'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_82'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_80',InputLinkIdx=1)),DrawY=-2947,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2926,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2905,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3698,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=-3016
   ObjName="DynamicTriggerVolume_1 Touch"
   ObjComment="Scan Trigger"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_66"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_83
   Duration=10.000000
   InputLinks(0)=(DrawY=-2771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2729,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_80')),DrawY=-2766,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2734,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3748,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3800
   ObjPosY=-2808
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_83"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_82
   Duration=10.000000
   InputLinks(0)=(DrawY=-2947,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2926,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2905,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=1)),DrawY=-2942,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=2)),DrawY=-2910,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3404,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3456
   ObjPosY=-2984
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_82"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_80
   Duration=30.000000
   InputLinks(0)=(DrawY=-2763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=2)),DrawY=-2758,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42',InputLinkIdx=2)),DrawY=-2726,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3580,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3632
   ObjPosY=-2800
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_80"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3384
   ObjPosY=-2200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_67
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_2'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_84'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_81',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2507,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2486,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2465,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3706,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=-2576
   ObjName="DynamicTriggerVolume_2 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_67"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_40
   bLooping=True
   InputLinks(0)=(DrawY=-2362,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2340,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2318,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2296,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2274,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2346,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2290,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-3427,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),LinkDesc="Trigger",MinVars=0,DrawX=-3372,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3472
   ObjPosY=-2400
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_40"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_81
   Duration=30.000000
   InputLinks(0)=(DrawY=-2331,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2310,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2289,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=2)),DrawY=-2326,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=2)),DrawY=-2294,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3620,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-2368
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_81"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_84
   Duration=10.000000
   InputLinks(0)=(DrawY=-2515,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2494,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2473,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=1)),DrawY=-2510,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40',InputLinkIdx=2)),DrawY=-2478,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3404,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3456
   ObjPosY=-2552
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_84"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_79
   Duration=10.000000
   InputLinks(0)=(DrawY=-2339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2297,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_81')),DrawY=-2334,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2302,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3780,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3832
   ObjPosY=-2376
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_79"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=TargetPoint'KF-RIG.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5456
   ObjPosY=-4168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=TargetPoint'KF-RIG.TheWorld:PersistentLevel.TargetPoint_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-3672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=TargetPoint'KF-RIG.TheWorld:PersistentLevel.TargetPoint_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-4192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=TargetPoint'KF-RIG.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-3632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=TargetPoint'KF-RIG.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6984
   ObjPosY=-4168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=TargetPoint'KF-RIG.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7024
   ObjPosY=-3576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=TWSeqEvent_LightFlicker Name=TWSeqEvent_LightFlicker_0
   Originator=DominantDirectionalLight'KF-RIG.TheWorld:PersistentLevel.DominantDirectionalLight_1'
   MaxWidth=383
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-7502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9601,OverrideDelta=159)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-7568
   ObjName="DominantDirectionalLight_1 Light Flicker"
   DrawWidth=211
   DrawHeight=128
   Name="TWSeqEvent_LightFlicker_0"
   ObjectArchetype=TWSeqEvent_LightFlicker'Engine.Default__TWSeqEvent_LightFlicker'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-1776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_78
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_9'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_63'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_62',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=-2147,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2126,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2105,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7338,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7448
   ObjPosY=-2216
   ObjName="DynamicTriggerVolume_9 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_78"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7048
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_77
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_10'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=228
   OutputLinks(0)=(DrawY=-2641,OverrideDelta=56)
   OutputLinks(1)=(DrawY=-2662,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_60'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_61',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-2683,OverrideDelta=14)
   VariableLinks(0)=(DrawX=-7302,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=-2752
   ObjName="DynamicTriggerVolume_10 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_77"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8000
   ObjPosY=-2344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_76
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_7'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_54'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_53',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=-2707,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2686,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2665,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8274,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-2776
   ObjName="DynamicTriggerVolume_7 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_76"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8048
   ObjPosY=-1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_75
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_13'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_69'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_68',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=-2203,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2182,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2161,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8270,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-2272
   ObjName="DynamicTriggerVolume_13 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_75"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8024
   ObjPosY=-1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_74
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_12'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_72'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_73',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1667,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1646,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1625,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8270,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-1736
   ObjName="DynamicTriggerVolume_12 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_74"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7072
   ObjPosY=48
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_73
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_14'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=228
   OutputLinks(0)=(DrawY=-278,OverrideDelta=35)
   OutputLinks(1)=(DrawY=-257,OverrideDelta=56)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_75'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_74',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-299,OverrideDelta=14)
   VariableLinks(0)=(DrawX=-7326,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=-368
   ObjName="DynamicTriggerVolume_14 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_73"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=72
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_72
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_5'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_66'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_65',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19')),DrawY=-323,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-302,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-281,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8322,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8432
   ObjPosY=-392
   ObjName="DynamicTriggerVolume_5 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_72"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_65
   Duration=30.000000
   InputLinks(0)=(DrawY=-107,OverrideDelta=14)
   InputLinks(1)=(DrawY=-86,OverrideDelta=35)
   InputLinks(2)=(DrawY=-65,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36',InputLinkIdx=2)),DrawY=-102,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36',InputLinkIdx=2)),DrawY=-70,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8268,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-144
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_65"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_66
   Duration=10.000000
   InputLinks(0)=(DrawY=-291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-249,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=1)),DrawY=-286,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36',InputLinkIdx=2)),DrawY=-254,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8092,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8144
   ObjPosY=-328
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_66"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_67
   Duration=10.000000
   InputLinks(0)=(DrawY=-115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-94,OverrideDelta=35)
   InputLinks(2)=(DrawY=-73,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_65')),DrawY=-110,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-78,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8436,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8488
   ObjPosY=-152
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_67"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_36
   bLooping=True
   InputLinks(0)=(DrawY=-130,OverrideDelta=15)
   InputLinks(1)=(DrawY=-108,OverrideDelta=37)
   InputLinks(2)=(DrawY=-86,OverrideDelta=59)
   InputLinks(3)=(DrawY=-64,OverrideDelta=81)
   InputLinks(4)=(DrawY=-42,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-114,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-58,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-8115,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),LinkDesc="Trigger",MinVars=0,DrawX=-8060,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-168
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_36"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_39
   bLooping=True
   InputLinks(0)=(DrawY=-122,OverrideDelta=15)
   InputLinks(1)=(DrawY=-100,OverrideDelta=37)
   InputLinks(2)=(DrawY=-78,OverrideDelta=59)
   InputLinks(3)=(DrawY=-56,OverrideDelta=81)
   InputLinks(4)=(DrawY=-34,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-106,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-50,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-7131,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),LinkDesc="Trigger",MinVars=0,DrawX=-7076,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7176
   ObjPosY=-160
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_39"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_76
   Duration=10.000000
   InputLinks(0)=(DrawY=-107,OverrideDelta=14)
   InputLinks(1)=(DrawY=-86,OverrideDelta=35)
   InputLinks(2)=(DrawY=-65,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_74')),DrawY=-102,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-70,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7452,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-144
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_76"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_75
   Duration=10.000000
   InputLinks(0)=(DrawY=-283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-241,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=1)),DrawY=-278,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39',InputLinkIdx=2)),DrawY=-246,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7108,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7160
   ObjPosY=-320
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_75"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_74
   Duration=30.000000
   InputLinks(0)=(DrawY=-99,OverrideDelta=14)
   InputLinks(1)=(DrawY=-78,OverrideDelta=35)
   InputLinks(2)=(DrawY=-57,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39',InputLinkIdx=2)),DrawY=-94,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39',InputLinkIdx=2)),DrawY=-62,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7336
   ObjPosY=-136
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_74"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_53
   Duration=30.000000
   InputLinks(0)=(DrawY=-2499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2457,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32',InputLinkIdx=2)),DrawY=-2494,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32',InputLinkIdx=2)),DrawY=-2462,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8228,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-2536
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_53"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_54
   Duration=10.000000
   InputLinks(0)=(DrawY=-2683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2641,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=1)),DrawY=-2678,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32',InputLinkIdx=2)),DrawY=-2646,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8052,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8104
   ObjPosY=-2720
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_54"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_55
   Duration=10.000000
   InputLinks(0)=(DrawY=-2507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2465,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_53')),DrawY=-2502,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2470,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8396,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8448
   ObjPosY=-2544
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_55"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_32
   bLooping=True
   InputLinks(0)=(DrawY=-2522,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2500,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2478,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2456,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2434,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2506,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2450,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-8075,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),LinkDesc="Trigger",MinVars=0,DrawX=-8020,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=-2560
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_32"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_68
   Duration=30.000000
   InputLinks(0)=(DrawY=-1979,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1958,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1937,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37',InputLinkIdx=2)),DrawY=-1974,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37',InputLinkIdx=2)),DrawY=-1942,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8296
   ObjPosY=-2016
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_68"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_69
   Duration=10.000000
   InputLinks(0)=(DrawY=-2163,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2142,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2121,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=1)),DrawY=-2158,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37',InputLinkIdx=2)),DrawY=-2126,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8068,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=-2200
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_69"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_70
   Duration=10.000000
   InputLinks(0)=(DrawY=-1987,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1966,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1945,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_68')),DrawY=-1982,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1950,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8412,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8464
   ObjPosY=-2024
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_70"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_37
   bLooping=True
   InputLinks(0)=(DrawY=-2002,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1980,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1958,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1936,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1914,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1986,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1930,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-8091,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Trigger",MinVars=0,DrawX=-8036,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=-2040
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_37"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_73
   Duration=30.000000
   InputLinks(0)=(DrawY=-1475,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1454,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1433,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38',InputLinkIdx=2)),DrawY=-1470,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38',InputLinkIdx=2)),DrawY=-1438,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8296
   ObjPosY=-1512
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_73"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_72
   Duration=10.000000
   InputLinks(0)=(DrawY=-1659,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1638,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1617,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=1)),DrawY=-1654,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38',InputLinkIdx=2)),DrawY=-1622,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8068,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=-1696
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_72"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_71
   Duration=10.000000
   InputLinks(0)=(DrawY=-1483,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1462,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1441,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_73')),DrawY=-1478,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1446,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8412,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8464
   ObjPosY=-1520
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_71"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_38
   bLooping=True
   InputLinks(0)=(DrawY=-1498,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1476,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1454,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1432,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1410,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1482,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1426,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-8091,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),LinkDesc="Trigger",MinVars=0,DrawX=-8036,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=-1536
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_38"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_35
   bLooping=True
   InputLinks(0)=(DrawY=-1938,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1916,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1894,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1872,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1850,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1922,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1866,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-7131,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),LinkDesc="Trigger",MinVars=0,DrawX=-7076,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7176
   ObjPosY=-1976
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_35"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_64
   Duration=10.000000
   InputLinks(0)=(DrawY=-1923,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1902,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1881,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_62')),DrawY=-1918,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1886,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7452,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-1960
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_64"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_63
   Duration=10.000000
   InputLinks(0)=(DrawY=-2099,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2078,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2057,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6',InputLinkIdx=1)),DrawY=-2094,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35',InputLinkIdx=2)),DrawY=-2062,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7108,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7160
   ObjPosY=-2136
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_63"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_62
   Duration=30.000000
   InputLinks(0)=(DrawY=-1915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1873,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35',InputLinkIdx=2)),DrawY=-1910,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35',InputLinkIdx=2)),DrawY=-1878,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7336
   ObjPosY=-1952
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_62"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_61
   Duration=30.000000
   InputLinks(0)=(DrawY=-2459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2417,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34',InputLinkIdx=2)),DrawY=-2454,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34',InputLinkIdx=2)),DrawY=-2422,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-2496
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_61"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_60
   Duration=10.000000
   InputLinks(0)=(DrawY=-2643,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2601,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=1)),DrawY=-2638,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34',InputLinkIdx=2)),DrawY=-2606,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7068,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7120
   ObjPosY=-2680
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_60"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_59
   Duration=10.000000
   InputLinks(0)=(DrawY=-2467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2425,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_61')),DrawY=-2462,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2430,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7412,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-2504
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_59"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_34
   bLooping=True
   InputLinks(0)=(DrawY=-2482,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2460,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2438,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2416,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2394,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2466,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2410,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-7091,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),LinkDesc="Trigger",MinVars=0,DrawX=-7036,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-2520
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_34"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-1848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_71
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_8'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_41'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_42',InputLinkIdx=1)),DrawY=-2219,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2198,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2177,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6186,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-2288
   ObjName="DynamicTriggerVolume_8 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_71"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-2336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_70
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_0'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_57'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_56',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=-2691,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2670,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2649,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6186,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-2760
   ObjName="DynamicTriggerVolume_0 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_70"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_42
   Duration=30.000000
   InputLinks(0)=(DrawY=-1995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1953,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2)),DrawY=-1990,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2)),DrawY=-1958,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6124,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6176
   ObjPosY=-2032
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_42"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_41
   Duration=10.000000
   InputLinks(0)=(DrawY=-2179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2137,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=1)),DrawY=-2174,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2)),DrawY=-2142,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5948,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6000
   ObjPosY=-2216
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_41"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_40
   Duration=10.000000
   InputLinks(0)=(DrawY=-2003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1961,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_42')),DrawY=-1998,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1966,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6292,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-2040
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_40"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bLooping=True
   InputLinks(0)=(DrawY=-2018,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1996,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1974,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1952,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1930,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2002,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1946,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-5971,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="Trigger",MinVars=0,DrawX=-5916,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6016
   ObjPosY=-2056
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_33
   bLooping=True
   InputLinks(0)=(DrawY=-2490,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2468,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2446,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2424,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2402,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2474,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2418,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-5963,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="Trigger",MinVars=0,DrawX=-5908,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjPosY=-2528
   ObjComment="Scan Trigger Scan Animation"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_33"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_58
   Duration=10.000000
   InputLinks(0)=(DrawY=-2475,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2454,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2433,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_56')),DrawY=-2470,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2438,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=-2512
   ObjComment="Scan Trigger Activation Delay If Room Trigger is Empty"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_58"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_57
   Duration=10.000000
   InputLinks(0)=(DrawY=-2651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2609,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=1)),DrawY=-2646,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33',InputLinkIdx=2)),DrawY=-2614,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-2688
   ObjComment="Scan Trigger Disconnection After Finding a Presence in the Room"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_57"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_56
   Duration=30.000000
   InputLinks(0)=(DrawY=-2467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2425,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33',InputLinkIdx=2)),DrawY=-2462,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33',InputLinkIdx=2)),DrawY=-2430,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6116,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6168
   ObjPosY=-2504
   ObjComment="Scan Trigger Shut Down if Nothing is Detected"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_56"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4384
   ObjPosY=-424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_69
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_11'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_35'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_38',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17')),DrawY=-771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-729,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4646,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4760
   ObjPosY=-840
   ObjName="DynamicTriggerVolume_11 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_69"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_39
   Duration=10.000000
   InputLinks(0)=(DrawY=-563,OverrideDelta=14)
   InputLinks(1)=(DrawY=-542,OverrideDelta=35)
   InputLinks(2)=(DrawY=-521,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_38')),DrawY=-558,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-526,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4780,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-600
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_39"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_35
   Duration=10.000000
   InputLinks(0)=(DrawY=-739,OverrideDelta=14)
   InputLinks(1)=(DrawY=-718,OverrideDelta=35)
   InputLinks(2)=(DrawY=-697,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17',InputLinkIdx=1)),DrawY=-734,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2)),DrawY=-702,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4404,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-776
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_35"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_38
   Duration=30.000000
   InputLinks(0)=(DrawY=-555,OverrideDelta=14)
   InputLinks(1)=(DrawY=-534,OverrideDelta=35)
   InputLinks(2)=(DrawY=-513,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2)),DrawY=-550,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2)),DrawY=-518,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4620,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4672
   ObjPosY=-592
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_38"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bLooping=True
   InputLinks(0)=(DrawY=-586,OverrideDelta=15)
   InputLinks(1)=(DrawY=-564,OverrideDelta=37)
   InputLinks(2)=(DrawY=-542,OverrideDelta=59)
   InputLinks(3)=(DrawY=-520,OverrideDelta=81)
   InputLinks(4)=(DrawY=-498,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-570,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-514,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-4427,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),LinkDesc="Trigger",MinVars=0,DrawX=-4372,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=-624
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-1456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_68
   bForceOverlapping=False
   Originator=DynamicTriggerVolume'KF-RIG.TheWorld:PersistentLevel.DynamicTriggerVolume_6'
   MaxTriggerCount=0
   ReTriggerDelay=10.000000
   bPlayerOnly=False
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_48'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_49',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-1795,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1774,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1753,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4690,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-1864
   ObjName="DynamicTriggerVolume_6 Touch"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_68"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_30
   bLooping=True
   InputLinks(0)=(DrawY=-1610,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1588,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1566,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1544,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1522,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1594,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1538,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-4435,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),LinkDesc="Trigger",MinVars=0,DrawX=-4380,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-1648
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_30"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_49
   Duration=30.000000
   InputLinks(0)=(DrawY=-1579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1558,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1537,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30',InputLinkIdx=2)),DrawY=-1574,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30',InputLinkIdx=2)),DrawY=-1542,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4628,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4680
   ObjPosY=-1616
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_49"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_48
   Duration=10.000000
   InputLinks(0)=(DrawY=-1763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1721,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=1)),DrawY=-1758,OverrideDelta=19)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30',InputLinkIdx=2)),DrawY=-1726,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4412,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=-1800
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_48"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_47
   Duration=10.000000
   InputLinks(0)=(DrawY=-1587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1545,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_49')),DrawY=-1582,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1550,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4788,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=-1624
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_47"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8224
   ObjPosY=232
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_9"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4968
   ObjPosY=-608
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-1584
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_32
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6488
   ObjPosY=-2592
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_32"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_30
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6496
   ObjPosY=-2088
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_30"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_44
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8568
   ObjPosY=-1592
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_44"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_27
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-1968
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_27"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_26
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8568
   ObjPosY=-2104
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_26"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_25
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-2536
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_25"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_24
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timer_zed_spawn_doors_delay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-2632
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_24"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_20
   Duration=2.000000
   InputLinks(0)=(DrawY=-1699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1657,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_47')),DrawY=-1694,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1662,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35'),DrawX=-4940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4992
   ObjPosY=-1736
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_20"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_19
   Duration=2.000000
   InputLinks(0)=(DrawY=-707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_39')),DrawY=-702,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-670,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36'),DrawX=-4932,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4984
   ObjPosY=-744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_19"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_16
   Duration=2.000000
   InputLinks(0)=(DrawY=-2707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_58')),DrawY=-2702,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2670,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=-6460,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-2744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_16"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_15
   Duration=2.000000
   InputLinks(0)=(DrawY=-2195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2153,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_40')),DrawY=-2190,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2158,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=-6460,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-2232
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_15"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_13
   Duration=2.000000
   InputLinks(0)=(DrawY=-2091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2049,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_64')),DrawY=-2086,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2054,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_27'),DrawX=-7604,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7656
   ObjPosY=-2128
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_13"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_12
   Duration=2.000000
   InputLinks(0)=(DrawY=-2635,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2614,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2593,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_59')),DrawY=-2630,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2598,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_25'),DrawX=-7572,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-2672
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_12"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_11
   Duration=2.000000
   InputLinks(0)=(DrawY=-2739,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2718,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2697,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_55')),DrawY=-2734,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2702,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_24'),DrawX=-8556,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=-2776
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_11"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_10
   Duration=2.000000
   InputLinks(0)=(DrawY=-2211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2169,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_70')),DrawY=-2206,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2174,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_26'),DrawX=-8540,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=-2248
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_10"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_9
   Duration=2.000000
   InputLinks(0)=(DrawY=-1699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1657,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_71')),DrawY=-1694,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1662,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_44'),DrawX=-8540,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=-1736
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_9"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_8
   Duration=2.000000
   InputLinks(0)=(DrawY=-299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-257,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_76')),DrawY=-294,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-262,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_9'),DrawX=-7564,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7616
   ObjPosY=-336
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_8"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   Duration=2.000000
   InputLinks(0)=(DrawY=-267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-225,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_67')),DrawY=-262,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-230,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_9'),DrawX=-8564,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-304
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5152
   ObjPosY=-1416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-1848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7784
   ObjPosY=-1792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6664
   ObjPosY=-2360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-1344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=-1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=48
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_45
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_46'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_8',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_75',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_76',InputLinkIdx=1)),DrawY=-307,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-286,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_8')),DrawY=-265,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7778,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-376
   ObjName="TriggerVolume_46 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_45"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-116,OverrideDelta=37)
   InputLinks(1)=(DrawY=-94,OverrideDelta=59)
   InputLinks(2)=(DrawY=-72,OverrideDelta=81)
   InputLinks(3)=(DrawY=-50,OverrideDelta=103)
   InputLinks(4)=(DrawY=-138,OverrideDelta=15)
   OutputLinks(0)=(DrawY=-122,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-66,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7801,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85'),LinkDesc="Door_Open0",MinVars=0,DrawX=-7748,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-176
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8704
   ObjPosY=40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_19
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-124,OverrideDelta=37)
   InputLinks(1)=(DrawY=-102,OverrideDelta=59)
   InputLinks(2)=(DrawY=-80,OverrideDelta=81)
   InputLinks(3)=(DrawY=-58,OverrideDelta=103)
   InputLinks(4)=(DrawY=-146,OverrideDelta=15)
   OutputLinks(0)=(DrawY=-130,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-74,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8777,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8724,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-184
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_19"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_44
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_54'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_67',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_66',InputLinkIdx=1)),DrawY=-315,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-294,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7')),DrawY=-273,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8754,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8840
   ObjPosY=-384
   ObjName="TriggerVolume_54 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_44"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-1586,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1564,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1542,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1520,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1498,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1570,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1514,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-5193,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),LinkDesc="Door_Open0",MinVars=0,DrawX=-5140,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-1624
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_43
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_40'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_48',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_47',InputLinkIdx=1)),DrawY=-1779,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1758,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20')),DrawY=-1737,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5170,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5256
   ObjPosY=-1848
   ObjName="TriggerVolume_40 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_43"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_13
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2026,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2004,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1982,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1960,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1938,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2010,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1954,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-6673,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),LinkDesc="Door_Open0",MinVars=0,DrawX=-6620,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=-2064
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_13"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2522,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2500,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2478,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2456,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2434,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2506,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2450,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-6689,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),LinkDesc="Door_Open0",MinVars=0,DrawX=-6636,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-2560
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_39
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_36'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_15',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_41',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_40',InputLinkIdx=1)),DrawY=-2195,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2174,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_15')),DrawY=-2153,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6650,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-2264
   ObjName="TriggerVolume_36 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_39"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_38
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_37'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_57',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_58',InputLinkIdx=1)),DrawY=-2699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2678,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16')),DrawY=-2657,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6658,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-2768
   ObjName="TriggerVolume_37 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_38"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-1962,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1940,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1918,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1896,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1874,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1946,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1890,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7809,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),LinkDesc="Door_Open0",MinVars=0,DrawX=-7756,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7856
   ObjPosY=-2000
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_37
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_34'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_13',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_63',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_64',InputLinkIdx=1)),DrawY=-2139,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2118,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_13')),DrawY=-2097,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7778,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-2208
   ObjName="TriggerVolume_34 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_37"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-1522,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1500,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1478,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1456,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1434,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1506,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1450,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8761,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8708,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-1560
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_36
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_32'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_9',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_72',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_71',InputLinkIdx=1)),DrawY=-1707,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1686,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_9')),DrawY=-1665,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8738,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-1776
   ObjName="TriggerVolume_32 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_36"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2034,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2012,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1990,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1968,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1946,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2018,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1962,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8777,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8724,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-2072
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_35
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_43'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_10',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_69',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_70',InputLinkIdx=1)),DrawY=-2211,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2190,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_10')),DrawY=-2169,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8746,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-2280
   ObjName="TriggerVolume_43 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_35"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5112
   ObjPosY=-392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=-392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_17
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-572,OverrideDelta=37)
   InputLinks(1)=(DrawY=-550,OverrideDelta=59)
   InputLinks(2)=(DrawY=-528,OverrideDelta=81)
   InputLinks(3)=(DrawY=-506,OverrideDelta=103)
   InputLinks(4)=(DrawY=-594,OverrideDelta=15)
   OutputLinks(0)=(DrawY=-578,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-522,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-5185,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),LinkDesc="Door_Open0",MinVars=0,DrawX=-5132,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5232
   ObjPosY=-632
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_17"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_33
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_58'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_19',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_35',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_39',InputLinkIdx=1)),DrawY=-779,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-758,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_19')),DrawY=-737,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5154,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-848
   ObjName="TriggerVolume_58 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_33"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_32
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_35'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_12',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_60',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_59',InputLinkIdx=1)),DrawY=-2699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2678,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_12')),DrawY=-2657,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7778,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-2768
   ObjName="TriggerVolume_35 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_32"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2522,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2500,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2478,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2456,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2434,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2506,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2450,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7809,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),LinkDesc="Door_Open0",MinVars=0,DrawX=-7756,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7856
   ObjPosY=-2560
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-2360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_31
   bForceOverlapping=False
   Originator=TriggerVolume'KF-RIG.TheWorld:PersistentLevel.TriggerVolume_42'
   MaxTriggerCount=0
   ReTriggerDelay=2.500000
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8'),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_11',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_54',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_55',InputLinkIdx=1)),DrawY=-2739,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2718,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_11')),DrawY=-2697,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8746,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-2808
   ObjName="TriggerVolume_42 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_31"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=InterpActor'KF-RIG.TheWorld:PersistentLevel.InterpActor_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-2400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   PlayRate=2.000000
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2570,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2548,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2526,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2504,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2482,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2554,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2498,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-8777,OverrideDelta=32)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-RIG.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),LinkDesc="Door_Open0",MinVars=0,DrawX=-8724,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-RIG.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-2608
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object
