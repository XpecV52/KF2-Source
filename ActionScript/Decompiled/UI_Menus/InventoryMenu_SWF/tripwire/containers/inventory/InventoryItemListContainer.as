package tripwire.containers.inventory
{
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.TileList;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.managers.FocusHandler;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    
    public class InventoryItemListContainer extends TripContainer
    {
         
        
        public var inventoryItemScrollingList:TileList;
        
        public var itemImageLoader:UILoader;
        
        public var itemNameText:TextField;
        
        public var itemDescriptionText:TextField;
        
        public var filtersText:TextField;
        
        public var allButton:TripButton;
        
        public var weaponSkinsButton:TripButton;
        
        public var cosmeticsButton:TripButton;
        
        public var consumablesButton:TripButton;
        
        public var craftingMatsButton:TripButton;
        
        public var craftWeaponsButton:TripButton;
        
        public var craftCosmeticsButton:TripButton;
        
        public var buttonList:Vector.<TripButton>;
        
        public function InventoryItemListContainer()
        {
            this.buttonList = new Vector.<TripButton>();
            super();
            defaultFirstElement = currentElement = this.inventoryItemScrollingList;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            FocusHandler.getInstance().setFocus(currentElement);
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
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.buttonList.push(this.allButton,this.weaponSkinsButton,this.cosmeticsButton,this.consumablesButton,this.craftingMatsButton);
            var _loc2_:int = 0;
            while(_loc2_ < this.buttonList.length)
            {
                this.buttonList[_loc2_].addEventListener(ButtonEvent.PRESS,this.onFilterButtonClicked,false,0,true);
                _loc2_++;
            }
            this.allButton.tabIndex = 1;
            this.weaponSkinsButton.tabIndex = 2;
            this.cosmeticsButton.tabIndex = 3;
            this.consumablesButton.tabIndex = 4;
            this.craftingMatsButton.tabIndex = 5;
            this.inventoryItemScrollingList.tabIndex = 6;
            this.craftWeaponsButton.tabIndex = 7;
            this.craftCosmeticsButton.tabIndex = 8;
            if(bManagerUsingGamepad)
            {
                this.inventoryItemScrollingList.selectedIndex = 1;
            }
            this.inventoryItemScrollingList.addEventListener(ListEvent.INDEX_CHANGE,this.onIndexChange,false,0,true);
        }
        
        public function onFilterButtonClicked(param1:ButtonEvent) : void
        {
            var _loc2_:TripButton = param1.currentTarget as TripButton;
            var _loc3_:int = 0;
            while(_loc3_ < this.buttonList.length)
            {
                if(this.buttonList[_loc3_] == _loc2_ && !_loc2_.selected)
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
        
        public function onIndexChange(param1:ListEvent) : void
        {
            if(param1.itemData)
            {
                this.itemDetails = param1.itemData;
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
                this.inventoryItemScrollingList.focusable = true;
                FocusManager.setFocus(this.inventoryItemScrollingList);
            }
            else
            {
                this.inventoryItemScrollingList.focusable = false;
            }
        }
    }
}
