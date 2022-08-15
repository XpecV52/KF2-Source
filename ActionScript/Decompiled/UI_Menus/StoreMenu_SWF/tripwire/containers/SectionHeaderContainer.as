package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.managers.MenuManager;
    
    public class SectionHeaderContainer extends TripContainer
    {
         
        
        public var headerIcon:MovieClip;
        
        public var leftTriggerIcon:MovieClip;
        
        public var textField:TextField;
        
        public function SectionHeaderContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.updateIconVisibility();
            stage.addEventListener(MenuManager.INPUT_CHANGED,this.onInputChange,false,0,true);
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateIconVisibility();
        }
        
        public function set text(param1:String) : void
        {
            this.textField.text = param1;
        }
        
        public function get text() : String
        {
            return this.textField.text;
        }
        
        public function updateIconVisibility() : void
        {
            this.headerIcon.visible = !bManagerUsingGamepad;
            if(this.leftTriggerIcon)
            {
                this.leftTriggerIcon.visible = bManagerUsingGamepad;
            }
        }
    }
}
