package tripwire.containers.optionsControls
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    
    public class ControllerPresetsContainer extends TripContainer
    {
         
        
        public var backTextfield:TextField;
        
        public var startTextfield:TextField;
        
        public var leftTriggerTextfield:TextField;
        
        public var rightTriggerTextfield:TextField;
        
        public var leftBumperTextfield:TextField;
        
        public var rightBumperTextfield:TextField;
        
        public var leftThumbstickTextfield:TextField;
        
        public var rightThumbstickTextfield:TextField;
        
        public var l3Textfield:TextField;
        
        public var r3Textfield:TextField;
        
        public var yTextfield:TextField;
        
        public var xTextfield:TextField;
        
        public var bTextfield:TextField;
        
        public var aTextfield:TextField;
        
        public var upTextfield:TextField;
        
        public var downTextfield:TextField;
        
        public var leftTextfield:TextField;
        
        public var rightTextfield:TextField;
        
        public function ControllerPresetsContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.formatTextfields();
        }
        
        public function formatTextfields() : void
        {
            TextFieldEx.setVerticalAlign(this.backTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.startTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.leftTriggerTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.rightTriggerTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.leftBumperTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.rightBumperTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.leftThumbstickTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.rightThumbstickTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.l3Textfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.r3Textfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.yTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.xTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.bTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.aTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.upTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.downTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.leftTextfield,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.rightTextfield,TextFieldEx.VALIGN_CENTER);
        }
        
        public function set localizedText(param1:Object) : void
        {
            var _loc2_:String = null;
            var _loc3_:Object = null;
            if(param1)
            {
                for each(_loc2_ in param1)
                {
                    trace(_loc2_);
                }
                this.backTextfield.text = !!param1.back ? param1.back : "";
                this.startTextfield.text = !!param1.start ? param1.start : "";
                this.leftThumbstickTextfield.text = !!param1.leftThumbstick ? param1.leftThumbstick : "";
                this.rightThumbstickTextfield.text = !!param1.rightThumbstick ? param1.rightThumbstick : "";
                if(param1.bindings)
                {
                    for each(_loc3_ in param1.bindings)
                    {
                        (this[_loc3_.Key + "Textfield"] as TextField).text = _loc3_.Command;
                    }
                }
            }
        }
        
        override protected function openAnimation() : *
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
    }
}
