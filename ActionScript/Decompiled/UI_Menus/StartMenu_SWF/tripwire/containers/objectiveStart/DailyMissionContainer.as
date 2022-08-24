package tripwire.containers.objectiveStart
{
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    
    public class DailyMissionContainer extends TripContainer
    {
         
        
        public var titleTextfield:TextField;
        
        public var dailyOverviewTextfield:TextField;
        
        public var dailySubTitleTextfield:TextField;
        
        public var objective_0:ObjectiveInfoRenderer;
        
        public var objective_1:ObjectiveInfoRenderer;
        
        public var objective_2:ObjectiveInfoRenderer;
        
        public var rewardTextfield_0:TextField;
        
        public var rewardTextfield_1:TextField;
        
        public var rewardTextfield_2:TextField;
        
        public var rewardNumberTextField_0:TextField;
        
        public var rewardNumberTextField_1:TextField;
        
        public var rewardNumberTextField_2:TextField;
        
        public function DailyMissionContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.titleTextfield.text = !!param1.title ? param1.title : "";
            this.dailyOverviewTextfield.text = !!param1.overview ? param1.overview : "";
            this.dailySubTitleTextfield.text = !!param1.subtitle ? param1.subtitle : "";
        }
        
        public function set dailyObjectiveData(param1:Array) : void
        {
            var _loc2_:Number = NaN;
            var _loc3_:int = 0;
            if(param1)
            {
                _loc3_ = 0;
                while(_loc3_ < param1.length)
                {
                    this["objective_" + _loc3_].data = param1[_loc3_];
                    this["rewardTextfield_" + _loc3_].text = !!param1[_loc3_].rewardText ? param1[_loc3_].rewardText : "";
                    this["rewardNumberTextField_" + _loc3_].text = !!param1[_loc3_].reward ? param1[_loc3_].reward : "";
                    _loc3_++;
                }
            }
        }
    }
}
