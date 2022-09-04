package tripwire.containers.hud
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.TimerEvent;
    import flash.filters.GlowFilter;
    import flash.text.TextField;
    import flash.utils.Timer;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    
    public class ObjectiveProgressContainer extends TripContainer
    {
         
        
        public var objectiveTitleTextfield:TextField;
        
        public var objectiveProgressTextfield:TextField;
        
        public var objectiveDescTextfield:TextField;
        
        public var objectiveStatusTextfield:TextField;
        
        public var bonusNumberTextfield:TextField;
        
        public var requirementNumberTextfield:TextField;
        
        public var normalRequirementColor:uint = 4836490;
        
        public var warningRequirementColor:uint = 16737097;
        
        public var failedColor:uint = 15541248;
        
        public var normalColor:uint = 4836490;
        
        public var defaultColor:uint = 16503487;
        
        public var disabledColor:uint = 8947848;
        
        public var stateGlow:GlowFilter;
        
        public var currentRequirementColor:Color;
        
        public var currentProgressColor:Color;
        
        public var currentStateColor:Color;
        
        public var currentStatusColor:Color;
        
        public var currentDescColor:Color;
        
        public var doshIconMC:MovieClip;
        
        public var progressDoshIconMC:MovieClip;
        
        private var _currentProgress:Number;
        
        public var failedString:String;
        
        private var _statusFlashDelay:uint = 100;
        
        private var _statusFlashRepeat:uint = 10;
        
        private var _statusFlashTimer:Timer;
        
        protected var bComplete:Boolean = false;
        
        protected var bMissionCritical:Boolean = false;
        
        public function ObjectiveProgressContainer()
        {
            this.stateGlow = new GlowFilter(0,1,8,8,1,3,false,false);
            this.currentRequirementColor = new Color();
            this.currentProgressColor = new Color();
            this.currentStateColor = new Color();
            this.currentStatusColor = new Color();
            this.currentDescColor = new Color();
            this._statusFlashTimer = new Timer(this._statusFlashDelay,this._statusFlashRepeat);
            super();
            enableInitCallback = true;
            this._statusFlashTimer.addEventListener(TimerEvent.TIMER,this.statusTimerHandler);
            this._statusFlashTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.statusCompleteHandler);
        }
        
        private function statusTimerHandler(param1:TimerEvent) : void
        {
            this.objectiveStatusTextfield.visible = !this.objectiveStatusTextfield.visible;
        }
        
        private function statusCompleteHandler(param1:TimerEvent) : void
        {
            this.objectiveStatusTextfield.visible = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.isActive = false;
            visible = false;
            this.missionCriticalStatus = false;
            TextFieldEx.setVerticalAlign(this.objectiveDescTextfield,"center");
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.objectiveTitleTextfield.text = !!param1.objectiveTitle ? param1.objectiveTitle : "";
                this.objectiveDescTextfield.text = !!param1.objectiveDesc ? param1.objectiveDesc : "";
                this.currentDescColor.setTint(this.defaultColor,1);
                this.currentProgressColor.setTint(this.defaultColor,1);
                this.objectiveDescTextfield.transform.colorTransform = this.currentDescColor;
                this.objectiveProgressTextfield.transform.colorTransform = this.currentProgressColor;
            }
        }
        
        public function set currentStatus(param1:Object) : void
        {
            if(param1.StatusMessage != this.objectiveStatusTextfield.text)
            {
                this.objectiveStatusTextfield.text = param1.StatusMessage;
                if(param1.StatusMessage != "")
                {
                    this._statusFlashTimer.reset();
                    if(param1.bStatusNotification)
                    {
                        this.currentStatusColor.setTint(this.normalColor,1);
                        this.currentDescColor.setTint(this.defaultColor,1);
                    }
                    else if(param1.bStatusWarning)
                    {
                        this.currentStatusColor.setTint(this.failedColor,1);
                        this.currentDescColor.setTint(this.defaultColor,1);
                        this._statusFlashTimer.start();
                    }
                    else
                    {
                        this.currentStatusColor.setTint(this.defaultColor,1);
                        this.currentDescColor.setTint(this.disabledColor,1);
                    }
                    this.objectiveStatusTextfield.transform.colorTransform = this.currentStatusColor;
                    this.objectiveDescTextfield.transform.colorTransform = this.currentDescColor;
                }
            }
        }
        
        public function set currentProgressText(param1:String) : void
        {
            this.objectiveProgressTextfield.text = param1;
            this.objectiveProgressTextfield.transform.colorTransform = this.currentProgressColor;
        }
        
        public function set currentProgressIsDosh(param1:Boolean) : void
        {
            this.progressDoshIconMC.visible = param1;
            if(param1)
            {
                this.progressDoshIconMC.gotoAndStop(3);
            }
        }
        
        public function set isActive(param1:Boolean) : void
        {
        }
        
        public function set currentIcon(param1:String) : void
        {
            if(param1 == "")
            {
            }
        }
        
        public function set completeStatus(param1:Object) : void
        {
            if(this.bComplete != param1.bComplete)
            {
                this.bComplete = param1.bComplete;
                gotoAndStop(!!this.bComplete ? "complete" : "default");
                if(this.bComplete)
                {
                    this.currentProgressColor.setTint(this.normalColor,1);
                    this.currentProgressText = param1.completeString;
                    this.currentProgressIsDosh = false;
                }
            }
        }
        
        public function set missionCriticalStatus(param1:Boolean) : void
        {
            if(this.bMissionCritical != param1)
            {
                this.bMissionCritical = param1;
            }
        }
        
        public function set objectiveNumber(param1:Object) : void
        {
            if(!param1)
            {
            }
        }
        
        public function set failed(param1:Object) : void
        {
            var _loc2_:Boolean = !!param1.bFailed ? Boolean(param1.bFailed) : false;
            this.currentStateColor.setTint(!!_loc2_ ? uint(this.failedColor) : uint(this.normalRequirementColor),1);
            this.stateGlow.color = !!_loc2_ ? uint(this.failedColor) : uint(this.normalRequirementColor);
            this.bonusNumberTextfield.transform.colorTransform = this.currentStateColor;
            this.bonusNumberTextfield.filters = [this.stateGlow];
            if(_loc2_)
            {
                this.doshIconMC.gotoAndStop(2);
                this.currentProgressColor.setTint(this.failedColor,1);
                this.currentProgressText = param1.failedString;
                this.currentProgressIsDosh = false;
                this.currentBonus = "0";
            }
        }
        
        public function set currentBonus(param1:String) : void
        {
            this.bonusNumberTextfield.text = param1;
        }
        
        public function set currentRequirement(param1:String) : void
        {
        }
        
        public function set requirements(param1:Object) : void
        {
            if(param1)
            {
                this.currentRequirementColor.setTint(!!param1.requirementMet ? uint(this.normalRequirementColor) : uint(this.warningRequirementColor),1);
            }
        }
        
        public function set rewardValue(param1:int) : *
        {
            this.bonusNumberTextfield.text = param1.toString();
        }
        
        public function testObjective(param1:KeyboardEvent) : void
        {
        }
    }
}
