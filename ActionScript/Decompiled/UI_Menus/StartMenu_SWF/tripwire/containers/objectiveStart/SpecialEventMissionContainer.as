package tripwire.containers.objectiveStart
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoader;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    import tripwire.controls.objectiveStart.RewardRenderer;
    
    public class SpecialEventMissionContainer extends TripContainer
    {
         
        
        public var titleTextfield:TextField;
        
        public var descTextfield:TextField;
        
        public var rewardTextfield:TextField;
        
        public var grantedTextfield:TextField;
        
        public var chanceOfDropTextfield:TextField;
        
        public var fillBar:MovieClip;
        
        public var objective_0:ObjectiveInfoRenderer;
        
        public var objective_1:ObjectiveInfoRenderer;
        
        public var objective_2:ObjectiveInfoRenderer;
        
        public var objective_3:ObjectiveInfoRenderer;
        
        public var objective_4:ObjectiveInfoRenderer;
        
        protected var objectiveList:Vector.<ObjectiveInfoRenderer>;
        
        public var rewardNumberTextField_0:TextField;
        
        public var rewardNumberTextField_1:TextField;
        
        public var rewardNumberTextField_2:TextField;
        
        public var rewardNumberTextField_3:TextField;
        
        public var rewardNumberTextField_4:TextField;
        
        public var vaultDoshBG_0:MovieClip;
        
        public var vaultDoshBG_1:MovieClip;
        
        public var vaultDoshBG_2:MovieClip;
        
        public var vaultDoshBG_3:MovieClip;
        
        public var vaultDoshBG_4:MovieClip;
        
        public var grantedReward:RewardRenderer;
        
        public var chanceOfDrop_0:RewardRenderer;
        
        public var chanceOfDrop_1:RewardRenderer;
        
        protected var chanceOfDropList:Vector.<RewardRenderer>;
        
        public var iconImageLoader:TripUILoader;
        
        protected var vaultRewardBGs:Vector.<MovieClip>;
        
        protected var vaultRewardTextfields:Vector.<TextField>;
        
        public var _isTieredEvent:Boolean = false;
        
        public const FILLBAR_HEIGHT:Number = 123.2;
        
        public var testArray:Array;
        
        public var testText:Object;
        
        public var test0:Object;
        
        public var test1:Object;
        
        public var test2:Object;
        
        public var test3:Object;
        
        public var test4:Object;
        
        public function SpecialEventMissionContainer()
        {
            this.objectiveList = new Vector.<ObjectiveInfoRenderer>();
            this.vaultRewardBGs = new Vector.<MovieClip>();
            this.vaultRewardTextfields = new Vector.<TextField>();
            super();
            this.fillBar.visible = false;
            this.fillBar.height = 0;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            gotoAndStop("regular");
        }
        
        public function testStuff() : void
        {
            this.isTieredEvent = true;
            this.testText = {
                "title":"Endless Mode",
                "description":"Beat the indicated wave in Endless to earn rewards"
            };
            this.test0 = {
                "label":"Endless Survivor",
                "complete":true,
                "waveNum":"5",
                "tierNum":0,
                "rewardName":"D.A.R. Classic - White",
                "description":"Beat wave 5 in Endless",
                "rewardValue":"100000"
            };
            this.test1 = {
                "label":"Endless Amateur",
                "complete":false,
                "waveNum":"10",
                "tierNum":1,
                "rewardName":"D.A.R. Classic - Bronze",
                "description":"Beat wave 10 in Endless",
                "rewardValue":"100000"
            };
            this.test2 = {
                "label":"Endless Veteran",
                "complete":false,
                "waveNum":"15",
                "tierNum":2,
                "rewardName":"D.A.R. Classic - Silver",
                "description":"Beat wave 15 in Endless",
                "rewardValue":"100000"
            };
            this.test3 = {
                "label":"Endless Professional",
                "complete":false,
                "waveNum":"20",
                "tierNum":3,
                "rewardName":"D.A.R. Classic - Blue",
                "description":"Beat wave 20 in Endless",
                "rewardValue":"100000"
            };
            this.test4 = {
                "label":"Endless Champion",
                "complete":false,
                "waveNum":"25",
                "tierNum":4,
                "rewardName":"D.A.R. Classic - Gold",
                "description":"Beat wave 25 in Endless",
                "rewardValue":"100000"
            };
            this.testArray = [this.test0,this.test1,this.test2,this.test3,this.test4];
            this.objectives = this.testArray;
            this.localizedText = this.testText;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.titleTextfield.text = !!param1.title ? param1.title : "";
            this.descTextfield.text = !!param1.description ? param1.description : "";
            this.rewardTextfield.text = !!param1.reward ? param1.reward : "";
            this.grantedTextfield.text = !!param1.granted ? param1.granted : "";
            this.chanceOfDropTextfield.text = !!param1.chanceOfDrop ? param1.chanceOfDrop : "";
        }
        
        public function initLists() : void
        {
            this.objectiveList.length = 0;
            this.objectiveList.push(this.objective_0,this.objective_1,this.objective_2,this.objective_3,this.objective_4);
            this.vaultRewardTextfields.push(this.rewardNumberTextField_0,this.rewardNumberTextField_1,this.rewardNumberTextField_2,this.rewardNumberTextField_3,this.rewardNumberTextField_4);
            this.vaultRewardBGs.push(this.vaultDoshBG_0,this.vaultDoshBG_1,this.vaultDoshBG_2,this.vaultDoshBG_3,this.vaultDoshBG_4);
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
        
        public function set isTieredEvent(param1:Boolean) : void
        {
            gotoAndStop(!!param1 ? "tier" : "regular");
            this._isTieredEvent = param1;
        }
        
        public function get isTieredEvent() : Boolean
        {
            return this._isTieredEvent;
        }
        
        public function set objectives(param1:Array) : void
        {
            var _loc2_:int = 0;
            this.initLists();
            if(param1)
            {
                _loc2_ = 0;
                while(_loc2_ < this.objectiveList.length)
                {
                    if(_loc2_ < param1.length)
                    {
                        this.objectiveList[_loc2_].bIsContracted = false;
                        this.objectiveList[_loc2_].data = param1[_loc2_];
                        if(this.vaultRewardTextfields[_loc2_])
                        {
                            this.vaultRewardTextfields[_loc2_].text = !!param1[_loc2_].rewardValue ? param1[_loc2_].rewardValue : "";
                            this.vaultRewardBGs[_loc2_].alpha = !!param1[_loc2_].complete ? Number(0.32) : Number(1);
                            this.vaultRewardTextfields[_loc2_].alpha = !!param1[_loc2_].complete ? Number(0.32) : Number(1);
                        }
                        if(param1[_loc2_].complete == true && this.isTieredEvent)
                        {
                            this.fillBar.visible = false;
                            this.fillBar.height = (_loc2_ + 1) * this.FILLBAR_HEIGHT;
                        }
                    }
                    else
                    {
                        this.objectiveList[_loc2_].data = null;
                        if(this.vaultRewardTextfields[_loc2_])
                        {
                            this.vaultRewardTextfields[_loc2_].text = "";
                        }
                    }
                    _loc2_++;
                }
                this.iconImageLoader.source = !!param1.iconPath ? param1.iconPath : "";
            }
        }
    }
}
