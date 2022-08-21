//=============================================================================
// KFGameViewportClient
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 12/3/2012
//=============================================================================

class KFGameViewportClient extends GameViewportClient
	native(UI);


/** The message that the front ends pop up will display if there is a connection issue */
var string ErrorTitle;
var string ErrorMessage;

var string LastConnectionAttemptAddress;

var localized array<string> RandomLoadingStrings;
var FONT MessageFont;
var float FontScale;

/** Keep track of whether we have seen the Initial Interaction Screen. */
var bool bSeenIIS;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function NotifyConnectionError(EProgressMessageType MessageType, optional string Message=Localize("Errors", "ConnectionFailed", "Engine"), optional string Title=Localize("Errors", "ConnectionFailed_Title", "Engine") )
{
	local KFGameEngine KFGEngine;
	KFGEngine = KFGameEngine( Class'KFGameEngine'.static.GetEngine() );
	
	// Don't override cached error messages until we've dealt with them
	if ( ErrorTitle == "" )
	{
		// localize our strings
		ErrorTitle = class'KFLocalMessage'.static.getLocalized(Title);
		ErrorMessage = class'KFLocalMessage'.static.getLocalized(Message);
		KFGEngine.SetLastConnectionError(Message, Title);
	}

	super.NotifyConnectionError(MessageType, Message, Title);
}

//Ported from RO2, storing last address that we attempted to connect to.
event PreBrowse(string Address)
{
	LastConnectionAttemptAddress = Address;
}

/** Returns the error message related to any disconnects */
function GetErrorMessage(out string outTitle, out string outMessage)
{
	outTitle = ErrorTitle;
	outMessage = ErrorMessage;

	ErrorTitle = "";
	ErrorMessage = "";
}

/**
 * Displays the transition screen.
 * @param Canvas - The canvas to use for rendering.
 */
function DrawTransition(Canvas Canvas)
{
	local string RandomLoadingString;
	switch(Outer.TransitionType)
	{
		case TT_Loading:
			RandomLoadingString = GetRandomLoadingMessage();
			DrawTransitionMessage(Canvas,RandomLoadingString);
			break;
	}
}

function string GetRandomLoadingMessage()
{
	return RandomLoadingStrings[Rand(RandomLoadingStrings.length)];
}

/**
 * Print a centered transition message with a drop shadow.
 */
function DrawTransitionMessage(Canvas Canvas,string Message)
{
	Class'Engine'.static.AddOverlay(MessageFont, message, 0.15, 0.85, FontScale, FontScale, true);
	

	return;


	Super.DrawTransitionMessage(Canvas, Message);
}

defaultproperties
{
   RandomLoadingStrings(0)="The fleshpound is vulnerable to explosives but resistant to bullets."
   RandomLoadingStrings(1)="The scrake is resistant to explosives but vulnerable to bullets."
   RandomLoadingStrings(2)="You can only carry a limited amount of weight. Sell weaker weapons to make room for better ones."
   RandomLoadingStrings(3)="Watch the vents and sewers; Zeds can come from anywhere."
   RandomLoadingStrings(4)="Keep an eye out for gear and ammo boxes scattered throughout the map. They may save you if you get in a pinch."
   RandomLoadingStrings(5)="The bloat's body can take a lot of hits. Aim for its head."
   RandomLoadingStrings(6)="The parry ability stumbles a Zed, allowing you to get in a few extra strikes."
   RandomLoadingStrings(7)="Watch out for the husk. Once he takes enough damage, he may try to self-detonate on your team."
   RandomLoadingStrings(8)="You receive XP for damaging Zeds towards the perk associated with the weapon that inflicted the damage."
   RandomLoadingStrings(9)="Stick together. Getting singled out decreases your chances of survival if things get hairy."
   RandomLoadingStrings(10)="Players can use the syringe to heal themselves as well as their teammates."
   RandomLoadingStrings(11)="Welding doors can hold Zeds back. Doors do not come back once destroyed."
   RandomLoadingStrings(12)="If a teammate dies, it is helpful to grab their weapon and drop it for them at the trader."
   RandomLoadingStrings(13)="Got some extra dosh? Drop some for your team; they may return the favor."
   RandomLoadingStrings(14)="Choose your targets. Different weapons are more or less effective against different types of Zeds."
   RandomLoadingStrings(15)="Prioritize your targets. A fleshpound is a lot more deserving of your attention than a clot."
   RandomLoadingStrings(16)="All Zeds have weak points. If it's not the head, look for glowing elements on their bodies."
   RandomLoadingStrings(17)="Looking to buy or sell a cosmetic item or weapon skin?  Check the marketplace."
   RandomLoadingStrings(18)="The siren's scream neutralizes grenades and other explosives."
   RandomLoadingStrings(19)="Scrakes and fleshpounds will rage once they receive enough damage. Stay out of their way."
   RandomLoadingStrings(20)="Have a bunch of weapon skins or cosmetic items you're not using?  Craft new ones in your Inventory."
   RandomLoadingStrings(21)="Consider your outfit and gear carefully. One must look stylish while killing Zeds."
   RandomLoadingStrings(22)="Melee attacks are directional based on your movement. Forward = overhead, side = swipe, and back = uppercut."
   RandomLoadingStrings(23)="Welding doors shut can limit the directions the Zeds will attack you from, but will also limit your escape routes."
   RandomLoadingStrings(24)="Don't get close to even the weakest Zeds; they can grab you and hold on until their bigger friends arrive."
   RandomLoadingStrings(25)="Want Medic XP and some dosh? Heal your team -- both parties benefit!"
   RandomLoadingStrings(26)="Use controlled bursts with your weapons. Running out of ammo mid-wave makes for a difficult time."
   RandomLoadingStrings(27)="New perk skills are unlocked every 5 levels. Check them out at the Perks Menu."
   RandomLoadingStrings(28)="The M79 and RPG must travel a certain distance to arm the explosive charge."
   RandomLoadingStrings(29)="If you're having trouble seeing the Zeds, try your flashlight."
   RandomLoadingStrings(30)="Having a tough time surviving? Try a different perk! You may find one that fits your playstyle better."
   RandomLoadingStrings(31)="Always make sure you have a way out. Getting boxed in is a sure way to take a dirt nap."
   RandomLoadingStrings(32)="Armor is your friend. You can never go wrong getting more armor."
   RandomLoadingStrings(33)="Fire is a great way to keep Zeds away from you. Fire alone takes awhile to kill Zeds, but it keeps them occupied."
   RandomLoadingStrings(34)="If a Zed or its weapon are glowing red, parrying its melee attacks will be less effective.  Run!"
   RandomLoadingStrings(35)="Lighting Zeds on fire can cause them to panic. Time to play everyone's favorite game: Oh my god, I'm on fire!"
   RandomLoadingStrings(36)="Submachine guns have a high chance to cause targets to stumble, allowing you to keep them at a distance."
   RandomLoadingStrings(37)="The rail gun can fire through multiple Zeds if you line them up right."
   RandomLoadingStrings(38)="The microwave gun does more damage against Zeds carrying metal, like fleshpounds and sirens."
   RandomLoadingStrings(39)="Try out your weapon's alternate fire mode. Not all weapons have them, but it may help you in a tight spot."
   RandomLoadingStrings(40)="You get XP and dosh for assists in addition to kills, so don't feel bad for setting up kills for your allies."
   MessageFont=Font'UI_Canvas_Fonts.Font_Main'
   FontScale=1.000000
   Name="Default__KFGameViewportClient"
   ObjectArchetype=GameViewportClient'Engine.Default__GameViewportClient'
}
