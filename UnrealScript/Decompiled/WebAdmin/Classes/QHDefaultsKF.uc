/*******************************************************************************
 * QHDefaultsKF generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class QHDefaultsKF extends QHDefaults
    config(webadmin);

function string rewriteSettingsClassname(string pkgName, string clsName)
{
    if(pkgName ~= "KFGame")
    {
        pkgName = string(Class.GetPackageName());        
    }
    else
    {
        if(pkgName ~= "KFGameContent")
        {
            pkgName = string(Class.GetPackageName());
        }
    }
    return super.rewriteSettingsClassname(pkgName, clsName);
}

defaultproperties
{
    GeneralSettingsClass="WebAdmin.GeneralSettings"
}