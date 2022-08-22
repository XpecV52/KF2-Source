package
{
    import tripwire.containers.trader.TraderButtonPromptContainer;
    
    public dynamic class TraderButtonPromptContainer_MC extends TraderButtonPromptContainer
    {
         
        
        public function TraderButtonPromptContainer_MC()
        {
            super();
            this.__setProp_buttonPromptContainer_TraderButtonPromptContainer_MC_Layer4_0();
        }
        
        function __setProp_buttonPromptContainer_TraderButtonPromptContainer_MC_Layer4_0() : *
        {
            try
            {
                buttonPromptContainer["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            buttonPromptContainer.bUseWidthForBoundry = false;
            buttonPromptContainer.enabled = true;
            buttonPromptContainer.enableInitCallback = false;
            buttonPromptContainer.promptSpacing = 32;
            buttonPromptContainer.visible = true;
            try
            {
                buttonPromptContainer["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
