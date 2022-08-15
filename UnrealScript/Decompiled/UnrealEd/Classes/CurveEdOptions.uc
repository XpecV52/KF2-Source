/*******************************************************************************
 * CurveEdOptions generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CurveEdOptions extends Object
    native
    config(EditorUserSettings)
    hidecategories(Object);

var(Options) config float MinViewRange;
var(Options) config float MaxViewRange;
var(Options) config LinearColor BackgroundColor;
var(Options) config LinearColor LabelColor;
var(Options) config LinearColor SelectedLabelColor;
var(Options) config LinearColor GridColor;
var(Options) config LinearColor GridTextColor;
var(Options) config LinearColor LabelBlockBkgColor;
var(Options) config LinearColor SelectedKeyColor;

defaultproperties
{
    BackgroundColor=(R=0,G=0,B=0,A=1)
    LabelColor=(R=0,G=0,B=0,A=1)
    SelectedLabelColor=(R=0,G=0,B=0,A=1)
    GridColor=(R=0,G=0,B=0,A=1)
    GridTextColor=(R=0,G=0,B=0,A=1)
    LabelBlockBkgColor=(R=0,G=0,B=0,A=1)
    SelectedKeyColor=(R=0,G=0,B=0,A=1)
}