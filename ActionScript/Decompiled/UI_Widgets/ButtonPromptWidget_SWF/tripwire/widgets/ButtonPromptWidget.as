package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import tripwire.containers.TripContainer;
    import tripwire.managers.MenuManager;
    
    public class ButtonPromptWidget extends TripContainer
    {
         
        
        public var APrompt:MovieClip;
        
        public var BPrompt:MovieClip;
        
        public var promptBG:MovieClip;
        
        private var _displayedPrompts:int = 2;
        
        private var _defaultBGWidth;
        
        public function ButtonPromptWidget()
        {
            super();
            enableInitCallback = true;
            this._defaultBGWidth = this.promptBG.width;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            stage.addEventListener(MenuManager.PROMPT_CHANGED,this.onPromptChanged,false,0,true);
            this.updateVisibilityBasedOnInputType();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            stage.removeEventListener(MenuManager.PROMPT_CHANGED,this.onPromptChanged);
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.APrompt.confirmText.text = !!param1.confirm ? param1.confirm : "";
            this.BPrompt.cancelText.text = !!param1.cancel ? param1.cancel : "";
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
            this.visible = bManagerUsingGamepad && this._displayedPrompts > 0;
            this.BPrompt.visible = this._displayedPrompts > 1;
            this.promptBG.width = !this.BPrompt.visible ? Number(this._defaultBGWidth - this.BPrompt.width) : Number(this._defaultBGWidth);
        }
        
        protected function onPromptChanged(param1:Event) : *
        {
            if(MenuManager.manager.numPrompts != this._displayedPrompts)
            {
                this._displayedPrompts = MenuManager.manager.numPrompts;
                this.updateVisibilityBasedOnInputType();
            }
        }
    }
}
