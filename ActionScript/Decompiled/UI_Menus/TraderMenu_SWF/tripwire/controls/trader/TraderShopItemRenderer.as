package tripwire.controls.trader
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.Extensions;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoaderQueue;
    
    public class TraderShopItemRenderer extends TripListItemRenderer
    {
         
        
        public var weaponName:TextField;
        
        public var weaponType:TextField;
        
        public var weaponWeight:TextField;
        
        public var weaponCost:TextField;
        
        public var BuyButton:TraderPlayerBuySellRenderer;
        
        public var buyTextField:TextField;
        
        public var controllerIcon:MovieClip;
        
        public var noIcon:MovieClip;
        
        public var doshIcon:MovieClip;
        
        public var weightIcon:MovieClip;
        
        public var ShopWeaponIconLoader:MovieClip;
        
        public var weaponIcon:TripUILoaderQueue;
        
        public var perkIconLoader:TripUILoaderQueue;
        
        private var activeColor:uint = 38006;
        
        private var inactiveColor:uint = 15547935;
        
        private var doshColor:uint = 0;
        
        private var weightColor:uint = 0;
        
        private var _doshIconColor:Color;
        
        private var _weightIconColor:Color;
        
        public var hitMC:TraderButton;
        
        public function TraderShopItemRenderer()
        {
            this._doshIconColor = new Color();
            this._weightIconColor = new Color();
            preventAutosizing = true;
            super();
            this.weaponIcon = this.ShopWeaponIconLoader.weaponIcon;
            this.perkIconLoader = this.ShopWeaponIconLoader.perkIconLoader;
            clickSoundEffect = "";
            overSoundEffect = "TRADER_INVENTORY_ITEM_CLICK";
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1)
            {
                this.weaponName.text = !!param1.weaponName ? param1.weaponName : "";
                this.weaponType.text = !!param1.weaponType ? param1.weaponType : "";
                this.buyTextField.visible = selected && bManagerUsingGamepad ? true : false;
                this.BuyButton.visible = !bManagerUsingGamepad;
                this.BuyButton.label = !!param1.buyText ? param1.buyText : "";
                this.buyTextField.text = !!param1.buyText ? param1.buyText : "";
                this.weaponCost.text = !!param1.weaponCost ? param1.weaponCost : "";
                this.weaponWeight.text = !!param1.weaponWeight ? param1.weaponWeight : "";
                if(this.BuyButton.enabled && (!param1.bCanAfford || !param1.bCanCarry))
                {
                    this.BuyButton.enabled = false;
                    this.buyTextField.textColor = this.inactiveColor;
                }
                if(!this.BuyButton.enabled && param1.bCanAfford && param1.bCanCarry)
                {
                    this.BuyButton.enabled = true;
                    this.buyTextField.textColor = this.activeColor;
                }
                if(param1.bCanAfford)
                {
                    this._doshIconColor.setTint(this.activeColor,1);
                    this.weaponCost.textColor = this.activeColor;
                }
                else
                {
                    this._doshIconColor.setTint(this.inactiveColor,1);
                    this.weaponCost.textColor = this.inactiveColor;
                }
                if(param1.bCanCarry)
                {
                    this._weightIconColor.setTint(this.activeColor,1);
                    this.weaponWeight.textColor = this.activeColor;
                }
                else
                {
                    this._weightIconColor.setTint(this.inactiveColor,1);
                    this.weaponWeight.textColor = this.inactiveColor;
                }
                this.doshIcon.transform.colorTransform = this._doshIconColor;
                this.weightIcon.transform.colorTransform = this._weightIconColor;
                this.weaponIcon.source = !!param1.weaponSource ? param1.weaponSource : "";
                this.perkIconLoader.source = !!param1.perkIconSource ? param1.perkIconSource : "";
                this.controllerIcon.visible = selected && bManagerUsingGamepad && this.BuyButton.enabled ? true : false;
                this.noIcon.visible = selected && bManagerUsingGamepad && !this.BuyButton.enabled ? true : false;
                visible = true;
            }
            else
            {
                visible = false;
            }
            hitArea = this.hitMC;
            mouseChildren = true;
            this.BuyButton.addEventListener(ButtonEvent.PRESS,this.buyClicked,false,0,true);
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
        }
        
        override public function set selected(param1:Boolean) : void
        {
            if(param1 && selected == false)
            {
                if(Extensions.gfxProcessSound != null && enabled == true)
                {
                    Extensions.gfxProcessSound(this,"UI",overSoundEffect);
                }
            }
            this.buyTextField.visible = bManagerUsingGamepad;
            this.controllerIcon.visible = !!this.BuyButton.enabled ? Boolean(bManagerUsingGamepad) : false;
            this.noIcon.visible = !this.BuyButton.enabled ? Boolean(bManagerUsingGamepad) : false;
            super.selected = param1;
        }
        
        public function updateControllerVisibility() : void
        {
            if(bManagerUsingGamepad)
            {
                this.BuyButton.visible = false;
                this.buyTextField.visible = !!selected ? true : false;
                this.controllerIcon.visible = selected && this.BuyButton.enabled ? true : false;
                this.noIcon.visible = selected && !this.BuyButton.enabled ? true : false;
            }
            else
            {
                this.BuyButton.visible = true;
                this.BuyButton.bgVisibility = true;
                this.buyTextField.visible = false;
                this.controllerIcon.visible = false;
                this.noIcon.visible = false;
            }
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(this.weaponName != null && data)
            {
                this.weaponName.text = data.weaponName;
            }
            if(this.weaponType != null && data)
            {
                this.weaponType.text = data.weaponType;
            }
            if(this.BuyButton != null && data)
            {
                this.weaponCost.text = !!data.weaponCost ? data.weaponCost : "";
            }
            if(this.weaponWeight != null && data)
            {
                this.weaponWeight.text = data.weaponWeight;
            }
        }
        
        protected function buyClicked(param1:ButtonEvent) : void
        {
            owner.dispatchEvent(new Event("BuyShopItem"));
        }
        
        protected function dblClicked(param1:MouseEvent) : void
        {
            owner.dispatchEvent(new Event("BuyShopItem"));
        }
    }
}
