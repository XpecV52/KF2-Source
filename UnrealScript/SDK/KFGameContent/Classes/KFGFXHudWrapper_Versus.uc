class KFGFXHudWrapper_Versus extends KFGFXHudWrapper;

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
    local KFPlayerReplicationInfoVersus KFPRIV;
    local float ThisDot;
    local vector ViewLocation, ViewVector, PawnLocation;
    local rotator ViewRotation;
    local Pawn TestPawn;
    local KFPawn_Human HumanPawn;
    local KFPAwn_Monster MonsterPawn;
    local array<PlayerReplicationInfo> VisibleHumanPlayers;
    local int i;
    local PlayerReplicationInfo PRI;
    super.DrawHUD();

    if( KFPlayerOwner.PlayerCamera != none )
    {
        KFPlayerOwner.PlayerCamera.GetCameraViewPoint( ViewLocation, ViewRotation );
    }

    ViewVector = vector(ViewRotation);

    if( KFPlayerOwner != none && KFPlayerOwner.GetTeamNum() == 255 )
    {
        // Draw the visible players
        Canvas.EnableStencilTest(true);
        foreach WorldInfo.AllPawns( class'Pawn', TestPawn )   
        {
            if( TestPawn != BossPawn && TestPawn != KFPlayerOwner.Pawn )
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
                        }
                        else
                        {
                            MonsterPawn = KFPawn_Monster(TestPawn);
                            if( MonsterPawn != none &&
                                VSizeSq( KFPlayerOwner.ViewTarget.Location - MonsterPawn.Location ) <= FriendlyZedInfoShowDistanceSQ )
                            {
                                DrawFriendlyZedHUD( MonsterPawn );
                            }
                        }
                    }
                }
            }
        }

        // Draw the hidden players
        for( i = 0; i < WorldInfo.GRI.PRIArray.Length; i++ )
        {
            // Avoid casting until we've got some simple checks out of the way
            PRI = WorldInfo.GRI.PRIArray[i];

            // Only humans
            if( PRI.GetTeamNum() == PlayerOwner.GetTeamNum() ||
                VisibleHumanPlayers.Find( PRI ) != INDEX_NONE )
            {
                continue;
            }

            KFPRIV = KFPlayerReplicationInfoVersus( WorldInfo.GRI.PRIArray[i] );
            PawnLocation = KFPRIV.GetReplicatedPawnIconLocation(HumanPlayerIconInterpMult);
            if ( IsZero(PawnLocation) )
            {
                continue;
            }

            // FOV pre-check (further per-pixel filtering after screen projection is done)
            ThisDot = Normal(PawnLocation - ViewLocation) dot ViewVector;
            if( ThisDot > 0 )
            {
                DrawEnemyHumanHUD( KFPRIV, PawnLocation );
            }
        }
       
        Canvas.EnableStencilTest(false);  
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
}

function DrawZedPlayerHud();

simulated function DrawFriendlyZedHUD( KFPawn_Monster KFPM )
{
    local float Percentage;
    local float BarHeight, BarLength;
    local vector ScreenPos, TargetLocation;
    local KFPlayerReplicationInfo KFPRI;
    local FontRenderInfo MyFontRenderInfo;
    local float FontScale;
    //local color TempColor;

    KFPRI = KFPlayerReplicationInfo(KFPM.PlayerReplicationInfo);

    if( KFPRI == none )
    {
        return;
    }

    MyFontRenderInfo = Canvas.CreateFontRenderInfo( true );
    BarLength = FMin(HumanStatusBarLengthMax * (float(Canvas.SizeX) / 1024.f), HumanStatusBarLengthMax) * FriendlyHudScale;
    BarHeight = FMin(8.f * (float(Canvas.SizeX) / 1024.f), 8.f) * FriendlyHudScale;

    TargetLocation = KFPM.Location + vect(0,0,1) * KFPM.GetCollisionHeight() * 1.2;

    ScreenPos = Canvas.Project(TargetLocation);
    if( ScreenPos.X < 0 || ScreenPos.X > Canvas.SizeX || ScreenPos.Y < 0 || ScreenPos.Y > Canvas.SizeY )
    {
        return;
    }

    //Draw health bar
    Percentage = FMin(float(KFPM.Health) / float(KFPM.HealthMax), 100);
    DrawKFBar(Percentage, BarLength, BarHeight, ScreenPos.X - (BarLength *0.5f), ScreenPos.Y, HealthColor);

    //Draw player name (Top)
    FontScale = class'KFGameEngine'.Static.GetKFFontScale();
    Canvas.Font = class'KFGameEngine'.Static.GetKFCanvasFont();
    Canvas.SetDrawColorStruct(PlayerBarTextColor);
    Canvas.SetPos(ScreenPos.X - (BarLength *0.5f), ScreenPos.Y - BarHeight * 3);
    Canvas.DrawText( KFPRI.PlayerName,,FontScale * FriendlyHudScale,FontScale * FriendlyHudScale, MyFontRenderInfo );
}

/** Displays icons where enemy human players are */
function DrawEnemyHumanHUD( KFPlayerReplicationInfoVersus KFPRIV, vector IconWorldLocation )
{
    local vector ScreenPos;
    local float IconSizeMult;
  
    if( KFPRIV.CurrentPerkClass == none )
    {
        return;
    }

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
    Canvas.DrawTile( /*KFPRIV.CurrentPerkClass.default.PerkIcon*/GenericHumanIconTexture, PlayerStatusIconSize * FriendlyHudScale, PlayerStatusIconSize * FriendlyHudScale, 0, 0, 256, 256 );
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