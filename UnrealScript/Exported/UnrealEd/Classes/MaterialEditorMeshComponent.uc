/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialEditorMeshComponent extends StaticMeshComponent
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient native const pointer	MaterialEditor;

cpptext
{
protected:
	// ActorComponent interface.
	virtual void Attach();
	virtual void Detach( UBOOL bWillReattach = FALSE );

}


defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__MaterialEditorMeshComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
