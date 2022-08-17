package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
    import com.greensock.events.TweenEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.containers.trader.TraderItemDetailsContainer;
    import tripwire.containers.trader.TraderPlayerInventoryContainer;
    import tripwire.containers.trader.TraderShopContainer;
    import tripwire.controls.TripButton;
    
    public class TraderMenu extends TripContainer
    {
        
        public static const HIDE_DETAILS:int = 255;
        
        public static const SHOW_DETAILS:int = 254;
         
        
        public var playerInventoryContainer:TraderPlayerInventoryContainer;
        
        public var shopContainer:TraderShopContainer;
        
        public var itemDetailsContainer:TraderItemDetailsContainer;
        
        public var exitButton:TripButton;
        
        public var cancelPrompt:MovieClip;
        
        private const SELECTED_ALPHA = 1;
        
        private const UNSELECTED_ALPHA = 0.5;
        
        private var _selectedMenuIndex:int = 0;
        
        private const PlayerInventory = 0;
        
        private const StoreContainer = 1;
        
        public function TraderMenu()
        {
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            stage.addEventListener(InputEvent.INPUT,this.handleControllerInput,false,0,true);
            this.playerInventoryContainer.addEventListener(IndexEvent.INDEX_CHANGE,this.selectedItemChanged,false,0,true);
            this.playerInventoryContainer.addEventListener(FocusEvent.FOCUS_IN,this.containerFocusIn,false,0,true);
            this.shopContainer.addEventListener(FocusEvent.FOCUS_IN,this.containerFocusIn,false,0,true);
            this.exitButton.focusable = false;
            if(bManagerUsingGamepad)
            {
                this.shopContainer.deselectContainer();
                this.playerInventoryContainer.selectContainer();
            }
            this.updateControllerVisibility();
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
        
        public function set cancelPromptName(param1:String) : void
        {
            this.cancelPrompt.textField.text = param1;
        }
        
        public function updateControllerVisibility() : *
        {
            this.cancelPrompt.visible = bManagerUsingGamepad;
            this.exitButton.visible = !bManagerUsingGamepad;
            this.shopContainer.updateControllerVisibility();
            this.playerInventoryContainer.updateControllerVisibility();
            this.itemDetailsContainer.updateControllerVisibility();
        }
        
        protected function containerFocusIn(param1:FocusEvent) : void
        {
            if(param1.target != this.playerInventoryContainer)
            {
                this.playerInventoryContainer.infoList.selectedIndex = -1;
            }
            if(param1.target != this.shopContainer)
            {
                this.shopContainer.shopList.selectedIndex = -1;
            }
        }
        
        protected function selectedItemChanged(param1:IndexEvent) : void
        {
            this.itemDetailsContainer.visible = param1.index == SHOW_DETAILS;
        }
        
        protected function handleControllerInput(param1:InputEvent) : void
        {
            var _loc2_:InputDetails = param1.details;
            if(!bOpen)
            {
                return;
            }
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(param1.details.navEquivalent)
                {
                    case NavigationCode.LEFT:
                        if(this._selectedMenuIndex < this.StoreContainer && this.playerInventoryContainer.changePerkButton.focused != 1 && !this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
                        {
                            this.selectedMenuIndex += 1;
                        }
                        break;
                    case NavigationCode.GAMEPAD_B:
                        if(!this.playerInventoryContainer.playerInfoContainer.perkListContainer.bOpen)
                        {
                            ExternalInterface.call("Callback_Close");
                        }
                        break;
                    case NavigationCode.RIGHT:
                        if(this._selectedMenuIndex > this.PlayerInventory)
                        {
                            this.selectedMenuIndex = this.selectedMenuIndex - 1;
                        }
                        break;
                    case NavigationCode.GAMEPAD_R3:
                        if(this.itemDetailsContainer.visible)
                        {
                            this.itemDetailsContainer.favoriteItem();
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
            }
            this.updateControllerVisibility();
        }
        
        private function setSelectedContainer(param1:Boolean, param2:Boolean) : void
        {
            this.shopContainer.alpha = !!param1 ? Number(this.SELECTED_ALPHA) : Number(this.UNSELECTED_ALPHA);
            this.playerInventoryContainer.alpha = !!param2 ? Number(this.SELECTED_ALPHA) : Number(this.UNSELECTED_ALPHA);
        }
        
        protected function exitMenu(param1:ButtonEvent) : *
        {
            ExternalInterface.call("Callback_Close");
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
            stage.addEventListener(InputEvent.INPUT,this.handleControllerInput,false,0,true);
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
            stage.removeEventListener(InputEvent.INPUT,this.handleControllerInput);
            if(bManagerUsingGamepad)
            {
                this.selectedMenuIndex = this.PlayerInventory;
            }
            this.shopContainer.deselectContainer();
            this.playerInventoryContainer.deselectContainer();
            currentElement = null;
            FocusHandler.getInstance().setFocus(null);
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "blurFilter":{
                    "blurX":ANIM_BLUR_X,
                    "blurY":ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_START_Z,
                "alpha":_defaultAlpha,
                "blurFilter":{
                    "blurX":AnimBLUR_OUT,
                    "blurY":AnimBLUR_OUT,
                    "quality":1,
                    "remove":true
                },
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
                "alpha":_defaultAlpha,
                "ease":Linear.easeNone,
                "useFrames":true
            },{
                "z":ANIM_OFFSET_Z,
                "alpha":0,
                "blurFilter":{
                    "blurX":ANIM_BLUR_X,
                    "blurY":ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":this.onClosed
            });
        }
    }
}
