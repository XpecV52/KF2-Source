package tripwire.containers.optionsControls
{
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripOptionStepper;
    
    public class ControllerPresetsContainer extends TripContainer
    {
         
        
        public var XboxTypeS_BackTextfield:TextField;
        
        public var XboxTypeS_StartTextfield:TextField;
        
        public var XboxTypeS_LeftTriggerTextfield:TextField;
        
        public var XboxTypeS_RightTriggerTextfield:TextField;
        
        public var XboxTypeS_LeftShoulderTextfield:TextField;
        
        public var XboxTypeS_RightShoulderTextfield:TextField;
        
        public var XboxTypeS_LeftXTextfield:TextField;
        
        public var XboxTypeS_RightXTextfield:TextField;
        
        public var XboxTypeS_LeftThumbStickTextfield:TextField;
        
        public var XboxTypeS_RightThumbStickTextfield:TextField;
        
        public var XboxTypeS_YTextfield:TextField;
        
        public var XboxTypeS_XTextfield:TextField;
        
        public var XboxTypeS_BTextfield:TextField;
        
        public var XboxTypeS_ATextfield:TextField;
        
        public var XboxTypeS_DPad_UpTextfield:TextField;
        
        public var XboxTypeS_DPad_DownTextfield:TextField;
        
        public var XboxTypeS_DPad_LeftTextfield:TextField;
        
        public var XboxTypeS_DPad_RightTextfield:TextField;
        
        public var CurrentPresetTextfield:TextField;
        
        public var presetStepper:TripOptionStepper;
        
        public var defaultButton:TripButton;
        
        public function ControllerPresetsContainer()
        {
            super();
            defaultFirstElement = this.presetStepper;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.presetStepper.tabIndex = 1;
            this.presetStepper.addEventListener(IndexEvent.INDEX_CHANGE,this.onPrefixChanged,false,0,true);
            this.defaultButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.formatTextfields();
        }
        
        public function set currentPreset(param1:int) : void
        {
            this.presetStepper.selectedIndex = param1;
        }
        
        public function set presetOptions(param1:Array) : void
        {
            this.presetStepper.dataProvider = new DataProvider(param1);
        }
        
        public function onPrefixChanged(param1:IndexEvent) : void
        {
            ExternalInterface.call("Callback_UpdateControllerPreset",param1.index);
        }
        
        public function formatTextfields() : void
        {
            TextFieldEx.setVerticalAlign(this.XboxTypeS_BackTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_StartTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_LeftTriggerTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_RightTriggerTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_LeftShoulderTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_RightShoulderTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_LeftXTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_RightXTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_LeftThumbStickTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_RightThumbStickTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_YTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_XTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_BTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_ATextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_DPad_UpTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_DPad_DownTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_DPad_LeftTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.XboxTypeS_DPad_RightTextfield,TextFieldEx.VALIGN_CENTER);
        }
        
        public function set localizedText(param1:Object) : void
        {
            var _loc2_:String = null;
            var _loc3_:Object = null;
            if(param1)
            {
                for each(_loc2_ in param1)
                {
                    trace("Preset containter:",_loc2_);
                }
                if(param1.bindings)
                {
                    for each(_loc3_ in param1.bindings)
                    {
                        (this[_loc3_.Key + "Textfield"] as TextField).text = _loc3_.Command;
                    }
                }
                if(!bManagerConsoleBuild)
                {
                    this.defaultButton.label = !!param1.resetDefault ? param1.resetDefault : "";
                }
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
        
        override protected function pushToBackAnimation() : *
        {
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
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
        
        protected function onButtonClick(param1:ButtonEvent) : void
        {
            if(param1.target == this.defaultButton)
            {
                ExternalInterface.call("CallBack_ResetPresetOptions");
            }
        }
    }
}
