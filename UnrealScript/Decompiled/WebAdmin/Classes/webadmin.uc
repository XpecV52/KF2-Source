/*******************************************************************************
 * webadmin generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class webadmin extends WebApplication
    config(webadmin);

struct FailedAuthRecord
{
    var string IP;
    var int Count;
    var string LastUpdate;

    structdefaultproperties
    {
        IP=""
        Count=0
        LastUpdate=""
    }
};

var WebAdminMenu menu;
var IWebAdminAuth auth;
var globalconfig string AuthenticationClass;
var Class defaultAuthClass;
var ISessionHandler Sessions;
var globalconfig string SessionHandlerClass;
var Class defaultSessClass;
var array<IQueryHandler> handlers;
var globalconfig array<config string> QueryHandlers;
var globalconfig bool bHttpAuth;
var globalconfig bool bChatLog;
var globalconfig bool bUseStrictContentType;
var globalconfig string startpage;
var protected string ServerIP;
var globalconfig string DataStoreCacheClass;
var Class defaultDataStoreCacheClass;
var DataStoreCache DataStoreCache;
var PCCleanUp PCCleanUp;
var globalconfig int cfgver;
var array<WebAdminSkin> Skins;
var string SkinData;
var globalconfig int sessionOctetValidation;
var const localized string menuLogout;
var const localized string menuLogoutDesc;
var const localized string AccessDenied;
var const localized string msgNoPrivs;
var const localized string msgNoStartPage;
var const localized string msgLogoutNotice;
var const localized string msgUnableToLogout;
var const localized string error404;
var const localized string msgNotFound;
var const localized string msgSessionCreateFail;
var const localized string msgWrongAuthCookie;
var const localized string error403;
var const localized string error401;
var const localized string pageLogin;
var const localized string pageLoginDesc;
var const localized string pageAboutTitle;
var const localized string pageAboutDesc;
var const localized string msgUnknownDataType;
var const localized string msgInvalidToken;
var const localized string msgMaxLoginTries;
var const localized string HTMLSubDirectory;
var HashLib HashLib;
var array<FailedAuthRecord> authFails;
var globalconfig int MaxAuthFails;

function Init()
{
    local Class authClass, sessClass, dscClass;
    local class<Actor> aClass;
    local IpAddr IpAddr;
    local int I;
    local bool doSaveConfig;

    LogInternal("Starting Killing Floor 2 WebAdmin...", 'webadmin');
    doSaveConfig = false;
    CleanupMsgSpecs();
    WebServer.AcceptClass = Class'WebConnectionEx';
    if(Class'WebConnection'.default.MaxValueLength < 4096)
    {
        Class'WebConnection'.default.MaxValueLength = 4096;
        Class'WebConnection'.static.StaticSaveConfig();
    }
    super.Init();
    if(QueryHandlers.Length == 0)
    {
        QueryHandlers[0] = string(Class.GetPackageName()) $ ".QHCurrentKF";
        QueryHandlers[1] = string(Class.GetPackageName()) $ ".QHDefaultsKF";
        QueryHandlers[3] = string(Class.GetPackageName()) $ ".WebAdminSystemSettings";
        doSaveConfig = true;
    }
    if(MaxAuthFails == 0)
    {
        MaxAuthFails = 5;
    }
    if(doSaveConfig)
    {
        SaveConfig();
    }
    if(Len(DataStoreCacheClass) != 0)
    {
        dscClass = class<Object>(DynamicLoadObject(DataStoreCacheClass, Class'Class'));
    }
    if(dscClass == none)
    {
        dscClass = defaultDataStoreCacheClass;
    }
    DataStoreCache = DataStoreCache(new (self) dscClass);
    menu = new (self) Class'WebAdminMenu';
    menu.webadmin = self;
    menu.addMenu("/about", "", none,, 2147483647 - 1);
    menu.addMenu("/data", "", none,, 2147483647 - 1);
    menu.addMenu("/logout", menuLogout, none, menuLogoutDesc, 2147483647);
    if(Len(AuthenticationClass) != 0)
    {
        authClass = class<Object>(DynamicLoadObject(AuthenticationClass, Class'Class'));
    }
    if(authClass == none)
    {
        authClass = defaultAuthClass;
    }
    LogInternal("Creating IWebAdminAuth instance from: " $ string(authClass), 'webadmin');
    if(!ClassIsChildOf(authClass, Class'Actor'))
    {
        auth = (new (self) authClass);        
    }
    else
    {
        aClass = class<Actor>(DynamicLoadObject("" $ string(authClass), Class'Class'));
        auth = (WorldInfo.Spawn(aClass));
    }
    auth.Init(WorldInfo);
    HashLib = new Class'Sha1HashLib';
    if(!auth.supportHashAlgorithm(HashLib.getAlgName()))
    {
        LogInternal((("" $ string(authClass)) $ " does not support hash algorithm ") $ HashLib.getAlgName(), 'webadmin');
        HashLib = none;
    }
    if(Len(SessionHandlerClass) != 0)
    {
        sessClass = class<Object>(DynamicLoadObject(SessionHandlerClass, Class'Class'));
    }
    if(sessClass == none)
    {
        sessClass = defaultSessClass;
    }
    LogInternal("Creating ISessionHandler instance from: " $ string(sessClass), 'webadmin');
    if(!ClassIsChildOf(sessClass, Class'Actor'))
    {
        Sessions = (new (self) sessClass);        
    }
    else
    {
        aClass = class<Actor>(DynamicLoadObject("" $ string(sessClass), Class'Class'));
        Sessions = (WorldInfo.Spawn(aClass));
    }
    WebServer.GetLocalIP(IpAddr);
    ServerIP = WebServer.IpAddrToString(IpAddr);
    I = InStr(ServerIP, ":");
    if(I > -1)
    {
        ServerIP = Left(ServerIP, I);
    }
    initQueryHandlers();
}

function loadWebAdminSkins();

function CreateChatLog()
{
    if(bChatLog)
    {
        WorldInfo.Spawn(Class'ChatLog');
    }
}

function CleanupMsgSpecs()
{
    WorldInfo.Spawn(Class'PCCleanUp');
}

function CleanupApp()
{
    local IQueryHandler Handler;

    foreach handlers(Handler,)
    {
        Handler.Cleanup();        
    }    
    handlers.Remove(0, handlers.Length;
    menu.menu.Remove(0, menu.menu.Length;
    menu = none;
    auth.Cleanup();
    auth = none;
    Sessions.destroyAll();
    Sessions = none;
    DataStoreCache.Cleanup();
    DataStoreCache = none;
    super.CleanupApp();
}

protected function initQueryHandlers()
{
    local IQueryHandler qh;
    local string Entry;
    local Class qhc;
    local class<Actor> aClass;

    foreach QueryHandlers(Entry,)
    {
        qhc = class<Object>(DynamicLoadObject(Entry, Class'Class'));
        if(qhc == none)
        {
            LogInternal("Unable to find query handler class: " $ Entry, 'webadmin');
            continue;            
        }
        else
        {
            qh = none;
            if(!ClassIsChildOf(qhc, Class'Actor'))
            {
                qh = (new (self) qhc);                
            }
            else
            {
                aClass = class<Actor>(DynamicLoadObject("" $ string(qhc), Class'Class'));
                qh = (WorldInfo.Spawn(aClass));
            }
            if(EqualEqual_InterfaceInterface(qh, (none)))
            {
                LogInternal("Unable to create query handler: " $ Entry, 'webadmin');                
            }
            else
            {
                addQueryHandler(qh);
            }            
        }
    }    
}

function addQueryHandler(IQueryHandler qh)
{
    if(handlers.Find(qh != -1)
    {
        return;
    }
    qh.Init(self);
    qh.registerMenuItems(menu);
    handlers.AddItem(qh;
}

function string getAuthURL(string forpath)
{
    if(Left(forpath, 1) != "/")
    {
        forpath = "/" $ forpath;
    }
    return ((("webadmin://" $ ServerIP) $ ":") $ string(WebServer.CurrentListenPort)) $ forpath;
}

function Query(WebRequest Request, WebResponse Response)
{
    local WebAdminQuery currentQuery;
    local WebAdminMenu wamenu;
    local IQueryHandler Handler;
    local string Title, Description;
    local bool acceptsXhtmlXml;
    local int I;

    Response.Subst("webadmin.path", Path);
    Response.Subst("page.uri", Request.URI);
    Response.Subst("page.fulluri", Path $ Request.URI);
    Response.Subst("random", string(Rand(2147483647)));
    if(Len(SkinData) == 0)
    {
        if(Skins.Length == 0)
        {
            loadWebAdminSkins();
        }
        I = 0;
        J0x13E:

        if(I < Skins.Length)
        {
            Response.Subst("webadminskin.name", Class'WebAdminUtils'.static.HTMLEscape(string(Skins[I].Name)));
            Response.Subst("webadminskin.friendlyname", Class'WebAdminUtils'.static.HTMLEscape(Skins[I].FriendlyName));
            Response.Subst("webadminskin.cssfile", Class'WebAdminUtils'.static.HTMLEscape(Skins[I].CssFile));            
            SkinData $= Response.LoadParsedUHTM(Path $ "/webadminskin_meta.inc");
            ++ I;
            goto J0x13E;
        }
        if(Skins.Length == 0)
        {            
            SkinData $= " ";
        }
    }
    Response.Subst("webadminskins.meta", SkinData);
    if(InStr(Request.GetHeader("accept-encoding") $ ",", "gzip,") != -1)
    {
        if(InStr(Request.GetHeader("user-agent"), "Safari/") != -1)
        {
            Response.Subst("client.gzip", "");            
        }
        else
        {
            if(InStr(Request.GetHeader("user-agent"), "MSIE 6.") != -1)
            {
                Response.Subst("client.gzip", "");                
            }
            else
            {
                Response.Subst("client.gzip", ".gz");
            }
        }        
    }
    else
    {
        Response.Subst("client.gzip", "");
    }
    if(InStr(Request.GetHeader("accept"), "application/xhtml+xml") != -1)
    {
        acceptsXhtmlXml = bUseStrictContentType;
    }
    if(WorldInfo.IsInSeamlessTravel())
    {
        if(acceptsXhtmlXml)
        {
            Response.AddHeader("Content-Type: application/xhtml+xml");
        }
        Response.HttpResponse("HTTP/1.1 503 Service Unavailable");
        Response.Subst("html.headers", "<meta http-equiv=\"refresh\" content=\"10\"/>");
        Response.IncludeUHTM(Path $ "/servertravel.html");
        Response.ClearSubst();
        return;
    }
    currentQuery.Request = Request;
    currentQuery.Response = Response;
    parseCookies(Request.GetHeader("cookie", ""), currentQuery.cookies);
    if(!getSession(currentQuery))
    {
        return;
    }
    if(Len(pageAboutTitle) == 0)
    {
        addMessage(currentQuery, "No localization data. Please make sure the file Localization/INT/WebAdmin.int is up to date.", 2);
    }
    if(!getWebAdminUser(currentQuery))
    {
        return;
    }
    Response.Subst("admin.name", currentQuery.User.getUsername());
    wamenu = WebAdminMenu(currentQuery.Session.GetObject("WebAdminMenu"));
    if(wamenu == none)
    {
        wamenu = menu.getUserMenu(currentQuery.User);
        if(wamenu != none)
        {
            currentQuery.Session.putObject("WebAdminMenu", wamenu);
            currentQuery.Session.putString("WebAdminMenu.rendered", wamenu.Render());
        }
    }
    if(wamenu == none)
    {
        Response.HttpResponse("HTTP/1.1 403 Forbidden");
        pageGenericError(currentQuery, msgNoPrivs, AccessDenied);
        return;
    }
    Response.Subst("navigation.menu", currentQuery.Session.GetString("WebAdminMenu.rendered"));
    currentQuery.User.clearCheckedPrivileges();
    if(Request.URI == "/")
    {
        if(Len(startpage) != 0)
        {
            Response.Redirect(Path $ startpage);
            return;
        }
        pageGenericError(currentQuery, msgNoStartPage);
        return;        
    }
    else
    {
        if(Request.URI == "/logout")
        {
            if(auth.Logout(currentQuery.User))
            {
                Sessions.Destroy(currentQuery.Session);
                sendCookie(currentQuery, "sessionid", "", Path, 0);
                sendCookie(currentQuery, "authcred", "", Path, 0);
                sendCookie(currentQuery, "authtimeout", "", Path, 0);
                if(bHttpAuth)
                {
                    Response.Subst("navigation.menu", "");
                    sendCookie(currentQuery, "forceAuthentication", "1", Path);
                    addMessage(currentQuery, msgLogoutNotice, 1);
                    pageGenericInfo(currentQuery, "");
                    return;
                }
                Response.Redirect(Path $ "/");
                return;
            }
            pageGenericError(currentQuery, msgUnableToLogout);
            return;            
        }
        else
        {
            if(Request.URI == "/about")
            {
                if(acceptsXhtmlXml)
                {
                    Response.AddHeader("Content-Type: application/xhtml+xml");
                }
                pageAbout(currentQuery);
                return;                
            }
            else
            {
                if(Request.URI == "/data")
                {
                    pageData(currentQuery);
                    return;
                }
            }
        }
    }
    Handler = wamenu.getHandlerFor(Request.URI, Title, Description);
    if(NotEqual_InterfaceInterface(Handler, (none)))
    {
        if(acceptsXhtmlXml && Handler.producesXhtml())
        {
            Response.AddHeader("Content-Type: application/xhtml+xml");
        }
        Response.Subst("page.title", Title);
        Response.Subst("page.description", Description);
        if(Handler.handleQuery(currentQuery))
        {
            return;
        }
    }
    if(currentQuery.User.canPerform(getAuthURL(Request.URI)))
    {
        foreach handlers(Handler,)
        {
            if(Handler.unhandledQuery(currentQuery))
            {                
                return;
            }            
        }        
    }
    if(acceptsXhtmlXml)
    {
        Response.AddHeader("Content-Type: application/xhtml+xml");
    }
    if(EqualEqual_InterfaceInterface(menu.getHandlerFor(Request.URI, Title, Description), (none)))
    {
        Response.HttpResponse("HTTP/1.1 404 Not Found");
        pageGenericError(currentQuery, msgNotFound, error404);        
    }
    else
    {
        Response.HttpResponse("HTTP/1.1 403 Forbidden");
        pageGenericError(currentQuery, msgNoPrivs, AccessDenied);
    }
}

protected function parseCookies(string cookiehdr, out array<KeyValuePair> cookies)
{
    local array<string> cookieParts;
    local string Entry;
    local int pos;
    local KeyValuePair KVP;

    ParseStringIntoArray(cookiehdr, cookieParts, ";", true);
    foreach cookieParts(Entry,)
    {
        pos = InStr(Entry, "=");
        if(pos > -1)
        {
            KVP.Key = Left(Entry, pos);            
            KVP.Key -= " ";
            KVP.Value = Mid(Entry, pos + 1);
            if(Left(KVP.Value, 1) == "\"")
            {
                KVP.Value = Repl(Mid(KVP.Value, 1, Len(KVP.Value) - 2), "\\\"", "\"");
            }
            cookies.AddItem(KVP;
        }        
    }    
}

function bool sendCookie(out WebAdminQuery Q, string Key, coerce string Value, optional string cpath, optional int maxage, optional string Domain)
{
    local string cookie;

    cpath = "";
    maxage = -1;
    Domain = "";
    if(Q.Response.SentText())
    {
        return false;
    }
    Key = Class'WebAdminUtils'.static.Trim(Key);
    if(Len(Key) == 0)
    {
        return false;
    }
    cookie = ((("Set-Cookie: " $ Key) $ "=\"") $ Repl(Value, "\"", "\\\"")) $ "\"";
    if(Len(cpath) > 0)
    {
        if(Right(cpath, 1) != "/")
        {            
            cpath $= "/";
        }        
        cookie $= ("; path=" $ cpath);
    }
    if(Len(Domain) > 0)
    {        
        cookie $= ("; domain=" $ Domain);
    }
    if(maxage > -1)
    {        
        cookie $= (("; expires=\"" $ Class'WebAdminUtils'.static.convertToRfc2109Date(Q.Response.GetHTTPExpiration(maxage))) $ "\"");        
        cookie $= ("; max-age=" $ string(maxage));
    }
    Q.Response.Headers[Q.Response.Headers.Length] = cookie;
    return true;
}

protected function bool getSession(out WebAdminQuery Q)
{
    local string SessionId;
    local int Idx;

    Idx = Q.cookies.Find('Key', "sessionid";
    if(Idx > -1)
    {
        SessionId = Q.cookies[Idx].Value;
    }
    if(Len(SessionId) == 0)
    {
        SessionId = Q.Request.GetVariable("sessionid");
    }
    if(Len(SessionId) > 0)
    {
        Q.Session = Sessions.Get(SessionId);
        if(NotEqual_InterfaceInterface(Q.Session, (none)) && sessionOctetValidation > 0)
        {
            validateSessionOctet(Q);
        }
    }
    if(EqualEqual_InterfaceInterface(Q.Session, (none)))
    {
        Q.Session = Sessions.Create();
        Idx = InStr(Q.Request.RemoteAddr, ":");
        if(Idx == -1)
        {
            Idx = Len(Q.Request.RemoteAddr);
        }
        Q.Session.putString("AuthIP", Left(Q.Request.RemoteAddr, Idx));
        sendCookie(Q, "sessionid", Q.Session.getId(), Path);
    }
    if(EqualEqual_InterfaceInterface(Q.Session, (none)))
    {
        pageGenericError(Q, msgSessionCreateFail);
        return false;
    }
    Q.Response.Subst("sessionid", Q.Session.getId());
    return true;
}

protected function validateSessionOctet(out WebAdminQuery Q)
{
    local array<string> ip1, ip2;
    local int I;

    I = InStr(Q.Request.RemoteAddr, ":");
    if(I == -1)
    {
        I = Len(Q.Request.RemoteAddr);
    }
    ParseStringIntoArray(Left(Q.Request.RemoteAddr, I), ip1, ".", false);
    ParseStringIntoArray(Q.Session.GetString("AuthIP", "0.0.0.0"), ip2, ".", false);
    ip1.Length = sessionOctetValidation;
    ip2.Length = sessionOctetValidation;
    I = 0;
    J0x174:

    if(I < ip1.Length)
    {
        if(int(ip1[I]) != int(ip2[I]))
        {
            Q.Session = none;
            goto J0x1EA;
        }
        ++ I;
        goto J0x174;
    }
    J0x1EA:

}

protected function bool getWebAdminUser(out WebAdminQuery Q)
{
    local string UserName, Password, Token, errorMsg, rememberCookie, hashAlgName;

    local int Idx;
    local bool checkToken;
    local string Realm;

    if(bHttpAuth)
    {
        Realm = "RO2 WebAdmin - " $ WorldInfo.Game.GameReplicationInfo.ServerName;
        Q.Response.AddHeader(("WWW-authenticate: basic realm=\"" $ Realm) $ "\"");
        Q.Session.putString("UsedHttpAuth", "1");
    }
    Q.User = (Q.Session.GetObject("IWebAdminUser"));
    if(NotEqual_InterfaceInterface(Q.User, (none)))
    {
        if(Q.Session.GetString("UsedHttpAuth") == "1")
        {
            if(!auth.validate(Q.Request.UserName, Q.Request.Password, "", errorMsg))
            {
                addMessage(Q, errorMsg, 2);
                pageAuthentication(Q);
                return false;
            }            
        }
        else
        {
            if(Q.Session.GetString("AuthTimeout") == "1")
            {
                if(Q.cookies.Find('Key', "authcred" == -1)
                {
                    Q.Session.removeString("AuthTimeout");
                    Q.Session.removeObject("IWebAdminUser");
                    auth.Logout(Q.User);
                    Q.User = none;
                    addMessage(Q, "Session timeout.", 2);
                    pageAuthentication(Q);
                    return false;
                }
            }
            setAuthCredCookie(Q, "", -2);
        }
        return true;
    }
    Idx = Q.cookies.Find('Key', "authcred";
    if(Idx != -1)
    {
        rememberCookie = Q.cookies[Idx].Value;        
    }
    else
    {
        rememberCookie = "";
    }
    checkToken = false;
    if((Len(Q.Request.UserName) > 0) && Len(Q.Request.Password) > 0)
    {
        UserName = Q.Request.UserName;
        Password = Q.Request.Password;
        if(bHttpAuth)
        {
            Idx = Q.cookies.Find('Key', "forceAuthentication";
            if((Idx != -1) && Q.cookies[Idx].Value == "1")
            {
                sendCookie(Q, "forceAuthentication", "", Path, 0);
                pageAuthentication(Q);
                return false;
            }
        }        
    }
    else
    {
        if(Len(rememberCookie) > 0)
        {
            UserName = Q.Request.DecodeBase64(rememberCookie);
            Idx = InStr(UserName, Chr(10));
            if(Idx != -1)
            {
                Password = Mid(UserName, Idx + 1);
                UserName = Left(UserName, Idx);                
            }
            else
            {
                UserName = "";
            }
        }
    }
    if((Len(UserName) == 0) || Len(Password) == 0)
    {
        UserName = Q.Request.GetVariable("username");
        Password = Q.Request.GetVariable("password_hash");
        if(Len(Password) == 0)
        {
            Password = Q.Request.GetVariable("password");
        }
        Token = Q.Request.GetVariable("token");
        checkToken = true;
    }
    if((Len(UserName) == 0) || Len(Password) == 0)
    {
        pageAuthentication(Q);
        return false;
    }
    if(checkToken && (Len(Token) == 0) || Token != Q.Session.GetString("AuthFormToken"))
    {
        addMessage(Q, msgInvalidToken, 2);
        pageAuthentication(Q);
        return false;
    }
    if(Left(Password, 1) == "$")
    {
        Idx = InStr(Password, "$",,, 1);
        if(Idx != -1)
        {
            hashAlgName = Mid(Password, 1, Idx - 1);
            Password = Mid(Password, Idx + 1);
        }
    }
    if(exceededAuthFail(Q, UserName))
    {
        Q.Response.HttpResponse("HTTP/1.1 403 Forbidden");
        pageGenericError(Q, msgMaxLoginTries);
        return false;
    }
    Q.User = auth.authenticate(UserName, Password, hashAlgName, errorMsg);
    if(EqualEqual_InterfaceInterface(Q.User, (none)))
    {
        recordAuthFail(Q, UserName);
        addMessage(Q, errorMsg, 2);
        if(Len(rememberCookie) > 0)
        {
            sendCookie(Q, "authcred", "", Path, 0);
            sendCookie(Q, "authtimeout", "", Path, 0);
            addMessage(Q, msgWrongAuthCookie, 2);
            rememberCookie = "";
        }
        pageAuthentication(Q);
        return false;
    }
    Q.Session.putObject("IWebAdminUser", bool(Q.User));
    resetAuthFail(Q, UserName);
    if(Q.Request.GetVariable("remember") != "")
    {
        if(HashLib != none)
        {
            if(hashAlgName == "")
            {
                Password = HashLib.getHash(Password $ UserName);
            }
            Password = (("$" $ HashLib.getAlgName()) $ "$") $ Password;
            rememberCookie = Q.Request.EncodeBase64((UserName $ Chr(10)) $ Password);            
        }
        else
        {
            rememberCookie = Q.Request.EncodeBase64((UserName $ Chr(10)) $ Password);
        }
        setAuthCredCookie(Q, rememberCookie, int(Q.Request.GetVariable("remember")));
    }
    return true;
}

function bool exceededAuthFail(out WebAdminQuery Q, string UserName)
{
    local int Idx;

    Idx = authFails.Find('IP', Q.Request.RemoteAddr;
    if(Idx != -1)
    {
        if(authFails[Idx].Count > MaxAuthFails)
        {
            return true;
        }
    }
    return false;
}

function recordAuthFail(out WebAdminQuery Q, string UserName)
{
    local int Idx;

    Idx = authFails.Find('IP', Q.Request.RemoteAddr;
    if(Idx == -1)
    {
        Idx = authFails.Length;
        authFails.Length = Idx + 1;
        authFails[Idx].Count = 0;
        authFails[Idx].IP = Q.Request.RemoteAddr;
    }
    authFails[Idx].Count = authFails[Idx].Count + 1;
    authFails[Idx].LastUpdate = TimeStamp();
}

function resetAuthFail(out WebAdminQuery Q, string UserName)
{
    local int Idx;

    Idx = authFails.Find('IP', Q.Request.RemoteAddr;
    if(Idx != -1)
    {
        authFails.Remove(Idx, 1;
    }
}

function setAuthCredCookie(out WebAdminQuery Q, string creddata, int TimeOut)
{
    local int Idx;

    if(TimeOut == -2)
    {
        Idx = Q.cookies.Find('Key', "authtimeout";
        if(Idx != -1)
        {
            TimeOut = int(Q.cookies[Idx].Value);            
        }
        else
        {
            TimeOut = 0;
        }
    }
    if(Len(creddata) == 0)
    {
        Idx = Q.cookies.Find('Key', "authcred";
        if(Idx != -1)
        {
            creddata = Q.cookies[Idx].Value;
        }
    }
    if(Len(creddata) == 0)
    {
        return;
    }
    if(TimeOut > 0)
    {
        sendCookie(Q, "authcred", creddata, Path, TimeOut);
        sendCookie(Q, "authtimeout", string(TimeOut), Path, TimeOut);
        Q.Session.putString("AuthTimeout", "1");        
    }
    else
    {
        if(TimeOut == -1)
        {
            sendCookie(Q, "authcred", creddata, Path);
        }
    }
}

function WebAdminMessages getMessagesObject(WebAdminQuery Q)
{
    local WebAdminMessages msgs;

    msgs = WebAdminMessages(Q.Session.GetObject("WebAdmin.Messages"));
    if(msgs == none)
    {
        msgs = new Class'WebAdminMessages';
        Q.Session.putObject("WebAdmin.Messages", msgs);
    }
    return msgs;
}

function addMessage(WebAdminQuery Q, string msg, optional IQueryHandler.EMessageType Type)
{
    local WebAdminMessages msgs;

    Type = 0;
    if(Len(msg) == 0)
    {
        return;
    }
    msgs = getMessagesObject(Q);
    msgs.addMessage(msg, Type);
}

function string renderMessages(WebAdminQuery Q)
{
    local WebAdminMessages msgs;

    msgs = WebAdminMessages(Q.Session.GetObject("WebAdmin.Messages"));
    if(msgs == none)
    {
        return "";
    }
    return msgs.renderMessages(self, Q);
}

function string renderPrivilegeLog(WebAdminQuery Q)
{
    local array<string> privs;
    local int I, J;
    local string tmp, Entry;

    privs = Q.User.getCheckedPrivileges();
    tmp = "";
    privs.InsertItem(0, getAuthURL(Q.Request.URI);
    I = 0;
    J0x9D:

    if(I < privs.Length)
    {
        Entry = privs[I];
        if(Left(Entry, 11) != "webadmin://")
        {            
        }
        else
        {
            J = InStr(Entry, "/",,, 11);
            if(J == -1)
            {                
            }
            else
            {
                Entry = Mid(Entry, J);
                Q.Response.Subst("privilege.log.entry", Entry);                
                tmp $= (Include(Q, "privilege_log_entry.inc"));
            }
        }
        ++ I;
        goto J0x9D;
    }
    Q.Response.Subst("privilege.log", tmp);
    return Include(Q, "privilege_log.inc");
}

function string Include(WebAdminQuery Q, string File)
{
    if((Len(HTMLSubDirectory) > 0) && Q.Response.FileExists((((Path $ "/") $ HTMLSubDirectory) $ "/") $ File))
    {
        return Q.Response.LoadParsedUHTM((((Path $ "/") $ HTMLSubDirectory) $ "/") $ File);
    }
    return Q.Response.LoadParsedUHTM((Path $ "/") $ File);
}

function bool hasIncludeFile(WebAdminQuery Q, string File)
{
    if((Len(HTMLSubDirectory) > 0) && Q.Response.FileExists((((Path $ "/") $ HTMLSubDirectory) $ "/") $ File))
    {
        return true;
    }
    return Q.Response.FileExists((Path $ "/") $ File);
}

function sendPage(WebAdminQuery Q, string File)
{
    local IQueryHandler Handler;

    foreach handlers(Handler,)
    {
        Handler.decoratePage(Q);        
    }    
    Q.Response.Subst("messages", renderMessages(Q));
    if(Q.Session.GetString("privilege.log") != "")
    {
        Q.Response.Subst("privilege.log", renderPrivilegeLog(Q));
    }
    if((Len(HTMLSubDirectory) > 0) && Q.Response.FileExists((((Path $ "/") $ HTMLSubDirectory) $ "/") $ File))
    {
        Q.Response.IncludeUHTM((((Path $ "/") $ HTMLSubDirectory) $ "/") $ File);        
    }
    else
    {
        Q.Response.IncludeUHTM((Path $ "/") $ File);
    }
    Q.Response.ClearSubst();
}

function pageGenericError(WebAdminQuery Q, coerce string errorMsg, optional string Title)
{
    Title = "Error";
    if(Q.acceptsXhtmlXml)
    {
        Q.Response.AddHeader("Content-Type: application/xhtml+xml");
    }
    Q.Response.Subst("page.title", Title);
    Q.Response.Subst("page.description", "");
    addMessage(Q, errorMsg, 2);
    sendPage(Q, "message.html");
}

function pageGenericInfo(WebAdminQuery Q, coerce string msg, optional string Title)
{
    Title = "Information";
    if(Q.acceptsXhtmlXml)
    {
        Q.Response.AddHeader("Content-Type: application/xhtml+xml");
    }
    Q.Response.Subst("page.title", Title);
    Q.Response.Subst("page.description", "");
    addMessage(Q, msg);
    sendPage(Q, "message.html");
}

function pageAuthentication(WebAdminQuery Q)
{
    local string Token;

    if(Q.Request.GetVariable("ajax") == "1")
    {
        Q.Response.HttpResponse("HTTP/1.1 403 Forbidden");
        pageGenericError(Q, msgNoPrivs, error403);
        return;
    }
    if(bHttpAuth)
    {
        Q.Response.HttpResponse("HTTP/1.1 401 Unauthorized");
        pageGenericError(Q, msgNoPrivs, error401);
        return;
    }
    if(Q.acceptsXhtmlXml)
    {
        Q.Response.AddHeader("Content-Type: application/xhtml+xml");
    }
    Token = Right(ToHex(Rand(65535)), 4) $ Right(ToHex(Rand(65535)), 4);
    Q.Session.putString("AuthFormToken", Token);
    Q.Response.Subst("page.title", pageLogin);
    Q.Response.Subst("page.description", pageLoginDesc);
    Q.Response.Subst("token", Token);
    if(HashLib == none)
    {
        Q.Response.Subst("hashalg", "");        
    }
    else
    {
        Q.Response.Subst("hashalg", HashLib.getAlgName());
    }
    sendPage(Q, "login.html");
}

function pageAbout(WebAdminQuery Q)
{
    local OnlineGameSettings ogs;
    local OnlineSubsystem steamWorks;

    Q.Response.Subst("page.title", pageAboutTitle);
    Q.Response.Subst("page.description", pageAboutDesc);
    Q.Response.Subst("engine.version", WorldInfo.EngineVersion);
    Q.Response.Subst("engine.netversion", WorldInfo.MinNetVersion);
    Q.Response.Subst("client.address", Q.Request.RemoteAddr);
    Q.Response.Subst("webadmin.address", (ServerIP $ ":") $ string(WebServer.CurrentListenPort));
    if(bHttpAuth)
    {
        Q.Response.Subst("webadmin.authmethod", "HTTP Authentication");        
    }
    else
    {
        Q.Response.Subst("webadmin.authmethod", "Login form");
    }
    if(Q.cookies.Find('Key', "authcred" > -1)
    {
        Q.Response.Subst("client.remember", "True");        
    }
    else
    {
        Q.Response.Subst("client.remember", "False");
    }
    Q.Response.Subst("client.sessionid", Q.Session.getId());
    Q.Response.Subst("client.authip", Q.Session.GetString("AuthIP"));
    Q.Response.Subst("client.useragent", Q.Request.GetHeader("user-agent"));
    if(NotEqual_InterfaceInterface(WorldInfo.Game.GameInterface, (none)))
    {
        ogs = WorldInfo.Game.GameInterface.GetGameSettings(WorldInfo.Game.PlayerReplicationInfoClass.default.SessionName);
    }
    steamWorks = Class'GameEngine'.static.GetOnlineSubsystem();
    if(ogs != none)
    {
        Q.Response.Subst("player.uniqueid", Class'WebAdminUtils'.static.UniqueNetIdToString(ogs.OwningPlayerId));
        if(steamWorks != none)
        {
            Q.Response.Subst("player.steamid", Class'WebAdminUtils'.static.HTMLEscape(steamWorks.UniqueNetIdToPlayerName(ogs.OwningPlayerId)));            
        }
        else
        {
            Q.Response.Subst("player.steamid", "");
        }        
    }
    else
    {
        Q.Response.Subst("player.uniqueid", "");
        Q.Response.Subst("player.steamid", "");
    }
    if(steamWorks != none)
    {
        Q.Response.Subst("player.status", string(steamWorks.GetLoginStatus(0)));
        Q.Response.Subst("engine.nattype", string(steamWorks.GetNATType()));        
    }
    else
    {
        Q.Response.Subst("player.status", "");
        Q.Response.Subst("engine.nattype", "");
    }
    sendPage(Q, "about.html");
}

function pageData(WebAdminQuery Q)
{
    local string tmp;
    local int I, J;
    local DCEGameInfo GameType;
    local array<DCEMapInfo> Maps;
    local array<MutatorGroup> Mutators;

    Q.Response.AddHeader("Content-Type: text/xml");
    Q.Response.SendText("<request>");
    tmp = Q.Request.GetVariable("type");
    if(tmp == "gametypes")
    {
        DataStoreCache.loadGameTypes();
        Q.Response.SendText("<gametypes>");
        foreach DataStoreCache.GameTypes(GameType,)
        {
            Q.Response.SendText("<gametype>");
            Q.Response.SendText(("<class>" $ Class'WebAdminUtils'.static.HTMLEscape(GameType.Data.ClassName)) $ "</class>");
            Q.Response.SendText(("<friendlyname>" $ Class'WebAdminUtils'.static.HTMLEscape(GameType.FriendlyName)) $ "</friendlyname>");
            Q.Response.SendText("</gametype>");            
        }        
        Q.Response.SendText("</gametypes>");        
    }
    else
    {
        if(tmp == "maps")
        {
            Q.Response.SendText("<maps>");
            Maps = DataStoreCache.getMaps(Q.Request.GetVariable("gametype"));
            I = 0;
            J0x427:

            if(I < Maps.Length)
            {
                Q.Response.SendText("<map>");
                Q.Response.SendText(("<name>" $ Class'WebAdminUtils'.static.HTMLEscape(Maps[I].MapName)) $ "</name>");
                Q.Response.SendText(("<friendlyname>" $ Class'WebAdminUtils'.static.HTMLEscape(Maps[I].FriendlyName)) $ "</friendlyname>");
                Q.Response.SendText("</map>");
                ++ I;
                goto J0x427;
            }
            Q.Response.SendText("</maps>");            
        }
        else
        {
            if(tmp == "mutators")
            {
                Mutators = DataStoreCache.getMutators(Q.Request.GetVariable("gametype"));
                I = 0;
                J0x6B9:

                if(I < Mutators.Length)
                {
                    Q.Response.SendText("<mutatorGroup>");
                    Q.Response.SendText(("<name>" $ Class'WebAdminUtils'.static.HTMLEscape(Mutators[I].GroupName)) $ "</name>");
                    Q.Response.SendText("<mutators>");
                    J = 0;
                    J0x7EB:

                    if(J < Mutators[I].Mutators.Length)
                    {
                        Q.Response.SendText("<mutator>");
                        Q.Response.SendText(("<class>" $ Class'WebAdminUtils'.static.HTMLEscape(Mutators[I].Mutators[J].ClassName)) $ "</class>");
                        Q.Response.SendText(("<friendlyname>" $ Class'WebAdminUtils'.static.HTMLEscape(Mutators[I].Mutators[J].FriendlyName)) $ "</friendlyname>");
                        Q.Response.SendText("</mutator>");
                        ++ J;
                        goto J0x7EB;
                    }
                    Q.Response.SendText("</mutators>");
                    Q.Response.SendText("</mutatorGroup>");
                    ++ I;
                    goto J0x6B9;
                }                
            }
            else
            {
                addMessage(Q, msgUnknownDataType @ tmp, 2);
            }
        }
    }
    Q.Response.SendText("<messages><![CDATA[");
    Q.Response.SendText(renderMessages(Q));
    Q.Response.SendText("]]></messages>");
    Q.Response.SendText("</request>");
}

defaultproperties
{
    defaultAuthClass=Class'BasicWebAdminAuth'
    defaultSessClass=Class'SessionHandler'
    QueryHandlers(0)="WebAdmin.QHCurrentKF"
    QueryHandlers(1)="WebAdmin.QHDefaultsKF"
    QueryHandlers(2)="WebAdmin.WebAdminSystemSettings"
    startpage="/current"
    defaultDataStoreCacheClass=Class'DataStoreCacheKF'
    sessionOctetValidation=3
    menuLogout="Log out"
    menuLogoutDesc="Log out from the webadmin and clear all authentication information."
    AccessDenied="Access Denied"
    msgNoPrivs="You do not have the privileges to view this page."
    msgNoStartPage="No starting page."
    msgLogoutNotice="To properly log out you will need to close the webbrowser to clear the saved authentication information."
    msgUnableToLogout="Unable to log out."
    error404="Error 404 - Page not found"
    msgNotFound="The requested page was not found."
    msgSessionCreateFail="Unable to create a session. See the log file for details."
    msgWrongAuthCookie="Authentication cookie does not contain correct information."
    error403="Error 403 - Forbidden"
    error401="Error 401 - Unauthorized"
    pageLogin="Login"
    pageLoginDesc="Log in using the administrator username and password. Cookies must be enabled for this site."
    pageAboutTitle="About"
    pageAboutDesc="Various information about the Red Orchestra 2 WebAdmin"
    msgUnknownDataType="Requested unknown data type:"
    msgInvalidToken="Invalid form data."
    msgMaxLoginTries="Exceeded login attempts."
}