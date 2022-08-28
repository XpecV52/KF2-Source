class KFGFxTraderContainer_ErrorMessage extends KFGFxObject_Container;

var KFGFxMenu_Trader MyTraderMenu;

var localized string CannotAffordString;
var localized string CannotCarryString;


function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	MyTraderMenu = KFGFxMenu_Trader( NewParentMenu );
	SetWarningMessage("");
}

function SetWarningMessage(string Message)
{
	SetString("ErrorMessage", Message);
}

defaultproperties
{
   CannotAffordString="Insufficient funds for this item."
   CannotCarryString="Cannot carry item. Sell others to make room."
   Name="Default__KFGFxTraderContainer_ErrorMessage"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
