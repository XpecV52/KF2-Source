package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonBarEvent;
    import scaleform.clik.events.IndexEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.trader.TraderFilterButtonBar;
    import tripwire.controls.trader.TraderFilterTab;
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
        
        public var leftTriggerIcon:MovieClip;
        
        public var rightTriggerIcon:MovieClip;
        
        public var descriptionTextField:TextField;
        
        private var _filterIndex:int = 0;
        
        private var _tabIndex:int = 0;
        
        private const START_WIDTH:int = 760;
        
        private const FILTER_WIDTH:int = 56;
        
        private const FILTER_NAME_ORIGINAL_Y:Number = 132.8;
        
        private const FILTER_NAME_NOFILTER_Y:Number = 76.8;
        
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
            this.filterButtonBar.x = (this.START_WIDTH - this.filterButtonBar.dataProvider.length * this.FILTER_WIDTH) / 2;
        }
        
        public function set selectedTab(param1:int) : void
        {
            this.tabBar.selectedIndex = param1;
            this._tabIndex = param1;
            this.filterText = !!this.filterButtonBar.visible ? this.filterName.text : TraderFilterTab(this.tabBar.getButtonAt(param1)).label;
        }
        
        public function get selectedTab() : int
        {
            return this._tabIndex;
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
            if(this.filterButtonBar.visible != param1)
            {
                this.filterButtonBar.visible = param1;
                this.leftArrow.visible = param1;
                this.rightArrow.visible = param1;
                this.controllerIconVisibility = bManagerUsingGamepad;
                this.filterName.y = !!param1 ? Number(this.FILTER_NAME_ORIGINAL_Y) : Number(this.FILTER_NAME_NOFILTER_Y);
                dispatchEvent(new Event("UpdateShopListPosition"));
            }
        }
        
        public function changeTabIndex(param1:int) : Boolean
        {
            if(param1 < 0 || param1 >= this.tabBar.dataProvider.length)
            {
                return false;
            }
            this.selectedTab = param1;
            return true;
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
            this.leftTriggerIcon.visible = !!this.filterButtonBar.visible ? Boolean(param1) : false;
            this.rightTriggerIcon.visible = !!this.filterButtonBar.visible ? Boolean(param1) : false;
        }
    }
}
