package
{
    import tripwire.containers.objectiveStart.CollapsedMissionObjectiveContainer;
    
    public dynamic class ObjectiveCollapsedContainer extends CollapsedMissionObjectiveContainer
    {
         
        
        public function ObjectiveCollapsedContainer()
        {
            super();
            this.__setProp_expandButton_ObjectiveCollapsedContainer_expandedButton_0();
        }
        
        function __setProp_expandButton_ObjectiveCollapsedContainer_expandedButton_0() : *
        {
            try
            {
                expandButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            expandButton.autoRepeat = false;
            expandButton.autoSize = "none";
            expandButton.data = "";
            expandButton.enabled = true;
            expandButton.enableInitCallback = false;
            expandButton.focusable = true;
            expandButton.label = "^ ^ ^ ^ ^ ^";
            expandButton.selected = false;
            expandButton.toggle = false;
            expandButton.visible = false;
            try
            {
                expandButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
