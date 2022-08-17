package tripwire.containers
{
    import flash.events.Event;
    import scaleform.clik.core.UIComponent;
    
    public class MoveContainer extends UIComponent
    {
         
        
        private var MAX_INDICATORS:int = 7;
        
        public function MoveContainer()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        public function set Data(param1:Array) : void
        {
            var _loc3_:int = 0;
            var _loc2_:int = this.MAX_INDICATORS - param1.length;
            if(this.MAX_INDICATORS != param1.length)
            {
                _loc2_--;
            }
            if(param1)
            {
                _loc3_ = 0;
                while(_loc3_ < param1.length)
                {
                    if(_loc3_ < this.MAX_INDICATORS)
                    {
                        this["moveIndicator_" + (_loc3_ + _loc2_)].data = param1[_loc3_];
                    }
                    _loc3_++;
                }
            }
        }
        
        public function MakeTestData() : *
        {
            var _loc1_:Array = new Array();
            _loc1_.push({
                "image":"doge.png",
                "progressPercent":1,
                "buttonString":"XboxTypeS_A"
            });
            _loc1_.push({
                "image":"doge.png",
                "progressPercent":0.75,
                "buttonString":"XboxTypeS_B"
            });
            _loc1_.push({
                "image":"doge.png",
                "progressPercent":0.5,
                "buttonString":"XboxTypeS_X"
            });
            _loc1_.push({
                "image":"doge.png",
                "progressPercent":0,
                "buttonString":"XboxTypeS_Y"
            });
            _loc1_.push({
                "image":"doge.png",
                "progressPercent":0.1,
                "buttonString":"LMB"
            });
            _loc1_.push({
                "image":"doge.png",
                "progressPercent":1,
                "buttonString":"RMB"
            });
            this.Data = _loc1_;
        }
    }
}
