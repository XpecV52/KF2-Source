package tripwire.containers.trader
{
    import fl.motion.Color;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.trader.TraderButton;
    import tripwire.managers.MenuManager;
    
    public class TraderItemDetailsContainer extends TripContainer
    {
         
        
        public var detailedStats:TraderItemStatsContainer;
        
        public var noStatsDescriptionTextField:TextField;
        
        public var typeTextField:TextField;
        
        public var nameTextField:TextField;
        
        public var weaponLoader:UILoader;
        
        public var perkLoader:UILoader;
        
        public var buySellButton:TraderButton;
        
        private var activeColor:uint = 31319;
        
        private var inactiveColor:uint = 15541248;
        
        private var _iconColor:Color;
        
        private var _favoriteString:String;
        
        private var _unfavoriteString:String;
        
        public function TraderItemDetailsContainer()
        {
            this._iconColor = new Color();
            super();
            this.buySellButton.addEventListener(ButtonEvent.PRESS,this.buyItem,false,0,true);
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
        }
        
        public function set itemData(param1:Object) : void
        {
            if(!visible)
            {
                visible = true;
            }
            this.typeTextField.text = !!param1.type ? param1.type : "";
            this.nameTextField.text = !!param1.name ? param1.name : "";
            this.buySellButton.setUsableButtonVisability(param1.bCanBuyOrSell);
            if(param1.bCanBuyOrSell)
            {
                this.buySellButton.label = param1.buyOrSellLabel;
            }
            else
            {
                this.buySellButton.cannotUseTextField.text = param1.cannotBuyOrSellLabel;
            }
            this.detailedStats.favoriteButton.visible = param1.bCanFavorite;
            this.detailedStats.favoriteTextField.visible = param1.bCanFavorite;
            this.buySellButton.buttonValue = param1.price;
            this.buySellButton.enabled = param1.bCanBuyOrSell;
            if(MenuManager.manager && MenuManager.manager.bUsingGamepad)
            {
                this.buySellButton.controllerIcon.visible = param1.bCanBuyOrSell;
                this.detailedStats.favoriteControllerIcon.visible = param1.bCanBuyOrSell;
            }
            else
            {
                this.buySellButton.controllerIcon.visible = false;
                this.detailedStats.favoriteControllerIcon.visible = false;
            }
            this.weaponLoader.source = !!param1.texturePath ? param1.texturePath : "";
            this.weaponLoader.visible = true;
            this.perkLoader.source = !!param1.perkIconPath ? param1.perkIconPath : "";
            this.SetHideStats(param1.bHideStats);
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
                if(param1.bIsFavorite)
                {
                    this.detailedStats.favoriteButton.gotoAndStop("favorited");
                    this.detailedStats.favoriteTextField.text = this._unfavoriteString;
                }
                else
                {
                    this.detailedStats.favoriteButton.gotoAndStop("notFavorited");
                    this.detailedStats.favoriteTextField.text = this._favoriteString;
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
        }
        
        public function updateControllerVisibility() : *
        {
            this.buySellButton.controllerIcon.visible = bManagerUsingGamepad;
            this.detailedStats.favoriteControllerIcon.visible = bManagerUsingGamepad;
            this.detailedStats.favoriteTextField.visible = !bManagerUsingGamepad;
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
