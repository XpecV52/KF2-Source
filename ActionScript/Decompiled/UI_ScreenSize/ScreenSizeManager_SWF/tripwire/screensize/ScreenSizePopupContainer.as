package tripwire.screensize
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    
    public class ScreenSizePopupContainer extends TripContainer
    {
         
        
        public var titleTextField:TextField;
        
        public var descriptionTextField:TextField;
        
        public var enlargeTextField:TextField;
        
        public var shrinkTextField:TextField;
        
        public var confirmTextField:TextField;
        
        public var cancelTextField:TextField;
        
        public var enlargeButtonIcon:MovieClip;
        
        public var shrinkButtonIcon:MovieClip;
        
        public var confirmButtonIcon:MovieClip;
        
        public var backButtonIcon:MovieClip;
        
        protected var _bUsingGamepad:Boolean;
        
        public function ScreenSizePopupContainer()
        {
            super();
        }
        
        public function TutorialPopupContainer() : *
        {
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.titleTextField.text = !!param1.title ? param1.title : "";
                this.descriptionTextField.text = !!param1.description ? param1.description : "";
                this.enlargeTextField.text = !!param1.enlarge ? param1.enlarge : "";
                this.shrinkTextField.text = !!param1.shrink ? param1.shrink : "";
                this.confirmTextField.text = !!param1.confirm ? param1.confirm : "";
                this.cancelTextField.text = !!param1.cancel ? param1.cancel : "";
            }
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
                    case NavigationCode.GAMEPAD_B:
                        param1.handled = true;
                        ExternalInterface.call("Callback_Cancel");
                        break;
                    case NavigationCode.GAMEPAD_A:
                        ExternalInterface.call("Callback_Confirm");
                        param1.handled = true;
                        break;
                    case NavigationCode.UP:
                        ExternalInterface.call("Callback_Enlarge");
                        param1.handled = true;
                        break;
                    case NavigationCode.DOWN:
                        ExternalInterface.call("Callback_Shrink");
                        param1.handled = true;
                }
            }
        }
    }
}
