package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import tripwire.managers.MenuManager;
    
    public class SectionHeaderContainer extends TripContainer
    {
         
        
        public var headerIcon:MovieClip;
        
        public var leftTriggerIcon:MovieClip;
        
        public var textField:TextField;
        
        public var headerTextFormat:TextFormat;
        
        private var _controllerIconVisible:Boolean = true;
        
        public const textSpacing:int = 3;
        
        public function SectionHeaderContainer()
        {
            this.headerTextFormat = new TextFormat();
            super();
            this.formatText();
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
        
        public function formatText() : void
        {
            this.headerTextFormat = this.textField.getTextFormat();
            this.headerTextFormat.letterSpacing = this.textSpacing;
            this.textField.defaultTextFormat = this.headerTextFormat;
        }
        
        public function get controllerIconVisible() : Boolean
        {
            return this._controllerIconVisible;
        }
        
        public function set controllerIconVisible(param1:Boolean) : *
        {
            if(this._controllerIconVisible == param1)
            {
                return;
            }
            this._controllerIconVisible = param1;
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
