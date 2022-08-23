package tripwire.screensize
{
    import flash.display.MovieClip;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.Extensions;
    
    public class ScreenSizeManager extends UIComponent
    {
         
        
        public var mCursor:MovieClip;
        
        public var _bUsingGamepad:Boolean;
        
        public var screenSizePopup:ScreenSizePopupContainer;
        
        public function ScreenSizeManager()
        {
            super();
        }
        
        public function TutorialManager() : *
        {
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            Extensions.enabled = true;
            stage.scaleMode = StageScaleMode.SHOW_ALL;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.mCursor.mouseEnabled = false;
            this.mCursor.tabEnabled = false;
            enableInitCallback = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.handleMouseMove,false,0,true);
        }
        
        protected function handleMouseMove(param1:MouseEvent) : void
        {
            this.mCursor.x = param1.stageX;
            this.mCursor.y = param1.stageY;
        }
        
        public function set bUsingGamepad(param1:Boolean) : void
        {
            this.mCursor.visible = !param1;
        }
    }
}
