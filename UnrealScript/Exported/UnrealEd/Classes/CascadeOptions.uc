/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// CascadeOptions
//
// A configuration class that holds information for the setup of Cascade.
// Supplied so that the editor 'remembers' the last setup the user had.
//=============================================================================
class CascadeOptions extends Object	
	hidecategories(Object)
	config(EditorUserSettings)
	native;	

var(Options)		config bool			bShowModuleDump;
var(Options)		config color		BackgroundColor;
var(Options)		config bool			bUseSubMenus;
var(Options)		config bool			bUseSpaceBarReset;
var(Options)		config bool			bUseSpaceBarResetInLevel;
var(Options)		config color		Empty_Background;
var(Options)		config color		Emitter_Background;
var(Options)		config color		Emitter_Unselected;
var(Options)		config color		Emitter_Selected;
var(Options)		config color		ModuleColor_General_Unselected;
var(Options)		config color		ModuleColor_General_Selected;
var(Options)		config color		ModuleColor_TypeData_Unselected;
var(Options)		config color		ModuleColor_TypeData_Selected;
var(Options)		config color		ModuleColor_Beam_Unselected;
var(Options)		config color		ModuleColor_Beam_Selected;
var(Options)		config color		ModuleColor_Trail_Unselected;
var(Options)		config color		ModuleColor_Trail_Selected;
var(Options)		config color		ModuleColor_Spawn_Unselected;
var(Options)		config color		ModuleColor_Spawn_Selected;
var(Options)		config color		ModuleColor_Required_Unselected;
var(Options)		config color		ModuleColor_Required_Selected;
var(Options)		config color		ModuleColor_Event_Unselected;
var(Options)		config color		ModuleColor_Event_Selected;

var(Options)		config bool			bShowGrid;
var(Options)		config color		GridColor_Hi;
var(Options)		config color		GridColor_Low;
var(Options)		config float		GridPerspectiveSize;

var(Options)		config bool			bShowParticleCounts;
var(Options)		config bool			bShowParticleEvents;
var(Options)		config bool			bShowParticleTimes;
var(Options)		config bool			bShowParticleDistance;
var(Options)		config bool			bShowParticleMemory;
var(Options)		config float		ParticleMemoryUpdateTime;

var(Options)		config bool			bShowFloor;
var(Options)		config string		FloorMesh;
var(Options)		config vector		FloorPosition;
var(Options)		config rotator		FloorRotation;
var(Options)		config float		FloorScale;
var(Options)		config vector		FloorScale3D;

var(Options)		config string		PostProcessChainName;

var(Options)		config int			ShowPPFlags;

/** If TRUE, use the 'slimline' module drawing method in cascade. */
var(Options)		config bool			bUseSlimCascadeDraw;
/** The height to use for the 'slimline' module drawing method in cascade. */
var(Options)		config int			SlimCascadeDrawHeight;
/** If TRUE, center the module name and buttons in the module box. */
var(Options)		config bool			bCenterCascadeModuleText;
/** The number of units the mouse must move before considering the module as dragged. */
var(Options)		config int			Cascade_MouseMoveThreshold;

/**
 *	TypeData-to-base module mappings.
 *	These will disallow complete 'sub-menus' depending on the TypeData utilized.
 */
var deprecated config array<ModuleMenuMapper> ModuleMenu_TypeDataToBaseModuleRejections;
/** Module-to-TypeData mappings. */
var deprecated config array<ModuleMenuMapper> ModuleMenu_TypeDataToSpecificModuleRejections;
/** Modules that Cascade should ignore in the menu system. */
var deprecated config array<string> ModuleMenu_ModuleRejections;

/** The radius of the motion mode */
var(Options) config float MotionModeRadius;

defaultproperties
{
   bUseSubMenus=True
   bUseSpaceBarResetInLevel=True
   bUseSlimCascadeDraw=True
   bCenterCascadeModuleText=True
   BackgroundColor=(B=25,G=20,R=20,A=0)
   Empty_Background=(B=25,G=20,R=20,A=0)
   Emitter_Background=(B=25,G=20,R=20,A=0)
   Emitter_Unselected=(B=0,G=100,R=255,A=0)
   Emitter_Selected=(B=180,G=180,R=180,A=0)
   ModuleColor_General_Unselected=(B=49,G=40,R=40,A=0)
   ModuleColor_General_Selected=(B=0,G=100,R=255,A=0)
   ModuleColor_TypeData_Unselected=(B=20,G=20,R=15,A=0)
   ModuleColor_TypeData_Selected=(B=0,G=100,R=255,A=0)
   ModuleColor_Beam_Unselected=(B=235,G=150,R=160,A=0)
   ModuleColor_Beam_Selected=(B=0,G=100,R=255,A=0)
   ModuleColor_Trail_Unselected=(B=170,G=235,R=130,A=0)
   ModuleColor_Trail_Selected=(B=0,G=100,R=255,A=0)
   ModuleColor_Spawn_Unselected=(B=100,G=100,R=200,A=0)
   ModuleColor_Spawn_Selected=(B=50,G=50,R=255,A=0)
   ModuleColor_Required_Unselected=(B=100,G=200,R=200,A=0)
   ModuleColor_Required_Selected=(B=50,G=225,R=255,A=0)
   ModuleColor_Event_Unselected=(B=255,G=64,R=64,A=0)
   ModuleColor_Event_Selected=(B=255,G=0,R=0,A=0)
   GridColor_Hi=(B=255,G=100,R=0,A=0)
   GridColor_Low=(B=255,G=100,R=0,A=0)
   GridPerspectiveSize=1024.000000
   PostProcessChainName="EditorMaterials.Cascade.DefaultCascadePostProcess"
   SlimCascadeDrawHeight=24
   Cascade_MouseMoveThreshold=4
   MotionModeRadius=150.000000
   Name="Default__CascadeOptions"
   ObjectArchetype=Object'Core.Default__Object'
}
