class KFGFXHudWrapper_Versus extends KFGFXHudWrapper;

struct sHiddenHumanPawnInfo
{
    var Pawn HumanPawn;
    var PlayerReplicationInfo HumanPRI;
};

var Class<KFGFxMoviePlayer_HUD> HumanHUDClass;
var Class<KFGFxMoviePlayer_HUD> ZedHUDClass;
var float HumanPlayerIconInterpMult;
var() float ZedPlayerHudLocX, ZedPlayerHudLocY;

var int HumanStatusBarLengthMax;
const FriendlyZedInfoShowDistanceSQ = 562000;

/** Texture used for the generic human icon */
var Texture2D GenericHumanIconTexture;

/** Boss icon texture/values */
var Texture2D BossIconTexture;
var color BossIconColor;

simulated function PostBeginPlay()
{
    local KFPawn_MonsterBoss KFPMB;

    super.PostBeginPlay();
 
    // If we have a new HUD, try to cache a reference to boss pawn
    foreach WorldInfo.AllPawns( class'KFPawn_MonsterBoss', KFPMB )
    {
        BossPawn = KFPMB;
        break;
    }
}

function CreateHUDMovie()
{
    if (!class'WorldInfo'.static.IsMenuLevel())
    {       
        if(HudMovie != none)
        {
            RemoveMovies();
        }
        HudMovie = new GetHUDClass();
        HudMovie.SetTimingMode(TM_Real);
        HudMovie.Init(class'Engine'.static.GetEngine().GamePlayers[HudMovie.LocalPlayerOwnerIndex]);
    }
}

function class<KFGFxMoviePlayer_HUD> GetHUDClass()
{
    if( KFPlayerOwner != none && KFPlayerOwner.GetTeamNum() == 255 && KFPlayerOwner.PlayerReplicationInfo != none && !KFPlayerOwner.PlayerReplicationInfo.bOnlySpectator )
    {
        return ZedHUDClass;
    }

    return HumanHUDClass;
}

function DrawHUD()
{
    local PlayerReplicationInfo PRI;
    local KFPlayerReplicationInfoVersus KFPRIV;
    local float ThisDot;
    local vector ViewLocation, ViewVector, PawnLocation;
    local rotator ViewRotation;
    local Pawn TestPawn;
    local KFPawn_Human HumanPawn;
    local array<PlayerReplicationInfo> VisibleHumanPlayers;
    local array<sHiddenHumanPawnInfo> HiddenHumanPlayers;
    local int i, HiddenHumanIndex;

    super.DrawHUD();

    if( KFPlayerOwner.PlayerCamera != none )
    {
        KFPlayerOwner.PlayerCamera.GetCameraViewPoint( ViewLocation, ViewRotation );
    }

    // Enable stencil test
    Canvas.EnableStencilTest(true);

    // Cache off view rotation vector
    ViewVector = vector(ViewRotation);

    if( KFPlayerOwner != none && KFPlayerOwner.GetTeamNum() == 255 )
    {
        foreach WorldInfo.AllPawns( class'Pawn', TestPawn )   
        {
            if( TestPawn.IsAliveAndWell() && TestPawn != BossPawn && TestPawn != KFPlayerOwner.Pawn )
            {
                if( TestPawn.Mesh != none && `TimeSince( TestPawn.Mesh.LastRenderTime ) < 0.2f )
                {
                    ThisDot = Normal(TestPawn.Location - ViewLocation) dot ViewVector;
                    if( ThisDot > 0.f )
                    {
                        HumanPawn = KFPawn_Human(TestPawn);
                        if( HumanPawn != none )
                        {
                            if( DrawPreciseEnemyHumanHUD( HumanPawn ) )
                            {
                                VisibleHumanPlayers.AddItem( HumanPawn.PlayerReplicationInfo );
                            }
                            else
                            {
                                HiddenHumanPlayers.Insert( 0, 1 );
                                HiddenHumanPlayers[0].HumanPawn = TestPawn;
                                HiddenHumanPlayers[0].HumanPRI = HumanPawn.PlayerReplicationInfo;
                            }
                        }
                        else if( TestPawn.GetTeamNum() == 255 )
                        {
                            if( VSizeSq( KFPlayerOwner.ViewTarget.Location - TestPawn.Location ) <= FriendlyZedInfoShowDistanceSQ )
                            {
                                DrawFriendlyZedHUD( TestPawn );
                            }
                        }
                    }
                }
                else if( TestPawn.GetTeamNum() == 0 )
                {
                    HiddenHumanPlayers.Insert( 0, 1 );
                    HiddenHumanPlayers[0].HumanPawn = TestPawn;
                    HiddenHumanPlayers[0].HumanPRI = TestPawn.PlayerReplicationInfo;
                }
            }
        }

        // Draw the hidden players
        for( i = 0; i < WorldInfo.GRI.PRIArray.Length; ++i )
        {
            // Avoid casting until we've got some simple checks out of the way
            PRI = WorldInfo.GRI.PRIArray[i];

            // Only humans
            if( PRI.GetTeamNum() == PlayerOwner.GetTeamNum() ||
                VisibleHumanPlayers.Find( PRI ) != INDEX_NONE )
            {
                continue;
            }

            // Use the real pawn location if the pawn is still relevant
            HiddenHumanIndex = HiddenHumanPlayers.Find( 'HumanPRI', PRI );
            if( HiddenHumanIndex != INDEX_NONE && HiddenHumanPlayers[HiddenHumanIndex].HumanPawn != none )
            {
                PawnLocation = HiddenHumanPlayers[HiddenHumanIndex].HumanPawn.Location;
            }

            // Otherwise we'll use our replicated location
            if( IsZero(PawnLocation) )
            {
                KFPRIV = KFPlayerReplicationInfoVersus( PRI );
                PawnLocation = KFPRIV.GetReplicatedPawnIconLocation(HumanPlayerIconInterpMult);
                if( IsZero(PawnLocation) )
                {
                    continue;
                }
            }

            // FOV pre-check (further per-pixel filtering after screen projection is done)
            ThisDot = Normal(PawnLocation - ViewLocation) dot ViewVector;
            if( ThisDot > 0.f )
            {
                DrawEnemyHumanHUD( PRI, PawnLocation );
            }
        }      
    }

    // Draw boss pawn icon if needed
    if( BossPawn != none
        && BossPawn != PlayerOwner.Pawn
        && BossPawn.IsAliveAndWell()
        && `TimeSince( BossPawn.Mesh.LastRenderTime ) > 0.2f
        && (PlayerOwner.GetTeamNum() == 255 || BossPawn.ShouldDrawBossIcon()) )
    {
        ThisDot = Normal( BossPawn.Location - ViewLocation ) dot ViewVector;
        if( ThisDot > 0.f )
        {
            DrawBossHUD();
        }
    }

    // Disable stencil test
    Canvas.EnableStencilTest(false);
}

function DrawZedPlayerHud();

simulated function DrawFriendlyZedHUD( Pawn MonsterPawn )
{
    local float Percentage;
    local float BarHeight, BarLength;
    local vector ScreenPos, TargetLocation;
    local FontRenderInfo MyFontRenderInfo;
    local float FontScale;
    //local color TempColor;

    MyFontRenderInfo = Canvas.CreateFontRenderInfo( true );
    BarLength = FMin(HumanStatusBarLengthMax * (float(Canvas.SizeX) / 1024.f), HumanStatusBarLengthMax) * FriendlyHudScale;
    BarHeight = FMin(8.f * (float(Canvas.SizeX) / 1024.f), 8.f) * FriendlyHudScale;

    TargetLocation = MonsterPawn.Location + vect(0,0,1) * MonsterPawn.GetCollisionHeight() * 1.2;

    ScreenPos = Canvas.Project(TargetLocation);
    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return;
    }

    //Draw health bar
    Percentage = FMin(float(MonsterPawn.Health) / float(MonsterPawn.HealthMax), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength *0.5f), ScreenPos.Y, HealthColor);

    //Draw player name (Top)
    FontScale = class'KFGameEngine'.Static.GetKFFontScale();
    Canvas.Font = class'KFGameEngine'.Static.GetKFCanvasFont();
    Canvas.SetDrawColorStruct(PlayerBarTextColor);
    Canvas.SetPos(ScreenPos.X - (BarLength *0.5f), ScreenPos.Y - BarHeight * 3);
    Canvas.DrawText( MonsterPawn.PlayerReplicationInfo.PlayerName,,FontScale * FriendlyHudScale,FontScale * FriendlyHudScale, MyFontRenderInfo );
}

/** Displays icons where enemy human players are */
function DrawEnemyHumanHUD( PlayerReplicationInfo PRI, vector IconWorldLocation )
{
    local vector ScreenPos;
    local float IconSizeMult;

    // Project world pos to canvas
    ScreenPos = Canvas.Project( IconWorldLocation + vect(0,0,1) * class'KFPAwn_Human'.default.CylinderComponent.CollisionHeight * 1.2 );

    // Fudge by icon size
    IconSizeMult = PlayerStatusIconSize * FriendlyHudScale * 0.5f;
    ScreenPos.X -= IconSizeMult;
    ScreenPos.Y -= IconSizeMult;

    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return;
    }

    // Draw human icon
    Canvas.SetDrawColor(255,255,255,255);
    Canvas.SetPos( ScreenPos.X, ScreenPos.Y );
    Canvas.DrawTile( GenericHumanIconTexture, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256 );
}

function bool DrawPreciseEnemyHumanHUD( KFPawn_Human KFPH )
{
    local float Percentage;
    local float BarHeight, BarLength;
    local vector ScreenPos, TargetLocation;
    local KFPlayerReplicationInfo KFPRI;
    local float IconSizeMult;

    KFPRI = KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo);
    if( KFPRI == none )
    {        
        return false;
    }

    BarLength = FMin( HumanStatusBarLengthMax * (float(Canvas.SizeX) / 1024.f), HumanStatusBarLengthMax ) * FriendlyHudScale;
    BarHeight = FMin( 8.f * (float(Canvas.SizeX) / 1024.f), 8.f ) * FriendlyHudScale;

    TargetLocation = KFPH.Location + vect(0,0,1) * KFPH.GetCollisionHeight() * 1.2;

    ScreenPos = Canvas.Project(TargetLocation);
    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return true;
    }

    //Draw health bar
    Percentage = FMin( float(KFPH.Health) / float(KFPH.HealthMax), 100  );
    DrawKFBar( Percentage, BarLength, BarHeight, ScreenPos.X - BarLength * 0.5f, ScreenPos.Y, HealthColor );
    //Draw armor bar
    Percentage = FMin(float(KFPH.Armor) / float(KFPH.MaxArmor), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength *0.5f), ScreenPos.Y - BarHeight, ArmorColor);

    IconSizeMult = PlayerStatusIconSize * FriendlyHudScale * 0.5f;
    ScreenPos.X -= IconSizeMult;
    ScreenPos.Y -= IconSizeMult * 2.5;

    Canvas.SetDrawColor(255,255,255,255);
    Canvas.SetPos( ScreenPos.X, ScreenPos.Y );
    Canvas.DrawTile( /*KFPRI.CurrentPerkClass.default.PerkIcon*/GenericHumanIconTexture, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256 );
    return true;
}

/**
 * @brief Draws an icon projecting the boss' world position on the screen
 * 
 * @param BossPawn The boss' pawn
 */
function DrawBossHUD()
{
    local vector ScreenPos, TargetLocation;
    local float IconSizeMult;

    TargetLocation = BossPawn.Location + vect(0,0,1) * BossPawn.GetCollisionHeight() * 1.2;
    ScreenPos = Canvas.Project( TargetLocation );
    IconSizeMult = PlayerStatusIconSize * FriendlyHudScale * 0.5f;
    ScreenPos.X -= IconSizeMult;
    ScreenPos.Y -= IconSizeMult;

    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || 
        ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return;
    }   
  
     // Draw boss icon
    Canvas.SetDrawColorStruct( BossIconColor );
    Canvas.SetPos( ScreenPos.X, ScreenPos.Y );
    Canvas.DrawTile( BossIconTexture, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256 );
}

DefaultProperties
{
    HUDClass=class'KFGFxMoviePlayer_HUD'
    HumanHUDClass=class'KFGFxMoviePlayer_HUD'
    ZedHUDClass=class'KFGFxMoviePlayer_HUD_Versus'

    ZedPlayerHudLocX=0.25
    ZedPlayerHudLocY=0.85

    HumanPlayerIconInterpMult=0.007f
    HumanStatusBarLengthMax = 80.0f;

    GenericHumanIconTexture=Texture2D'UI_PerkIcons_TEX.UI_Horzine_H_Logo'
    BossIconTexture=Texture2D'ZED_Patriarch_UI.ZED-VS_Icon_Boss'
    BossIconColor=(R=255, G=255, B=255, A=192)
}