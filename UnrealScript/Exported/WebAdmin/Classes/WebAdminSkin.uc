/**
 * Data resource for webadmin "skins"
 *
 * Copyright 2009 Epic Games, Inc. All Rights Reserved
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class WebAdminSkin extends UIResourceDataProvider PerObjectConfig;

var config string FriendlyName;

var config string CssFile;

defaultproperties
{
   Name="Default__WebAdminSkin"
   ObjectArchetype=UIResourceDataProvider'Engine.Default__UIResourceDataProvider'
}
