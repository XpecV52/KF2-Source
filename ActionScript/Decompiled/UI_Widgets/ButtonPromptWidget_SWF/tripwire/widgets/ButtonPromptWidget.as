package tripwire.widgets
{
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    
    public class ButtonPromptWidget extends TripContainer
    {
         
        
        public var confirmText:TextField;
        
        public var cancelText:TextField;
        
        public function ButtonPromptWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.updateVisibilityBasedOnInputType();
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.confirmText.text = !!param1.confirm ? param1.confirm : "";
            this.cancelText.text = !!param1.cancel ? param1.cancel : "";
        }
        
        override public function set visible(param1:Boolean) : void
        {
            if(param1)
            {
                param1 = bManagerUsingGamepad;
            }
            super.visible = param1;
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateVisibilityBasedOnInputType();
        }
        
        protected function updateVisibilityBasedOnInputType() : *
        {
            this.visible = bManagerUsingGamepad;
        }
    }
}
