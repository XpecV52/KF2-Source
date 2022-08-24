package
{
    import tripwire.containers.objectiveStart.ExpandedMissionObjectiveContainer;
    
    public dynamic class ObjectiveExpandedContainer extends ExpandedMissionObjectiveContainer
    {
         
        
        public function ObjectiveExpandedContainer()
        {
            super();
            this.__setProp_collapseButton_ObjectiveExpandedContainer_collapse_0();
        }
        
        function __setProp_collapseButton_ObjectiveExpandedContainer_collapse_0() : *
        {
            try
            {
                collapseButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            collapseButton.autoRepeat = false;
            collapseButton.autoSize = "none";
            collapseButton.data = "";
            collapseButton.enabled = true;
            collapseButton.enableInitCallback = false;
            collapseButton.focusable = true;
            collapseButton.label = "V V V V V V";
            collapseButton.selected = false;
            collapseButton.toggle = false;
            collapseButton.visible = false;
            try
            {
                collapseButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
