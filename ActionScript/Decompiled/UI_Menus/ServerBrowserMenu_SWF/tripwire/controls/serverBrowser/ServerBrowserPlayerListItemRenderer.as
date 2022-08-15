package tripwire.controls.serverBrowser
{
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    
    public class ServerBrowserPlayerListItemRenderer extends ListItemRenderer
    {
         
        
        public var playerNameText:TextField;
        
        public var killCountText:TextField;
        
        public var playerTimerText:TextField;
        
        public var playerPingText:TextField;
        
        public function ServerBrowserPlayerListItemRenderer()
        {
            super();
        }
        
        override public function setData(param1:Object) : void
        {
            if(param1)
            {
                super.setData(param1);
                visible = true;
                this.playerNameText.text = !!param1.playerName ? param1.playerName : "";
                this.killCountText.text = !!param1.killCount ? param1.killCount : "";
                this.playerTimerText.text = !!param1.playTime ? param1.playTime : "";
                this.playerPingText.text = !!param1.playerPing ? param1.playerPing : "";
            }
            else
            {
                visible = false;
            }
        }
    }
}
