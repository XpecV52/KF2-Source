package tripwire.containers.inventory
{
    import com.greensock.easing.*;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.controls.TileList;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.FocusHandlerEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.managers.MenuManager;
    
    public class InventoryItemListContainer extends TripContainer
    {
         
        
        public var ListBG:MovieClip;
        
        public var scrollbar:ScrollBar;
        
        public var inventoryItemScrollingList:TileList;
        
        public var itemImageLoader:UILoader;
        
        public var itemNameText:TextField;
        
        public var itemDescriptionText:TextField;
        
        public var _inventoryListSelectedIndex:int = 0;
        
        public var filtersText:TextField;
        
        public var noItemsText:TextField;
        
        public var noItemsString:String;
        
        public var allButton:TripButton;
        
        public var weaponSkinsButton:TripButton;
        
        public var cosmeticsButton:TripButton;
        
        public var consumablesButton:TripButton;
        
        public var craftingMatsButton:TripButton;
        
        public var craftWeaponsButton:TripButton;
        
        public var craftCosmeticsButton:TripButton;
        
        public var leftDimmingPanel:MovieClip;
        
        public var rightDimmingPanel:MovieClip;
        
        public var leftSideFocused:Boolean = true;
        
        public var buttonList:Vector.<TripButton>;
        
        public var currentFilter:UIComponent;
        
        public var Owner:TripContainer;
        
        private var listWidgetsArray:Array;
        
        private const SCROLLBAR_HEIGHT:int = 712;
        
        public function InventoryItemListContainer()
        {
            this.buttonList = new Vector.<TripButton>();
            this.listWidgetsArray = new Array();
            super();
            TextFieldEx.setTextAutoSize(this.noItemsText,"shrink");
            _dimmedAlpha = 0.45;
        }
        
        override public function selectContainer() : void
        {
            if(MenuManager.manager.bPopUpOpen)
            {
                return;
            }
            super.selectContainer();
            if(this.leftSideFocused)
            {
                FocusHandler.getInstance().setFocus(this.currentFilter);
                showDimLeftSide(false);
                this.inventoryItemScrollingList.focused = 0;
                this.inventoryItemScrollingList.selectedIndex = -1;
                FocusManager.setModalClip(null);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 1;
                }
            }
            else
            {
                this.inventoryItemScrollingList.focused = 1;
                this.inventoryItemScrollingList.selectedIndex = bManagerUsingGamepad && this.inventoryItemScrollingList.dataProvider.length > 0 ? int(this._inventoryListSelectedIndex) : -1;
                FocusManager.setModalClip(this.inventoryItemScrollingList);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 2;
                }
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.filtersText.text = !!param1.filters ? param1.filters : "";
                this.allButton.label = !!param1.all ? param1.all : "";
                this.weaponSkinsButton.label = !!param1.weaponSkins ? param1.weaponSkins : "";
                this.cosmeticsButton.label = !!param1.cosmetics ? param1.cosmetics : "";
                this.consumablesButton.label = !!param1.items ? param1.items : "";
                this.craftingMatsButton.label = !!param1.craftingMats ? param1.craftingMats : "";
                this.craftWeaponsButton.label = !!param1.craftWeapon ? param1.craftWeapon : "";
                this.craftCosmeticsButton.label = !!param1.craftCosmetic ? param1.craftCosmetic : "";
                this.noItemsString = !!param1.noItems ? param1.noItems : "";
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.craftWeaponsButton.bHasVerticalAlign = true;
            this.craftCosmeticsButton.bHasVerticalAlign = true;
            this.buttonList.push(this.allButton,this.weaponSkinsButton,this.cosmeticsButton,this.consumablesButton,this.craftingMatsButton);
            var _loc2_:int = 0;
            while(_loc2_ < this.buttonList.length)
            {
                this.buttonList[_loc2_].addEventListener(ButtonEvent.CLICK,this.onFilterButtonClicked,false,0,true);
                this.buttonList[_loc2_].addEventListener(FocusEvent.FOCUS_IN,this.onFilterFocusIn,false,0,true);
                _loc2_++;
            }
            this.craftWeaponsButton.addEventListener(FocusEvent.FOCUS_IN,this.onCraftFocusIn,false,0,true);
            this.allButton.tabIndex = 1;
            this.weaponSkinsButton.tabIndex = 2;
            this.cosmeticsButton.tabIndex = 3;
            this.consumablesButton.tabIndex = 4;
            this.craftingMatsButton.tabIndex = 5;
            this.inventoryItemScrollingList.tabIndex = 6;
            this.craftWeaponsButton.tabIndex = 7;
            this.craftCosmeticsButton.tabIndex = 8;
            this.inventoryItemScrollingList.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onInventoryListFocusChange,false,0,true);
            this.inventoryItemScrollingList.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onInventoryListFocusChange,false,0,true);
            this.allButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.weaponSkinsButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.cosmeticsButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.consumablesButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.craftingMatsButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.craftWeaponsButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.craftCosmeticsButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.filtersText.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.leftDimmingPanel.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.inventoryItemScrollingList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.itemDescriptionText.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.itemNameText.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.rightDimmingPanel.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            leftSidePanels.push(this.allButton);
            leftSidePanels.push(this.weaponSkinsButton);
            leftSidePanels.push(this.cosmeticsButton);
            leftSidePanels.push(this.consumablesButton);
            leftSidePanels.push(this.craftWeaponsButton);
            leftSidePanels.push(this.craftingMatsButton);
            leftSidePanels.push(this.craftCosmeticsButton);
            leftSidePanels.push(this.filtersText);
            rightSidePanels.push(this.inventoryItemScrollingList);
            rightSidePanels.push(this.itemDescriptionText);
            rightSidePanels.push(this.itemNameText);
            rightSidePanels.push(this.inventoryItemScrollingList);
            rightSidePanels.push(this.ListBG);
            rightSidePanels.push(this.itemDescriptionText);
            rightSidePanels.push(this.itemNameText);
            rightSidePanels.push(this.scrollbar);
            rightSidePanels.push(this.noItemsText);
            this.currentFilter = this.allButton;
            this.inventoryItemScrollingList.addEventListener(ListEvent.INDEX_CHANGE,this.onItemRollOver,false,0,true);
            this.noItemsText.text = "";
        }
        
        public function onItemRollOver(param1:ListEvent) : void
        {
            this.itemDetails = param1.itemData;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(!this.Owner.bOpen || !this.Owner.bSelected)
            {
                param1.handled = false;
                super.handleInput(param1);
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN || _loc2_.value == InputValue.KEY_HOLD)
            {
                switch(param1.details.navEquivalent)
                {
                    case NavigationCode.UP:
                        if(this.leftSideFocused && this.allButton.focused == 1)
                        {
                            param1.handled = true;
                            return;
                        }
                        break;
                    case NavigationCode.DOWN:
                        if(this.leftSideFocused && this.craftCosmeticsButton.focused == 1)
                        {
                            param1.handled = true;
                            return;
                        }
                        if(this.craftingMatsButton.focused == 1 && !this.craftCosmeticsButton.enabled && !this.craftWeaponsButton.enabled)
                        {
                            param1.handled = true;
                            return;
                        }
                        break;
                    case NavigationCode.LEFT:
                        if(this.leftSideFocused)
                        {
                            param1.handled = true;
                            return;
                        }
                        break;
                    case NavigationCode.GAMEPAD_B:
                        if(!this.leftSideFocused)
                        {
                            this.leftSideFocused = true;
                            FocusManager.setModalClip(null);
                            this.selectContainer();
                            param1.handled = true;
                            return;
                        }
                        break;
                    case NavigationCode.RIGHT:
                        if(this.leftSideFocused)
                        {
                            param1.handled = true;
                            return;
                        }
                        break;
                }
                super.handleInput(param1);
            }
        }
        
        public function onInventoryListFocusChange(param1:FocusHandlerEvent) : void
        {
            if(param1.target.hasFocus)
            {
                FocusManager.setModalClip(this.inventoryItemScrollingList);
                this.leftSideFocused = false;
                showDimLeftSide(true);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 2;
                }
            }
            else
            {
                this._inventoryListSelectedIndex = !!bManagerUsingGamepad ? int(param1.target.selectedIndex) : -1;
                param1.target.selectedIndex = -1;
                FocusManager.setModalClip(null);
            }
        }
        
        public function onCraftFocusIn(param1:FocusEvent) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this.buttonList.length)
            {
                this.buttonList[_loc2_].selected = false;
                _loc2_++;
            }
        }
        
        public function onFilterFocusIn(param1:FocusEvent) : void
        {
            var _loc2_:TripButton = param1.target as TripButton;
            this.currentFilter = _loc2_;
            var _loc3_:int = 0;
            while(_loc3_ < this.buttonList.length)
            {
                if(this.buttonList[_loc3_] == _loc2_)
                {
                    this.buttonList[_loc3_].selected = true;
                    ExternalInterface.call("Callback_InventoryFilter",_loc3_);
                }
                else
                {
                    this.buttonList[_loc3_].selected = false;
                }
                _loc3_++;
            }
        }
        
        public function onFilterButtonClicked(param1:ButtonEvent) : void
        {
            var _loc2_:TripButton = param1.currentTarget as TripButton;
            var _loc3_:int = 0;
            while(_loc3_ < this.buttonList.length)
            {
                if(this.buttonList[_loc3_] == _loc2_)
                {
                    this.buttonList[_loc3_].selected = true;
                    this.currentFilter = _loc2_;
                    ExternalInterface.call("Callback_InventoryFilter",_loc3_);
                    this.inventoryItemScrollingList.focusable = true;
                    this.inventoryItemScrollingList.selectedIndex = !!bManagerUsingGamepad ? 0 : -1;
                    if(bManagerUsingGamepad)
                    {
                        FocusManager.setFocus(this.inventoryItemScrollingList);
                        FocusManager.setModalClip(this.inventoryItemScrollingList);
                    }
                    else
                    {
                        FocusManager.setFocus(null);
                    }
                    if(MenuManager.manager != null)
                    {
                        MenuManager.manager.numPrompts = 2;
                    }
                }
                else
                {
                    this.buttonList[_loc3_].selected = false;
                }
                _loc3_++;
            }
        }
        
        public function onIndexChange(param1:ListEvent) : void
        {
            if(param1.itemData)
            {
                ExternalInterface.call("CallBack_ItemDetailsClicked",param1.itemData.definition);
            }
        }
        
        public function set itemDetails(param1:Object) : void
        {
            if(param1)
            {
                if(!param1.iconURLLarge)
                {
                }
                this.itemNameText.text = param1.label;
                this.itemDescriptionText.text = !!param1.typeRarity ? param1.typeRarity : "";
            }
        }
        
        public function set inventoryList(param1:Array) : void
        {
            this.inventoryItemScrollingList.dataProvider = new DataProvider(param1);
            this.itemNameText.text = "";
            this.itemDescriptionText.text = "";
            if(param1.length > 0)
            {
                this.itemDetails = param1[0];
                this.noItemsText.text = "";
                this.scrollbar.visible = true;
            }
            else
            {
                this.inventoryItemScrollingList.focusable = false;
                this.leftSideFocused = true;
                showDimLeftSide(false);
                this.inventoryItemScrollingList.focused = 0;
                this.inventoryItemScrollingList.selectedIndex = -1;
                FocusManager.setModalClip(null);
                FocusHandler.getInstance().setFocus(this.currentFilter);
                this.noItemsText.text = this.noItemsString;
                this.scrollbar.visible = false;
            }
            this.inventoryItemScrollingList.scrollPosition = 0;
        }
    }
}
