//=============================================================================
// KFObj_Coop
//=============================================================================
// Base class for the KF2 co-op objectives triggered by gameplay events
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Coop extends KFObjective;

var	int								ObjDoshReward;
var	int								ObjExpReward;

simulated function HideObj();
function CheckEndConditions();

simulated function DrawObjectiveTargets(Canvas C)
{
	local vector ScreenPos;
	local string Distance;
   	local KFPawn_Human KFPH, MyKFPH;
	local KFPlayerController KFPC;
	local float Dim, StringSizeX, StringSizeY;

	Dim = 48;
  	C.SetDrawColor(0, 230, 255);
  	
  	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		MyKFPH = KFPawn_Human(KFPC.Pawn);
		if ( MyKFPH != none )
		{
			break;
		}
	}

	if ( MyKFPH.bObjectivePlayer )
	{
		return;
	}

	foreach WorldInfo.Allpawns(class'KFPawn_Human', KFPH)
	{
		if ( KFPH.bObjectivePlayer && KFPH.IsAliveAndWell() )
		{
			ScreenPos = C.Project(KFPH.Location);
    		if ( ScreenPos.Z > 0 )
			{
				if ( ScreenPos.X >= C.ClipX )
				{
					ScreenPos.X = C.ClipX - Dim / 2;
				}
				else if ( ScreenPos.X <= 0 )
				{
					ScreenPos.X = Dim / 2;
				}
			}
			else
			{
				if ( ScreenPos.X >= C.SizeX / 2)
				{
					ScreenPos.X = Dim / 2;
				}
				else
				{
					ScreenPos.X = C.ClipX - Dim / 2;
				}
			}

			if ( ScreenPos.Y >= C.ClipY )
			{
				ScreenPos.Y = C.ClipY - Dim / 2;
			}
			else if ( ScreenPos.Y <= 0 )
			{
				ScreenPos.Y = Dim / 2;
			}

			Distance = Round(VSize(KFPH.Location - MyKFPH.Location) / 100) $ "m";
			C.StrLen(Distance, StringSizeX, StringSizeY);

			C.SetPos(ScreenPos.X - Dim / 2, ScreenPos.Y - Dim / 2);
			C.DrawTile(ObjWorldTex, Dim, Dim, 0, 0, 256, 256);

			C.SetPos(ScreenPos.X -  StringSizeX / 2, ScreenPos.Y + Dim / 2);
			C.DrawText(Distance, false);
		}
	}

	C.Reset();
}

DefaultProperties
{
	bIsCoopObjective=true
}

