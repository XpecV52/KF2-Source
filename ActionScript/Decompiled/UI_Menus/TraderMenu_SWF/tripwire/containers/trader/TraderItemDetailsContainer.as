package tripwire.containers.trader
{
    import fl.motion.Color;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoaderQueue;
    import tripwire.managers.MenuManager;
    
    public class TraderItemDetailsContainer extends TripContainer
    {
         
        
        public var detailedStats:TraderItemStatsContainer;
        
        public var noStatsDescriptionTextField:TextField;
        
        public var typeTextField:TextField;
        
        public var nameTextField:TextField;
        
        public var weaponLoader:TripUILoaderQueue;
        
        public var perkLoader:TripUILoaderQueue;
        
        private var activeColor:uint = 38006;
        
        private var inactiveColor:uint = 15547935;
        
        private var _iconColor:Color;
        
        private var _favoriteString:String;
        
        private var _unfavoriteString:String;
        
        public var _bIsFavorite:Boolean;
        
        public var _bCanFavorite:Boolean;
        
        private var cachedFavorite_X:Number;
        
        private var cachedItemData:Object;
        
        public function TraderItemDetailsContainer()
        {
            this._iconColor = new Color();
            super();
            this.detailedStats.favoriteButton.addEventListener(ButtonEvent.PRESS,this.onFavoriteItem,false,0,true);
            tabChildren = false;
            tabEnabled = false;
            this.updateControllerVisibility();
            this.detailedStats.damageValue.visible = false;
            this.detailedStats.fireRateValue.visible = false;
            this.detailedStats.penetrationValue.visible = false;
            this.detailedStats.accuracyValue.visible = false;
        }
        
        public function set localizeContainer(param1:Object) : void
        {
            visible = false;
            this.detailedStats.damageTitle.text = param1.damageTitle;
            this.detailedStats.fireRateTitle.text = param1.fireRateTitle;
            this.detailedStats.penetrationTitle.text = param1.penetrationTitle;
            this.detailedStats.accuracyTitle.text = param1.accuracyTitle;
            this.detailedStats.ammoTitle.text = param1.capacityTitle;
            this.detailedStats.magTitle.text = param1.magTitle;
            this._favoriteString = param1.favorite;
            this._unfavoriteString = param1.unfavorite;
            this.cachedFavorite_X = this.detailedStats.favoriteTextField.x;
        }
        
        public function set itemData(param1:Object) : void
        {
            this.cachedItemData = param1;
            if(!visible)
            {
                visible = true;
            }
            this.nameTextField.text = !!param1.type ? param1.type : "";
            if(MenuManager.manager && MenuManager.manager.bUsingGamepad)
            {
                this.detailedStats.favoriteIcon.visible = param1.bCanFavorite;
                this.detailedStats.favoriteButton.visible = false;
            }
            else
            {
                this.detailedStats.favoriteIcon.visible = false;
                this.detailedStats.favoriteButton.visible = param1.bCanFavorite;
            }
            this.weaponLoader.source = !!param1.texturePath ? param1.texturePath : "";
            this.weaponLoader.visible = true;
            this.perkLoader.source = !!param1.perkIconPath ? param1.perkIconPath : "";
            this.SetHideStats(param1.bHideStats);
            this.bCanFavorite = !!param1.bCanFavorite ? Boolean(param1.bCanFavorite) : false;
            if(!param1.bHideStats)
            {
                this.detailedStats.damageValue.text = param1.damageValue;
                this.detailedStats.fireRateValue.text = param1.fireRateValue;
                this.detailedStats.penetrationValue.text = param1.penetrationValue;
                this.detailedStats.accuracyValue.text = param1.accuracyValue;
                this.detailedStats.ammoCapacity.text = param1.ammoCapacity;
                this.detailedStats.magSizeValue.text = param1.magSizeValue;
                this.detailedStats.damageBar.gotoAndStop(param1.damagePercent);
                this.detailedStats.fireRateBar.gotoAndStop(param1.fireRatePercent);
                this.detailedStats.penetrationBar.gotoAndStop(param1.penetrationPercent);
                this.detailedStats.accuracyBar.gotoAndStop(param1.accuracyPercent);
                this.detailedStats.descriptionTextField.text = param1.description;
                this.detailedStats.weightValue.text = param1.weight;
                this.detailedStats.weightValue.visible = param1.weight > 0;
                this.detailedStats.weightIcon.visible = param1.weight > 0;
                if(param1.bIsFavorite)
                {
                    this.detailedStats.favoriteIcon.gotoAndStop("favorited");
                    this.detailedStats.favoriteButton.selected = true;
                    this.detailedStats.favoriteButton.label = this._unfavoriteString;
                    this.bIsFavorite = true;
                }
                else
                {
                    this.detailedStats.favoriteIcon.gotoAndStop("notFavorited");
                    this.detailedStats.favoriteButton.selected = false;
                    this.detailedStats.favoriteButton.label = this._favoriteString;
                    this.bIsFavorite = false;
                }
                if(param1.bCanCarry)
                {
                    this._iconColor.setTint(this.activeColor,1);
                    this.detailedStats.weightValue.textColor = this.activeColor;
                }
                else
                {
                    this._iconColor.setTint(this.inactiveColor,1);
                    this.detailedStats.weightValue.textColor = this.inactiveColor;
                }
                this.detailedStats.weightIcon.transform.colorTransform = this._iconColor;
            }
            else
            {
                this.noStatsDescriptionTextField.text = param1.description;
            }
            if(this.visible)
            {
                this.dispatchEvent(new Event("ItemUpdated"));
            }
        }
        
        public function get bIsFavorite() : *
        {
            return this._bIsFavorite;
        }
        
        public function set bIsFavorite(param1:Boolean) : void
        {
            this._bIsFavorite = param1;
        }
        
        public function get bCanFavorite() : *
        {
            return this._bCanFavorite;
        }
        
        public function set bCanFavorite(param1:Boolean) : void
        {
            this._bCanFavorite = param1;
        }
        
        public function updateControllerVisibility() : *
        {
            this.detailedStats.favoriteButton.visible = !bManagerUsingGamepad && this.cachedItemData && this.cachedItemData.bCanFavorite;
            this.detailedStats.favoriteIcon.visible = bManagerUsingGamepad && this.cachedItemData && this.cachedItemData.bCanFavorite;
        }
        
        public function favoriteItem() : *
        {
            ExternalInterface.call("Callback_FavoriteItem");
        }
        
        protected function buyItem(param1:ButtonEvent) : *
        {
            ExternalInterface.call("Callback_BuyOrSellItem");
        }
        
        protected function onFavoriteItem(param1:ButtonEvent) : *
        {
            this.favoriteItem();
        }
        
        protected function SetHideStats(param1:Boolean) : *
        {
            this.noStatsDescriptionTextField.visible = param1;
            this.detailedStats.visible = !param1;
        }
    }
}
