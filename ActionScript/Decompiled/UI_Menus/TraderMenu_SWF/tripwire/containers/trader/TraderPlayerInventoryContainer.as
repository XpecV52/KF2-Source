package tripwire.containers.trader
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    import tripwire.controls.trader.TraderArmorItem;
    import tripwire.controls.trader.TraderAutofillButton;
    import tripwire.controls.trader.TraderGrenadeItem;
    import tripwire.controls.trader.TraderPlayerAmmoItemRenderer;
    import tripwire.controls.trader.TraderPlayerBuySellRenderer;
    import tripwire.controls.trader.TraderPlayerInventoryInfoRenderer;
    import tripwire.menus.TraderMenu;
    import tripwire.widgets.MultiPromptDisplay;
    
    public class TraderPlayerInventoryContainer extends TripContainer
    {
         
        
        public var playerInfoContainer:TraderPlayerInfoContainer;
        
        public var infoList:TripScrollingList;
        
        public var sellList:TripScrollingList;
        
        public var magList:TripScrollingList;
        
        public var fillButtonList:TripScrollingList;
        
        public var filterContainer:TraderFilterContainer;
        
        public var autoFillButton:TraderAutofillButton;
        
        public var armorItem:TraderArmorItem;
        
        public var grenadeItem:TraderGrenadeItem;
        
        public var weightTextField:TextField;
        
        public var playerScrollBar:MovieClip;
        
        public var divLine:MovieClip;
        
        public var lastMagItem:TraderPlayerAmmoItemRenderer;
        
        public var lastFillItem:TraderPlayerAmmoItemRenderer;
        
        public var lastSellItem:TraderPlayerBuySellRenderer;
        
        public var lastInfoItem:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_1:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_2:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_3:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_4:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_5:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_6:TraderPlayerInventoryInfoRenderer;
        
        public var inventoryItem_7:TraderPlayerInventoryInfoRenderer;
        
        public var changePerkButton:TripButton;
        
        private var _bCanUseMenu:Boolean = false;
        
        public var cachedCurrentElement:UIComponent;
        
        public var currentSelectedIndex:int = -1;
        
        public var promptsDisplay:MultiPromptDisplay;
        
        public var disabledPromptAlpha:Number = 0.25;
        
        public var autofillValue:String;
        
        public var autofillState:int;
        
        public var bListFocused:Boolean = false;
        
        public var bGrenadeFocused:Boolean = false;
        
        public var bArmorFocused:Boolean = false;
        
        public var itemSoldSoundEffect:String = "TRADER_SELL_WEAPON";
        
        public var magFillSoundEffect:String = "TRADER_MAGFILL_BUTTON_CLICK";
        
        public const MAG_LIST_GAMEPAD_LOCATION:int = 422;
        
        public const MAG_LIST_KBM_LOCATION:int = 30;
        
        public const FILL_LIST_GAMEPAD_LOCATION:int = 526;
        
        public const FILL_LIST_KBM_LOCATION:int = 142;
        
        public const SELL_LIST_GAMEPAD_LOCATION:int = 678;
        
        public const SELL_LIST_KBM_LOCATION:int = 646;
        
        public const INFO_LIST_GAMEPAD_LOCATION:int = -202;
        
        public const INFO_LIST_KBM_LOCATION:int = 30;
        
        public const INVITEM_GAMEPAD_LOCATION:int = -192;
        
        public const INVITEM_KBM_LOCATION:int = 40;
        
        private var _bPerkMenuOpen:Boolean;
        
        public function TraderPlayerInventoryContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.changePerkButton.bHasVerticalAlign = true;
            this.promptsDisplay.visible = false;
            this.armorItem.addEventListener(MouseEvent.MOUSE_OVER,this.armorMouseOver,false,0,true);
            this.armorItem.fillButton.addEventListener(MouseEvent.MOUSE_OVER,this.armorMouseOver,false,0,true);
            this.grenadeItem.addEventListener(MouseEvent.MOUSE_OVER,this.grenadeMouseOver,false,0,true);
            this.grenadeItem.magButton.addEventListener(MouseEvent.MOUSE_OVER,this.grenadeMouseOver,false,0,true);
            this.grenadeItem.fillButton.addEventListener(MouseEvent.MOUSE_OVER,this.grenadeMouseOver,false,0,true);
            this.armorItem.fillButton.addEventListener(ButtonEvent.PRESS,this.fillArmor,false,0,true);
            this.grenadeItem.magButton.addEventListener(ButtonEvent.PRESS,this.buyGrenade,false,0,true);
            this.grenadeItem.fillButton.addEventListener(ButtonEvent.PRESS,this.fillGrenades,false,0,true);
            this.autoFillButton.addEventListener(ButtonEvent.PRESS,this.autoFill,false,0,true);
            this.changePerkButton.addEventListener(ButtonEvent.PRESS,this.playerInfoContainer.togglePerkList,false,0,true);
            this.infoList.addEventListener(ListEvent.INDEX_CHANGE,this.onItemSelected,false,0,true);
            this.infoList.addEventListener(ListEvent.ITEM_PRESS,this.onControllerBuyMag,false,0,true);
            this.infoList.addEventListener(MouseEvent.DOUBLE_CLICK,this.sellSelected,false,0,true);
            this.infoList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.selectItem,false,0,true);
            this.magList.addEventListener(IndexEvent.INDEX_CHANGE,this.buyMag,false,0,true);
            this.magList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.selectItem,false,0,true);
            this.sellList.addEventListener(IndexEvent.INDEX_CHANGE,this.sellItem,false,0,true);
            this.sellList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.selectItem,false,0,true);
            this.fillButtonList.addEventListener(IndexEvent.INDEX_CHANGE,this.fillAmmo,false,0,true);
            this.fillButtonList.addEventListener(ListEvent.ITEM_ROLL_OVER,this.selectItem,false,0,true);
            this.autoFillButton.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.grenadeItem.fillButton.addEventListener(MouseEvent.MOUSE_OVER,this.changeFocusIn,false,0,true);
            this.armorItem.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.grenadeItem.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.autoFillButton.addEventListener(FocusEvent.FOCUS_OUT,this.changeFocusOut,false,0,true);
            this.grenadeItem.addEventListener(FocusEvent.FOCUS_OUT,this.changeFocusOut,false,0,true);
            this.armorItem.addEventListener(FocusEvent.FOCUS_OUT,this.changeFocusOut,false,0,true);
            this.grenadeItem.addEventListener(ButtonEvent.PRESS,this.grenadeSelected,false,0,true);
            this.armorItem.addEventListener(ButtonEvent.PRESS,this.armorSelected,false,0,true);
            this.infoList.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.playerInfoContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.onTogglePlayerInfoMenu,false,0,true);
            this.armorItem.tabIndex = 1;
            this.grenadeItem.tabIndex = 2;
            this.infoList.tabIndex = 5;
            currentElement = this.armorItem.armorInfoContainer;
            this.updateControllerVisibility();
            this.parent.addEventListener("FadeOutAssets",this.fadeoutAssets);
            this.infoList.bStayOpenOnSelection = true;
            this.magList.bStayOpenOnSelection = true;
            this.sellList.bStayOpenOnSelection = true;
            this.fillButtonList.bStayOpenOnSelection = true;
            this.autoFillButton.tabEnabled = false;
            this.changePerkButton.tabEnabled = false;
            this.playerInfoContainer.owner = this;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.playerInfoContainer.perkListContainer.bOpen)
            {
                this.playerInfoContainer.closeList();
                this.playerInfoContainer.focused = 0;
            }
            if(!bManagerUsingGamepad)
            {
                this.armorItem.armorInfoContainer.focused = 0;
                this.armorItem.armorInfoContainer.selected = false;
            }
            this.setSelected();
        }
        
        function setSelected() : *
        {
            if(bManagerUsingGamepad)
            {
                this.infoList.focused = 0;
                this.infoList.selectedIndex = -1;
                this.grenadeItem.focused = 0;
                this.grenadeItem.grenadeInfoContainer.focused = 0;
                this.grenadeItem.grenadeInfoContainer.selected = false;
                if(this.cachedCurrentElement)
                {
                    FocusHandler.getInstance().setFocus(this.cachedCurrentElement);
                }
                else
                {
                    FocusHandler.getInstance().setFocus(this.armorItem);
                }
                if(this.cachedCurrentElement == this.infoList)
                {
                    this.infoList.selectedIndex = this.currentSelectedIndex == -1 ? 0 : int(this.currentSelectedIndex);
                    this.infoList.focused = 1;
                }
                else
                {
                    this.infoList.selectedIndex = -1;
                }
            }
        }
        
        override public function deselectContainer() : void
        {
            this.currentSelectedIndex = this.infoList.selectedIndex;
            this.infoList.focused = 0;
            this.infoList.selectedIndex = -1;
            this.autoFillButton.selected = false;
            this.armorItem.armorInfoContainer.selected = false;
            this.armorItem.armorInfoContainer.focused = 0;
            this.grenadeItem.grenadeInfoContainer.selected = false;
            this.grenadeItem.grenadeInfoContainer.focused = 0;
            super.deselectContainer();
            currentElement = null;
        }
        
        override public function closeContainer() : void
        {
            if(this.playerInfoContainer.perkListContainer.bOpen)
            {
                this.fadeinAssets();
                this.playerInfoContainer.closeList();
            }
            if(this.playerInfoContainer.bOpen)
            {
                this.playerInfoContainer.closeContainer();
            }
            super.closeContainer();
            currentElement = null;
        }
        
        public function swapLists() : void
        {
            TweenMax.allTo([this.inventoryItem_1,this.inventoryItem_2,this.inventoryItem_3,this.inventoryItem_4,this.inventoryItem_5,this.inventoryItem_6,this.inventoryItem_7],0,{"x":(!!bManagerUsingGamepad ? this.INVITEM_GAMEPAD_LOCATION : this.INVITEM_KBM_LOCATION)});
            this.infoList.x = !!bManagerUsingGamepad ? Number(this.INFO_LIST_GAMEPAD_LOCATION) : Number(this.INFO_LIST_KBM_LOCATION);
            this.sellList.x = !!bManagerUsingGamepad ? Number(this.SELL_LIST_GAMEPAD_LOCATION) : Number(this.SELL_LIST_KBM_LOCATION);
            this.fillButtonList.x = !!bManagerUsingGamepad ? Number(this.FILL_LIST_GAMEPAD_LOCATION) : Number(this.FILL_LIST_KBM_LOCATION);
            this.magList.x = !!bManagerUsingGamepad ? Number(this.MAG_LIST_GAMEPAD_LOCATION) : Number(this.MAG_LIST_KBM_LOCATION);
        }
        
        public function set bCanUseMenu(param1:Boolean) : void
        {
            this._bCanUseMenu = param1;
            this.playerInfoContainer.bCanUseMenu = param1;
        }
        
        public function get bCanUseMenu() : Boolean
        {
            return this._bCanUseMenu;
        }
        
        public function set localizeStrings(param1:Object) : void
        {
            this.autoFillButton.label = !!param1.autoFill ? param1.autoFill : "";
            this.changePerkButton.label = !!param1.changePerk ? param1.changePerk : "";
            this.armorItem.fillTitle = !!param1.armorLabel ? param1.armorLabel : "";
            this.grenadeItem.magButton.label = !!param1.grenadeLabel ? param1.grenadeLabel : "";
            this.grenadeItem.fillButton.label = !!param1.fillLabel ? param1.fillLabel : "";
            var _loc2_:String = !!param1.magLabel ? param1.magLabel : "";
            var _loc3_:String = !!param1.sellPrompt ? param1.sellPrompt : "";
            var _loc4_:String = !!param1.perkPrompt ? param1.perkPrompt : "";
        }
        
        public function get bPerkMenuOpen() : *
        {
            return this._bPerkMenuOpen;
        }
        
        public function set bPerkMenuOpen(param1:Boolean) : void
        {
            this._bPerkMenuOpen = param1;
            this.dispatchEvent(new Event("PerkMenuChanged"));
        }
        
        public function set perkChangeLocked(param1:Boolean) : void
        {
            this.changePerkButton.enabled = !param1;
        }
        
        public function set itemData(param1:Array) : void
        {
            this.infoList.dataProvider = new DataProvider(param1);
            this.infoList.invalidateData();
        }
        
        public function set sellData(param1:Array) : void
        {
            this.sellList.dataProvider = new DataProvider(param1);
            this.sellList.invalidateData();
        }
        
        public function set magData(param1:Array) : void
        {
            this.magList.dataProvider = new DataProvider(param1);
            this.magList.invalidateData();
        }
        
        public function set fillData(param1:Array) : void
        {
            this.fillButtonList.dataProvider = new DataProvider(param1);
            this.fillButtonList.invalidateData();
        }
        
        public function set autoFillCost(param1:Object) : void
        {
            this.autofillValue = param1.buttonValue;
            this.autofillState = param1.buttonState;
            this.autoFillButton.buttonValue = param1.buttonValue;
            this.autoFillButton.buttonState = param1.buttonState;
            dispatchEvent(new Event("AutoFillChanged"));
        }
        
        public function set armorInfo(param1:Object) : void
        {
            this.armorItem.armorInfo = param1;
        }
        
        public function set grenadeInfo(param1:Object) : void
        {
            this.grenadeItem.grenadeInfo = param1;
        }
        
        public function set currentWeight(param1:String) : void
        {
            this.weightTextField.text = param1;
        }
        
        public function updateControllerVisibility() : void
        {
            var _loc1_:TraderPlayerAmmoItemRenderer = null;
            var _loc2_:TraderPlayerBuySellRenderer = null;
            this.autoFillButton.bUsingGamepad = bManagerUsingGamepad;
            this.playerInfoContainer.updateControllerVisibility();
            this.swapLists();
            this.autoFillButton.focusable = bManagerUsingGamepad;
            this.armorItem.updateControllerVisibility(bManagerUsingGamepad);
            this.grenadeItem.updateControllerVisibility(bManagerUsingGamepad);
            this.autoFillButton.visible = !bManagerUsingGamepad;
            this.changePerkButton.visible = !bManagerUsingGamepad;
            var _loc3_:int = 0;
            while(_loc3_ < this.infoList.rowCount)
            {
                _loc1_ = TraderPlayerAmmoItemRenderer(this.magList.getRendererAt(_loc3_));
                if(_loc1_ != null)
                {
                    _loc1_.controllerIconVisibility = false;
                    _loc1_.bgVisibility = !bManagerUsingGamepad;
                }
                _loc1_ = TraderPlayerAmmoItemRenderer(this.fillButtonList.getRendererAt(_loc3_));
                if(_loc1_ != null)
                {
                    _loc1_.controllerIconVisibility = false;
                    _loc1_.bgVisibility = !bManagerUsingGamepad;
                }
                _loc2_ = TraderPlayerBuySellRenderer(this.sellList.getRendererAt(_loc3_));
                if(_loc2_ != null)
                {
                    _loc2_.controllerIconVisibility = false;
                    _loc2_.bgVisibility = !bManagerUsingGamepad;
                }
                _loc3_++;
            }
            if(!bManagerUsingGamepad)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.SHOW_DETAILS));
            }
            else
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.HIDE_DETAILS));
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
                    case NavigationCode.GAMEPAD_Y:
                        this.sellSelectedController();
                        param1.handled = true;
                        break;
                    case NavigationCode.GAMEPAD_X:
                        this.onControllerFillAmmo();
                        param1.handled = true;
                        break;
                    case NavigationCode.GAMEPAD_A:
                        if(this.bCanUseMenu)
                        {
                            if(currentElement == this.grenadeItem && this.grenadeItem.magButton.enabled)
                            {
                                if(Extensions.gfxProcessSound != null)
                                {
                                    Extensions.gfxProcessSound(this,"UI",this.magFillSoundEffect);
                                }
                                ExternalInterface.call("Callback_BuyGrenade");
                                param1.handled = true;
                            }
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
            if(!this.playerInfoContainer.perkListContainer.bOpen)
            {
                trace("CALLING CLOSE!!!!!!!!!!!!!!!!!!!!!!!");
                ExternalInterface.call("Callback_Close");
            }
            else
            {
                this.playerInfoContainer.closeList();
                this.fadeinAssets();
            }
        }
        
        public function onTogglePlayerInfoMenu(param1:IndexEvent) : void
        {
            if(!this.bCanUseMenu)
            {
                return;
            }
            switch(param1.index)
            {
                case TraderPlayerInfoContainer.OPEN_INDEX:
                    this.OpenPerkSelect();
                    break;
                case TraderPlayerInfoContainer.CLOSE_INDEX:
                    this.ClosePerkSelect();
            }
        }
        
        public function OpenPerkSelect() : void
        {
            this.bPerkMenuOpen = true;
            this.autoFillButton.enabled = false;
            this.fadeoutAssets();
            this.updateFocusableOnFillButtons(false);
            this.updateFocusableOnInfoList(false);
            this.playerInfoContainer.focusable = true;
            this.playerInfoContainer.perkListContainer.perkList.focusable = true;
            this.playerInfoContainer.perkListContainer.perkList.focused = 1;
            if(bManagerUsingGamepad)
            {
                this.playerInfoContainer.perkListContainer.perkList.selectedIndex = 0;
            }
        }
        
        public function ClosePerkSelect() : void
        {
            this.bPerkMenuOpen = false;
            this.autoFillButton.enabled = true;
            this.fadeinAssets();
            this.updateFocusableOnFillButtons(true);
            this.playerInfoContainer.focusable = false;
            this.updateFocusableOnInfoList(true);
            this.playerInfoContainer.perkListContainer.perkList.focusable = false;
            this.armorItem.focused = 1;
            if(!bManagerUsingGamepad)
            {
            }
        }
        
        protected function tabEnableButtons(param1:Boolean) : void
        {
            if(bManagerUsingGamepad)
            {
                this.playerInfoContainer.perkListContainer.perkList.focused = 0;
                this.playerInfoContainer.tabEnabled = false;
                this.playerInfoContainer.tabChildren = false;
                this.updateFocusableOnFillButtons(param1);
                this.updateFocusableOnInfoList(!param1);
                if(param1)
                {
                    FocusHandler.getInstance().setFocus(this.armorItem.armorInfoContainer);
                }
                else
                {
                    FocusHandler.getInstance().setFocus(this.infoList);
                }
            }
        }
        
        private function updateFocusableOnFillButtons(param1:Boolean) : void
        {
            this.armorItem.focusable = param1;
            this.grenadeItem.focusable = param1;
            this.armorItem.armorInfoContainer.focusable = param1;
            this.grenadeItem.grenadeInfoContainer.focusable = param1;
            this.autoFillButton.focusable = param1;
        }
        
        private function updateFocusableOnInfoList(param1:Boolean) : void
        {
            this.infoList.focusable = param1;
        }
        
        protected function onItemSelected(param1:ListEvent) : void
        {
            var _loc2_:TraderPlayerAmmoItemRenderer = null;
            var _loc3_:TraderPlayerAmmoItemRenderer = null;
            var _loc4_:TraderPlayerBuySellRenderer = null;
            var _loc5_:TraderPlayerInventoryInfoRenderer = null;
            if(this.lastMagItem)
            {
                this.lastMagItem.controllerIconVisibility = false;
            }
            if(this.lastFillItem)
            {
                this.lastFillItem.controllerIconVisibility = false;
            }
            if(this.lastSellItem)
            {
                this.lastSellItem.controllerIconVisibility = false;
            }
            if(this.lastInfoItem)
            {
                this.lastInfoItem.gamepadHighlight.visible = false;
            }
            if(param1.index >= 0)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.SHOW_DETAILS));
                ExternalInterface.call("Callback_PlayerItemSelected",param1.index);
                if(bManagerUsingGamepad)
                {
                    _loc2_ = TraderPlayerAmmoItemRenderer(this.magList.getRendererAt(param1.index,this.infoList.scrollPosition));
                    _loc3_ = TraderPlayerAmmoItemRenderer(this.fillButtonList.getRendererAt(param1.index,this.infoList.scrollPosition));
                    _loc4_ = TraderPlayerBuySellRenderer(this.sellList.getRendererAt(param1.index,this.infoList.scrollPosition));
                    _loc5_ = TraderPlayerInventoryInfoRenderer(this.infoList.getRendererAt(param1.index,this.infoList.scrollPosition));
                    if(_loc2_)
                    {
                        _loc2_.controllerIconVisibility = true;
                        this.lastMagItem = _loc2_;
                    }
                    if(_loc3_)
                    {
                        _loc3_.controllerIconVisibility = true;
                        this.lastFillItem = _loc3_;
                    }
                    if(_loc4_)
                    {
                        _loc4_.controllerIconVisibility = true;
                        this.lastSellItem = _loc4_;
                    }
                    if(_loc5_)
                    {
                        _loc5_.gamepadHighlight.visible = true;
                        this.lastInfoItem = _loc5_;
                    }
                    this.currentSelectedIndex = param1.index;
                }
            }
        }
        
        protected function sellSelectedController() : void
        {
            if(this.bCanUseMenu)
            {
                if(bManagerUsingGamepad)
                {
                    ExternalInterface.call("Callback_BuyOrSellItem");
                }
            }
        }
        
        protected function sellSelected(param1:MouseEvent) : void
        {
            if(this.bCanUseMenu)
            {
                if(!bManagerUsingGamepad)
                {
                    ExternalInterface.call("Callback_BuyOrSellItem");
                }
            }
        }
        
        protected function selectItem(param1:ListEvent) : void
        {
            this.grenadeItem.grenadeInfoContainer.selected = false;
            this.armorItem.armorInfoContainer.selected = false;
            this.infoList.selectedIndex = param1.index;
        }
        
        public function itemSold() : *
        {
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"UI",this.itemSoldSoundEffect);
            }
        }
        
        protected function onControllerBuyMag() : void
        {
            if(this.bCanUseMenu)
            {
                if(bManagerUsingGamepad)
                {
                    if(currentElement == this.grenadeItem && this.grenadeItem.magButton.enabled)
                    {
                        if(Extensions.gfxProcessSound != null)
                        {
                            Extensions.gfxProcessSound(this,"UI",this.magFillSoundEffect);
                        }
                        ExternalInterface.call("Callback_BuyGrenade");
                    }
                    else if(this.infoList.selectedIndex >= 0 && this.magList.getRendererAt(this.infoList.selectedIndex).selectable)
                    {
                        if(Extensions.gfxProcessSound != null)
                        {
                            Extensions.gfxProcessSound(this,"UI",this.magFillSoundEffect);
                        }
                        ExternalInterface.call("Callback_BuyMagazine",this.infoList.selectedIndex);
                    }
                }
            }
        }
        
        protected function buyMag(param1:IndexEvent) : void
        {
            if(this.bCanUseMenu)
            {
                ExternalInterface.call("Callback_BuyMagazine",param1.index);
            }
        }
        
        protected function sellItem(param1:IndexEvent) : void
        {
            if(this.bCanUseMenu)
            {
                if(!bManagerUsingGamepad)
                {
                    ExternalInterface.call("Callback_BuyOrSellItem");
                }
            }
        }
        
        protected function onControllerFillAmmo() : void
        {
            if(this.bCanUseMenu)
            {
                if(currentElement == this.grenadeItem && this.grenadeItem.fillButton.enabled)
                {
                    if(Extensions.gfxProcessSound != null)
                    {
                        Extensions.gfxProcessSound(this,"UI",this.magFillSoundEffect);
                    }
                    ExternalInterface.call("Callback_FillGrenades");
                }
                else if(currentElement == this.armorItem && this.armorItem.fillButton.enabled)
                {
                    if(Extensions.gfxProcessSound != null)
                    {
                        Extensions.gfxProcessSound(this,"UI",this.magFillSoundEffect);
                    }
                    ExternalInterface.call("Callback_FillArmor");
                }
                else if(this.infoList.selectedIndex >= 0 && this.fillButtonList.getRendererAt(this.infoList.selectedIndex).selectable)
                {
                    if(Extensions.gfxProcessSound != null)
                    {
                        Extensions.gfxProcessSound(this,"UI",this.magFillSoundEffect);
                    }
                    ExternalInterface.call("Callback_FillAmmo",this.infoList.selectedIndex);
                }
            }
        }
        
        protected function fillAmmo(param1:IndexEvent) : void
        {
            if(this.bCanUseMenu)
            {
                ExternalInterface.call("Callback_FillAmmo",param1.index);
            }
        }
        
        protected function fillArmor(param1:ButtonEvent) : void
        {
            if(this.bCanUseMenu)
            {
                ExternalInterface.call("Callback_FillArmor");
            }
        }
        
        protected function fillGrenades(param1:ButtonEvent) : void
        {
            if(this.bCanUseMenu)
            {
                ExternalInterface.call("Callback_FillGrenades");
            }
        }
        
        protected function buyGrenade(param1:ButtonEvent) : void
        {
            if(this.bCanUseMenu)
            {
                ExternalInterface.call("Callback_BuyGrenade");
            }
        }
        
        protected function autoFill(param1:ButtonEvent) : void
        {
            if(this.bCanUseMenu)
            {
                ExternalInterface.call("Callback_AutoFill");
            }
        }
        
        public function globalAutoFill() : void
        {
            ExternalInterface.call("Callback_AutoFill");
        }
        
        protected function armorMouseOver(param1:MouseEvent) : void
        {
            ExternalInterface.call("Callback_ArmorItemSelected");
            this.armorItem.armorInfoContainer.selected = true;
            this.grenadeItem.grenadeInfoContainer.selected = false;
            if(param1.target != this.infoList)
            {
                this.infoList.selectedIndex = -1;
            }
            else if(bManagerUsingGamepad)
            {
                this.infoList.selectedIndex = 0;
            }
        }
        
        protected function grenadeMouseOver(param1:MouseEvent) : void
        {
            ExternalInterface.call("Callback_GrenadeItemSelected");
            this.grenadeItem.grenadeInfoContainer.selected = true;
            this.armorItem.armorInfoContainer.selected = false;
            if(param1.target != this.infoList)
            {
                this.infoList.selectedIndex = -1;
            }
            else if(bManagerUsingGamepad)
            {
                this.infoList.selectedIndex = 0;
            }
        }
        
        protected function changeFocusIn(param1:FocusEvent) : void
        {
            this.bArmorFocused = false;
            this.bListFocused = false;
            this.bGrenadeFocused = false;
            if(param1.target == this.armorItem)
            {
                this.armorItem.armorInfoContainer.selected = true;
                this.cachedCurrentElement = this.armorItem;
                ExternalInterface.call("Callback_ArmorItemSelected");
                this.bArmorFocused = true;
            }
            else if(param1.target == this.grenadeItem)
            {
                this.grenadeItem.grenadeInfoContainer.selected = true;
                this.cachedCurrentElement = this.grenadeItem;
                ExternalInterface.call("Callback_GrenadeItemSelected");
                this.bGrenadeFocused = true;
            }
            else if(param1.target == this.autoFillButton)
            {
                this.autoFillButton.selected = true;
                this.cachedCurrentElement = this.autoFillButton;
            }
            if(param1.target != this.infoList)
            {
                this.infoList.selectedIndex = -1;
                this.currentSelectedIndex = -1;
            }
            else if(bManagerUsingGamepad)
            {
                this.cachedCurrentElement = this.infoList;
                this.infoList.selectedIndex = this.currentSelectedIndex == -1 ? 0 : int(this.currentSelectedIndex);
                this.grenadeItem.grenadeInfoContainer.selected = false;
                this.armorItem.armorInfoContainer.selected = false;
                this.bListFocused = true;
            }
        }
        
        protected function changeFocusOut(param1:FocusEvent) : void
        {
            if(param1.target == this.grenadeItem.grenadeInfoContainer)
            {
                this.grenadeItem.grenadeInfoContainer.selected = false;
            }
            else if(param1.target == this.armorItem.armorInfoContainer)
            {
                this.armorItem.armorInfoContainer.selected = false;
            }
            else if(param1.target == this.autoFillButton)
            {
                this.autoFillButton.selected = false;
            }
        }
        
        protected function armorSelected(param1:ButtonEvent) : void
        {
            if(param1.target == this.armorItem.armorInfoContainer)
            {
                FocusHandler.getInstance().setFocus(this.armorItem);
            }
        }
        
        protected function grenadeSelected(param1:ButtonEvent) : void
        {
            if(param1.target == this.grenadeItem.grenadeInfoContainer)
            {
                FocusHandler.getInstance().setFocus(this.grenadeItem);
            }
        }
        
        protected function fadeoutAssets() : void
        {
            this.autoFillButton.mouseEnabled = false;
            TweenMax.allTo([this.inventoryItem_1,this.inventoryItem_2,this.inventoryItem_3,this.inventoryItem_4,this.inventoryItem_5,this.inventoryItem_6,this.inventoryItem_7],4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.armorItem,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.divLine,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.grenadeItem,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.autoFillButton,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.infoList,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.magList,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.sellList,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.fillButtonList,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.playerScrollBar,4,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
        }
        
        protected function fadeinAssets() : void
        {
            this.autoFillButton.mouseEnabled = true;
            TweenMax.allTo([this.inventoryItem_1,this.inventoryItem_2,this.inventoryItem_3,this.inventoryItem_4,this.inventoryItem_5,this.inventoryItem_6,this.inventoryItem_7],4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.armorItem,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.divLine,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.grenadeItem,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.autoFillButton,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.infoList,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.magList,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.sellList,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.fillButtonList,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.playerScrollBar,4,{
                "delay":2,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
        }
    }
}
