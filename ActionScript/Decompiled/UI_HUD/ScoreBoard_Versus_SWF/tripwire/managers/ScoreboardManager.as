package tripwire.managers
{
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.Extensions;
    import tripwire.widgets.ScoreboardWidget;
    
    public class ScoreboardManager extends UIComponent
    {
         
        
        public var ScoreboardWidgetMC:ScoreboardWidget;
        
        public function ScoreboardManager()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        override protected function configUI() : void
        {
            super.configUI();
            Extensions.enabled = true;
            stage.scaleMode = StageScaleMode.SHOW_ALL;
        }
    }
}
