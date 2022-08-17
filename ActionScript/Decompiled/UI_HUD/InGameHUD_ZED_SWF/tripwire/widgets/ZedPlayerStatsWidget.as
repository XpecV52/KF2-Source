package tripwire.widgets
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import tripwire.Tools.TextfieldUtil;
    
    public class ZedPlayerStatsWidget extends PlayerStatWidget
    {
         
        
        public var HealthMask:MovieClip;
        
        public var HealthWidth:Number;
        
        public function ZedPlayerStatsWidget()
        {
            super();
        }
        
        override public function init() : *
        {
            this.HealthWidth = _healerChargeBarMC.width;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        override public function cachePlayerStatWidgets() : *
        {
            _healerChargeBarMC = HealerContainer.HealerBarContainer;
        }
        
        override public function set playerHealth(param1:int) : void
        {
            _healerChargeBarMC.width = 300 * (param1 / 100);
            TextfieldUtil.instance.InvalidateFilteredDisplayObject(_healerChargeBarMC);
        }
    }
}
