/**
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */


class EditorViewportInput extends Input
	transient
	config(Input)
	native;

var EditorEngine	Editor;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual UBOOL Exec(const TCHAR* Cmd,FOutputDevice& Ar);

}


defaultproperties
{
   Bindings(0)=(Name="SpaceBar",Command="MODE WIDGETMODECYCLE")
   Bindings(1)=(Name="Tilde",Command="MODE WIDGETCOORDSYSTEMCYCLE")
   Bindings(2)=(Name="Delete",Command="DELETE")
   Bindings(3)=(Name="F2",Command="SELECT BUILDERBRUSH")
   Bindings(4)=(Name="F4",Command="EDCALLBACK SELECTEDPROPS")
   Bindings(5)=(Name="F4",Command="QUIT_EDITOR",Alt=True)
   Bindings(6)=(Name="F5",Command="EDCALLBACK SURFPROPS")
   Bindings(7)=(Name="F6",Command="EDCALLBACK LEVELPROPS")
   Bindings(8)=(Name="A",Command="ACTOR SELECT ALL",Shift=True)
   Bindings(9)=(Name="B",Command="POLY SELECT MATCHING BRUSH",Shift=True)
   Bindings(10)=(Name="C",Command="POLY SELECT ADJACENT COPLANARS",Shift=True)
   Bindings(11)=(Name="D",Command="DUPLICATE",Shift=True)
   Bindings(12)=(Name="E",Command="ACTOR SELECT MATCHINGSTATICMESH",Shift=True)
   Bindings(13)=(Name="F",Command="POLY SELECT ADJACENT FLOORS",Shift=True)
   Bindings(14)=(Name="F",Command="EDCALLBACK FITTEXTURETOSURFACE",Control=True,Shift=True)
   Bindings(15)=(Name="I",Command="POLY SELECT MATCHING ITEMS",Shift=True)
   Bindings(16)=(Name="J",Command="POLY SELECT ADJACENT ALL",Shift=True)
   Bindings(17)=(Name="M",Command="POLY SELECT MEMORY SET",Shift=True)
   Bindings(18)=(Name="M",Command="ACTOR LEVELCURRENT")
   Bindings(19)=(Name="M",Command="ACTOR MOVETOCURRENT",Control=True)
   Bindings(20)=(Name="N",Command="SELECT NONE",Shift=True)
   Bindings(21)=(Name="O",Command="POLY SELECT MEMORY INTERSECT",Shift=True)
   Bindings(22)=(Name="Q",Command="POLY SELECT REVERSE",Shift=True)
   Bindings(23)=(Name="R",Command="POLY SELECT MEMORY RECALL",Shift=True)
   Bindings(24)=(Name="S",Command="POLY SELECT ALL",Shift=True)
   Bindings(25)=(Name="T",Command="POLY SELECT MATCHING TEXTURE",Shift=True)
   Bindings(26)=(Name="U",Command="POLY SELECT MEMORY UNION",Shift=True)
   Bindings(27)=(Name="W",Command="POLY SELECT ADJACENT WALLS",Shift=True)
   Bindings(28)=(Name="X",Command="POLY SELECT MEMORY XOR",Shift=True)
   Bindings(29)=(Name="Y",Command="POLY SELECT ADJACENT SLANTS",Shift=True)
   Bindings(30)=(Name="Z",Command="ACTOR SELECT MATCHINGSTATICMESH ALLCLASSES",Shift=True)
   Bindings(31)=(Name="C",Command="EDIT COPY",Control=True)
   Bindings(32)=(Name="V",Command="EDIT PASTE",Control=True)
   Bindings(33)=(Name="W",Command="DUPLICATE",Control=True)
   Bindings(34)=(Name="X",Command="EDIT CUT",Control=True)
   Bindings(35)=(Name="Y",Command="TRANSACTION REDO",Control=True)
   Bindings(36)=(Name="Z",Command="TRANSACTION UNDO",Control=True)
   Bindings(37)=(Name="A",Command="BRUSH ADD",Control=True)
   Bindings(38)=(Name="S",Command="BRUSH SUBTRACT",Control=True)
   Bindings(39)=(Name="I",Command="BRUSH FROM INTERSECTION",Control=True)
   Bindings(40)=(Name="D",Command="BRUSH FROM DEINTERSECTION",Control=True)
   Bindings(41)=(Name="P",Command="PREFAB SELECTACTORSINPREFABS",Shift=True)
   Bindings(42)=(Name="End",Command="ACTOR ALIGN SNAPTOFLOOR ALIGN=0")
   Bindings(43)=(Name="End",Command="ACTOR ALIGN MOVETOGRID",Control=True)
   Bindings(44)=(Name="Home",Command="CAMERA ALIGN")
   Bindings(45)=(Name="Home",Command="CAMERA ALIGN ACTIVEVIEWPORTONLY",Shift=True)
   Bindings(46)=(Name="Add",Command="CAMERA ALIGN NEXT")
   Bindings(47)=(Name="Equals",Command="CAMERA ALIGN NEXT",Shift=True)
   Bindings(48)=(Name="Subtract",Command="CAMERA ALIGN PREVIOUS")
   Bindings(49)=(Name="Underscore",Command="CAMERA ALIGN PREVIOUS",Shift=True)
   Bindings(50)=(Name="P",Command="MAP BRUSH GET",Control=True)
   Bindings(51)=(Name="K",Command="ACTOR FIND KISMET",Control=True)
   Bindings(52)=(Name="A",Command="ACTOR SELECT ALL FROMOBJ",Control=True,Shift=True)
   Bindings(53)=(Name="B",Command="ACTOR SYNCBROWSER",Control=True)
   Bindings(54)=(Name="B",Command="ACTOR SYNCBROWSERMATERIAL",Control=True,Shift=True)
   Bindings(55)=(Name="Escape",Command="ACTOR DESELECT")
   Bindings(56)=(Name="Tab",Command="CTRLTAB SHIFTDOWN=FALSE",Control=True)
   Bindings(57)=(Name="Tab",Command="CTRLTAB SHIFTDOWN=TRUE",Control=True,Shift=True)
   Bindings(58)=(Name="L",Command="ACTOR LINKSELECTED",Control=True,Shift=True)
   Bindings(59)=(Name="U",Command="ACTOR UNLINKSELECTED",Control=True,Shift=True)
   Bindings(60)=(Name="SemiColon",Command="BUILDLIGHTING",Control=True,Shift=True)
   Bindings(61)=(Name="Period",Command="RECOMPILESHADERS CHANGED",Control=True,Shift=True)
   Bindings(62)=(Name="B",Command="ACTOR ATTACH",Alt=True)
   Bindings(63)=(Name="A",Command="ACTOR ADDTOATTACHEDITOR",Alt=True)
   Bindings(64)=(Name="Slash",Command="PARTICLE RESET SELECTED")
   Bindings(65)=(Name="Slash",Command="PARTICLE RESET ALL",Shift=True)
   Bindings(66)=(Name="G",Command="GROUPS REGROUP",Control=True)
   Bindings(67)=(Name="G",Command="GROUPS UNGROUP",Shift=True)
   Bindings(68)=(Name="G",Command="GROUPS TOGGLEMODE",Control=True,Shift=True)
   Name="Default__EditorViewportInput"
   ObjectArchetype=Input'Engine.Default__Input'
}
