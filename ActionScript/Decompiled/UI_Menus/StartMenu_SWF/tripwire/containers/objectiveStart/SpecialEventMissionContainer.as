package tripwire.containers.objectiveStart
{
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoader;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    import tripwire.controls.objectiveStart.RewardRenderer;
    
    public class SpecialEventMissionContainer extends TripContainer
    {
         
        
        public var titleTextfield:TextField;
        
        public var rewardTextfield:TextField;
        
        public var grantedTextfield:TextField;
        
        public var chanceOfDropTextfield:TextField;
        
        public var objective_0:ObjectiveInfoRenderer;
        
        public var objective_1:ObjectiveInfoRenderer;
        
        public var objective_2:ObjectiveInfoRenderer;
        
        public var objective_3:ObjectiveInfoRenderer;
        
        public var objective_4:ObjectiveInfoRenderer;
        
        protected var objectiveList:Vector.<ObjectiveInfoRenderer>;
        
        public var grantedReward:RewardRenderer;
        
        public var chanceOfDrop_0:RewardRenderer;
        
        public var chanceOfDrop_1:RewardRenderer;
        
        protected var chanceOfDropList:Vector.<RewardRenderer>;
        
        public var iconImageLoader:TripUILoader;
        
        public function SpecialEventMissionContainer()
        {
            this.objectiveList = new Vector.<ObjectiveInfoRenderer>();
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.initLists();
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.titleTextfield.text = !!param1.title ? param1.title : "";
            this.rewardTextfield.text = !!param1.reward ? param1.reward : "";
            this.grantedTextfield.text = !!param1.granted ? param1.granted : "";
            this.chanceOfDropTextfield.text = !!param1.chanceOfDrop ? param1.chanceOfDrop : "";
        }
        
        public function initLists() : void
        {
            this.objectiveList.push(this.objective_0,this.objective_1,this.objective_2,this.objective_3,this.objective_4);
            this.chanceOfDropList = new Vector.<RewardRenderer>();
            this.chanceOfDropList.push(this.chanceOfDrop_0,this.chanceOfDrop_1);
        }
        
        public function set allCompleteReward(param1:Object) : void
        {
            if(param1)
            {
                this.grantedReward.data = param1;
                this.grantedReward.visible = true;
            }
            else
            {
                this.grantedReward.visible = false;
            }
        }
        
        public function set chanceDrops(param1:Array) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this.chanceOfDropList.length)
            {
                if(_loc2_ < param1.length)
                {
                    this.chanceOfDropList[_loc2_].data = param1[_loc2_];
                }
                else
                {
                    this.chanceOfDropList[_loc2_].visible = false;
                }
                _loc2_++;
            }
        }
        
        public function set objectives(param1:Array) : void
        {
            var _loc2_:int = 0;
            if(param1)
            {
                _loc2_ = 0;
                while(_loc2_ < this.objectiveList.length)
                {
                    if(_loc2_ < param1.length)
                    {
                        this.objectiveList[_loc2_].data = param1[_loc2_];
                    }
                    else
                    {
                        this.objectiveList[_loc2_].data = null;
                    }
                    _loc2_++;
                }
                this.iconImageLoader.source = !!param1.iconPath ? param1.iconPath : "";
            }
        }
    }
}
