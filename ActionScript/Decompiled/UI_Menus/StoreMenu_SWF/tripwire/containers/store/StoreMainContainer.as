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
    import tripwire.controls.store.FeaturedStoreListItemRenderer;
    import tripwire.managers.MenuManager;
    
    public class StoreMainContainer extends TripContainer
    {
         
        
        public var storeItemFeaturedScrollingList:TileList;
        
        public var storeItemScrollingList:TileList;
        
        public var scrollbarFeatured:ScrollBar;
        
        public var featuredButton:Button;
        
        public var allButton:Button;
        
        public var weaponSkinsButton:Button;
        
        public var cosmeticsButton:Button;
        
        public var emotesButton:Button;
        
        public var consumablesButton:Button;
        
        public var sfxButton:Button;
        
        public var marketWeaponSkinsButton:Button;
        
        public var marketCosmeticsButton:Button;
        
        public var marketEmotesButton:Button;
        
        public var marketConsumableButton:Button;
        
        public var marketSFXButton:Button;
        
        public var scrollbar:ScrollBar;
        
        public var ListBG:MovieClip;
        
        public var thankYouTextfield:TextField;
        
        public var featuredItemRenderers:Vector.<FeaturedStoreListItemRenderer>;
        
        public var pageHeaderText:TextField;
        
        private var _storeListSelectedIndex:int = 0;
        
        public var leftDimmingPanel:MovieClip;
        
        public var rightDimmingPanel:MovieClip;
        
        public var leftSideFocused:Boolean = true;
        
        public var currentFilter:UIComponent;
        
        public var Owner:TripContainer;
        
        public var buttonList:Vector.<TripButton>;
        
        protected var currentSelectedScrollingList:TileList;
        
        protected var currentSelectedScroBar:ScrollBar;
        
        public var Num_Of_FeaturedItems:int = 5;
        
        public function StoreMainContainer()
        {
            this.featuredItemRenderers = new Vector.<FeaturedStoreListItemRenderer>();
            this.buttonList = new Vector.<TripButton>();
            super();
            enableInitCallback = true;
            _dimmedAlpha = 0.45;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.featuredButton.label = !!param1.featured ? param1.featured : "feaured swag";
            this.allButton.label = !!param1.all ? param1.all : "new stuff";
            this.weaponSkinsButton.label = !!param1.weaponSkin ? param1.weaponSkin : "no string";
            this.cosmeticsButton.label = !!param1.cosmetics ? param1.cosmetics : "dudes";
            this.emotesButton.label = !!param1.emotes ? param1.emotes : "lols";
            this.consumablesButton.label = !!param1.items ? param1.items : "shiny things";
            this.sfxButton.label = !!param1.sfx ? param1.sfx : "sfx stuff";
            this.marketWeaponSkinsButton.label = !!param1.marketWeaponSkins ? param1.marketWeaponSkins : "w skins";
            this.marketCosmeticsButton.label = !!param1.marketCosmetics ? param1.marketCosmetics : "w skins";
            this.marketEmotesButton.label = !!param1.marketEmotes ? param1.marketEmotes : "m lols";
            this.marketConsumableButton.label = !!param1.marketConsumables ? param1.marketConsumables : "w skins";
            this.marketSFXButton.label = !!param1.marketSFX ? param1.marketSFX : "m sfx";
            this.thankYouTextfield.text = !!param1.thankYouString ? param1.thankYouString : "wdsadasd";
            this.pageHeaderText.text = this.featuredButton.label;
        }
        
        override public function selectContainer() : void
        {
            if(MenuManager.manager && MenuManager.manager.bPopUpOpen)
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
                this.currentSelectedScrollingList.focused = 1;
                this.currentSelectedScrollingList.selectedIndex = 0;
                FocusManager.setModalClip(this.currentSelectedScrollingList);
                if(MenuManager.manager != null)
                {
                    MenuManager.manager.numPrompts = 2;
                }
            }
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
                        if(this.leftSideFocused && this.featuredButton.focused == 1)
                        {
                            param1.handled = true;
                        }
                        break;
                    case NavigationCode.DOWN:
                        if(this.leftSideFocused && this.marketSFXButton.focused == 1)
                        {
                            param1.handled = true;
                        }
                        else if(bManagerConsoleBuild && this.leftSideFocused && this.sfxButton.focused == 1)
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
            var _loc2_:int = 1;
            while(_loc2_ <= this.Num_Of_FeaturedItems)
            {
                this.featuredItemRenderers.push(this["featuredItem_" + _loc2_]);
                _loc2_++;
            }
            this.buttonList.push(this.featuredButton,this.allButton,this.weaponSkinsButton,this.cosmeticsButton,this.emotesButton,this.consumablesButton,this.sfxButton,this.marketWeaponSkinsButton,this.marketCosmeticsButton,this.marketEmotesButton,this.marketConsumableButton,this.marketSFXButton);
            this.currentSelectedScrollingList = this.storeItemFeaturedScrollingList;
            var _loc3_:int = 0;
            while(_loc3_ < this.buttonList.length)
            {
                this.buttonList[_loc3_].addEventListener(FocusEvent.FOCUS_IN,this.onSectionFocusIn,false,0,true);
                this.buttonList[_loc3_].addEventListener(ButtonEvent.CLICK,this.sectionButtonClicked,false,0,true);
                this.buttonList[_loc3_].addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
                leftSidePanels.push(this.buttonList[_loc3_]);
                _loc3_++;
            }
            this.storeItemFeaturedScrollingList.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onStoreListFocusChange,false,0,true);
            this.storeItemFeaturedScrollingList.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onStoreListFocusChange,false,0,true);
            this.storeItemScrollingList.addEventListener(FocusHandlerEvent.FOCUS_IN,this.onStoreListFocusChange,false,0,true);
            this.storeItemScrollingList.addEventListener(FocusHandlerEvent.FOCUS_OUT,this.onStoreListFocusChange,false,0,true);
            this.setTabIndex();
            this.leftDimmingPanel.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.storeItemScrollingList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.pageHeaderText.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.rightDimmingPanel.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            rightSidePanels.push(this.storeItemFeaturedScrollingList);
            rightSidePanels.push(this.storeItemScrollingList);
            rightSidePanels.push(this.pageHeaderText);
            rightSidePanels.push(this.storeItemScrollingList);
            rightSidePanels.push(this.pageHeaderText);
            rightSidePanels.push(this.ListBG);
            this.featuredButton.selected = true;
            this.currentFilter = this.featuredButton;
            this.selectContainer();
            if(bManagerConsoleBuild)
            {
                this.weaponSkinsButton.visible = false;
                this.cosmeticsButton.visible = false;
                this.consumablesButton.visible = false;
                this.sfxButton.visible = false;
                this.emotesButton.visible = false;
                this.marketWeaponSkinsButton.visible = false;
                this.marketCosmeticsButton.visible = false;
                this.marketConsumableButton.visible = false;
                this.marketEmotesButton.visible = false;
                this.marketSFXButton.visible = false;
            }
            this.ShowFeaturedItems();
            this.makeFakeItems();
            this.makeFeaturedItems();
        }
        
        public function onSectionFocusIn(param1:FocusEvent) : void
        {
            var _loc2_:TripButton = param1.target as TripButton;
            var _loc3_:int = 0;
            while(_loc3_ < this.buttonList.length)
            {
                if(this.buttonList[_loc3_] == _loc2_)
                {
                    this.buttonList[_loc3_].selected = true;
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
            var _loc1_:int = 0;
            this.storeItemScrollingList.tabIndex = _loc1_ = (this.marketSFXButton.tabIndex = int((this.marketConsumableButton.tabIndex = int((this.marketEmotesButton.tabIndex = int((this.marketCosmeticsButton.tabIndex = int((this.marketWeaponSkinsButton.tabIndex = int((this.sfxButton.tabIndex = int((this.consumablesButton.tabIndex = int((this.emotesButton.tabIndex = int((this.cosmeticsButton.tabIndex = int((this.weaponSkinsButton.tabIndex = int((this.allButton.tabIndex = int((this.featuredButton.tabIndex = int(_loc1_ + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1)) + 1;
        }
        
        public function sectionButtonClicked(param1:ButtonEvent = null) : *
        {
            var _loc2_:TripButton = param1.currentTarget as TripButton;
            if(_loc2_ != this.featuredButton)
            {
                this.ShowNonFeaturedItems();
            }
            switch(param1.currentTarget)
            {
                case this.featuredButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",0);
                    this.ShowFeaturedItems();
                    break;
                case this.allButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",1);
                    break;
                case this.weaponSkinsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",2);
                    break;
                case this.cosmeticsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",3);
                    break;
                case this.consumablesButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",4);
                    break;
                case this.emotesButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",5);
                    break;
                case this.sfxButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",6);
                    break;
                case this.marketWeaponSkinsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",7);
                    break;
                case this.marketCosmeticsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",8);
                    break;
                case this.marketConsumableButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",9);
                    break;
                case this.marketEmotesButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",10);
                    break;
                case this.marketSFXButton:
                    ExternalInterface.call("Callback_StoreSectionChanged",11);
            }
            this.deselectButtons();
            this.currentSelectedScrollingList.focusable = true;
            if(bManagerUsingGamepad)
            {
                this.currentSelectedScrollingList.selectedIndex = 0;
                FocusManager.setFocus(this.currentSelectedScrollingList);
            }
            else
            {
                FocusManager.setFocus(null);
            }
            this.pageHeaderText.text = Button(param1.currentTarget).label;
            Button(param1.currentTarget).selected = true;
            this.currentFilter = _loc2_;
        }
        
        private function ShowNonFeaturedItems() : *
        {
            var _loc1_:FeaturedStoreListItemRenderer = null;
            this.currentSelectedScrollingList = this.storeItemScrollingList;
            this.storeItemScrollingList.visible = true;
            this.storeItemFeaturedScrollingList.visible = false;
            this.scrollbar.visible = true;
            this.scrollbarFeatured.visible = false;
            this.pageHeaderText.visible = true;
            for each(_loc1_ in this.featuredItemRenderers)
            {
                _loc1_.visible = false;
            }
        }
        
        private function ShowFeaturedItems() : *
        {
            var _loc1_:FeaturedStoreListItemRenderer = null;
            this.currentSelectedScrollingList = this.storeItemFeaturedScrollingList;
            this.storeItemScrollingList.visible = false;
            this.storeItemFeaturedScrollingList.visible = true;
            this.scrollbar.visible = false;
            this.scrollbarFeatured.visible = true;
            this.pageHeaderText.visible = false;
            for each(_loc1_ in this.featuredItemRenderers)
            {
                _loc1_.visible = true;
            }
        }
        
        private function deselectButtons() : *
        {
            this.featuredButton.selected = false;
            this.allButton.selected = false;
            this.weaponSkinsButton.selected = false;
            this.cosmeticsButton.selected = false;
            this.consumablesButton.selected = false;
            this.sfxButton.selected = false;
            this.marketWeaponSkinsButton.selected = false;
            this.marketCosmeticsButton.selected = false;
            this.marketConsumableButton.selected = false;
            this.marketEmotesButton.selected = false;
            this.marketSFXButton.selected = false;
        }
        
        public function onStoreListFocusChange(param1:FocusHandlerEvent) : void
        {
            if(param1.target.hasFocus)
            {
                FocusManager.setModalClip(this.currentSelectedScrollingList);
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
        
        public function set storeItemFeaturedData(param1:Array) : void
        {
            this.storeItemFeaturedScrollingList.dataProvider = new DataProvider(param1);
            this.storeItemFeaturedScrollingList.scrollPosition = 0;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            ExternalInterface.call("Callback_ControllerCloseMenu");
        }
        
        public function makeFakeItems() : void
        {
            var _loc3_:Object = null;
        }
        
        public function makeFeaturedItems() : void
        {
            var _loc3_:Object = null;
        }
    }
}
