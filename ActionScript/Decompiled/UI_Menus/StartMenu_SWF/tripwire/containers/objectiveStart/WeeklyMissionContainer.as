package tripwire.containers.objectiveStart
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoader;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    import tripwire.controls.objectiveStart.RewardRenderer;
    import tripwire.controls.objectiveStart.WeeklyModifierRenderer;
    
    public class WeeklyMissionContainer extends TripContainer
    {
         
        
        public var weeklyObjectiveRenderer:ObjectiveInfoRenderer;
        
        public var currentModifierTextfield:TextField;
        
        public var rewardTextfield:TextField;
        
        public var grantedTextfield:TextField;
        
        public var weeklyTextfield:TextField;
        
        public var weeklyOverviewTextField:TextField;
        
        public var weeklyTimeTextField:TextField;
        
        public var weeklyDescriptionTextField:TextField;
        
        public var vaultDoshTextField:TextField;
        
        public var vaultDoshValueField:TextField;
        
        public var vaultDoshIcon:MovieClip;
        
        public var modifer_0:WeeklyModifierRenderer;
        
        public var modifer_1:WeeklyModifierRenderer;
        
        public var modifer_2:WeeklyModifierRenderer;
        
        public var modifer_3:WeeklyModifierRenderer;
        
        public var modifer_4:WeeklyModifierRenderer;
        
        public var reward_0:RewardRenderer;
        
        public var iconImageLoader:TripUILoader;
        
        protected var modifierList:Vector.<WeeklyModifierRenderer>;
        
        protected var rewardList:Vector.<RewardRenderer>;
        
        public function WeeklyMissionContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.modifierList = new Vector.<WeeklyModifierRenderer>();
            this.modifierList.push(this.modifer_0,this.modifer_1,this.modifer_2,this.modifer_3,this.modifer_4);
            this.rewardList = new Vector.<RewardRenderer>();
            this.rewardList.push(this.reward_0);
            this.hideRewardItems();
        }
        
        public function hideRewardItems() : void
        {
            var _loc1_:int = 0;
            while(_loc1_ < this.rewardList.length)
            {
                this.rewardList[_loc1_].visible = false;
                _loc1_++;
            }
            this.vaultDoshReward = -1;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.rewardTextfield.text = !!param1.reward ? param1.reward : "";
            this.grantedTextfield.text = !!param1.granted ? param1.granted : "";
            this.weeklyTextfield.text = !!param1.weekly ? param1.weekly : "";
            this.weeklyOverviewTextField.text = !!param1.overview ? param1.overview : "";
            this.weeklyDescriptionTextField.text = !!param1.description ? param1.description : "";
            this.vaultDoshTextField.text = !!param1.vaultDosh ? param1.vaultDosh : "";
        }
        
        public function set vaultDoshReward(param1:int) : void
        {
            this.vaultDoshValueField.text = param1.toString();
            this.vaultDoshTextField.visible = param1 > 0;
            this.vaultDoshValueField.visible = param1 > 0;
            this.vaultDoshIcon.visible = param1 > 0;
        }
        
        public function set weeklyObjectiveData(param1:Object) : void
        {
            this.weeklyObjectiveRenderer.data = !!param1 ? param1 : null;
            this.iconImageLoader.source = !!param1.iconPath ? param1.iconPath : "";
        }
        
        public function set modifiers(param1:Array) : void
        {
        }
        
        public function set rewards(param1:Array) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this.rewardList.length)
            {
                if(_loc2_ < param1.length)
                {
                    this.rewardList[_loc2_].data = param1[_loc2_];
                }
                else
                {
                    this.rewardList[_loc2_].data = null;
                }
                _loc2_++;
            }
        }
    }
}
