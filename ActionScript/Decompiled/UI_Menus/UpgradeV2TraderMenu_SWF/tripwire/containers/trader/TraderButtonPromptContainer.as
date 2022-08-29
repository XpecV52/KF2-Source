package tripwire.containers.trader
{
    import com.greensock.TweenMax;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextLineMetrics;
    import tripwire.containers.TripContainer;
    import tripwire.widgets.MultiPromptDisplay;
    
    public class TraderButtonPromptContainer extends TripContainer
    {
         
        
        public var autofillButtonIcon:MovieClip;
        
        public var autofillLabel:TextField;
        
        public var autofillNumText:TextField;
        
        public var doshIcon:MovieClip;
        
        public var buttonPromptContainer:MultiPromptDisplay;
        
        public var _autofillNum:String;
        
        public var _autofillState:int;
        
        public var _bShowAutoFill:Boolean;
        
        public const BUTTON_OFFSET:int = 8;
        
        public const BUTTON_SPACING:int = 64;
        
        public const START_WIDTH:int = 1856;
        
        public const DOSH_OFFSET:int = 64;
        
        public var disabledPromptAlpha:Number = 0.24;
        
        public function TraderButtonPromptContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.autofillLabel.autoSize = TextFieldAutoSize.LEFT;
            this.autofillNumText.autoSize = TextFieldAutoSize.LEFT;
            this.changeButtonPriority();
            this.buttonPromptContainer.promptSpacing = this.BUTTON_SPACING;
        }
        
        public function changeButtonPriority() : void
        {
            var _loc1_:* = new Object();
            _loc1_["xboxtypes_back"] = _loc1_["xboxtypes_back_o"] = 0;
            _loc1_["xboxtypes_start"] = _loc1_["xboxtypes_start_o"] = 1;
            _loc1_["xboxtypes_rightthumbstick"] = _loc1_["xboxtypes_rightthumbstick_o"] = 2;
            _loc1_["xboxtypes_a"] = _loc1_["xboxtypes_a_o"] = 3;
            _loc1_["xboxtypes_b"] = _loc1_["xboxtypes_b_o"] = 4;
            _loc1_["xboxtypes_leftthumbstick"] = _loc1_["xboxtypes_leftthumbstick_o"] = 5;
            _loc1_["xboxtypes_dpad_left"] = _loc1_["xboxtypes_dpad_left_o"] = 6;
            _loc1_["xboxtypes_dpad_down"] = _loc1_["xboxtypes_dpad_down_o"] = 7;
            _loc1_["xboxtypes_dpad_right"] = _loc1_["xboxtypes_dpad_right_o"] = 8;
            _loc1_["xboxtypes_dpad_up"] = _loc1_["xboxtypes_dpad_up_o"] = 9;
            _loc1_["xboxtypes_righttrigger"] = _loc1_["xboxtypes_righttrigger_o"] = 10;
            _loc1_["xboxtypes_lefttrigger"] = _loc1_["xboxtypes_lefttrigger_o"] = 11;
            _loc1_["xboxtypes_rightshoulder"] = _loc1_["xboxtypes_rightshoulder_o"] = 12;
            _loc1_["xboxtypes_leftshoulder"] = _loc1_["xboxtypes_leftshoulder_o"] = 13;
            _loc1_["xboxtypes_y"] = _loc1_["xboxtypes_y_o"] = 14;
            _loc1_["xboxtypes_x"] = _loc1_["xboxtypes_x_o"] = 15;
            this.buttonPromptContainer.buttonPriority = _loc1_;
        }
        
        public function set autofillText(param1:String) : void
        {
            this.autofillLabel.text = param1;
        }
        
        public function set promptData(param1:Array) : void
        {
            this.buttonPromptContainer.prompts = param1;
            TweenMax.killDelayedCallsTo(this.positionItems);
            TweenMax.delayedCall(1,this.positionItems,[],true);
        }
        
        public function get autofillNum() : *
        {
            return this._autofillNum;
        }
        
        public function set autofillNum(param1:String) : void
        {
            this._autofillNum = param1;
            this.autofillNumText.text = this._autofillNum;
        }
        
        public function get autofillState() : *
        {
            return this._autofillState;
        }
        
        public function set autofillState(param1:int) : void
        {
            this._autofillState = param1;
            TweenMax.allTo([this.autofillButtonIcon,this.autofillLabel,this.doshIcon,this.autofillNumText],0,{"alpha":(param1 == 0 ? 1 : this.disabledPromptAlpha)});
        }
        
        public function get bShowAutoFill() : *
        {
            return this._bShowAutoFill;
        }
        
        public function set bShowAutoFill(param1:Boolean) : void
        {
            this._bShowAutoFill = param1;
            this.autofillButtonIcon.visible = param1;
            this.autofillLabel.visible = param1;
            this.doshIcon.visible = param1;
            this.autofillNumText.visible = param1;
        }
        
        public function positionItems() : void
        {
            var _loc1_:TextLineMetrics = this.autofillLabel.getLineMetrics(0);
            this.autofillButtonIcon.x = (this.START_WIDTH - (this.BUTTON_OFFSET * 4.5 + this.BUTTON_SPACING + this.autofillButtonIcon.width + _loc1_.width + this.doshIcon.width + this.DOSH_OFFSET + this.buttonPromptContainer.actualWidth)) / 2;
            this.autofillLabel.x = this.autofillButtonIcon.x + this.autofillButtonIcon.width + this.BUTTON_OFFSET / 2;
            this.doshIcon.x = this.autofillLabel.x + _loc1_.width + this.BUTTON_OFFSET * 4;
            this.autofillNumText.x = this.doshIcon.x + this.doshIcon.width;
            this.buttonPromptContainer.x = !!this.bShowAutoFill ? Number(this.autofillNumText.x + this.DOSH_OFFSET + this.BUTTON_SPACING + this.buttonPromptContainer.actualWidth / 2) : Number(this.buttonPromptContainer.actualWidth / 2);
            alpha = 1;
        }
    }
}
