package
{
    import tripwire.popups.ConnectionErrorPopup;
    
    public dynamic class ConnectionErrorMC extends ConnectionErrorPopup
    {
         
        
        public function ConnectionErrorMC()
        {
            super();
            this.__setProp_AcceptButton_ConnectionErrorMC_AcceptButton_0();
        }
        
        function __setProp_AcceptButton_ConnectionErrorMC_AcceptButton_0() : *
        {
            try
            {
                AcceptButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            AcceptButton.autoRepeat = false;
            AcceptButton.autoSize = "left";
            AcceptButton.data = "";
            AcceptButton.enabled = true;
            AcceptButton.enableInitCallback = false;
            AcceptButton.focusable = true;
            AcceptButton.label = "<<BACK NOW";
            AcceptButton.selected = false;
            AcceptButton.toggle = false;
            AcceptButton.visible = true;
            try
            {
                AcceptButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
