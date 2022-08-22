package tripwire.containers.trader
{
    import com.greensock.TweenMax;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    
    public class TraderPlayerInfoContainer extends TripContainer
    {
        
        public static const CLOSE_INDEX = -1;
        
        public static const OPEN_INDEX = 1;
         
        
        public var doshTextField:TextField;
        
        public var perkNameTextField:TextField;
        
        public var perkLevelTextField:TextField;
        
        public var playerHeader:SectionHeaderContainer;
        
        public var xpBar:MovieClip;
        
        public var BG:MovieClip;
        
        public const KBM_FRAME_STRING:String = "kbm";
        
        public const CONTROLLER_FRAME_STRING:String = "controller";
        
        public var perkListContainer:TraderPerkListContainer;
        
        public var characterLoader:UILoader;
        
        public var perkIconLoader:UILoader;
        
        public var bCanUseMenu:Boolean;
        
        public const PERK_ICON_KBM_SIZE:int = 40;
        
        public const PERK_ICON_GAMEPAD_SIZE:int = 64;
        
        public const PERK_ICON_Y:int = 8;
        
        public const PERK_NAME_KBM_X:Number = -604.35;
        
        public const PERK_NAME_GAMEPAD_X:Number = -581.35;
        
        public const PERK_NAME_KBM_Y:Number = -15.2;
        
        public const PERK_NAME_GAMEPAD_Y:Number = 4.7;
        
        public const PERK_NAME_KBM_FONTSIZE:int = 32;
        
        public const PERK_NAME_GAMEPAD_FONTSIZE:int = 42;
        
        public var owner:TraderPlayerInventoryContainer;
        
        public function TraderPlayerInfoContainer()
        {
            super();
            var _loc1_:Array = new Array();
            var _loc2_:int = 1;
            while(_loc2_ < 3)
            {
                _loc1_.push({
                    "label":"Item " + _loc2_,
                    "level":_loc2_,
                    "perkXP":_loc2_ * 10
                });
                _loc2_++;
            }
            this.perkList = _loc1_;
            this.perkListContainer.perkList.bStayOpenOnSelection = true;
            this.perkListContainer.CancelButton.addEventListener(ButtonEvent.CLICK,this.togglePerkList,false,0,true);
            this.perkListContainer.perkList.addEventListener(ListEvent.ITEM_CLICK,this.perkChanged,false,0,true);
            this.perkListContainer.visible = false;
            this.setTabIndex();
            defaultFirstElement = this.perkListContainer.perkList;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.perkListContainer.deselectContainer();
            this.perkListContainer.PlayerInventoryContainerRef = this.owner;
        }
        
        public function set LocalizedText(param1:Object) : void
        {
            if(param1)
            {
                this.playerHeader.text = !!param1.PlayerHeader ? param1.PlayerHeader : "";
                this.perkListContainer.CancelButton.label = !!param1.Cancel ? param1.Cancel : "";
                this.perkListContainer.selectPerkTextField.text = !!param1.SelectPerk ? param1.SelectPerk : "";
            }
        }
        
        protected function setTabIndex() : void
        {
            this.perkListContainer.perkList.tabIndex = 1;
        }
        
        public function updateControllerVisibility() : void
        {
            var _loc1_:String = !!bManagerUsingGamepad ? this.CONTROLLER_FRAME_STRING : this.KBM_FRAME_STRING;
            var _loc2_:TextFormat = new TextFormat();
            this.perkListContainer.CancelButton.visible = !bManagerUsingGamepad;
            this.BG.gotoAndStop(_loc1_);
            _loc2_ = this.perkNameTextField.getTextFormat();
            _loc2_.size = !!bManagerUsingGamepad ? this.PERK_NAME_GAMEPAD_FONTSIZE : this.PERK_NAME_KBM_FONTSIZE;
            this.perkNameTextField.setTextFormat(_loc2_);
            TweenMax.set(this.perkIconLoader,{
                "y":(!!bManagerUsingGamepad ? this.PERK_ICON_Y : -this.PERK_ICON_Y),
                "width":(!!bManagerUsingGamepad ? this.PERK_ICON_GAMEPAD_SIZE : this.PERK_ICON_KBM_SIZE),
                "height":(!!bManagerUsingGamepad ? this.PERK_ICON_GAMEPAD_SIZE : this.PERK_ICON_KBM_SIZE)
            });
            TweenMax.set(this.perkNameTextField,{
                "x":(!!bManagerUsingGamepad ? this.PERK_NAME_GAMEPAD_X : this.PERK_NAME_KBM_X),
                "y":(!!bManagerUsingGamepad ? this.PERK_NAME_GAMEPAD_Y : this.PERK_NAME_KBM_Y)
            });
        }
        
        public function set perkIconPath(param1:String) : void
        {
            this.perkIconLoader.source = param1;
        }
        
        public function set perkName(param1:String) : void
        {
            this.perkNameTextField.text = param1;
        }
        
        public function set perkLevel(param1:String) : void
        {
            this.perkNameTextField.text = param1 + " " + this.perkNameTextField.text;
            this.updateControllerVisibility();
        }
        
        public function set dosh(param1:int) : void
        {
            this.doshTextField.text = String(param1);
        }
        
        public function set xpBarValue(param1:int) : void
        {
            if(param1 > 100)
            {
                param1 = 100;
            }
            else if(param1 < 0)
            {
                param1 = 0;
            }
            this.xpBar.gotoAndStop(param1 + 1);
        }
        
        public function set characterImage(param1:String) : void
        {
            this.characterLoader.source = param1;
        }
        
        public function set perkList(param1:Array) : *
        {
            this.perkListContainer.perkList.dataProvider = new DataProvider(param1);
            this.perkListContainer.perkList.invalidateData();
        }
        
        public function closeList() : *
        {
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CLOSE_INDEX));
            this.perkListContainer.closeContainer();
        }
        
        public function togglePerkList(param1:ButtonEvent = null) : void
        {
            this.doTogglePerkList();
        }
        
        public function doTogglePerkList() : *
        {
            if(!this.bCanUseMenu)
            {
                return;
            }
            if(this.perkListContainer.bOpen)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CLOSE_INDEX));
                deselectContainer();
                this.closeList();
                this.owner.selectContainer();
            }
            else
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,OPEN_INDEX));
                selectContainer();
                this.perkListContainer.openContainer();
                FocusHandler.getInstance().setFocus(this.perkListContainer.perkList);
            }
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            super.handleInput(param1);
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_B:
                        if(_loc2_.code == 97 && this.perkListContainer.bOpen)
                        {
                            this.togglePerkList();
                        }
                }
            }
        }
        
        protected function perkChanged(param1:ListEvent) : *
        {
            if(param1.index != CLOSE_INDEX)
            {
                ExternalInterface.call("Callback_PerkChanged",param1.index);
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CLOSE_INDEX));
                this.closeList();
            }
        }
    }
}
