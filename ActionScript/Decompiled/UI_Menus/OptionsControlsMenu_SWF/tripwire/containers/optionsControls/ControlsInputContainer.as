package tripwire.containers.optionsControls
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.controls.SliderOption;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripCheckBox;
    
    public class ControlsInputContainer extends TripContainer
    {
         
        
        public var sensitivitySliderOption:SliderOption;
        
        public var zoomSensitivitySliderOption:SliderOption;
        
        public var invertYCheckBox:TripCheckBox;
        
        public var mouseSmoothingCheckBox:TripCheckBox;
        
        public var controllerSensitivitySliderOption:SliderOption;
        
        public var controllerZoomSensitivitySliderOption:SliderOption;
        
        public var controllerDeadzoneSliderOption:SliderOption;
        
        public var controllerAccelerationJumpSliderOption:SliderOption;
        
        public var controllerInvertYCheckBox:TripCheckBox;
        
        public var aimAssistZoomLockOnCheckBox:TripCheckBox;
        
        public var aimAssistRotationCheckBox:TripCheckBox;
        
        public var aimAssistSlowDownCheckBox:TripCheckBox;
        
        public var forceFeedbackCheckBox:TripCheckBox;
        
        public var controllerTextField:TextField;
        
        public var sectionTextField:TextField;
        
        public var sensitivityMinimumText:TextField;
        
        public var sensitivityMaximumText:TextField;
        
        public var zoomSensitivityMinimumText:TextField;
        
        public var zoomSensitivityMaximumText:TextField;
        
        public var controllerSensitivityMinimumText:TextField;
        
        public var controllerSensitivityMaximumText:TextField;
        
        public var controllerZoomSensitivityMinimumText:TextField;
        
        public var controllerZoomSensitivityMaximumText:TextField;
        
        public var controllerDeadzoneMinimumText:TextField;
        
        public var controllerDeadzoneMaximumText:TextField;
        
        public var controllerAccelerationJumpMinimumText:TextField;
        
        public var controllerAccelerationJumpMaximumText:TextField;
        
        public var sensitivityValueText:TextField;
        
        public var zoomSensitivityValueText:TextField;
        
        public var controllerSensitivityValueText:TextField;
        
        public var controllerZoomSensitivityValueText:TextField;
        
        public var controllerDeadzoneValueText:TextField;
        
        public var controllerAccelerationJumpValueText:TextField;
        
        public var defaultButton:TripButton;
        
        public var bOptionsInit;
        
        public var genericSliderSoundEffect:String = "GEN_Click";
        
        public var inputSections:MovieClip;
        
        public var scrollBar:ScrollBar;
        
        private var _scrollRate:int = 48;
        
        private var _scrollPosition:Number;
        
        private var _pageSize:int;
        
        private var _scrollDistance:int;
        
        private var _scrollDifference:Number;
        
        private var _inputSectionsOriginalY:Number;
        
        public function ControlsInputContainer()
        {
            var _loc1_:int = 0;
            super();
            if(!bManagerConsoleBuild)
            {
                this._inputSectionsOriginalY = this.inputSections.y;
                addEventListener(MouseEvent.MOUSE_WHEEL,this.handleMouseWheel,false,0,true);
                this.scrollBar.addEventListener(Event.SCROLL,this.handleScroll,false,0,true);
                this.inputSections.addEventListener(InputEvent.INPUT,this.handleScrollWhenInputSelected,false,0,true);
                _loc1_ = this.inputSections.height;
                this._pageSize = 664.9;
                this._scrollDistance = _loc1_ - this._pageSize - 4;
                this._scrollDifference = this.inputSections.y - this.scrollBar.position;
                this.updateScrollBar();
            }
            if(!bManagerConsoleBuild)
            {
                this.defaultButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            }
            this.defaultButton.tabIndex = this.inputSections.nextTabIndex++;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.inputSections.localizedInputText = param1;
            if(this.defaultButton != null)
            {
                this.defaultButton.label = !!param1.resetDefault ? param1.resetDefault : "";
            }
        }
        
        public function set initializeOptions(param1:Object) : void
        {
            this.inputSections.initializeInputOptions = param1;
        }
        
        override protected function pushToBackAnimation() : *
        {
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        protected function onButtonClick(param1:ButtonEvent) : void
        {
            if(param1.target == this.defaultButton)
            {
                ExternalInterface.call("CallBack_ResetInputOptions");
            }
        }
        
        private function handleMouseWheel(param1:MouseEvent) : *
        {
            var _loc2_:int = 0;
            if(this._scrollDistance > 0)
            {
                _loc2_ = 0;
                this.inputSections.y += param1.delta > 0 ? this._scrollRate : -this._scrollRate;
                this.inputSections.y = Math.max(Math.min(this.inputSections.y,this._inputSectionsOriginalY),-this._scrollDistance);
            }
            this.updateScrollBar();
        }
        
        private function handleScroll(param1:Event) : *
        {
            if(!bManagerUsingGamepad)
            {
                this.inputSections.y = this._inputSectionsOriginalY - this.scrollBar.position;
            }
        }
        
        private function updateScrollBar() : *
        {
            this.scrollBar.setScrollProperties(this._pageSize,0,this._scrollDistance,this._scrollRate);
            this.scrollBar.position = -this.inputSections.y;
            this.scrollBar.validateNow();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            if(this.inputSections != null)
            {
                this.inputSections.closeContainer();
            }
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            alpha = 1;
            visible = true;
            _bReadyForInput = true;
            mouseEnabled = mouseChildren = true;
        }
        
        override protected function closeAnimation() : *
        {
            mouseEnabled = mouseChildren = false;
            _bReadyForInput = false;
            visible = false;
        }
        
        override public function selectContainer() : void
        {
            visible = true;
            tabEnabled = true;
            tabChildren = true;
            bSelected = true;
            addEventListener(FocusEvent.FOCUS_IN,onFocusIn,false,0,true);
            if(stage)
            {
                stage.addEventListener(InputEvent.INPUT,handleInput,false,0,true);
            }
        }
        
        private function handleScrollWhenInputSelected(param1:InputEvent) : *
        {
            if(param1.target.tabIndex == 0)
            {
                this.inputSections.y = this._inputSectionsOriginalY;
                this.updateScrollBar();
                return;
            }
            this.inputSections.y = Math.min(this._inputSectionsOriginalY,-stage.focus.y + this._pageSize / 2);
            this.inputSections.y = Math.max(this.inputSections.y,-this._scrollDistance);
            this.updateScrollBar();
        }
    }
}
