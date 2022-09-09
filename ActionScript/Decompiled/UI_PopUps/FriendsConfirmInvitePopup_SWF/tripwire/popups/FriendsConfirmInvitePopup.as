package tripwire.popups
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.TripButton;
    
    public class FriendsConfirmInvitePopup extends BasePopup
    {
         
        
        public var acceptButton:TripButton;
        
        public var declineButton:TripButton;
        
        public var title:TextField;
        
        public var description:TextField;
        
        public var bigName:TextField;
        
        public var defaultAvatar:MovieClip;
        
        public var profileLoader:UILoader;
        
        public var profileImageContainer:MovieClip;
        
        public function FriendsConfirmInvitePopup()
        {
            super();
            enableInitCallback = true;
            this.profileLoader = UILoader(this.profileImageContainer.profileLoader);
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.openPopup();
            this.acceptButton.addEventListener(ButtonEvent.PRESS,this.onBtnAcceptClick,false,0,true);
            this.declineButton.addEventListener(ButtonEvent.PRESS,this.onBtnDeclineClick,false,0,true);
        }
        
        override public function openPopup() : void
        {
            super.openPopup();
        }
        
        override public function setPopupText(param1:String, param2:String, param3:String, param4:String, param5:String) : *
        {
            this.title.text = param1;
            this.description.text = this.getDescription(param2);
            this.acceptButton.label = param3;
            this.declineButton.label = param4;
            this.bigName.text = this.getBigName(param2);
            this.profileImageSource = param5;
        }
        
        private function getDescription(param1:String) : String
        {
            return param1.replace(":"," ");
        }
        
        private function getBigName(param1:String) : String
        {
            return param1.substring(0,param1.indexOf(":"));
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_A:
                        ExternalInterface.call("Callback_onBtnAcceptClick");
                        break;
                    case NavigationCode.GAMEPAD_B:
                        ExternalInterface.call("Callback_onBtnDeclineClick");
                }
            }
        }
        
        private function onBtnAcceptClick(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_onBtnAcceptClick");
        }
        
        private function onBtnDeclineClick(param1:ButtonEvent) : void
        {
            ExternalInterface.call("Callback_onBtnDeclineClick");
        }
        
        public function set profileImageSource(param1:String) : *
        {
            if(param1 && param1 != "" && param1 != "img://")
            {
                this.profileImageContainer.visible = true;
                this.defaultAvatar.visible = false;
                this.profileLoader.source = param1;
            }
            else
            {
                this.profileImageContainer.visible = false;
                this.defaultAvatar.visible = true;
            }
        }
    }
}
