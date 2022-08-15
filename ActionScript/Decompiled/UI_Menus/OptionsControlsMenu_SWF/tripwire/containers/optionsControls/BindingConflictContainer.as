package tripwire.containers.optionsControls
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    
    public class BindingConflictContainer extends TripContainer
    {
         
        
        public var warningTextField:TextField;
        
        public var alreadyBoundToTextField:TextField;
        
        public var oldCommandTextField:TextField;
        
        public var rebindToTextField:TextField;
        
        public var newCommandTextField:TextField;
        
        public var clearedTextField:TextField;
        
        public var cancelButton:TripButton;
        
        public var acceptButton:TripButton;
        
        public function BindingConflictContainer()
        {
            super();
            this.cancelButton.addEventListener(ButtonEvent.PRESS,this.cancelBind,false,0,true);
            this.acceptButton.addEventListener(ButtonEvent.PRESS,this.acceptBind,false,0,true);
            ANIM_OFFSET_X = 0;
        }
        
        public function set localizedPopup(param1:Object) : *
        {
            this.warningTextField.text = param1.warningLabel;
            this.rebindToTextField.text = param1.rebindLabel;
            this.clearedTextField.text = param1.clearedLabel;
            this.cancelButton.label = param1.cancelLabel;
            this.acceptButton.label = param1.acceptLabel;
        }
        
        public function setConflictMessage(param1:String, param2:String, param3:String) : *
        {
            this.alreadyBoundToTextField.text = param1;
            this.oldCommandTextField.text = param2;
            this.newCommandTextField.text = param3;
        }
        
        private function cancelBind(param1:ButtonEvent) : *
        {
            closeContainer();
            dispatchEvent(new Event(ControlsBindingContainer.CANCEL_BIND));
            ExternalInterface.call("Callback_CancelBind");
        }
        
        private function acceptBind(param1:ButtonEvent) : *
        {
            closeContainer();
            ExternalInterface.call("Callback_AcceptBind");
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":-128,
                "autoAlpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1
                }
            },{
                "z":0,
                "autoAlpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":0,
                "alpha":1
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
    }
}
