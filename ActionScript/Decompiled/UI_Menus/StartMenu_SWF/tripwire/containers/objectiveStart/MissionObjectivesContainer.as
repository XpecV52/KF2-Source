package tripwire.containers.objectiveStart
{
    import com.greensock.TimelineMax;
    import com.greensock.easing.Power0;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextFieldAutoSize;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    
    public class MissionObjectivesContainer extends TripContainer
    {
         
        
        public var collapsedMissionObjectivesMC:CollapsedMissionObjectiveContainer;
        
        public var expandedMissionObjectivesMC:ExpandedMissionObjectiveContainer;
        
        public var switchButton:TripButton;
        
        public var buttonArrow:MovieClip;
        
        public var background:MovieClip;
        
        public var buttonPrompt:MovieClip;
        
        public var switchTimeline:TimelineMax;
        
        private const BG_Collapsed_Height:int = 120;
        
        private const BG_Expanded_Height:int = 768;
        
        private const button_Collapsed_Y:int = 720;
        
        private const button_Expanded_Y:int = 16;
        
        private const buttonPrompt_Padding:int = 72;
        
        private const buttonPrompt_Icon_Offset:int = 16;
        
        private const buttonPrompt_Text_Offset:Number = 4.45;
        
        protected var _bSeasonalEventActive:Boolean = true;
        
        protected var _weeklyEventActive:Boolean = true;
        
        protected var bExpanded:Boolean = true;
        
        protected var bInteractable:Boolean = true;
        
        public function MissionObjectivesContainer()
        {
            this.switchTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true,
                "onComplete":this.updateArrow,
                "onReverseComplete":this.updateArrow
            });
            super();
            _enableInitCallback = true;
            this.buttonArrow.mouseEnabled = false;
            this.buttonArrow.mouseChildren = false;
        }
        
        public function toggleExpanded() : void
        {
            this.expanded = !this.bExpanded;
        }
        
        public function set buttonPromptString(param1:String) : void
        {
            this.buttonPrompt.textField.autoSize = TextFieldAutoSize.LEFT;
            this.buttonPrompt.textField.text = param1;
            this.buttonPrompt.BlackBG.width = this.buttonPrompt.textField.textWidth + this.buttonPrompt_Padding;
            this.buttonPrompt.icon.x = -(this.buttonPrompt.BlackBG.width / 2) + this.buttonPrompt_Icon_Offset;
            this.buttonPrompt.textField.x = this.buttonPrompt.icon.x + this.buttonPrompt.icon.width + this.buttonPrompt_Text_Offset;
        }
        
        public function initAnimation() : void
        {
            this.switchTimeline.add("start");
            this.switchTimeline.fromTo(this.collapsedMissionObjectivesMC,4,{"autoAlpha":1},{
                "autoAlpha":0,
                "ease":Power0.easeNone
            });
            this.switchTimeline.add("BGanimate");
            this.switchTimeline.fromTo(this.background,4,{"height":this.BG_Collapsed_Height},{
                "height":this.BG_Expanded_Height,
                "ease":Power0.easeNone
            },"BGanimate");
            this.switchTimeline.fromTo(this.switchButton,4,{"y":this.button_Collapsed_Y},{
                "y":this.button_Expanded_Y,
                "ease":Power0.easeNone
            },"BGanimate");
            this.switchTimeline.fromTo(this.buttonArrow,4,{"y":this.button_Collapsed_Y},{
                "y":this.button_Expanded_Y,
                "ease":Power0.easeNone
            },"BGanimate");
            this.switchTimeline.fromTo(this.expandedMissionObjectivesMC,4,{"autoAlpha":0},{
                "autoAlpha":1,
                "ease":Power0.easeNone
            });
        }
        
        public function updateArrow() : void
        {
            this.buttonArrow.rotation = this.expanded == true ? Number(180) : Number(0);
        }
        
        public function onLeftPressed() : *
        {
            if(this.expandedMissionObjectivesMC.visible && this.expandedMissionObjectivesMC.pageIndex >= this.expandedMissionObjectivesMC.Weekly && this.interactable)
            {
                --this.expandedMissionObjectivesMC.pageIndex;
            }
        }
        
        public function onRighttPressed() : *
        {
            if(this.expandedMissionObjectivesMC.visible && this.expandedMissionObjectivesMC.pageIndex < this.expandedMissionObjectivesMC.SpecialEvent && this.interactable)
            {
                this.expandedMissionObjectivesMC.pageIndex += 1;
            }
        }
        
        public function updateControllerIcons(param1:Boolean = false) : void
        {
            if(param1 || !this.interactable)
            {
                this.buttonPrompt.visible = false;
                this.expandedMissionObjectivesMC.dpadLeftIcon.visible = false;
                this.expandedMissionObjectivesMC.dpadRightIcon.visible = false;
            }
            else
            {
                this.buttonPrompt.visible = bManagerUsingGamepad;
                this.expandedMissionObjectivesMC.dpadLeftIcon.visible = bManagerUsingGamepad && this.seasonalEventActive && this.weeklyEventActive;
                this.expandedMissionObjectivesMC.dpadRightIcon.visible = bManagerUsingGamepad && this.seasonalEventActive && this.weeklyEventActive;
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.expanded = false;
            this.switchButton.addEventListener(ButtonEvent.CLICK,this.switchExpandCollapse,false,0,true);
            this.updateControllerIcons();
            this.initAnimation();
            this.switchTimeline.stop();
            this.expandedMissionObjectivesMC.visible = false;
            this.switchTimeline.gotoAndStop("start",true);
        }
        
        public function set expanded(param1:Boolean) : void
        {
            if(this.bExpanded != param1)
            {
                this.switchTimeline.stop();
                if(param1 == true)
                {
                    this.switchTimeline.play();
                }
                else
                {
                    this.switchTimeline.reverse();
                }
            }
            this.bExpanded = param1;
        }
        
        public function set seasonalEventActive(param1:Boolean) : void
        {
            this._bSeasonalEventActive = param1;
            this.expandedMissionObjectivesMC.updateSeasonalEventActive(this._bSeasonalEventActive);
            this.updateControllerIcons();
        }
        
        public function set weeklyEventActive(param1:Boolean) : void
        {
            this._weeklyEventActive = param1;
            this.expandedMissionObjectivesMC.updateWeeklyEventActive(this._weeklyEventActive);
            this.updateControllerIcons();
        }
        
        public function get weeklyEventActive() : Boolean
        {
            return this._weeklyEventActive;
        }
        
        public function get seasonalEventActive() : Boolean
        {
            return this._bSeasonalEventActive;
        }
        
        public function switchExpandCollapse(param1:ButtonEvent) : void
        {
            this.expanded = !this.expanded;
        }
        
        public function onExpandPressed(param1:ButtonEvent) : void
        {
            this.expanded = true;
        }
        
        public function onCollapsePressed(param1:ButtonEvent) : void
        {
            this.expanded = false;
        }
        
        public function get expanded() : Boolean
        {
            return this.bExpanded;
        }
        
        public function get interactable() : Boolean
        {
            return this.bInteractable;
        }
        
        public function set interactable(param1:Boolean) : void
        {
            this.mouseEnabled = param1;
            this.mouseChildren = param1;
            this.alpha = !!param1 ? Number(1) : Number(0.24);
            this.bInteractable = param1;
            this.updateControllerIcons();
        }
    }
}
