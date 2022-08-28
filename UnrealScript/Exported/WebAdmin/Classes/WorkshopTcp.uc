Class WorkshopTcp extends TcpLink;

var int CurrentItem;
var WorkshopTool Tool;
var string RequestedID,ReqWebsite,URL,CRLF,FullLine;
var byte CurrentStage;
var bool bBadHeader,bHasConnection;

function PostBeginPlay()
{
	CRLF = Chr(13)$Chr(10);
}
final function BeginRequest( WorkshopTool T )
{
	Tool = T;

	CurrentItem = Tool.PendingInit[0];
	RequestedID = Tool.CurrentItems[CurrentItem].ID;
	if( BindPort()!=-1 )
	{
		if( T.SteamAddr.Port==80 )
			Resolved(T.SteamAddr);
		else Resolve(ReqWebsite);
	}
	else EncounteredError("Failed to bind a new port");
}
function Resolved( IpAddr Addr )
{
	Addr.Port = 80;
	Tool.SteamAddr = Addr;
	if( Open(Addr) )
	{
	}
	else EncounteredError("Failed to open TcpConnection");
}

event Opened()
{
	local string S;

	bHasConnection = true;
	S = "GET "$URL$RequestedID$" HTTP/1.0"$CRLF$"User-Agent: KF2"$CRLF$"Host:"$ReqWebsite$":80"$CRLF$CRLF;
	SendText(S);
}
function ReceivedText( string Text )
{
	local int i;

	if( bBadHeader )
		return;
	if( CurrentStage==0 && !VerifyHeader(Text) )
		return;
	FullLine = FullLine$Text;
	
	if( CurrentStage==1 )
	{
		i = InStr(FullLine,"<title>");
		if( i==-1 )
			return;
		FullLine = Mid(FullLine,i+7);
		++CurrentStage;
	}
	if( CurrentStage==2 )
	{
		i = InStr(FullLine,"</title>");
		if( i==-1 )
			return;
		FullLine = Left(FullLine,i);
		i = InStr(FullLine,":: ");
		if( i!=-1 )
			FullLine = Mid(FullLine,i+3);
		Tool.OnRequestDone(FullLine,false);
		bBadHeader = true;
		bHasConnection = false;
		Close();
	}
}
final function bool VerifyHeader( string S )
{
	local int i;
	
	i = InStr(S," ");
	if( i==-1 )
	{
		EncounteredError("Invalid HTTP header!");
		return false;
	}
	S = Mid(S,i+1);
	if( Left(S,3)!="200" )
	{
		i = InStr(S,CRLF);
		if( i>0 )
			S = Left(S,i);
		EncounteredError("HTTP error: "$S);
		return false;
	}
	++CurrentStage;
	return true;
}
final function EncounteredError( string S )
{
	if( bBadHeader )
		return;
	bBadHeader = true;
	Tool.OnRequestDone(S,true);
	if( bHasConnection )
	{
		bHasConnection = false;
		Close();
	}
	else LifeSpan = 5.f;
}

final function AbortConnection()
{
	bBadHeader = true;
	Close();
}

event Closed()
{
	if( !bBadHeader )
		EncounteredError("Unexpected closed connection");
	else Destroy();
}

defaultproperties
{
   RequestedID="1234"
   ReqWebsite="steamcommunity.com"
   URL="/sharedfiles/filedetails/?id="
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'IpDrv.Default__TcpLink:Sprite'
      SpriteCategoryName="Info"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'IpDrv.Default__TcpLink:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__WorkshopTcp"
   ObjectArchetype=TcpLink'IpDrv.Default__TcpLink'
}
