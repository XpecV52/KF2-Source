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
        
        private var _controllerIconVisible:Boolean = true;
        
        public function SectionHeaderContainer()
        {
            super();
        }
        
        override protected function addedToStage(event:Event) : void
        {
            super.addedToStage(event);
            this.updateIconVisibility();
            stage.addEventListener(MenuManager.INPUT_CHANGED,this.onInputChange,false,0,true);
        }
        
        override protected function onInputChange(e:Event) : *
        {
            super.onInputChange(e);
            this.updateIconVisibility();
        }
        
        public function set text(value:String) : void
        {
            this.textField.text = value;
        }
        
        public function get text() : String
        {
            return this.textField.text;
        }
        
        public function get controllerIconVisible() : Boolean
        {
            return this._controllerIconVisible;
        }
        
        public function set controllerIconVisible(value:Boolean) : *
        {
            if(this._controllerIconVisible == value)
            {
                return;
            }
            this._controllerIconVisible = value;
            this.updateIconVisibility();
        }
        
        public function updateIconVisibility() : void
        {
            this.headerIcon.visible = !bManagerUsingGamepad || !this._controllerIconVisible;
            if(this.leftTriggerIcon)
            {
                this.leftTriggerIcon.visible = bManagerUsingGamepad && this._controllerIconVisible;
            }
        }
    }
}
