/*******************************************************************************
 * KFGFxHUD_PlayerStatusVersus generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_PlayerStatusVersus extends KFGFxHUD_PlayerStatus within GFxMoviePlayer;

var class<Pawn> LastPawnClass;

function TickHud(float DeltaTime)
{
    UpdateHealth();
    UpdateCharacterName();
}

function UpdateCharacterName()
{
    local KFPawn MyKFPawn;

    if((MyPC.Pawn != none) && LastPawnClass != MyPC.Pawn.Class)
    {
        MyKFPawn = KFPawn(MyPC.Pawn);
        if(MyKFPawn != none)
        {
            LastPawnClass = MyPC.Pawn.Class;
            SetString("characterName", MyKFPawn.GetLocalizedName());
        }
    }
}

function UpdateHealth()
{
    if((MyPC != none) && MyPC.Pawn == none)
    {
        LastHealth = 0;
        SetInt("playerHealth", LastHealth);        
    }
    else
    {
        if(LastHealth != MyPC.Pawn.Health)
        {
            SetInt("playerHealth", int((float(MyPC.Pawn.Health) / float(MyPC.Pawn.HealthMax)) * float(100)));
            LastHealth = MyPC.Pawn.Health;
        }
    }
}

function UpdateXP(int XPDelta, int XPPercent, bool bLevelUp, class<KFPerk> PerkClass);

function UpdateArmor();

function UpdatePerk();

function UpdateHealer();

function ShowActiveIndicators(array<string> IconPathStrings);

function ClearBuffIcons();

defaultproperties
{
    LastPerkLevel=-1
}