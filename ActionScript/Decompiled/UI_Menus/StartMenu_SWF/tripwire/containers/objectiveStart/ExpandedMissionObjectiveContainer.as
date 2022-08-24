package tripwire.containers.objectiveStart
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripTabButton;
    
    public class ExpandedMissionObjectiveContainer extends TripContainer
    {
         
        
        public var dpadRightIcon:MovieClip;
        
        public var dpadLeftIcon:MovieClip;
        
        public var collapseButton:TripButton;
        
        public var weeklyButton:TripTabButton;
        
        public var specialEventButton:TripTabButton;
        
        public var dailyButton:TripTabButton;
        
        public var specialEventContainerMC:SpecialEventMissionContainer;
        
        public var weeklyContainerMC:WeeklyMissionContainer;
        
        protected var _currentPageIndex:int = -1;
        
        protected var bSeasonalActive:Boolean = true;
        
        public const Weekly = 0;
        
        public const SpecialEvent = 1;
        
        public const Daily = 2;
        
        protected var containerList:Vector.<TripContainer>;
        
        public function ExpandedMissionObjectiveContainer()
        {
            this.containerList = new Vector.<TripContainer>();
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.collapseButton.focusable = false;
            this.weeklyButton.focusable = false;
            this.specialEventButton.focusable = false;
            this.dailyButton.visible = false;
            this.containerList.push(this.weeklyContainerMC,this.specialEventContainerMC);
            this.specialEventButton.addEventListener(ButtonEvent.CLICK,this.onTabButtonClick,false,0,true);
            this.dailyButton.addEventListener(ButtonEvent.CLICK,this.onTabButtonClick,false,0,true);
            this.weeklyButton.addEventListener(ButtonEvent.CLICK,this.onTabButtonClick,false,0,true);
            this.pageIndex = this.Weekly;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.dailyButton.label = !!param1.daily ? param1.daily : "";
            this.weeklyButton.label = !!param1.weekly ? param1.weekly : "";
            this.specialEventButton.label = !!param1.specialEvent ? param1.specialEvent : "";
        }
        
        public function updateSeasonalEventActive(param1:Boolean) : void
        {
            this.bSeasonalActive = param1;
            this.specialEventButton.visible = param1;
            this.weeklyButton.x = !!param1 ? Number(60) : Number(222);
        }
        
        public function updateWeeklyEventActive(param1:Boolean) : void
        {
            this.weeklyButton.visible = param1;
            this.specialEventButton.x = !!param1 ? Number(60) : Number(222);
        }
        
        public function onTabButtonClick(param1:ButtonEvent) : void
        {
            switch(param1.currentTarget)
            {
                case this.weeklyButton:
                    this.pageIndex = this.Weekly;
                    break;
                case this.specialEventButton:
                    this.pageIndex = this.SpecialEvent;
                    break;
                case this.dailyButton:
            }
        }
        
        public function set pageIndex(param1:int) : void
        {
            var _loc2_:int = this.validateIndex(param1);
            param1 = _loc2_;
            if(param1 != this._currentPageIndex)
            {
                this.switchToMissionObjective(param1);
            }
            this._currentPageIndex = param1;
        }
        
        public function validateIndex(param1:int) : int
        {
            switch(param1)
            {
                case this.SpecialEvent:
                    if(this.bSeasonalActive)
                    {
                        return param1;
                    }
                    return this.Weekly;
                    break;
                case this.Weekly:
                    if(this.weeklyButton.visible)
                    {
                        return param1;
                    }
                    return this.SpecialEvent;
                    break;
                default:
                    return this.Weekly;
            }
        }
        
        public function get pageIndex() : int
        {
            return this._currentPageIndex;
        }
        
        public function switchToMissionObjective(param1:int) : void
        {
            var _loc2_:TripContainer = null;
            var _loc3_:TripContainer = null;
            switch(param1)
            {
                case this.Weekly:
                    _loc2_ = this.weeklyContainerMC;
                    this.weeklyButton.selected = true;
                    this.specialEventButton.selected = false;
                    break;
                case this.SpecialEvent:
                    _loc2_ = this.specialEventContainerMC;
                    this.specialEventButton.selected = true;
                    this.weeklyButton.selected = false;
            }
            for each(_loc3_ in this.containerList)
            {
                _loc3_.visible = _loc3_ == _loc2_;
            }
        }
    }
}
