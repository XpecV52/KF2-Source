package tripwire.containers
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.events.ButtonEvent;
    
    public class ServerWelcomeContainer extends TripContainer
    {
         
        
        public var bannerLoader:UILoader;
        
        public var messageOfTheDayText:TextField;
        
        public var clanMottoText:TextField;
        
        public var serverNameText:TextField;
        
        public var webLinkButton:Button;
        
        public var confirmButton:Button;
        
        public function ServerWelcomeContainer()
        {
            super();
            this.__setProp_webLinkButton_ServerWelcomeContainer_confirmbutton_0();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.confirmButton.tabIndex = 1;
            defaultFirstElement = currentElement = this.confirmButton;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.confirmButton.label = !!param1.confirm ? param1.confirm : "";
            }
        }
        
        public function onWebLinkClicked(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_OnWebLinkClicked",this.webLinkButton.label);
        }
        
        public function onConfirmClicked(param1:ButtonEvent) : void
        {
            visible = false;
        }
        
        public function set serverName(param1:String) : void
        {
            this.serverNameText.text = param1;
        }
        
        public function set serverIP(param1:String) : void
        {
            this.webLinkButton.label = param1;
            this.webLinkButton.addEventListener(ButtonEvent.CLICK,this.onWebLinkClicked,false,0,true);
        }
        
        public function set banner(param1:String) : void
        {
            if(param1 != "")
            {
                this.bannerLoader.source = param1;
            }
        }
        
        public function set messageOfTheDay(param1:String) : void
        {
            this.messageOfTheDayText.htmlText = param1;
        }
        
        public function set clanMotto(param1:String) : void
        {
            this.clanMottoText.text = param1;
        }
        
        override public function selectContainer() : void
        {
            trace("ServerWelcomeContainer::selectContainer");
            super.selectContainer();
        }
        
        function __setProp_webLinkButton_ServerWelcomeContainer_confirmbutton_0() : *
        {
            try
            {
                this.webLinkButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.webLinkButton.autoRepeat = false;
            this.webLinkButton.autoSize = "none";
            this.webLinkButton.data = "";
            this.webLinkButton.enabled = true;
            this.webLinkButton.enableInitCallback = false;
            this.webLinkButton.focusable = true;
            this.webLinkButton.label = "https://mail.google.com/mail/u/1/#inbox";
            this.webLinkButton.selected = false;
            this.webLinkButton.toggle = false;
            this.webLinkButton.visible = true;
            try
            {
                this.webLinkButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
