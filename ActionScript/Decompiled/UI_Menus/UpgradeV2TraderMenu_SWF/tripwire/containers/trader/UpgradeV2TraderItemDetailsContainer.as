package tripwire.containers.trader
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripUILoaderQueue;
    import tripwire.managers.MenuManager;
    
    public class UpgradeV2TraderItemDetailsContainer extends TripContainer
    {
         
        
        public var noStatsDescriptionTextField:TextField;
        
        public var detailedStats:UpgradeV2TraderItemStatsContainer;
        
        public var nameTextField:TextField;
        
        public var weaponLoader:TripUILoaderQueue;
        
        public var perkLoader:TripUILoaderQueue;
        
        public var perkSecondaryLoader:TripUILoaderQueue;
        
        private var activeColor:uint = 38006;
        
        private var inactiveColor:uint = 15547935;
        
        private var upgradeColor:uint = 16252764;
        
        private var upgradeTextColor:uint = 6943;
        
        private var regularColor:uint = 12255231;
        
        private var upgradePriceColor:uint = 0;
        
        private var upgradeWeightColor:uint = 0;
        
        private var _iconColor:Color;
        
        private var _priceColor:Color;
        
        private var _weightColor:Color;
        
        private var _favoriteString:String;
        
        private var _unfavoriteString:String;
        
        public var _bIsFavorite:Boolean;
        
        public var _bCanFavorite:Boolean;
        
        public var _bCanUpgrade:Boolean;
        
        public var perkSecondaryArrow:MovieClip;
        
        public var weaponUpPlusIcon:MovieClip;
        
        public var weaponUpNumText:TextField;
        
        public var WeaponImageBorder:MovieClip;
        
        private const BAR_X:int = 160;
        
        private const BAR_MAX_WIDTH:int = 144;
        
        private const DOSH_ICON_OFFSET:int = 6;
        
        private var cachedFavorite_X:Number;
        
        public var cachedItemData:Object;
        
        public function UpgradeV2TraderItemDetailsContainer()
        {
            this._iconColor = new Color();
            this._priceColor = new Color();
            this._weightColor = new Color();
            super();
            this.detailedStats.favoriteButton.addEventListener(ButtonEvent.PRESS,this.onFavoriteItem,false,0,true);
            this.detailedStats.upgradeButton.addEventListener(ButtonEvent.PRESS,this.onUpgradeItem,false,0,true);
            tabChildren = false;
            tabEnabled = false;
            this.updateControllerVisibility();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.detailedStats.upgradeButton.focusable = false;
        }
        
        public function set localizeContainer(param1:Object) : void
        {
            visible = false;
            this.detailedStats.upgradeTextField.text = param1.upgradeCost;
            this._favoriteString = param1.favorite;
            this._unfavoriteString = param1.unfavorite;
            this.detailedStats.upgradeButton.label = this._favoriteString;
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
                this.detailedStats.favoriteButton.visible = false;
            }
            else
            {
                this.detailedStats.favoriteButton.visible = param1.bCanFavorite;
            }
            this.detailedStats.upgradeCostTextField.text = !!param1.upgradePrice ? param1.upgradePrice : "";
            this.detailedStats.weightNextValue.text = !!param1.upgradeWeight ? param1.upgradeWeight : "";
            this.detailedStats.upgradeChevron.visible = param1.upgradeWeight;
            this.detailedStats.DoshIcon.x = this.detailedStats.upgradeCostTextField.getLineMetrics(0).x - this.DOSH_ICON_OFFSET;
            this.upgradePriceColor = !!param1.bCanBuyUpgrade ? uint(this.activeColor) : uint(this.inactiveColor);
            this.upgradeWeightColor = !!param1.bCanCarryUpgrade ? uint(this.activeColor) : uint(this.inactiveColor);
            this._priceColor.setTint(this.upgradePriceColor,1);
            this._weightColor.setTint(this.upgradeWeightColor,1);
            this.detailedStats.upgradeCostTextField.textColor = this.upgradePriceColor;
            this.detailedStats.weightNextValue.textColor = this.upgradeWeightColor;
            this.detailedStats.DoshIcon.transform.colorTransform = this._priceColor;
            this.detailedStats.upgradeButton.enabled = param1.bCanBuyUpgrade && param1.bCanCarryUpgrade ? true : false;
            this.detailedStats.upgradeButton.focused = 0;
            this.detailedStats.upgradeButton.focusable = false;
            this.weaponLoader.source = !!param1.texturePath ? param1.texturePath : "";
            this.weaponLoader.visible = true;
            this.perkLoader.source = !!param1.perkIconPath ? param1.perkIconPath : "";
            if(param1.perkIconPathSecondary)
            {
                this.perkSecondaryLoader.source = param1.perkIconPathSecondary;
                this.perkSecondaryLoader.visible = true;
                if(this.perkSecondaryArrow)
                {
                    this.perkSecondaryArrow.visible = true;
                }
                else
                {
                    trace("perkSecondaryArrow.visible = true; failed. NULL!");
                }
            }
            else
            {
                this.perkSecondaryLoader.source = "";
                this.perkSecondaryLoader.visible = false;
                if(this.perkSecondaryArrow)
                {
                    this.perkSecondaryArrow.visible = false;
                }
                else
                {
                    trace("perkSecondaryArrow.visible = true; failed. NULL!");
                }
            }
            this.SetHideStats(param1.bHideStats);
            this.bCanFavorite = !!param1.bCanFavorite ? Boolean(param1.bCanFavorite) : false;
            this.WeaponImageBorder.gotoAndStop(param1.weaponTier > 0 ? "upgrade" : "regular");
            this.weaponUpPlusIcon.visible = param1.weaponTier > 0 ? true : false;
            this.weaponUpNumText.text = param1.weaponTier > 0 ? param1.weaponTier : "";
            this._iconColor.setTint(param1.weaponTier > 0 ? uint(this.upgradeTextColor) : uint(this.regularColor),1);
            if(!param1.bHideStats)
            {
                this.detailedStats.primaryAmmoValue.text = !!param1.ammoCapacity ? param1.ammoCapacity : "";
                this.detailedStats.secondaryAmmoValue.text = !!param1.secondaryAmmoCapacity ? param1.secondaryAmmoCapacity : "";
                this.detailedStats.primaryAmmoUpgradeValue.text = !!param1.primaryAmmoUpgrade ? param1.secondaryAmmoUpgrade : "";
                this.detailedStats.secondaryAmmoUpgradeValue.text = !!param1.secondaryAmmoUpgrade ? param1.secondaryAmmoUpgrade : "";
                this.detailedStats.upgradePrimaryAmmoChevron.visible = param1.primaryAmmoUpgrade;
                this.detailedStats.upgradeSecondaryAmmoChevron.visible = param1.secondaryAmmoUpgrade;
                if(param1.primaryAmmoIcon)
                {
                    this.detailedStats.primaryAmmoLoader.source = "img://" + param1.primaryAmmoIcon;
                }
                else
                {
                    this.detailedStats.primaryAmmoLoader.visible = false;
                }
                if(param1.secondaryAmmoIcon)
                {
                    this.detailedStats.secondaryAmmoLoader.source = "img://" + param1.secondaryAmmoIcon;
                }
                else
                {
                    this.detailedStats.secondaryAmmoLoader.visible = false;
                }
                this.detailedStats.weightValue.text = !!param1.weight ? param1.weight : "";
                this.detailedStats.weightValue.visible = param1.weight > 0;
                this.detailedStats.weightIcon.visible = param1.weight > 0;
                this.detailedStats.favoriteButton.selected = param1.bIsFavorite;
                this.bCanUpgrade = param1.bCanBuyUpgrade && param1.bCanCarryUpgrade && param1.bCanUpgrade ? true : false;
                if(param1.bCanCarry)
                {
                    this._iconColor.setTint(!!param1.weaponTier ? uint(this.upgradeColor) : uint(this.activeColor),1);
                    this.detailedStats.weightValue.textColor = !!param1.weaponTier ? uint(this.upgradeColor) : uint(this.activeColor);
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
                this.noStatsDescriptionTextField.text = !!param1.description ? param1.description : "";
            }
            if(this.visible)
            {
                this.dispatchEvent(new Event("ItemUpdated"));
            }
            this.updateControllerVisibility();
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
        
        public function get bCanUpgrade() : *
        {
            return this._bCanUpgrade;
        }
        
        public function set bCanUpgrade(param1:Boolean) : void
        {
            this._bCanUpgrade = param1;
        }
        
        public function updateControllerVisibility() : *
        {
            this.detailedStats.favoriteControllerIcon.visible = bManagerUsingGamepad && this.cachedItemData && this.cachedItemData.bCanFavorite;
            this.detailedStats.favoriteButton.visible = !bManagerUsingGamepad && this.cachedItemData && this.cachedItemData.bCanFavorite;
            this.detailedStats.upgradeButton.visible = !bManagerUsingGamepad && this.cachedItemData && this.cachedItemData.bCanUpgrade;
            this.detailedStats.upgradeTextField.visible = this.cachedItemData && this.cachedItemData.bCanUpgrade;
            this.detailedStats.DoshIcon.visible = this.cachedItemData && this.cachedItemData.bCanUpgrade;
            this.detailedStats.upgradeCostTextField.visible = this.cachedItemData && this.cachedItemData.bCanUpgrade;
            this.detailedStats.weightNextValue.visible = this.cachedItemData && this.cachedItemData.bCanUpgrade;
        }
        
        public function favoriteItem() : *
        {
            ExternalInterface.call("Callback_FavoriteItem");
        }
        
        public function upgradeItem() : *
        {
            ExternalInterface.call("Callback_UpgradeItem");
        }
        
        protected function buyItem(param1:ButtonEvent) : *
        {
            ExternalInterface.call("Callback_BuyOrSellItem");
        }
        
        protected function onFavoriteItem(param1:ButtonEvent) : *
        {
            this.favoriteItem();
        }
        
        protected function onUpgradeItem(param1:ButtonEvent) : *
        {
            this.upgradeItem();
        }
        
        protected function SetHideStats(param1:Boolean) : *
        {
            this.noStatsDescriptionTextField.visible = param1;
            this.detailedStats.visible = !param1;
        }
    }
}
