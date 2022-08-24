package
{
    import tripwire.containers.objectiveStart.MissionObjectivesContainer;
    
    public dynamic class MissionObjectivesContainer extends tripwire.containers.objectiveStart.MissionObjectivesContainer
    {
         
        
        public function MissionObjectivesContainer()
        {
            super();
            this.__setProp_switchButton_MissionObjectivesContainer_SwitchButton_0();
        }
        
        function __setProp_switchButton_MissionObjectivesContainer_SwitchButton_0() : *
        {
            try
            {
                switchButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            switchButton.autoRepeat = false;
            switchButton.autoSize = "none";
            switchButton.data = "";
            switchButton.enabled = true;
            switchButton.enableInitCallback = false;
            switchButton.focusable = false;
            switchButton.label = "";
            switchButton.selected = false;
            switchButton.toggle = false;
            switchButton.visible = true;
            try
            {
                switchButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
