package
{
    import tripwire.containers.StartOverviewContainer;
    
    public dynamic class OverviewContainerMC extends StartOverviewContainer
    {
         
        
        public function OverviewContainerMC()
        {
            super();
            this.__setProp_permissionsList_OverviewContainerMC_Permissions_0();
        }
        
        function __setProp_permissionsList_OverviewContainerMC_Permissions_0() : *
        {
            try
            {
                permissionsList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            permissionsList.enabled = true;
            permissionsList.enableInitCallback = false;
            permissionsList.focusable = true;
            permissionsList.itemRendererName = "DefaultTripListItemRenderer";
            permissionsList.itemRendererInstanceName = "";
            permissionsList.margin = 0;
            permissionsList.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            permissionsList.rowHeight = 0;
            permissionsList.scrollBar = "ScrollBar";
            permissionsList.visible = true;
            permissionsList.wrapping = "stick";
            try
            {
                permissionsList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
