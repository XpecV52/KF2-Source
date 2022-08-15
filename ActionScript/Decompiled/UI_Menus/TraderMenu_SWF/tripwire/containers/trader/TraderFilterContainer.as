package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonBarEvent;
    import scaleform.clik.events.IndexEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.trader.TraderFilterButtonBar;
    import tripwire.controls.trader.TraderFilterTabBar;
    
    public class TraderFilterContainer extends TripContainer
    {
         
        
        public var filterButtonBar:TraderFilterButtonBar;
        
        public var tabBar:TraderFilterTabBar;
        
        public var leftButtonIcon:MovieClip;
        
        public var rightButtonIcon:MovieClip;
        
        public var filterName:TextField;
        
        public var leftArrow:MovieClip;
        
        public var rightArrow:MovieClip;
        
        private var _filterIndex:int = 0;
        
        public function TraderFilterContainer()
        {
            super();
            this.tabBar.addEventListener(IndexEvent.INDEX_CHANGE,this.tabChanged,false,0,true);
            this.tabBar.addEventListener(ButtonBarEvent.BUTTON_SELECT,this.handleTabSelect,false,0,true);
            this.filterButtonBar.addEventListener(ButtonBarEvent.BUTTON_SELECT,this.handleFilterSelect,false,0,true);
            this.filterButtonBar.focusable = false;
            this.controllerIconVisibility = false;
        }
        
        public function get filterIndex() : int
        {
            return this._filterIndex;
        }
        
        protected function tabChanged(param1:IndexEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                ExternalInterface.call("Callback_TabChanged",param1.index);
            }
        }
        
        protected function handleTabSelect(param1:ButtonBarEvent) : void
        {
            ExternalInterface.call("Callback_TabChanged",param1.index);
        }
        
        protected function handleFilterSelect(param1:ButtonBarEvent) : void
        {
            ExternalInterface.call("Callback_FilterChanged",param1.index);
        }
        
        public function set tabInfo(param1:Array) : void
        {
            this.tabBar.dataProvider = new DataProvider(param1);
        }
        
        public function set filterSource(param1:Array) : void
        {
            this.filterButtonBar.dataProvider = new DataProvider(param1);
        }
        
        public function set selectedTab(param1:int) : void
        {
            this.tabBar.selectedIndex = param1;
            this.controllerIconVisibility = bManagerUsingGamepad && this.filterButtonBar.visible;
        }
        
        public function set selectedFilter(param1:int) : void
        {
            this.filterButtonBar.selectedIndex = param1;
            this._filterIndex = param1;
        }
        
        public function set filterText(param1:String) : *
        {
            this.filterName.text = param1;
        }
        
        public function set filterVisibliity(param1:Boolean) : void
        {
            this.filterButtonBar.visible = param1;
            this.leftArrow.visible = param1;
            this.rightArrow.visible = param1;
        }
        
        public function changeFilterIndex(param1:int) : Boolean
        {
            if(param1 < 0 || param1 >= this.filterButtonBar.dataProvider.length)
            {
                return false;
            }
            this.selectedFilter = param1;
            ExternalInterface.call("Callback_FilterChanged",param1);
            return true;
        }
        
        public function set controllerIconVisibility(param1:Boolean) : *
        {
            this.leftButtonIcon.visible = param1;
            this.rightButtonIcon.visible = param1;
        }
    }
}
