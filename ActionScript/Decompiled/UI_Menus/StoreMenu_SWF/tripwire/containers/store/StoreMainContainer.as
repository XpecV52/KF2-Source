package tripwire.containers.store
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import scaleform.clik.controls.TileList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    
    public class StoreMainContainer extends TripContainer
    {
         
        
        public var storeItemScrollingList:TileList;
        
        public var newReleasesButton:Button;
        
        public var playableCharactersButton:Button;
        
        public var weaponSkinsButton:Button;
        
        public var toolsButton:Button;
        
        public var cartButton:CartButton;
        
        public var pageHeaderText:TextField;
        
        public function StoreMainContainer()
        {
            super();
            this.cartCount = 0;
            enableInitCallback = true;
            defaultFirstElement = currentElement = this.newReleasesButton;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.newReleasesButton.label = !!param1.newReleases ? param1.newReleases : "new stuff";
            this.playableCharactersButton.label = !!param1.characters ? param1.characters : "dudes";
            this.weaponSkinsButton.label = !!param1.weaponSkins ? param1.weaponSkins : "w skins";
            this.toolsButton.label = !!param1.tools ? param1.tools : "shiny things";
            this.cartButton.label = !!param1.cart ? param1.cart : "bin";
            this.pageHeaderText.text = this.playableCharactersButton.label;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            FocusManager.setFocus(currentElement);
        }
        
        public function set cartCount(param1:int) : void
        {
            this.cartButton.cartNumText.text = "(" + param1.toString() + ")";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.newReleasesButton.addEventListener(ButtonEvent.CLICK,this.sectionButtonClicked,false,0,true);
            this.playableCharactersButton.addEventListener(ButtonEvent.CLICK,this.sectionButtonClicked,false,0,true);
            this.weaponSkinsButton.addEventListener(ButtonEvent.CLICK,this.sectionButtonClicked,false,0,true);
            this.toolsButton.addEventListener(ButtonEvent.CLICK,this.sectionButtonClicked,false,0,true);
            this.newReleasesButton.selected = true;
            this.newReleasesButton.visible = true;
            this.setTabIndex();
            this.cartButton.visible = false;
            this.weaponSkinsButton.visible = false;
        }
        
        protected function setTabIndex() : *
        {
            this.newReleasesButton.tabIndex = 1;
            this.playableCharactersButton.tabIndex = 2;
            this.weaponSkinsButton.tabIndex = 3;
            this.toolsButton.tabIndex = 4;
            this.storeItemScrollingList.tabIndex = 1;
        }
        
        public function sectionButtonClicked(param1:ButtonEvent = null) : *
        {
            switch(param1.currentTarget)
            {
                case this.newReleasesButton:
                    ExternalInterface.call("Callback_StoreSectionChanged","New Releases");
                    break;
                case this.playableCharactersButton:
                    ExternalInterface.call("Callback_StoreSectionChanged","Characters");
                    break;
                case this.weaponSkinsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged","Weapons");
                    break;
                case this.toolsButton:
                    ExternalInterface.call("Callback_StoreSectionChanged","Tools");
            }
            this.deselectButtons();
            this.pageHeaderText.text = Button(param1.currentTarget).label;
            Button(param1.currentTarget).selected = true;
        }
        
        private function deselectButtons() : *
        {
            this.newReleasesButton.selected = false;
            this.playableCharactersButton.selected = false;
            this.weaponSkinsButton.selected = false;
            this.toolsButton.selected = false;
        }
        
        public function set storeItemData(param1:Array) : void
        {
            this.storeItemScrollingList.dataProvider = new DataProvider(param1);
            if(bManagerUsingGamepad)
            {
                FocusManager.setFocus(this.storeItemScrollingList);
            }
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
