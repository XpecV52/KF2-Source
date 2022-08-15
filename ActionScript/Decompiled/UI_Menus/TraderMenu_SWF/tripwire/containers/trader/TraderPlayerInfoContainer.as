package tripwire.containers.trader
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.events.ListEvent;
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
        
        public var perkListContainer:TraderPerkListContainer;
        
        public var characterLoader:UILoader;
        
        public var perkIconLoader:UILoader;
        
        public var bCanUseMenu:Boolean;
        
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
            this.perkListContainer.CancelButton.visible = !bManagerUsingGamepad;
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
            this.perkLevelTextField.text = param1;
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
            if(!this.bCanUseMenu)
            {
                return;
            }
            if(this.perkListContainer.bOpen)
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CLOSE_INDEX));
                this.closeList();
            }
            else
            {
                dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,OPEN_INDEX));
                selectContainer();
                this.perkListContainer.openContainer();
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
