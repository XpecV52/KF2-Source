package tripwire.managers
{
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import tripwire.widgets.Scoreboard_VersusWidget;
    
    public class ScoreBoardManager_Versus extends ScoreboardManager
    {
         
        
        public var ZEDScoreboardWidgetMC:Scoreboard_VersusWidget;
        
        public function ScoreBoardManager_Versus()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function test(param1:KeyboardEvent) : void
        {
            ScoreboardWidgetMC.showScore = true;
            this.ZEDScoreboardWidgetMC.showScore = true;
        }
    }
}
