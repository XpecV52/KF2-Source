/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
 
class PBRuleNodeBase extends Object
	native(ProcBuilding)
	hidecategories(Object)	
	editinlinenew
	abstract;


struct native PBRuleLink
{
	var()   instanced PBRuleNodeBase    NextRule;
	var()   name                        LinkName;
	var	    editoronly int			    DrawY;	
};

var editfixedsize array<PBRuleLink>   NextRules;

// Editor stuff

/** User defined comment, shown above node */
var() editoronly string Comment;

/** Visual X position of this rule in editor */
var editoronly int  RulePosX;
/** Visual Y position of this rule in editor */
var editoronly int  RulePosY;

var editoronly int  InDrawY;
var editoronly int  DrawWidth;
var editoronly int  DrawHeight;

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

	

defaultproperties
{
   NextRules(0)=(LinkName="Next")
   Name="Default__PBRuleNodeBase"
   ObjectArchetype=Object'Core.Default__Object'
}
