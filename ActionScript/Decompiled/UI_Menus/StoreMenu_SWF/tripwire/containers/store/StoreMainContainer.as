package tripwire.containers.store
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
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.ScrollBar;
    import scaleform.clik.controls.TileList;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.FocusHandlerEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.managers.MenuManager;
    
    public class StoreMainContainer extends TripContainer
    {
         
        
        public var storeItemScrollingList:TileList;
        
        public var allButton:Button;
        
        public var weaponSkinsButton:Button;
        
        public var cosmeticsButton:Button;
        
        public var consumablesButton:Button;
        
        public var marketWeaponSkinsButton:Button;
        
        public var marketCosmeticsButton:Button;
        
        public var marketConsumableButton:Button;
        
        public var scrollbar:ScrollBar;
        
        public var ListBG:MovieClip;
        
        public var pageHeaderText:TextField;
        
        private var _storeListSelectedIndex:int = 0;
        
        public var leftDimmingPanel:MovieClip;
        
        public var rightDimmingPanel:MovieClip;
        
        public var leftSideFocused:Boolean = true;
        
        public var currentFilter:UIComponent;
        
        public var Owner:TripContainer;
        
        public var buttonList:Vector.<TripButton>;
        
        public function StoreMainContainer()
        {
            this.buttonList = new Vector.<TripButton>();
            super();
            enableInitCallback = true;
            _dimmedAlpha = 0.45;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.allButton.label = !!param1.all ? param1.all : "new stuff";
            this.weaponSkinsButton.label = !!param1.weaponSkin ? param1.weaponSkin : "no string";
            this.cosmeticsButton.label = !!param1.cosmetics ? param1.cosmetics : "dudes";
            this.consumablesButton.label = !!param1.items ? param1.items : "shiny things";
            this.marketWeaponSkinsButton.label = !!param1.marketWeaponSkins ? param1.marketWeaponSkins : "w skins";
            this.marketCosmeticsButton.label = !!param1.marketCosmetics ? param1.marketCosmetics : "w skins";
            this.marketConsumableButton.label = !!param1.marketConsumables ? param1.marketConsumables : "w skins";
            this.pageHeaderText.text = this.allButton.label;
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
                this.storeItemScrollingList.focused = 0;
                this.storeItemScrollingList.selectedIndex = -1;
                FocusManager.setModalClip(null);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 1;
                }
            }
            else
            {
                this.storeItemScrollingList.focused = 1;
                this.storeItemScrollingList.selectedIndex = this._storeListSelectedIndex;
                FocusManager.setModalClip(this.storeItemScrollingList);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 2;
                }
            }
        }
        
        public function set cartCount(param1:int) : void
        {
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
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.UP:
                        if(this.leftSideFocused && this.allButton.focused == 1)
                        {
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.DOWN:
                        if(this.leftSideFocused && this.marketConsumableButton.focused == 1)
                        {
                            param1.handled = true;
                        }
                        else if(bManagerConsoleBuild && this.leftSideFocused && this.consumablesButton.focused == 1)
                        {
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.LEFT:
                        if(this.leftSideFocused)
                        {
                            param1.handled = true;
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
                        if(this.leftSideFocused)
                        {
                            this.onBPressed(_loc2_);
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
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.buttonList.push(this.allButton,this.weaponSkinsButton,this.cosmeticsButton,this.consumablesButton,this.marketWeaponSkinsButton,this.marketCosmeticsButton,this.marketConsumableButton);
            var _loc2_:int = 0;
            while(_loc2_ < this.buttonList.length)
            {
                this.buttonList[_loc2_].addEventListener(FocusEvent.FOCUS_IN,this.onSectionFocusIn,false,0,true);
                this.buttonList[_loc2_].addEventListener(ButtonEvent.CLICK,this.sectionButtonClicked,false,0,true);
                this.buttonList[_loc2_].addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
                leftSidePanels.push(this.buttonList[_loc2_]);
                _loc2_++;
            }
            this.storeItemScrollingList.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onStoreListFocusChange,false,0,true);
            this.storeItemScrollingList.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onStoreListFocusChange,false,0,true);
            this.setTabIndex();
            this.leftDimmingPanel.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.storeItemScrollingList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.pageHeaderText.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.rightDimmingPanel.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            rightSidePanels.push(this.storeItemScrollingList);
            rightSidePanels.push(this.pageHeaderText);
            rightSidePanels.push(this.storeItemScrollingList);
            rightSidePanels.push(this.pageHeaderText);
            rightSidePanels.push(this.ListBG);
            this.allButton.selected = true;
            this.currentFilter = this.allButton;
            this.selectContainer();
            if(bManagerConsoleBuild)
            {
                this.marketWeaponSkinsButton.visible = false;
                this.marketCosmeticsButton.visible = false;
                this.marketConsumableButton.visible = false;
            }
        }
        
        public function onSectionFocusIn(param1:FocusEvent) : void
        {
            var _loc2_:TripButton = param1.target as TripButton;
            this.currentFilter = _loc2_;
            this.pageHeaderText.text = Button(param1.currentTarget).label;
            var _loc3_:int = 0;
            while(_loc3_ < this.buttonList.length)
            {
                if(this.buttonList[_loc3_] == _loc2_)
                {
                    this.buttonList[_loc3_].selected = true;
                    ExternalInterface.call("Callback_StoreSectionChanged",_loc3_);
                }
                else
                {
                    this.buttonList[_loc3_].selected = false;
                }
                _loc3_++;
            }
        }
        
        protected function setTabIndex() : *
        {
            this.allButton.tabIndex = 1;
            this.weaponSkinsButton.tabIndex = 2;
            this.cosmeticsButton.tabIndex = 3;
            this.consumablesButton.tabIndex = 4;
            this.marketWeaponSkinsButton.tabIndex = 5;
            this.marketCosmeticsButton.tabIndex = 6;
            this.marketConsumableButton.tabIndex = 7;
            this.storeItemScrollingList.tabIndex = 8;
        }
        
        public function sectionButtonClicked(param1:ButtonEvent = null) : *
        {
            var _loc2_:TripButton = param1.currentTarget as TripButton;
            switch(param1.currentTarget)
            {
                case this.allButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",0);
                    break;
                case this.weaponSkinsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",1);
                    break;
                case this.cosmeticsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",2);
                    break;
                case this.consumablesButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",3);
                    break;
                case this.marketWeaponSkinsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",4);
                    break;
                case this.marketCosmeticsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",5);
                    break;
                case this.marketConsumableButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",6);
            }
            this.deselectButtons();
            this.storeItemScrollingList.focusable = true;
            if(bManagerUsingGamepad)
            {
                this.storeItemScrollingList.selectedIndex = 0;
                FocusManager.setFocus(this.storeItemScrollingList);
            }
            else
            {
                FocusManager.setFocus(null);
            }
            this.pageHeaderText.text = Button(param1.currentTarget).label;
            Button(param1.currentTarget).selected = true;
            this.currentFilter = _loc2_;
        }
        
        private function deselectButtons() : *
        {
            this.allButton.selected = false;
            this.weaponSkinsButton.selected = false;
            this.cosmeticsButton.selected = false;
            this.consumablesButton.selected = false;
            this.marketWeaponSkinsButton.selected = false;
            this.marketCosmeticsButton.selected = false;
            this.marketConsumableButton.selected = false;
        }
        
        public function onStoreListFocusChange(param1:FocusHandlerEvent) : void
        {
            if(param1.target.hasFocus)
            {
                FocusManager.setModalClip(this.storeItemScrollingList);
                this.leftSideFocused = false;
                showDimLeftSide(true);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 2;
                }
            }
            else
            {
                this._storeListSelectedIndex = param1.target.selectedIndex;
                param1.target.selectedIndex = -1;
                FocusManager.setModalClip(null);
            }
        }
        
        public function set storeItemData(param1:Array) : void
        {
            this.storeItemScrollingList.dataProvider = new DataProvider(param1);
            this.storeItemScrollingList.scrollPosition = 0;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            ExternalInterface.call("Callback_ControllerCloseMenu");
        }
        
        public function makeFakeItems() : void
        {
            var _loc3_:Object = null;
            var _loc1_:Array = new Array();
            var _loc2_:int = 0;
            while(_loc2_ < 20)
            {
                _loc3_ = new Object();
                _loc3_.label = _loc2_.toString();
                _loc3_.price = _loc2_;
                _loc3_.description = "DESCRIption" + _loc2_.toString();
                if(_loc2_ % 2 == 0)
                {
                    _loc3_.imageURL = "doge.png";
                }
                else
                {
                    _loc3_.imageURL = "maxresdefault.jpg";
                }
                _loc1_.push(_loc3_);
                _loc2_++;
            }
            this.storeItemData = _loc1_;
        }
    }
}
