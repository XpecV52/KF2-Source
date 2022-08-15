/*******************************************************************************
 * MobileHUD generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MobileHUD extends HUD
    transient
    native
    config(Game)
    hidecategories(Navigation);

var config bool bShowGameHud;
var config bool bShowMobileHud;
var globalconfig bool bForceMobileHUD;
var config bool bShowMobileTilt;
var config bool bDebugTouches;
var config bool bDebugZones;
var config bool bDebugZonePresses;
var config bool bShowMotionDebug;
var Texture2D JoystickBackground;
var TextureUVs JoystickBackgroundUVs;
var Texture2D JoystickHat;
var TextureUVs JoystickHatUVs;
var Texture2D ButtonImages[2];
var TextureUVs ButtonUVs[2];
var Font ButtonFont;
var Color ButtonCaptionColor;
var Texture2D TrackballBackground;
var TextureUVs TrackballBackgroundUVs;
var Texture2D TrackballTouchIndicator;
var TextureUVs TrackballTouchIndicatorUVs;
var Texture2D SliderImages[4];
var TextureUVs SliderUVs[4];
var config float MobileTiltX;
var config float MobileTiltY;
var config float MobileTiltSize;
var array<SeqEvent_HudRender> KismetRenderEvents;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    if(WorldInfo.IsConsoleBuild(3) || bForceMobileHUD)
    {        
    }
    else
    {
        bShowGameHud = true;
    }
    RefreshKismetLinks();
}

function PostRender()
{
    local MobilePlayerInput MPI;

    super.PostRender();
    if(Class'GameEngine'.static.HasSecondaryScreenActive() == false)
    {
        if(ShowMobileHud())
        {
            DrawInputZoneOverlays();
        }
        RenderMobileMenu();
    }
    if(bShowMotionDebug)
    {
        MPI = MobilePlayerInput(PlayerOwner.PlayerInput);
        if(MPI != none)
        {
            Canvas.SetDrawColor(255, 255, 255, 255);
            Canvas.SetPos(0, 70);
            DrawMobileDebugString(0, 90, "[Mobile Motion]");
            DrawMobileDebugString(0, 110, (((("Attitude: Pitch=" $ string(MPI.aTilt.X)) @ "Yaw=") $ string(MPI.aTilt.Y)) @ "Roll=") $ string(MPI.aTilt.Z));
            DrawMobileDebugString(0, 130, (("Rotation:" @ string(MPI.aRotationRate.X)) @ string(MPI.aRotationRate.Y)) @ string(MPI.aRotationRate.Z));
            DrawMobileDebugString(0, 150, (("Gravity:" @ string(MPI.aGravity.X)) @ string(MPI.aGravity.Y)) @ string(MPI.aGravity.Z));
            DrawMobileDebugString(0, 170, (("Accleration:" @ string(MPI.aAcceleration.X)) @ string(MPI.aAcceleration.Y)) @ string(MPI.aAcceleration.Z));
        }
    }
    RenderKismetHud();
}

function DrawMobileDebugString(float XPos, float YPos, string Str)
{
    Canvas.SetDrawColor(0, 0, 0, 255);
    Canvas.SetPos(XPos, YPos);
    Canvas.DrawText(Str);
    Canvas.SetPos(XPos + float(1), YPos + float(1));
    Canvas.DrawColor = WhiteColor;
    Canvas.DrawText(Str);
}

function bool ShowMobileHud()
{
    return bShowMobileHud && bShowHUD;
}

function RenderMobileMenu()
{
    local MobilePlayerInput MobileInput;
    local float Y;
    local int I;

    MobileInput = MobilePlayerInput(PlayerOwner.PlayerInput);
    if(MobileInput == none)
    {
        return;
    }
    if(bDebugTouches)
    {
        Y = 20;
        Canvas.SetDrawColor(255, 255, 255, 255);
        I = 0;
        J0x90:

        if(I < 5)
        {
            Canvas.SetPos(0, Y);
            Canvas.DrawText((((("" $ string(I)) @ string(MobileInput.Touches[I].bInUse)) @ string(MobileInput.Touches[I].State)) @ string(MobileInput.Touches[I].Zone)) @ string(MobileInput.Touches[I].Handle));
            Y += float(10);
            ++ I;
            goto J0x90;
        }
    }
    MobileInput.RenderMenus(Canvas, WorldInfo.DeltaSeconds);
}

function DrawInputZoneOverlays()
{
    local int ZoneIndex;
    local MobileInputZone Zone;
    local float Fade;
    local MobilePlayerInput MobileInput;
    local array<MobileInputZone> Zones;

    if(!bShowHUD)
    {
        return;
    }
    MobileInput = MobilePlayerInput(PlayerOwner.PlayerInput);
    if(MobileInput == none)
    {
        return;
    }
    Canvas.Reset();
    Canvas.ClipX = float(Canvas.SizeX);
    Canvas.ClipY = float(Canvas.SizeY);
    Canvas.Font = Class'Engine'.static.GetSmallFont();
    if(MobileInput.HasZones())
    {
        Zones = MobileInput.GetCurrentZones();
    }
    ZoneIndex = 0;
    J0x185:

    if(ZoneIndex < Zones.Length)
    {
        Zone = Zones[ZoneIndex];
        if(!Zone.bIsInvisible)
        {
            Canvas.DrawColor = Zone.RenderColor;
            Canvas.DrawColor.A *= Zone.AnimatingFadeOpacity;
            switch(Zone.State)
            {
                case 0:
                    Canvas.DrawColor.A *= Zone.InactiveAlpha;
                    break;
                case 1:
                    Fade = Lerp(Zone.InactiveAlpha, 1, Zone.TransitionTime / Zone.ActivateTime);
                    Canvas.DrawColor.A *= Fade;
                    break;
                case 3:
                    Fade = Lerp(1, Zone.InactiveAlpha, Zone.TransitionTime / Zone.DeactivateTime);
                    Canvas.DrawColor.A *= Fade;
                    break;
                default:
                    break;
            }
            if(Canvas.DrawColor.A <= 0)
            {
                goto J0x711;
            }
            if(!Zone.OnPreDrawZone(Zone, Canvas))
            {
                switch(Zone.Type)
                {
                    case 0:
                        DrawMobileZone_Button(Zone);
                        break;
                    case 1:
                        DrawMobileZone_Joystick(Zone);
                        break;
                    case 2:
                        DrawMobileZone_Trackball(Zone);
                        break;
                    case 3:
                        DrawMobileZone_Slider(Zone);
                        break;
                    default:
                        break;
                }
                Zone.OnPostDrawZone(Zone, Canvas);
            }
        }
        if(bShowMobileTilt)
        {
            DrawMobileTilt(MobileInput);
        }
        if(bDebugZones || bDebugZonePresses && (Zone.State == 2) || Zone.State == 1)
        {
            Canvas.SetDrawColor(0, 255, 255, 255);
            Canvas.SetPos(Zone.X, Zone.Y);
            Canvas.DrawBox(Zone.SizeX, Zone.SizeY);
        }
        J0x711:

        ++ ZoneIndex;
        goto J0x185;
    }
}

function DrawMobileZone_Button(MobileInputZone Zone)
{
    local int Pressed;
    local float X, Y, U, V, UL, VL,
	    A;

    local Texture2D Tex;

    Pressed = int(Zone.State == 2);
    if(ButtonImages[Pressed] != none)
    {
        Canvas.SetPos(Zone.X, Zone.Y);
        if((Pressed == 0) && Zone.OverrideTexture1 != none)
        {
            Tex = Zone.OverrideTexture1;
            U = Zone.OverrideUVs1.U;
            V = Zone.OverrideUVs1.V;
            UL = Zone.OverrideUVs1.UL;
            VL = Zone.OverrideUVs1.VL;            
        }
        else
        {
            if((Pressed == 1) && Zone.OverrideTexture2 != none)
            {
                Tex = Zone.OverrideTexture2;
                U = Zone.OverrideUVs2.U;
                V = Zone.OverrideUVs2.V;
                UL = Zone.OverrideUVs2.UL;
                VL = Zone.OverrideUVs2.VL;                
            }
            else
            {
                Tex = ButtonImages[Pressed];
                U = ButtonUVs[Pressed].U;
                V = ButtonUVs[Pressed].V;
                UL = ButtonUVs[Pressed].UL;
                VL = ButtonUVs[Pressed].VL;
            }
        }
        Canvas.DrawTile(Tex, Zone.ActiveSizeX, Zone.ActiveSizeY, U, V, UL, VL);
        if(Zone.Caption != "")
        {
            if(ButtonFont != none)
            {
                Canvas.Font = ButtonFont;
            }
            Canvas.StrLen(Zone.Caption, UL, VL);
            X = (Zone.X + (Zone.SizeX / float(2))) - (UL / float(2));
            Y = (Zone.Y + (Zone.SizeY / float(2))) - (VL / float(2));
            Canvas.SetPos(X + Zone.CaptionXAdjustment, Y + Zone.CaptionYAdjustment);
            A = float(Canvas.DrawColor.A);
            Canvas.DrawColor = ButtonCaptionColor;
            Canvas.DrawColor.A = byte(A);
            Canvas.DrawText(Zone.Caption);
        }
    }
}

function DrawMobileZone_Joystick(MobileInputZone Zone)
{
    local int X, Y, Width, Height;
    local Color LineColor;
    local float ClampedX, ClampedY, Scale;
    local Color TempColor;

    if((Zone.OverrideTexture1 != none) || JoystickBackground != none)
    {
        Width = int(Zone.ActiveSizeX);
        Height = int(Zone.ActiveSizeY);
        X = int(Zone.CurrentCenter.X - float(Width / 2));
        Y = int(Zone.CurrentCenter.Y - float(Height / 2));
        Canvas.SetPos(float(X), float(Y));
        if(Zone.OverrideTexture1 != none)
        {
            Canvas.DrawTile(Zone.OverrideTexture1, float(Width), float(Height), Zone.OverrideUVs1.U, Zone.OverrideUVs1.V, Zone.OverrideUVs1.UL, Zone.OverrideUVs1.VL);            
        }
        else
        {
            Canvas.DrawTile(JoystickBackground, float(Width), float(Height), JoystickBackgroundUVs.U, JoystickBackgroundUVs.V, JoystickBackgroundUVs.UL, JoystickBackgroundUVs.VL);
        }
    }
    if((Zone.OverrideTexture2 != none) || JoystickHat != none)
    {
        ClampedX = Zone.CurrentLocation.X - Zone.CurrentCenter.X;
        ClampedY = Zone.CurrentLocation.Y - Zone.CurrentCenter.Y;
        Scale = 1;
        if((ClampedX != float(0)) || ClampedY != float(0))
        {
            Scale = float(Min(int(Zone.ActiveSizeX), int(Zone.ActiveSizeY))) / (2 * Sqrt((ClampedX * ClampedX) + (ClampedY * ClampedY)));
            Scale = FMin(1, Scale);
        }
        ClampedX = (ClampedX * Scale) + Zone.CurrentCenter.X;
        ClampedY = (ClampedY * Scale) + Zone.CurrentCenter.Y;
        if(Zone.bRenderGuides)
        {
            TempColor = Canvas.DrawColor;
            LineColor.R = 128;
            LineColor.G = 128;
            LineColor.B = 128;
            LineColor.A = 255;
            Canvas.Draw2DLine(Zone.CurrentCenter.X, Zone.CurrentCenter.Y, ClampedX, ClampedY, LineColor);
            Canvas.DrawColor = TempColor;
        }
        Width = int(Zone.ActiveSizeX * 0.65);
        Height = int(Zone.ActiveSizeY * 0.65);
        Canvas.SetPos(ClampedX - float(Width / 2), ClampedY - float(Height / 2));
        if(Zone.OverrideTexture2 != none)
        {
            Canvas.DrawTile(Zone.OverrideTexture2, float(Width), float(Height), Zone.OverrideUVs2.U, Zone.OverrideUVs2.V, Zone.OverrideUVs2.UL, Zone.OverrideUVs2.VL);            
        }
        else
        {
            Canvas.DrawTile(JoystickHat, float(Width), float(Height), JoystickHatUVs.U, JoystickHatUVs.V, JoystickHatUVs.UL, JoystickHatUVs.VL);
        }
    }
}

function DrawMobileZone_Trackball(MobileInputZone Zone)
{
    local int Width, Height;

    if((Zone.OverrideTexture1 != none) || TrackballBackground != none)
    {
        Canvas.SetPos(Zone.X, Zone.Y);
        if(Zone.OverrideTexture1 != none)
        {
            Canvas.DrawTile(Zone.OverrideTexture1, Zone.SizeX, Zone.SizeY, Zone.OverrideUVs1.U, Zone.OverrideUVs1.V, Zone.OverrideUVs1.UL, Zone.OverrideUVs1.VL);            
        }
        else
        {
            Canvas.DrawTile(TrackballBackground, Zone.SizeX, Zone.SizeY, TrackballBackgroundUVs.U, TrackballBackgroundUVs.V, TrackballBackgroundUVs.UL, TrackballBackgroundUVs.VL);
        }
    }
    if(((Zone.OverrideTexture2 != none) || TrackballTouchIndicator != none) && (Zone.State == 2) || Zone.State == 1)
    {
        Width = int(Zone.ActiveSizeX * 0.65);
        Height = int(Zone.ActiveSizeY * 0.65);
        Canvas.SetPos(Zone.CurrentLocation.X - float(Width / 2), Zone.CurrentLocation.Y - float(Height / 2));
        if(Zone.OverrideTexture2 != none)
        {
            Canvas.DrawTile(Zone.OverrideTexture2, float(Width), float(Height), Zone.OverrideUVs2.U, Zone.OverrideUVs2.V, Zone.OverrideUVs2.UL, Zone.OverrideUVs2.VL);            
        }
        else
        {
            Canvas.DrawTile(TrackballTouchIndicator, float(Width), float(Height), TrackballTouchIndicatorUVs.U, TrackballTouchIndicatorUVs.V, TrackballTouchIndicatorUVs.UL, TrackballTouchIndicatorUVs.VL);
        }
    }
}

function DrawMobileTilt(MobilePlayerInput MobileInput)
{
    local float X, Y, Scale, Yaw, Pitch;

    Yaw = (2 * FClamp(MobileInput.MobileYaw - MobileInput.MobileYawCenter, -0.5, 0.5)) * MobileInput.MobileYawMultiplier;
    Pitch = (2 * FClamp(MobileInput.MobilePitch - MobileInput.MobilePitchCenter, -0.5, 0.5)) * MobileInput.MobilePitchMultiplier;
    X = (MobileTiltX + ((Yaw * MobileTiltSize) / float(2))) - MobileTiltX;
    Y = (MobileTiltY + ((Pitch * MobileTiltSize) / float(2))) - MobileTiltY;
    Scale = 1;
    if((X != float(0)) || Y != float(0))
    {
        Scale = MobileTiltSize / (2 * Sqrt(((X * X) * Y) * Y));
        Scale = FMin(1, Scale);
    }
    X = (X * Scale) + MobileTiltX;
    Y = (Y * Scale) + MobileTiltY;
    Canvas.DrawColor = WhiteColor;
    Canvas.Draw2DLine(MobileTiltX, MobileTiltY, X, Y, Canvas.DrawColor);
}

function DrawMobileZone_Slider(MobileInputZone Zone)
{
    local float X, Y;
    local TextureUVs UVs;
    local Texture2D Tex;

    if(Zone.OverrideTexture1 != none)
    {
        Tex = Zone.OverrideTexture1;
        UVs = Zone.OverrideUVs1;        
    }
    else
    {
        Tex = SliderImages[Zone.SlideType];
        UVs = SliderUVs[Zone.SlideType];
    }
    X = ((Zone.SlideType > 1) ? Zone.CurrentLocation.X - (Zone.ActiveSizeX * 0.5) : Zone.X);
    Y = ((Zone.SlideType > 1) ? Zone.Y : Zone.CurrentLocation.Y - (Zone.ActiveSizeY * 0.5));
    Canvas.SetPos(X, Y);
    Canvas.DrawTile(Tex, Zone.ActiveSizeX, Zone.ActiveSizeY, UVs.U, UVs.V, UVs.UL, UVs.VL);
}

function RefreshKismetLinks()
{
    local array<SequenceObject> HudEvents;
    local Sequence GameSeq;
    local int I;

    GameSeq = WorldInfo.GetGameSequence();
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'SeqEvent_HudRender', true, HudEvents);
        I = 0;
        J0x75:

        if(I < HudEvents.Length)
        {
            AddKismetRenderEvent(SeqEvent_HudRender(HudEvents[I]));
            ++ I;
            goto J0x75;
        }
    }
}

function AddKismetRenderEvent(SeqEvent_HudRender NewEvent)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < KismetRenderEvents.Length)
    {
        if(KismetRenderEvents[I] == NewEvent)
        {
            return;
        }
        ++ I;
        goto J0x0B;
    }
    I = 0;
    J0x5F:

    if(I < KismetRenderEvents.Length)
    {
        if(KismetRenderEvents[I] == none)
        {
            KismetRenderEvents[I] = NewEvent;
            return;
        }
        ++ I;
        goto J0x5F;
    }
    KismetRenderEvents.AddItem(NewEvent;
}

function RenderKismetHud()
{
    local int I;
    local array<byte> boolVars;

    I = 0;
    J0x0B:

    if(I < KismetRenderEvents.Length)
    {
        boolVars.Length = 0;
        KismetRenderEvents[I].GetBoolVars(boolVars, "Active");
        if(((boolVars.Length == 0) || boolVars[0] != 0) && KismetRenderEvents[I].bIsActive)
        {
            if((KismetRenderEvents[I] != none) && KismetRenderEvents[I].bIsActive)
            {
                KismetRenderEvents[I].Render(Canvas, self);
            }
        }
        ++ I;
        goto J0x0B;
    }
}

defaultproperties
{
    bShowMobileHud=true
    JoystickBackgroundUVs=(U=0,V=0,UL=64,VL=64)
    JoystickHatUVs=(U=0,V=0,UL=64,VL=64)
    ButtonUVs[0]=(U=0,V=0,UL=64,VL=64)
    ButtonUVs[1]=(U=0,V=0,UL=64,VL=64)
    TrackballBackgroundUVs=(U=0,V=0,UL=64,VL=64)
    TrackballTouchIndicatorUVs=(U=0,V=0,UL=64,VL=64)
    SliderUVs[0]=(U=0,V=0,UL=64,VL=64)
    SliderUVs[1]=(U=0,V=0,UL=64,VL=64)
    SliderUVs[2]=(U=0,V=0,UL=64,VL=64)
    SliderUVs[3]=(U=0,V=0,UL=64,VL=64)
}