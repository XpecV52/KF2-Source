/*******************************************************************************
 * UIDataProvider_MenuItem generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UIDataProvider_MenuItem extends UIResourceDataProvider
    transient
    native(UIPrivate)
    config(UI)
    perobjectconfig
    hidecategories(Object,UIRoot);

enum EMenuOptionType
{
    MENUOT_ComboReadOnly,
    MENUOT_ComboNumeric,
    MENUOT_CheckBox,
    MENUOT_Slider,
    MENUOT_Spinner,
    MENUOT_EditBox,
    MENUOT_CollectionCheckBox,
    MENUOT_CollapsingList,
    MENUOT_MAX
};

var config UIDataProvider_MenuItem.EMenuOptionType OptionType;
var config array<config name> OptionSet;
var config string DataStoreMarkup;
var config string DescriptionMarkup;
var config name RequiredGameMode;
var const config localized string FriendlyName;
var string CustomFriendlyName;
var const config localized string Description;
var config bool bEditableCombo;
var config bool bNumericCombo;
var config bool bKeyboardOrMouseOption;
var config bool bOnlineOnly;
var config bool bOfflineOnly;
/**  
 *whether to search all .inis for valid resource provider instances instead of just the our specified config file
 * this is used for lists that need to support additions via extra files, i.e. mods
 */
var() bool bSearchAllInis;
var config bool bRemoveOn360;
var config bool bRemoveOnPC;
var config bool bRemoveOnPS3;
var config bool bRemoveOnDingo;
var config int EditBoxMaxLength;
var config UIRangeData RangeData;
var config array<config name> SchemaCellFields;
var const string IniName;
