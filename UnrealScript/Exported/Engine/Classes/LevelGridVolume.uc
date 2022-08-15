/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LevelGridVolume extends Volume
	native
	dependson(KMeshProps)
	hidecategories(Advanced,Attachment,Collision,Volume,Physics,Location)
	autoexpandcategories(LevelGridVolume)
	placeable;



/** Structure contains coordinates for a single grid cell */
struct native LevelGridCellCoordinate
{
	/** Cell X coordinate */
	var int X;

	/** Cell Y coordinate */
	var int Y;

	/** Cell Z coordinate */
	var int Z;

	structcpptext
	{
		/** Constructor */
		FLevelGridCellCoordinate()
			: X( 0 ), Y( 0 ), Z( 0 )
		{
		}

		/** Equality operator */
		UBOOL operator==( const FLevelGridCellCoordinate& RHS ) const
		{
			return ( RHS.X == X && RHS.Y == Y && RHS.Z == Z );
		}
	}
};



/** Possible shapes for grid cells */
enum LevelGridCellShape
{
	/** Axis-aligned boxes */
	LGCS_Box,

	/** Hexagonal prism */
	LGCS_Hex
};


/** Name of this level grid volume, which is also the prefix for level names created for volume.  If empty, the level grid volume actor's name will be used instead.  You should set this name before placing any actors into the level, and never change it afterwards! */
var() const string LevelGridVolumeName;

/** Shape of the cells this grid is composed of */
var() const LevelGridCellShape CellShape;

/** The number of streaming volumes should the grid be subdivided into along each axis.  Be careful when changing this after actors have been added to the level grid volume! */
var() const int Subdivisions[ 3 ];

/*
* Width of each grid cell (X axis size.)  Be careful when changing this after actors have been added to the level grid volume! /
var() const int CellWidth;

* Depth of each grid cell (Y axis size.)  Be careful when changing this after actors have been added to the level grid volume! /
var() const int CellDepth;

* Height of each grid cell (Z axis size.)  Be careful when changing this after actors have been added to the level grid volume! /
var() const int CellHeight;

* Location offset for all grid cells in the map.  Be careful when changing this after actors have been added to the level grid volume! /
var() const vector GridOffset;
*/


/** Minimum distance between a grid cell and the viewer before a cell's level will be queued to stream in */
var() const float LoadingDistance;

/** Extra distance before the LoadingDistance which levels should stay loaded.  This can be used to prevent a level from continuously being loaded and unloaded as the viewer's distance to the cell crosses the LoadingDistance threshold. */
var() const float KeepLoadedRange;

/** Grid cell convex shape, used for fast distance tests */
var const transient KConvexElem CellConvexElem;



// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Subdivisions(0)=1
   Subdivisions(1)=1
   Subdivisions(2)=1
   LoadingDistance=20480.000000
   KeepLoadedRange=2048.000000
   BrushColor=(B=80,G=80,R=80,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   Begin Object Class=LevelGridVolumeRenderingComponent Name=LevelGridVolumeRenderer
      ReplacementPrimitive=None
      Name="LevelGridVolumeRenderer"
      ObjectArchetype=LevelGridVolumeRenderingComponent'Engine.Default__LevelGridVolumeRenderingComponent'
   End Object
   Components(1)=LevelGridVolumeRenderer
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__LevelGridVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
