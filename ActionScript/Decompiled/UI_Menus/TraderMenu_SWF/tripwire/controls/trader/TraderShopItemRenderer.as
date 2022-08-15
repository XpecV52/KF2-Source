package tripwire.controls.trader
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class TraderShopItemRenderer extends TripListItemRenderer
    {
         
        
        public var weaponName:TextField;
        
        public var weaponType:TextField;
        
        public var weaponCost:TextField;
        
        public var weaponWeight:TextField;
        
        public var doshIcon:MovieClip;
        
        public var weightIcon:MovieClip;
        
        public var ShopWeaponIconLoader:MovieClip;
        
        public var weaponIcon:TripUILoader;
        
        public var perkIconLoader:TripUILoader;
        
        private var activeColor:uint = 38006;
        
        private var inactiveColor:uint = 15547935;
        
        private var doshColor:uint = 0;
        
        private var weightColor:uint = 0;
        
        private var _iconColor:Color;
        
        public function TraderShopItemRenderer()
        {
            this._iconColor = new Color();
            preventAutosizing = true;
            super();
            this.weaponIcon = this.ShopWeaponIconLoader.weaponIcon;
            this.perkIconLoader = this.ShopWeaponIconLoader.perkIconLoader;
            clickSoundEffect = "TraderItem_Select";
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1)
            {
                this.weaponName.text = !!param1.weaponName ? param1.weaponName : "";
                this.weaponType.text = !!param1.weaponType ? param1.weaponType : "";
                this.weaponCost.text = !!param1.weaponCost ? param1.weaponCost : "";
                this.weaponWeight.text = !!param1.weaponWeight ? param1.weaponWeight : "";
                if(param1.bCanAfford)
                {
                    this.doshColor = this.activeColor;
                    this._iconColor.setTint(this.activeColor,1);
                    this.weaponCost.textColor = this.activeColor;
                }
                else
                {
                    this.doshColor = this.inactiveColor;
                    this._iconColor.setTint(this.inactiveColor,1);
                    this.weaponCost.textColor = this.inactiveColor;
                }
                this.doshIcon.transform.colorTransform = this._iconColor;
                if(param1.bCanCarry)
                {
                    this.weightColor = this.activeColor;
                    this._iconColor.setTint(this.activeColor,1);
                    this.weaponWeight.textColor = this.activeColor;
                }
                else
                {
                    this.weightColor = this.inactiveColor;
                    this._iconColor.setTint(this.inactiveColor,1);
                    this.weaponWeight.textColor = this.inactiveColor;
                }
                this.weightIcon.transform.colorTransform = this._iconColor;
                this.weaponIcon.source = !!param1.weaponSource ? param1.weaponSource : "";
                this.perkIconLoader.source = !!param1.perkIconSource ? param1.perkIconSource : "";
                visible = true;
            }
            else
            {
                visible = false;
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
            if(this.weaponCost != null && data)
            {
                this.weaponCost.text = data.weaponCost;
                this.weaponCost.textColor = this.doshColor;
            }
            if(this.weaponWeight != null && data)
            {
                this.weaponWeight.text = data.weaponWeight;
                this.weaponWeight.textColor = this.weightColor;
            }
        }
    }
}
