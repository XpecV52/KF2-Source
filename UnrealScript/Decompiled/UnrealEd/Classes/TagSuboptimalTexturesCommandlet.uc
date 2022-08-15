/*******************************************************************************
 * TagSuboptimalTexturesCommandlet generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TagSuboptimalTexturesCommandlet extends Commandlet
    transient
    native
    config(Editor);

cpptext
{
	/**
	 * Find textures that don't match their MaxLODSize and add them to a shared collection
	 *
	 * @param Params - the command line arguments used to run the commandlet. A map list is the only expected argument at this time
	 *
	 * @return 0 - unused
	 */
	INT Main(const FString& Params);

}

var config array<config Engine.Texture.TextureGroup> TextureGroupsToExamine;
