/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 * A TranslationContext is part of the system for managing translation tags in localization text.
 * This system handles text with special tags. E.g.: Press <Controller:GBA_POI/> to look at point of interest.
 * A TranslationContext provides information that cannot be deduced from the text alone.
 * In the example above player1 and player2 might have different buttons mapped to the POI action;
 * a per-player context helps translate <StringAliasBindings:GBA_POI/> based on the player's controller setup.
 */
class TranslationContext extends Object
	native;

/** TranslatorTags that define this TranslationContext. */
var array<TranslatorTag> TranslatorTags;

/** Add a Tag to this Context */
function native bool RegisterTranslatorTag( TranslatorTag InTagHandler );

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
   Name="Default__TranslationContext"
   ObjectArchetype=Object'Core.Default__Object'
}
