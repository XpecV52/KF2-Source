package tripwire.containers.hud
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.filters.GlowFilter;
    import flash.text.TextField;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoader;
    
    public class ObjectiveProgressContainer extends TripContainer
    {
         
        
        public var progressBarMC:MovieClip;
        
        public var outerLines:MovieClip;
        
        public var requirementIcon:MovieClip;
        
        public var objectiveRequirementContainer:MovieClip;
        
        public var iconLoaderMC:TripUILoader;
        
        public var bonusNumberTextfield:TextField;
        
        public var requirementNumberTextfield:TextField;
        
        public var normalRequirementColor:uint = 4836490;
        
        public var warningRequirementColor:uint = 15541248;
        
        public var failedColor:uint = 15541248;
        
        public var normalColor:uint = 4836490;
        
        public var defaultColor:uint = 16503487;
        
        public var stateGlow:GlowFilter;
        
        public var currentRequirementColor:Color;
        
        public var currentProgressColor:Color;
        
        public var currentStateColor:Color;
        
        public var doshIconMC:MovieClip;
        
        public var accentsMC:MovieClip;
        
        public var criticalBoxMC;
        
        private var _currentProgress:Number;
        
        public var failedString:String;
        
        public var objectiveNumberMC;
        
        protected var bComplete:Boolean = false;
        
        protected var bMissionCritical:Boolean = false;
        
        public function ObjectiveProgressContainer()
        {
            this.stateGlow = new GlowFilter(0,1,8,8,1,3,false,false);
            this.currentRequirementColor = new Color();
            this.currentProgressColor = new Color();
            this.currentStateColor = new Color();
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.isActive = false;
            visible = false;
            this.objectiveRequirementContainer.visible = true;
            TextFieldEx.setTextAutoSize(this.objectiveRequirementContainer.requirementNumberTextfield,"shrink");
            this.objectiveNumberMC.visible = false;
            this.missionCriticalStatus = false;
            this.criticalBoxMC.visible = false;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.failedString = !!param1.failedString ? param1.failedString : "";
            }
        }
        
        public function set isActive(param1:Boolean) : void
        {
        }
        
        public function set currentIcon(param1:String) : void
        {
            if(param1 == "")
            {
                this.iconLoaderMC.visible = false;
            }
            else
            {
                this.iconLoaderMC.source = param1;
            }
        }
        
        public function set completeStatus(param1:Boolean) : void
        {
            if(this.bComplete != param1)
            {
                this.bComplete = param1;
                gotoAndStop(!!this.bComplete ? "complete" : "default");
                if(this.bComplete)
                {
                    this.criticalBoxMC.visible = false;
                }
            }
        }
        
        public function set missionCriticalStatus(param1:Boolean) : void
        {
            if(this.bMissionCritical != param1)
            {
                this.bMissionCritical = param1;
                this.objectiveNumberMC.y = !!this.bMissionCritical ? 18 : 32;
                this.criticalBoxMC.visible = this.bMissionCritical;
            }
        }
        
        public function set objectiveNumber(param1:Object) : void
        {
            if(param1)
            {
                this.objectiveNumberMC.visible = param1.textValue && param1.textValue != "";
                this.objectiveNumberMC.numberTextfield.text = param1.textValue;
            }
            else
            {
                this.objectiveNumberMC.visble = false;
            }
        }
        
        public function set currentProgress(param1:Number) : void
        {
            if(this._currentProgress < param1)
            {
                if(this.currentProgressColor.tintColor != this.normalColor)
                {
                    this.currentProgressColor.setTint(this.normalColor,1);
                    this.progressBarMC.transform.colorTransform = this.currentProgressColor;
                    this.bonusNumberTextfield.transform.colorTransform = this.currentProgressColor;
                    this.stateGlow.color = this.normalColor;
                    this.bonusNumberTextfield.filters = [this.stateGlow];
                    this.doshIconMC.gotoAndStop(1);
                }
            }
            else if(this._currentProgress <= param1)
            {
                if(this.currentProgressColor.tintColor != this.defaultColor)
                {
                    this.currentProgressColor.setTint(this.defaultColor,1);
                    this.progressBarMC.transform.colorTransform = this.currentProgressColor;
                    this.bonusNumberTextfield.transform.colorTransform = this.currentProgressColor;
                    this.stateGlow.color = this.defaultColor;
                    this.bonusNumberTextfield.filters = [this.stateGlow];
                    this.doshIconMC.gotoAndStop(3);
                }
            }
            this.progressBarMC.gotoAndStop(param1 + 1);
            this._currentProgress = param1;
        }
        
        public function set failed(param1:Object) : void
        {
            var _loc2_:Boolean = !!param1.bFailed ? Boolean(param1.bFailed) : false;
            this.doshIconMC.gotoAndStop(!!_loc2_ ? 2 : 1);
            this.accentsMC.gotoAndStop(!!_loc2_ ? 2 : 1);
            this.currentStateColor.setTint(!!_loc2_ ? uint(this.failedColor) : uint(this.normalRequirementColor),1);
            this.stateGlow.color = !!_loc2_ ? uint(this.failedColor) : uint(this.normalRequirementColor);
            this.bonusNumberTextfield.transform.colorTransform = this.currentStateColor;
            this.bonusNumberTextfield.filters = [this.stateGlow];
            this.iconLoaderMC.transform.colorTransform = this.currentStateColor;
            this.objectiveRequirementContainer.requirementNumberTextfield.text = this.failedString;
            this.objectiveRequirementContainer.transform.colorTransform = this.currentStateColor;
            this.doshIconMC.visible = !_loc2_;
            this.bonusNumberTextfield.visible = !_loc2_;
            this.objectiveRequirementContainer.visible = _loc2_;
        }
        
        public function set currentBonus(param1:String) : void
        {
            this.bonusNumberTextfield.text = param1;
        }
        
        public function set currentRequirement(param1:String) : void
        {
            this.objectiveRequirementContainer.requirementIcon.gotoAndStop(param1);
        }
        
        public function set requirements(param1:Object) : void
        {
            if(param1)
            {
                this.objectiveRequirementContainer.requirementNumberTextfield.text = !!param1.requirementString ? param1.requirementString : "";
                this.currentRequirementColor.setTint(!!param1.requirementMet ? uint(this.normalRequirementColor) : uint(this.warningRequirementColor),1);
                this.objectiveRequirementContainer.transform.colorTransform = this.currentRequirementColor;
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
