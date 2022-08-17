package tripwire.widgets
{
    import flash.events.Event;
    import tripwire.containers.TripContainer;
    
    public class PlayerRosterWidget extends TripContainer
    {
         
        
        protected const MaxTeamSlots = 5;
        
        public function PlayerRosterWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set data(param1:Array) : void
        {
            var _loc2_:int = 0;
            if(param1)
            {
                _loc2_ = 0;
                while(_loc2_ < param1.length)
                {
                    if(_loc2_ < this.MaxTeamSlots)
                    {
                        this["teamSlot_" + _loc2_].data = param1[_loc2_];
                    }
                    _loc2_++;
                }
            }
        }
        
        public function makeTestData() : void
        {
            var _loc1_:* = new Array();
            var _loc2_:int = 0;
            while(_loc2_ < this.MaxTeamSlots)
            {
                _loc1_.push({
                    "playerIcon":"doge.png",
                    "zedIcon":"doge.png",
                    "health":_loc2_ * 0.1
                });
                _loc2_++;
            }
            this.data = _loc1_;
        }
    }
}
