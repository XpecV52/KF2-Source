package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
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
    import tripwire.menus.TraderMenu;
    
    public class TraderShopContainer extends TripContainer
    {
         
        
        public var shopList:TripScrollingList;
        
        public var filterContainer:TraderFilterContainer;
        
        public var shopHeader:SectionHeaderContainer;
        
        public var cancelPrompt:MovieClip;
        
        public function TraderShopContainer()
        {
            super();
            this.shopList.addEventListener(ListEvent.INDEX_CHANGE,this.onSelected,false,0,true);
            this.shopList.addEventListener(ListEvent.ITEM_PRESS,this.buySelectedController,false,0,true);
            this.shopList.addEventListener(MouseEvent.DOUBLE_CLICK,this.buySelected,false,0,true);
            focusable = false;
            this.shopList.tabIndex = 1;
            this.updateControllerVisibility();
            this.shopList.bStayOpenOnSelection = true;
            defaultFirstElement = this.shopList;
        }
        
        public function set shopHeaderName(param1:String) : void
        {
            this.shopHeader.text = param1;
        }
        
        public function set cancelPromptName(param1:String) : void
        {
            this.cancelPrompt.textField.text = param1;
        }
        
        public function set selectedIndex(param1:int) : void
        {
            this.shopList.selectedIndex = param1;
            this.shopList.invalidateData();
        }
        
        public function set shopData(param1:Array) : void
        {
            this.shopList.dataProvider = new DataProvider(param1);
            this.shopList.invalidateData();
        }
        
        override public function selectContainer() : void
        {
            currentElement = this.shopList;
            super.selectContainer();
            this.shopList.selectedIndex = 0;
            this.enterShoppingList();
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.shopList.selectedIndex = -1;
            this.filterContainer.deselectContainer();
            this.filterContainer.tabBar.removeEventListener(ButtonEvent.PRESS,this.handleGamepadTabSelect);
        }
        
        protected function onSelected(param1:ListEvent) : void
        {
            if(param1.index >= 0)
            {
                ExternalInterface.call("Callback_ShopItemSelected",param1.index);
            }
        }
        
        protected function buySelectedController(param1:ListEvent) : void
        {
            if(bManagerUsingGamepad)
            {
                ExternalInterface.call("Callback_BuyOrSellItem");
            }
        }
        
        protected function buySelected(param1:MouseEvent) : void
        {
            if(!bManagerUsingGamepad)
            {
                ExternalInterface.call("Callback_BuyOrSellItem");
            }
        }
        
        public function itemBought() : void
        {
            Extensions.gfxProcessSound(this,"ButtonSoundTheme","TraderBuy_Select");
        }
        
        public function updateControllerVisibility() : *
        {
            this.cancelPrompt.visible = bManagerUsingGamepad;
            this.filterContainer.controllerIconVisibility = bManagerUsingGamepad;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled)
            {
                return;
            }
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_UP)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_L1:
                        if(this.shopList.focused == 1 && this.filterContainer.changeTabIndex(this.filterContainer.selectedTab - 1))
                        {
                            this.filterContainer.tabBar;
                            this.shopList.selectedIndex = 0;
                        }
                        break;
                    case NavigationCode.GAMEPAD_R1:
                        if(this.shopList.focused == 1 && this.filterContainer.changeTabIndex(this.filterContainer.selectedTab + 1))
                        {
                            this.shopList.selectedIndex = 0;
                        }
                        break;
                    case NavigationCode.GAMEPAD_L2:
                        if(this.shopList.focused == 1 && this.filterContainer.changeFilterIndex(this.filterContainer.filterIndex - 1))
                        {
                            this.shopList.selectedIndex = 0;
                        }
                        break;
                    case NavigationCode.GAMEPAD_R2:
                        if(this.shopList.focused == 1 && this.filterContainer.changeFilterIndex(this.filterContainer.filterIndex + 1))
                        {
                            this.shopList.selectedIndex = 0;
                        }
                }
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
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
        
        public function leaveList() : *
        {
            this.shopList.selectedIndex = -1;
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
                this.shopList.selectedIndex = 0;
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
