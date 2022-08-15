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
    import scaleform.clik.controls.Button;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripScrollingList;
    import tripwire.controls.trader.TraderArmorItem;
    import tripwire.controls.trader.TraderAutofillButton;
    import tripwire.controls.trader.TraderGrenadeItem;
    import tripwire.controls.trader.TraderPlayerAmmoItemRenderer;
    import tripwire.menus.TraderMenu;
    
    public class TraderPlayerInventoryContainer extends TripContainer
    {
         
        
        public var playerInfoContainer:TraderPlayerInfoContainer;
        
        public var infoList:TripScrollingList;
        
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
        
        public var changePerkButton:Button;
        
        private var _bCanUseMenu:Boolean = false;
        
        public function TraderPlayerInventoryContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.armorItem.fillButton.addEventListener(ButtonEvent.PRESS,this.fillArmor,false,0,true);
            this.grenadeItem.magButton.addEventListener(ButtonEvent.PRESS,this.buyGrenade,false,0,true);
            this.grenadeItem.fillButton.addEventListener(ButtonEvent.PRESS,this.fillGrenades,false,0,true);
            this.autoFillButton.addEventListener(ButtonEvent.PRESS,this.autoFill,false,0,true);
            this.changePerkButton.addEventListener(ButtonEvent.PRESS,this.playerInfoContainer.togglePerkList,false,0,true);
            this.infoList.addEventListener(ListEvent.INDEX_CHANGE,this.onItemSelected,false,0,true);
            this.infoList.addEventListener(ListEvent.ITEM_PRESS,this.sellSelectedController,false,0,true);
            this.infoList.addEventListener(MouseEvent.DOUBLE_CLICK,this.sellSelected,false,0,true);
            this.magList.addEventListener(IndexEvent.INDEX_CHANGE,this.buyMag,false,0,true);
            this.fillButtonList.addEventListener(IndexEvent.INDEX_CHANGE,this.fillAmmo,false,0,true);
            this.autoFillButton.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.grenadeItem.grenadeInfoContainer.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.armorItem.armorInfoContainer.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.autoFillButton.addEventListener(FocusEvent.FOCUS_OUT,this.changeFocusOut,false,0,true);
            this.grenadeItem.grenadeInfoContainer.addEventListener(FocusEvent.FOCUS_OUT,this.changeFocusOut,false,0,true);
            this.armorItem.armorInfoContainer.addEventListener(FocusEvent.FOCUS_OUT,this.changeFocusOut,false,0,true);
            this.grenadeItem.grenadeInfoContainer.addEventListener(ButtonEvent.PRESS,this.grenadeSelected,false,0,true);
            this.armorItem.armorInfoContainer.addEventListener(ButtonEvent.PRESS,this.armorSelected,false,0,true);
            this.infoList.addEventListener(FocusEvent.FOCUS_IN,this.changeFocusIn,false,0,true);
            this.playerInfoContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.onTogglePlayerInfoMenu,false,0,true);
            this.changePerkButton.tabIndex = 1;
            this.autoFillButton.tabIndex = 2;
            this.armorItem.tabIndex = 3;
            this.grenadeItem.tabIndex = 4;
            this.infoList.tabIndex = 5;
            currentElement = this.armorItem.armorInfoContainer;
            this.updateControllerVisibility();
            this.parent.addEventListener("FadeOutAssets",this.fadeoutAssets);
            this.infoList.bStayOpenOnSelection = true;
            this.magList.bStayOpenOnSelection = true;
            this.fillButtonList.bStayOpenOnSelection = true;
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
                FocusManager.setFocus(this.armorItem);
                this.armorItem.armorInfoContainer.focused = 1;
                this.armorItem.armorInfoContainer.selected = true;
            }
        }
        
        override public function deselectContainer() : void
        {
            FocusManager.setFocus(this.armorItem);
            this.autoFillButton.selected = false;
            this.armorItem.armorInfoContainer.selected = false;
            this.grenadeItem.grenadeInfoContainer.selected = false;
            super.deselectContainer();
        }
        
        override public function closeContainer() : void
        {
            if(this.playerInfoContainer.perkListContainer.bOpen)
            {
                this.fadeinAssets();
                this.playerInfoContainer.closeList();
            }
            super.closeContainer();
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
            this.autoFillButton.buttonValue = param1.buttonValue;
            this.autoFillButton.buttonState = param1.buttonState;
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
            var _loc2_:int = 0;
            this.autoFillButton.bUsingGamepad = bManagerUsingGamepad;
            this.playerInfoContainer.updateControllerVisibility();
            this.autoFillButton.focusable = bManagerUsingGamepad;
            if(!bManagerUsingGamepad)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.SHOW_DETAILS));
                _loc2_ = 0;
                while(_loc2_ < this.infoList.rowCount)
                {
                    _loc1_ = TraderPlayerAmmoItemRenderer(this.magList.getRendererAt(_loc2_));
                    if(_loc1_ != null)
                    {
                        _loc1_.controllerIconVisibility = bManagerUsingGamepad;
                    }
                    _loc1_ = TraderPlayerAmmoItemRenderer(this.fillButtonList.getRendererAt(_loc2_));
                    if(_loc1_ != null)
                    {
                        _loc1_.controllerIconVisibility = bManagerUsingGamepad;
                    }
                    _loc2_++;
                }
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
                    case NavigationCode.GAMEPAD_X:
                        this.onControllerBuyMag();
                        break;
                    case NavigationCode.GAMEPAD_Y:
                        this.onControllerFillAmmo();
                }
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            if(!this.playerInfoContainer.perkListContainer.bOpen)
            {
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
            this.autoFillButton.enabled = true;
            this.fadeinAssets();
            this.updateFocusableOnFillButtons(true);
            this.playerInfoContainer.focusable = false;
            this.updateFocusableOnInfoList(true);
            this.playerInfoContainer.perkListContainer.perkList.focusable = false;
            this.armorItem.focused = 1;
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
                    FocusManager.setFocus(this.armorItem.armorInfoContainer);
                }
                else
                {
                    FocusManager.setFocus(this.infoList);
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
            if(this.lastMagItem)
            {
                this.lastMagItem.controllerIconVisibility = false;
            }
            if(this.lastFillItem)
            {
                this.lastFillItem.controllerIconVisibility = false;
            }
            if(param1.index >= 0)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,TraderMenu.SHOW_DETAILS));
                ExternalInterface.call("Callback_PlayerItemSelected",param1.index);
                if(bManagerUsingGamepad)
                {
                    _loc2_ = TraderPlayerAmmoItemRenderer(this.magList.getRendererAt(param1.index));
                    _loc3_ = TraderPlayerAmmoItemRenderer(this.fillButtonList.getRendererAt(param1.index));
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
                }
            }
        }
        
        protected function sellSelectedController(param1:ListEvent) : void
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
        
        public function itemSold() : *
        {
            Extensions.gfxProcessSound(this,"ButtonSoundTheme","TraderSell_Select");
        }
        
        protected function onControllerBuyMag() : void
        {
            if(this.bCanUseMenu)
            {
                if(currentElement == this.grenadeItem && this.grenadeItem.magButton.enabled)
                {
                    ExternalInterface.call("Callback_BuyGrenade");
                }
                else if(this.infoList.selectedIndex >= 0 && this.magList.getRendererAt(this.infoList.selectedIndex).selectable)
                {
                    ExternalInterface.call("Callback_BuyMagazine",this.infoList.selectedIndex);
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
        
        protected function onControllerFillAmmo() : void
        {
            if(this.bCanUseMenu)
            {
                if(currentElement == this.grenadeItem && this.grenadeItem.magButton.enabled)
                {
                    ExternalInterface.call("Callback_FillGrenades");
                }
                else if(currentElement == this.armorItem && this.armorItem.fillButton.enabled)
                {
                    ExternalInterface.call("Callback_FillArmor");
                }
                else if(this.infoList.selectedIndex >= 0 && this.fillButtonList.getRendererAt(this.infoList.selectedIndex).selectable)
                {
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
        
        protected function changeFocusIn(param1:FocusEvent) : void
        {
            if(param1.target == this.armorItem.armorInfoContainer)
            {
                this.armorItem.armorInfoContainer.selected = true;
                ExternalInterface.call("Callback_ArmorItemSelected");
            }
            else if(param1.target == this.grenadeItem.grenadeInfoContainer)
            {
                this.grenadeItem.grenadeInfoContainer.selected = true;
                ExternalInterface.call("Callback_GrenadeItemSelected");
            }
            if(param1.target != this.infoList)
            {
                this.infoList.selectedIndex = -1;
            }
            else if(bManagerUsingGamepad)
            {
                this.infoList.selectedIndex = 0;
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
                FocusManager.setFocus(this.armorItem.armorInfoContainer);
            }
        }
        
        protected function grenadeSelected(param1:ButtonEvent) : void
        {
            if(param1.target == this.grenadeItem.grenadeInfoContainer)
            {
                FocusManager.setFocus(this.grenadeItem.grenadeInfoContainer);
            }
        }
        
        protected function fadeoutAssets() : void
        {
            TweenMax.to(this.armorItem,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.divLine,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.grenadeItem,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.autoFillButton,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.infoList,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.magList,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.fillButtonList,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.playerScrollBar,12,{
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
        }
        
        protected function fadeinAssets() : void
        {
            TweenMax.to(this.armorItem,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.divLine,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.grenadeItem,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.autoFillButton,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.infoList,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.magList,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.fillButtonList,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(this.playerScrollBar,12,{
                "delay":6,
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
        }
    }
}
