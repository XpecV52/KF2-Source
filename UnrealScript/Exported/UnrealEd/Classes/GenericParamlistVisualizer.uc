/**
* Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
*
* visualizes genericparamlistentries
*/
class GenericParamlistVisualizer extends GameStatsVisualizer			 
	native(GameStats)
	config(Editor);

struct native Line
{
	var Vector LineStart;
	var Vector LineEnd;
	var LinearColor  LineColor;
	var float Thickness;
};

struct native DrawBox
{
	var Vector BoxLoc;
	var Vector Extent;
	var Color BoxColor;
};


struct native DrawSphere
{
	var Vector SphereLoc;
	var float Radius;
	var Color SphereColor;
};


struct native DrawAtom
{
	var array<Line> Lines;
	var array<DrawBox> Boxes;

	var array<DrawSphere> Spheres;

	var string ShortName;
	var string LongName;
	var Texture2D Sprite;
	var vector Loc;
	var LinearColor Color;
};

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
var array<DrawAtom>  DrawAtoms;

var Texture2D DatumSprite;

cpptext
{
	/** Given a chance to initialize */
	virtual void Init();

	/** Reset the visualizer to initial state */
	virtual void Reset();

	/** 
	 * Draws all players with unique color within the given time period
	 * taking into account time/space jumps
	 * @param View - the view being drawn in
	 * @param PDI - draw interface for primitives
	 * @param ViewportType - type of viewport being draw (perspective, ortho)
	 */
	virtual void Visualize(const FSceneView* View, class FPrimitiveDrawInterface* PDI, ELevelViewportType ViewportType);

	/** Called before any database entries are given to the visualizer */
	virtual void BeginVisiting();

	/** Called at the end of database entry traversal, returns success or failure */
	virtual UBOOL EndVisiting();

	/** Returns the number of data points the visualizer is actively working with */
	virtual INT GetVisualizationSetCount() const;

	/** 
	 *	Retrieve some metadata about an event
	 * @param EventIndex - some visualizer relative index about the data to get metadata about
	 * @param MetadataString - return string containing information about the event requested
	 */
	virtual void GetMetadata(INT EventIndex, FString& MetadataString);


	/** Called when a hitproxy belonging to this visualizer is triggered */
	virtual void HandleHitProxy(struct HGameStatsHitProxy* HitProxy);

	virtual void Visit(class GenericParamListEntry* Entry); 

}


defaultproperties
{
   FriendlyName="Generic Visualizer (for debug stats mostly)"
   SupportedEvents(0)=302
   SupportedEvents(1)=1001
   SupportedEvents(2)=1002
   SupportedEvents(3)=1003
   SupportedEvents(4)=1004
   SupportedEvents(5)=1010
   SupportedEvents(6)=1011
   SupportedEvents(7)=1012
   SupportedEvents(8)=1013
   SupportedEvents(9)=1014
   SupportedEvents(10)=1015
   SupportedEvents(11)=1016
   SupportedEvents(12)=1017
   SupportedEvents(13)=1018
   SupportedEvents(14)=1019
   SupportedEvents(15)=1020
   SupportedEvents(16)=1021
   SupportedEvents(17)=1022
   SupportedEvents(18)=1023
   SupportedEvents(19)=1024
   SupportedEvents(20)=1025
   SupportedEvents(21)=1026
   SupportedEvents(22)=1027
   SupportedEvents(23)=1028
   SupportedEvents(24)=1029
   SupportedEvents(25)=1030
   SupportedEvents(26)=1031
   SupportedEvents(27)=1032
   SupportedEvents(28)=1033
   Name="Default__GenericParamlistVisualizer"
   ObjectArchetype=GameStatsVisualizer'UnrealEd.Default__GameStatsVisualizer'
}
