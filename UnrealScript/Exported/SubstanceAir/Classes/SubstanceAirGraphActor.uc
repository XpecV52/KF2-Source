//! @file SubstanceAirGraphActor.uc
//! @copyright Allegorithmic. All rights reserved.
//!
//! @brief Utility class designed to allow you to connect a FGraphInstance to a Matinee action.

class SubstanceAirGraphActor extends Actor
	native(Actor)
	placeable
	hidecategories(Movement)
	hidecategories(Advanced)
	hidecategories(Collision)
	hidecategories(Display)
	hidecategories(Actor)
	hidecategories(Attachment);

/** Pointer to SubstanceAirGraphInstance that we want to control parameters of using Matinee. */
var()	SubstanceAirGraphInstance	GraphInst;

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      SpriteCategoryName="Materials"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   TickGroup=TG_DuringAsyncWork
   bNoDelete=True
   Name="Default__SubstanceAirGraphActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
