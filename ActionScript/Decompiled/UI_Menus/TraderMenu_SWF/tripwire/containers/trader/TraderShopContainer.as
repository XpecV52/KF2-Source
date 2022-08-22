package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripScrollingList;
    import tripwire.controls.trader.TraderFilterTabBar;
    import tripwire.controls.trader.TraderShopItemRenderer;
    import tripwire.menus.TraderMenu;
    import tripwire.widgets.MultiPromptDisplay;
    
    public class TraderShopContainer extends TripContainer
    {
        
        public static var UPDATE_SHOP_LIST_POSITION = "UpdateShopListPosition";
        
        public static var RESET_SHOP_INDEX = "ResetShopIndex";
         
        
        public var shopList:TripScrollingList;
        
        public var filterContainer:TraderFilterContainer;
        
        public var shopHeader:SectionHeaderContainer;
        
        public var promptsDisplay:MultiPromptDisplay;
        
        public var shopScrollBar:ScrollBar;
        
        public var currentSelectedIndex:int = -1;
        
        public var disabledPromptAlpha:Number = 0.25;
        
        public const SHOP_LIST_ORIGINAL_Y:int = 242;
        
        public const SHOP_LIST_NOFILTER_Y:int = 186;
        
        public const SHOP_LIST_ORIGINAL_HEIGHT:int = 760;
        
        public const SHOP_LIST_NOFILTER_HEIGHT:int = 816;
        
        public const SHOP_ITEM_HEIGHT:int = 56;
        
        public const SHOP_LIST_ORIGINAL_LIMIT:int = 13;
        
        public const SHOP_LIST_NOFILTER_LIMIT:int = 14;
        
        public const BLOCKER_OFFSET:int = 128;
        
        public const SCROLLBAR_OFFSET:int = 14;
        
        public const SCROLLBAR_HEIGHT_OFFSET:int = 40;
        
        public var shopListLimit:int;
        
        public var blocker:MovieClip;
        
        public var buySoundEffect:String = "TRADER_BUY_WEAPON";
        
        public var tabChangeSoundEffect = "TRADER_STORE_FILTER_CLICK";
        
        public var filterChangeSoundEffect = "SHARED_BUTTON_CLICK";
        
        public function TraderShopContainer()
        {
            super();
            this.shopList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.onSelected,false,0,true);
            this.shopList.addEventListener(ListEvent.INDEX_CHANGE,this.onSelected,false,0,true);
            this.shopList.addEventListener(ListEvent.ITEM_PRESS,this.buySelectedController,false,0,true);
            this.shopList.addEventListener(MouseEvent.DOUBLE_CLICK,this.buySelected,false,0,true);
            this.shopList.addEventListener("BuyShopItem",this.onBuyButtonClicked,false,0,true);
            this.filterContainer.addEventListener(UPDATE_SHOP_LIST_POSITION,this.updateShopListPosition,false,0,true);
            TraderFilterTabBar(this.filterContainer.tabBar).addEventListener(IndexEvent.INDEX_CHANGE,this.tabChanged,false,0,true);
            this.shopList.Owner = this;
            focusable = false;
            this.shopList.tabIndex = 1;
            this.updateControllerVisibility();
            this.shopList.bStayOpenOnSelection = true;
            defaultFirstElement = this.shopList;
            this.shopListLimit = this.SHOP_LIST_ORIGINAL_LIMIT;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.promptsDisplay.visible = false;
        }
        
        public function set localizeStrings(param1:Object) : void
        {
            var _loc2_:String = !!param1.buyPrompt ? param1.buyPrompt : "";
        }
        
        public function set shopHeaderName(param1:String) : void
        {
            this.shopHeader.text = param1;
        }
        
        public function set selectedIndex(param1:int) : void
        {
            this.shopList.invalidateData();
        }
        
        public function set shopData(param1:Array) : void
        {
            this.blocker.height = param1.length > this.shopListLimit ? Number(this.BLOCKER_OFFSET) : Number((this.shopListLimit - param1.length) * this.SHOP_ITEM_HEIGHT + this.BLOCKER_OFFSET);
            this.shopList.dataProvider = new DataProvider(param1);
            this.shopList.invalidateData();
            if(!bManagerUsingGamepad)
            {
                this.shopList.selectedIndex = this.shopList.selectedIndex == 0 ? 0 : -1;
                this.currentSelectedIndex = this.shopList.selectedIndex;
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.HIDE_DETAILS));
            }
        }
        
        public function updateShopListPosition(param1:Event) : void
        {
            this.shopListLimit = !!this.filterContainer.filterButtonBar.visible ? int(this.SHOP_LIST_ORIGINAL_LIMIT) : int(this.SHOP_LIST_NOFILTER_LIMIT);
            this.shopList.y = !!this.filterContainer.filterButtonBar.visible ? Number(this.SHOP_LIST_ORIGINAL_Y) : Number(this.SHOP_LIST_NOFILTER_Y);
            this.shopList.height = !!this.filterContainer.filterButtonBar.visible ? Number(this.SHOP_LIST_ORIGINAL_HEIGHT) : Number(this.SHOP_LIST_NOFILTER_HEIGHT);
            this.shopScrollBar.y = this.shopList.y + this.SCROLLBAR_OFFSET;
            this.shopScrollBar.height = this.shopList.height - this.SCROLLBAR_HEIGHT_OFFSET;
            this.blocker.height = this.shopList.dataProvider.length > this.shopListLimit ? Number(this.BLOCKER_OFFSET) : Number((this.shopListLimit - this.shopList.dataProvider.length) * this.SHOP_ITEM_HEIGHT + this.BLOCKER_OFFSET);
        }
        
        override public function selectContainer() : void
        {
            currentElement = this.shopList;
            super.selectContainer();
            this.enterShoppingList();
            this.filterContainer.controllerIconVisibility = true;
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.filterContainer.deselectContainer();
            this.filterContainer.tabBar.removeEventListener(ButtonEvent.PRESS,this.handleGamepadTabSelect);
            this.filterContainer.controllerIconVisibility = false;
        }
        
        protected function onSelected(param1:ListEvent) : void
        {
            if(param1.index >= 0)
            {
                this.shopList.selectedIndex = param1.index;
                this.currentSelectedIndex = param1.index;
                ExternalInterface.call("Callback_ShopItemSelected",param1.index);
            }
        }
        
        protected function resetSelectedIndex() : void
        {
            this.shopList.selectedIndex = 0;
            this.currentSelectedIndex = 0;
            ExternalInterface.call("Callback_ShopItemSelected",0);
        }
        
        protected function buySelectedController(param1:ListEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                ExternalInterface.call("Callback_BuyOrSellItem");
                if(this.shopList.selectedIndex == 0)
                {
                    this.resetSelectedIndex();
                }
            }
        }
        
        protected function buySelected(param1:MouseEvent) : void
        {
            if(!bManagerUsingGamepad)
            {
                ExternalInterface.call("Callback_BuyOrSellItem");
                if(this.shopList.selectedIndex == 0)
                {
                    this.resetSelectedIndex();
                }
            }
        }
        
        protected function onBuyButtonClicked() : void
        {
            if(!bManagerUsingGamepad)
            {
                ExternalInterface.call("Callback_BuyOrSellItem");
                if(this.shopList.selectedIndex == 0)
                {
                    this.resetSelectedIndex();
                }
            }
        }
        
        public function itemBought() : void
        {
            Extensions.gfxProcessSound(this,"UI",this.buySoundEffect);
        }
        
        public function updateControllerVisibility() : *
        {
            var _loc1_:TraderShopItemRenderer = null;
            this.filterContainer.controllerIconVisibility = bManagerUsingGamepad;
            var _loc2_:int = 0;
            while(_loc2_ < this.shopList.rowCount)
            {
                _loc1_ = TraderShopItemRenderer(this.shopList.getRendererAt(_loc2_));
                if(_loc1_ != null)
                {
                    _loc1_.updateControllerVisibility();
                }
                _loc2_++;
            }
        }
        
        protected function tabChanged(param1:IndexEvent) : void
        {
            if(!bManagerUsingGamepad)
            {
                this.shopList.selectedIndex = 0;
                this.currentSelectedIndex = 0;
            }
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_L1:
                        if(this.shopList.focused == 1 && this.filterContainer.changeTabIndex(this.filterContainer.selectedTab - 1))
                        {
                            this.playSound(this.tabChangeSoundEffect);
                            this.shopList.selectedIndex = 0;
                        }
                        break;
                    case NavigationCode.GAMEPAD_R1:
                        if(this.shopList.focused == 1 && this.filterContainer.changeTabIndex(this.filterContainer.selectedTab + 1))
                        {
                            this.playSound(this.tabChangeSoundEffect);
                            this.shopList.selectedIndex = 0;
                        }
                        break;
                    case NavigationCode.GAMEPAD_L2:
                        if(this.shopList.focused == 1 && this.filterContainer.changeFilterIndex(this.filterContainer.filterIndex - 1) && this.filterContainer.filterButtonBar.visible)
                        {
                            this.playSound(this.filterChangeSoundEffect);
                            this.shopList.selectedIndex = 0;
                        }
                        break;
                    case NavigationCode.GAMEPAD_R2:
                        if(this.shopList.focused == 1 && this.filterContainer.changeFilterIndex(this.filterContainer.filterIndex + 1) && this.filterContainer.filterButtonBar.visible)
                        {
                            this.playSound(this.filterChangeSoundEffect);
                            this.shopList.selectedIndex = 0;
                        }
                }
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            if(bManagerPopUpOpen)
            {
                return;
            }
            if(this.shopList.focused)
            {
                this.leaveList();
                this.selectContainer();
            }
            else
            {
                ExternalInterface.call("Callback_Close");
            }
        }
        
        public function playSound(param1:String) : void
        {
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"UI",param1);
            }
        }
        
        public function leaveList() : *
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.HIDE_DETAILS));
        }
        
        private function handleGamepadTabSelect(param1:ButtonEvent) : void
        {
            this.enterShoppingList();
        }
        
        private function enterShoppingList() : *
        {
            if(bManagerUsingGamepad)
            {
                currentElement = this.shopList;
                this.shopList.selectedIndex = this.currentSelectedIndex == -1 ? 0 : int(this.currentSelectedIndex);
                this.shopList.focused = 1;
            }
        }
        
        private function downPressed() : *
        {
            if(this.filterContainer.tabBar.focused)
            {
                this.enterShoppingList();
            }
        }
        
        private function upPressed() : *
        {
            if(this.shopList.focused)
            {
                this.leaveList();
                this.selectContainer();
            }
        }
    }
}
