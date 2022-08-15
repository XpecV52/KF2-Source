package tripwire.containers.serverBrowser
{
    import scaleform.clik.core.UIComponent;
    import tripwire.controls.serverBrowser.ServerListSortButton;
    
    public class ServerBrowserSortButtonContainer extends UIComponent
    {
         
        
        public var sortNameButton:ServerListSortButton;
        
        public var sortModeButton:ServerListSortButton;
        
        public var sortDifficultyButton:ServerListSortButton;
        
        public var sortMapButton:ServerListSortButton;
        
        public var sortWaveCountButton:ServerListSortButton;
        
        public var sortPlayerCountButton:ServerListSortButton;
        
        public var sortPingButton:ServerListSortButton;
        
        public function ServerBrowserSortButtonContainer()
        {
            super();
        }
    }
}
