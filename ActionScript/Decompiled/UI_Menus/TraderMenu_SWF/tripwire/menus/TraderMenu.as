package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Linear;
    import com.greensock.events.TweenEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.containers.trader.TraderButtonPromptContainer;
    import tripwire.containers.trader.TraderItemDetailsContainer;
    import tripwire.containers.trader.TraderPlayerInfoContainer;
    import tripwire.containers.trader.TraderPlayerInventoryContainer;
    import tripwire.containers.trader.TraderShopContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.trader.TraderFilterTabBar;
    
    public class TraderMenu extends TripContainer
    {
        
        public static const HIDE_DETAILS:int = 255;
        
        public static const SHOW_DETAILS:int = 254;
        
        public static var ITEM_UPDATED = "ItemUpdated";
        
        public static var PERK_MENU_CHANGED = "PerkMenuChanged";
        
        public static var AUTOFILL_CHANGED = "AutoFillChanged";
         
        
        public var playerInventoryContainer:TraderPlayerInventoryContainer;
        
        public var shopContainer:TraderShopContainer;
        
        public var itemDetailsContainer:TraderItemDetailsContainer;
        
        public var gameInfoContainer:MovieClip;
        
        public var exitButton:TripButton;
        
        public var cancelPrompt:MovieClip;
        
        public var centralPrompts:TraderButtonPromptContainer;
        
        private const SELECTED_ALPHA = 1;
        
        private const UNSELECTED_ALPHA = 0.6;
        
        private var _selectedMenuIndex:int = 0;
        
        private const PlayerInventory = 0;
        
        private const StoreContainer = 1;
        
        private var _favoriteString:String;
        
        private var _unfavoriteString:String;
        
        private var _changePerkString:String;
        
        private var _autoTradeString:String;
        
        private var _selectString:String;
        
        private var _exitPromptString;
        
        private var _backPromptString;
        
        public var disabledPromptAlpha:Number = 0.24;
        
        private var _bCanAutoTrade:Boolean = true;
        
        private var CONTAINER_ROT;
        
        private var shopStartX:int;
        
        private var inventoryStartX:int;
        
        private const CONTAINER_OFFSET_X:int = 16;
        
        public var bRightSideFocused:Boolean;
        
        public function TraderMenu()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
            this.playerInventoryContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.selectedItemChanged,false,0,true);
            this.playerInventoryContainer.addEventListener(FocusEvent.FOCUS_IN,this.containerFocusIn,false,0,true);
            this.shopContainer.addEventListener(FocusEvent.FOCUS_IN,this.containerFocusIn,false,0,true);
            this.shopContainer.shopList.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            TraderFilterTabBar(this.shopContainer.filterContainer.tabBar).addEventListener(IndexEvent.INDEX_CHANGE,this.shopTabChanged,false,0,true);
            this.playerInventoryContainer.grenadeItem.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.playerInventoryContainer.playerInfoContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.onPerkContainer,false,0,true);
            this.itemDetailsContainer.addEventListener(ITEM_UPDATED,this.itemUpdated,false,0,true);
            this.playerInventoryContainer.addEventListener(PERK_MENU_CHANGED,this.perkMenuChanged,false,0,true);
            this.playerInventoryContainer.addEventListener(AUTOFILL_CHANGED,this.autofillChanged,false,0,true);
            leftSidePanels.push(this.shopContainer);
            rightSidePanels.push(this.playerInventoryContainer);
            this.exitButton.focusable = false;
            if(bManagerUsingGamepad)
            {
                this.shopContainer.deselectContainer();
                this.playerInventoryContainer.selectContainer();
            }
            this.updateControllerVisibility();
            this.CONTAINER_ROT = this.playerInventoryContainer.rotationY;
            this.shopStartX = this.shopContainer.x;
            this.inventoryStartX = this.playerInventoryContainer.x;
            this.updateCentralPrompts();
        }
        
        public function set selectedMenuIndex(param1:int) : void
        {
            this._selectedMenuIndex = param1;
            switch(this._selectedMenuIndex)
            {
                case this.PlayerInventory:
                    this.shopContainer.deselectContainer();
                    this.shopContainer.filterContainer.deselectContainer();
                    this.shopContainer.leaveList();
                    this.playerInventoryContainer.selectContainer();
                    this.setSelectedContainer(false,true);
                    break;
                case this.StoreContainer:
                    this.playerInventoryContainer.deselectContainer();
                    this.shopContainer.selectContainer();
                    this.setSelectedContainer(true,false);
            }
        }
        
        public function get selectedMenuIndex() : int
        {
            return this._selectedMenuIndex;
        }
        
        public function set exitMenuString(param1:String) : void
        {
            this.exitButton.label = param1;
        }
        
        public function set exitPromptString(param1:String) : void
        {
            this._exitPromptString = param1;
            this.cancelPrompt.textField.text = this._exitPromptString;
        }
        
        public function set backPromptString(param1:String) : void
        {
            this._backPromptString = param1;
        }
        
        public function set localizeCentralPrompts(param1:Object) : void
        {
            this.centralPrompts.autofillText = !!param1.autoFillString ? param1.autoFillString : "M_AUTOFILL_M";
            this._favoriteString = !!param1.favoriteString ? param1.favoriteString : "M_FAVORITE_M";
            this._unfavoriteString = !!param1.unFavoriteString ? param1.unFavoriteString : "M_UNFAVORITE_M";
            this._changePerkString = !!param1.changePerkString ? param1.changePerkString : "M_CHANGE PERK_M";
            this._autoTradeString = !!param1.autoTradeString ? param1.autoTradeString : "M_AUTOTRADE_M";
            this._selectString = !!param1.selectString ? param1.selectString : "M_SELECT_M";
        }
        
        public function set autofillCost(param1:String) : void
        {
            this.centralPrompts.autofillNum = param1;
            this.centralPrompts.autofillState = this.playerInventoryContainer.autofillState;
        }
        
        public function updateCentralPrompts(param1:Boolean = false) : void
        {
            var _loc2_:Array = new Array();
            var _loc3_:String = !!this.itemDetailsContainer.bIsFavorite ? this._unfavoriteString : this._favoriteString;
            this.centralPrompts.alpha = !!param1 ? Number(0) : Number(1);
            if(this.playerInventoryContainer.bPerkMenuOpen)
            {
                this.centralPrompts.bShowAutoFill = false;
                _loc2_.push({
                    "promptText":this._selectString,
                    "buttonDisplay":"xboxtypes_a"
                });
                _loc2_.push({
                    "promptText":this._backPromptString,
                    "buttonDisplay":"xboxtypes_b"
                });
                this.centralPrompts.promptData = _loc2_;
                this.centralPrompts.buttonPromptContainer.setPromptAlpha("xboxtypes_a",1);
                this.centralPrompts.buttonPromptContainer.setPromptAlpha("xboxtypes_b",1);
            }
            else
            {
                this.centralPrompts.bShowAutoFill = true;
                _loc2_.push({
                    "promptText":_loc3_,
                    "buttonDisplay":"xboxtypes_back"
                });
                _loc2_.push({
                    "promptText":this._changePerkString,
                    "buttonDisplay":"xboxtypes_rightthumbstick"
                });
                _loc2_.push({
                    "promptText":this._exitPromptString,
                    "buttonDisplay":"xboxtypes_b"
                });
                this.centralPrompts.promptData = _loc2_;
                this.centralPrompts.buttonPromptContainer.setPromptAlpha("xboxtypes_back",!!this.itemDetailsContainer.bCanFavorite ? Number(1) : Number(this.disabledPromptAlpha));
                this.centralPrompts.buttonPromptContainer.setPromptAlpha("xboxtypes_rightthumbstick",!!this.playerInventoryContainer.changePerkButton.enabled ? Number(1) : Number(this.disabledPromptAlpha));
            }
        }
        
        public function itemUpdated(param1:Event) : void
        {
            this.updateCentralPrompts();
        }
        
        public function perkMenuChanged(param1:Event) : void
        {
            this.updateCentralPrompts(true);
        }
        
        public function autofillChanged(param1:Event) : void
        {
            this.autofillCost = this.playerInventoryContainer.autofillValue;
        }
        
        public function updateControllerVisibility() : *
        {
            this.centralPrompts.visible = bManagerUsingGamepad;
            this.exitButton.visible = !bManagerUsingGamepad;
            this.exitPromptString = this._exitPromptString;
            this.shopContainer.updateControllerVisibility();
            this.playerInventoryContainer.updateControllerVisibility();
            this.itemDetailsContainer.updateControllerVisibility();
        }
        
        public function shopTabChanged(param1:IndexEvent) : void
        {
            if(!bManagerUsingGamepad)
            {
                this.playerInventoryContainer.infoList.selectedIndex = -1;
                this.playerInventoryContainer.grenadeItem.grenadeInfoContainer.selected = false;
                this.playerInventoryContainer.armorItem.armorInfoContainer.selected = false;
            }
        }
        
        protected function containerFocusIn(param1:FocusEvent) : void
        {
            if(param1.target != this.playerInventoryContainer)
            {
            }
            if(param1.target != this.shopContainer)
            {
            }
        }
        
        protected function selectedItemChanged(param1:IndexEvent) : void
        {
            this.itemDetailsContainer.visible = param1.index == SHOW_DETAILS;
            if(!bManagerUsingGamepad)
            {
                this.shopContainer.shopList.selectedIndex = -1;
            }
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            var _loc2_:InputDetails = param1.details;
            if(!bOpen || !_bReadyForInput)
            {
                return;
            }
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(param1.details.navEquivalent)
                {
                    case NavigationCode.RIGHT:
                        if(this._selectedMenuIndex < this.StoreContainer && this.playerInventoryContainer.autoFillButton.focused != 1 && !this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
                        {
                            this.selectedMenuIndex += 1;
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.GAMEPAD_B:
                        if(!this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
                        {
                            ExternalInterface.call("Callback_Close");
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.LEFT:
                        if(this._selectedMenuIndex > this.PlayerInventory)
                        {
                            this.selectedMenuIndex = this.selectedMenuIndex - 1;
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.GAMEPAD_L3:
                        if(!this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
                        {
                            this.playerInventoryContainer.globalAutoFill();
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.GAMEPAD_BACK:
                        if(this.itemDetailsContainer.visible && this.itemDetailsContainer.bCanFavorite == true && !this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
                        {
                            this.itemDetailsContainer.favoriteItem();
                            this.updateCentralPrompts();
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.GAMEPAD_R3:
                        if(!this.playerInventoryContainer.bPerkMenuOpen && this.playerInventoryContainer.changePerkButton.enabled)
                        {
                            if(this._selectedMenuIndex > this.PlayerInventory)
                            {
                                this.selectedMenuIndex = this.selectedMenuIndex - 1;
                            }
                            this.playerInventoryContainer.playerInfoContainer.doTogglePerkList();
                            this.updateCentralPrompts();
                            param1.handled = true;
                        }
                }
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            if(bManagerUsingGamepad)
            {
                this.setSelectedContainer(false,true);
                this.shopContainer.deselectContainer();
                this.playerInventoryContainer.selectContainer();
            }
            else
            {
                this.setSelectedContainer(true,true);
                this.shopContainer.deselectContainer();
                this.playerInventoryContainer.deselectContainer();
                this.resetBothSides();
            }
            this.updateControllerVisibility();
        }
        
        private function setSelectedContainer(param1:Boolean, param2:Boolean) : void
        {
            if(param1)
            {
                showDimLeftSide(false);
            }
            else
            {
                showDimLeftSide(true);
            }
            this.ShowPanelPrompts(param1,param2);
        }
        
        protected function exitMenu(param1:ButtonEvent) : *
        {
            ExternalInterface.call("Callback_Close");
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer(param1);
            this.updateControllerVisibility();
        }
        
        override public function closeContainer() : void
        {
            if(this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
            {
                this.playerInventoryContainer.closeContainer();
            }
            this.playerInventoryContainer.bCanUseMenu = false;
            mouseEnabled = mouseChildren = false;
            super.closeContainer();
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            this.playerInventoryContainer.bCanUseMenu = true;
            this.exitButton.addEventListener(ButtonEvent.PRESS,this.exitMenu,false,0,true);
            mouseEnabled = mouseChildren = true;
            stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
            if(bManagerUsingGamepad)
            {
                this.selectedMenuIndex = this.PlayerInventory;
            }
        }
        
        override protected function onClosed(param1:TweenEvent = null) : void
        {
            super.onClosed(param1);
            this.playerInventoryContainer.bCanUseMenu = false;
            this.exitButton.removeEventListener(ButtonEvent.PRESS,this.exitMenu);
            stage.removeEventListener(InputEvent.INPUT,this.handleInput);
            if(bManagerUsingGamepad)
            {
                this.selectedMenuIndex = this.PlayerInventory;
            }
            this.shopContainer.deselectContainer();
            this.playerInventoryContainer.deselectContainer();
            currentElement = null;
            FocusHandler.getInstance().setFocus(null);
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_START_Z,
                "alpha":(!!param1 ? _defaultAlpha : _dimmedAlpha),
                "ease":Linear.easeNone,
                "delay":ANIM_TIME,
                "useFrames":true,
                "onComplete":this.onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_START_Z,
                "alpha":alpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":this.onClosed
            });
        }
        
        protected function onPerkContainer(param1:IndexEvent) : *
        {
            if(bManagerUsingGamepad)
            {
                switch(param1.index)
                {
                    case TraderPlayerInfoContainer.OPEN_INDEX:
                        this.cancelPrompt.textField.text = this._backPromptString;
                        break;
                    case TraderPlayerInfoContainer.CLOSE_INDEX:
                        this.cancelPrompt.textField.text = this._exitPromptString;
                }
            }
        }
        
        public function ShowPanelPrompts(param1:Boolean, param2:Boolean) : *
        {
            if(bManagerUsingGamepad)
            {
                this.shopContainer.promptsDisplay.visible = param1;
                this.playerInventoryContainer.promptsDisplay.visible = param2;
            }
        }
        
        override public function dimLeftSide(param1:Boolean) : void
        {
            if(bManagerUsingGamepad)
            {
                TweenMax.to(this.shopContainer,4,{
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "alpha":(!param1 ? this.SELECTED_ALPHA : this.UNSELECTED_ALPHA),
                    "rotationY":(!!param1 ? -this.CONTAINER_ROT : 0),
                    "x":(!param1 ? this.shopStartX + this.CONTAINER_OFFSET_X : this.shopStartX)
                });
            }
            if(param1)
            {
                this.shopContainer.shopList.selectedIndex = -1;
            }
        }
        
        override public function dimRightSide(param1:Boolean) : void
        {
            if(bManagerUsingGamepad)
            {
                TweenMax.to(this.playerInventoryContainer,4,{
                    "ease":Cubic.easeOut,
                    "useFrames":true,
                    "alpha":(!param1 ? this.SELECTED_ALPHA : this.UNSELECTED_ALPHA),
                    "rotationY":(!!param1 ? this.CONTAINER_ROT : 0),
                    "x":(!param1 ? this.inventoryStartX - this.CONTAINER_OFFSET_X : this.inventoryStartX)
                });
            }
            if(param1)
            {
                this.playerInventoryContainer.infoList.selectedIndex = -1;
                this.playerInventoryContainer.grenadeItem.grenadeInfoContainer.selected = false;
                this.playerInventoryContainer.armorItem.armorInfoContainer.selected = false;
            }
        }
        
        public function resetBothSides() : void
        {
            TweenMax.killTweensOf(this.shopContainer);
            TweenMax.killTweensOf(this.playerInventoryContainer);
            TweenMax.set(this.shopContainer,{
                "alpha":this.SELECTED_ALPHA,
                "rotationY":-this.CONTAINER_ROT,
                "x":this.shopStartX
            });
            TweenMax.set(this.playerInventoryContainer,{
                "alpha":this.SELECTED_ALPHA,
                "rotationY":this.CONTAINER_ROT,
                "x":this.inventoryStartX
            });
        }
    }
}
