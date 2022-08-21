/*******************************************************************************
 * KFGFxHUD_ChatBoxWidget generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFGFxHUD_ChatBoxWidget extends GFxObject within GFxMoviePlayer;

var bool bChatBoxVisible;

function Init()
{
    local KFPlayerController KFPC;

    SetVisible(false);
    KFPC = KFPlayerController(Outer.GetPC());
    if((((KFPC != none) && KFPC.MyGFxHUD != none) && KFPC.MyGFxHUD.HudChatBox != none) && KFPC.MyGFxHUD.HudChatBox != self)
    {
        SetDataObjects(KFPC.MyGFxHUD.HudChatBox.GetDataObjects());
    }
}

function AddChatMessage(string NewMessage, string HexVal)
{
    ActionScriptVoid("addChatMessage");
}

function OpenInputField()
{
    ActionScriptVoid("onOpenInput");
}

function array<GFxObject> GetDataObjects()
{
    local array<GFxObject> Retval;

    Retval = ActionScriptArray("getDataObjects");
    return Retval;
}

function SetDataObjects(array<GFxObject> DataObjects)
{
    local GFxObject DataProvider, TempObj;
    local byte I;

    DataProvider = Outer.CreateArray();
    I = 0;
    J0x35:

    if(I < DataObjects.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", DataObjects[I].GetString("label"));
        TempObj.SetString("messageClr", DataObjects[I].GetString("messageClr"));
        TempObj.SetFloat("timeStamp", DataObjects[I].GetFloat("timeStamp"));
        DataProvider.SetElementObject(I, TempObj);
        ++ I;
        goto J0x35;
    }
    SetObject("dataObjects", DataProvider);
}

function SetLobbyChatVisible(bool bIsVisible)
{
    if(bIsVisible != bChatBoxVisible)
    {
        if(!Outer.GetPC().WorldInfo.IsConsoleBuild())
        {
            SetVisible(bIsVisible);
            bChatBoxVisible = bIsVisible;
        }
    }
}

function ClearAndCloseChat()
{
    ActionScriptVoid("ClearAndCloseChat");
}
