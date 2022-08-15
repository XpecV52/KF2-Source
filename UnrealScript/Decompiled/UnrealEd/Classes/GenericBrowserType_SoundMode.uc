/*******************************************************************************
 * GenericBrowserType_SoundMode generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GenericBrowserType_SoundMode extends GenericBrowserType_Sounds
    native
    hidecategories(Object,GenericBrowserType);

cpptext
{
	virtual void Init();
	virtual UBOOL NotifyPreDeleteObject( UObject* ObjectToDelete );
	virtual void NotifyPostDeleteObject();

}

defaultproperties
{
    Description="Sound Modes"
}