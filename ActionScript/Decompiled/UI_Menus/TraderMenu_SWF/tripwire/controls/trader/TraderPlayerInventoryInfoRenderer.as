package tripwire.controls.trader
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import scaleform.gfx.Extensions;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoaderQueue;
    
    public class TraderPlayerInventoryInfoRenderer extends TripListItemRenderer
    {
         
        
        public var itemName:TextField;
        
        public var ammoNum:TextField;
        
        public var itemWeight:TextField;
        
        public var weightIcon:MovieClip;
        
        public var weaponUpFrame:MovieClip;
        
        public var weaponUpPlusIcon:MovieClip;
        
        public var weaponUpNumText:TextField;
        
        public var favoriteIcon:MovieClip;
        
        public var weaponIcon:TripUILoaderQueue;
        
        public var _bHasLowAmmo:Boolean;
        
        private var noAmmoColor:uint = 15547935;
        
        private var lowAmmoColor:uint = 16753490;
        
        private var regularColor:uint = 12255231;
        
        private var upgradeColor:uint = 16252764;
        
        private var selectedTextColor:uint = 6943;
        
        public var itemNameColor:uint = 12255231;
        
        public var iconColor:Color;
        
        public var gamepadHighlight:MovieClip;
        
        public var subAmmoIndicator:MovieClip;
        
        public var ammoWarningIcon:MovieClip;
        
        public var AmmoIcon:MovieClip;
        
        public var regAmmoTextFormat:TextFormat;
        
        public var lowAmmoTextFormat:TextFormat;
        
        public var noAmmoTextFormat:TextFormat;
        
        private const INDEX_ZERO_NAME:String = "inventoryItem_1";
        
        private const LOW_AMMO_ICON_ALPHA:Number = 0.32;
        
        public function TraderPlayerInventoryInfoRenderer()
        {
            this.iconColor = new Color();
            this.regAmmoTextFormat = new TextFormat();
            this.lowAmmoTextFormat = new TextFormat();
            this.noAmmoTextFormat = new TextFormat();
            preventAutosizing = true;
            super();
            clickSoundEffect = "";
            overSoundEffect = "TRADER_INVENTORY_ITEM_CLICK";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.weaponIcon.enabled = false;
            if(this.ammoWarningIcon != null)
            {
                this.ammoWarningIcon.visible = false;
            }
            if(this.gamepadHighlight != null)
            {
                this.gamepadHighlight.visible = false;
            }
            if(this.subAmmoIndicator != null)
            {
                this.subAmmoIndicator.visible = false;
                this.subAmmoIndicator.mouseChildren = this.subAmmoIndicator.mouseEnabled = false;
            }
            this.regAmmoTextFormat = this.ammoNum.defaultTextFormat;
            this.lowAmmoTextFormat = this.ammoNum.defaultTextFormat;
            this.noAmmoTextFormat = this.ammoNum.defaultTextFormat;
            this.lowAmmoTextFormat.color = this.lowAmmoColor;
            this.noAmmoTextFormat.color = this.noAmmoColor;
        }
        
        override public function setData(param1:Object) : void
        {
            var _loc2_:Array = null;
            super.setData(param1);
            if(param1)
            {
                visible = true;
                this.itemName.text = !!param1.itemName ? param1.itemName : "";
                this.ammoNum.text = param1.itemAmmo && param1.itemAmmo != "0/0" ? param1.itemAmmo : "- - -";
                this.bHasLowAmmo = !!param1.lowAmmo ? Boolean(param1.lowAmmo) : Boolean("");
                if(this.favoriteIcon)
                {
                    this.favoriteIcon.visible = !!param1.bIsFavorite ? Boolean(param1.bIsFavorite) : false;
                }
                if(this.weaponUpFrame != null)
                {
                    this.weaponUpFrame.visible = !!param1.weaponTier ? true : false;
                    if(this.weaponUpPlusIcon)
                    {
                        this.weaponUpPlusIcon.visible = !!param1.weaponTier ? true : false;
                    }
                    if(this.weaponUpNumText)
                    {
                        this.weaponUpNumText.text = !!param1.weaponTier ? param1.weaponTier : "";
                    }
                    this.itemNameColor = !!param1.weaponTier ? uint(this.upgradeColor) : uint(this.regularColor);
                }
                if(!selected)
                {
                    this.itemName.textColor = this.itemNameColor;
                }
                if(this.subAmmoIndicator != null)
                {
                    this.subAmmoIndicator.visible = param1.isSubAmmo && name != this.INDEX_ZERO_NAME ? Boolean(param1.isSubAmmo) : false;
                }
                if(this.weaponIcon != null && param1.itemSource && param1.itemSource != "")
                {
                    this.weaponIcon.source = param1.itemSource;
                }
                else
                {
                    trace("ITEM GETS NO ICON: ",this.weaponIcon,param1.itemSource);
                }
                if(this.itemWeight != null && this.weightIcon != null)
                {
                    if(param1.itemWeight && param1.itemWeight >= 0)
                    {
                        this.itemWeight.visible = true;
                        this.weightIcon.visible = true;
                        this.itemWeight.text = !!param1.itemWeight ? param1.itemWeight : "";
                        this.iconColor.setTint(!!selected ? uint(this.selectedTextColor) : uint(this.itemNameColor),1);
                        this.weightIcon.transform.colorTransform = this.iconColor;
                        if(!selected)
                        {
                            this.itemWeight.textColor = this.itemNameColor;
                        }
                    }
                    else
                    {
                        this.itemWeight.visible = false;
                        this.weightIcon.visible = false;
                    }
                }
            }
            else
            {
                visible = false;
            }
        }
        
        public function get bHasLowAmmo() : Boolean
        {
            return this._bHasLowAmmo;
        }
        
        public function set bHasLowAmmo(param1:Boolean) : void
        {
            var _loc2_:int = 0;
            this._bHasLowAmmo = param1;
            if(param1)
            {
                _loc2_ = 0;
                _loc2_ = this.ammoNum.text.indexOf("/");
                this.ammoNum.setTextFormat(this.ammoNum.text.charAt(0) == "0" ? this.noAmmoTextFormat : this.lowAmmoTextFormat,0,_loc2_);
                this.ammoNum.setTextFormat(this.regAmmoTextFormat,_loc2_,this.ammoNum.text.length);
            }
            else
            {
                this.ammoNum.setTextFormat(this.regAmmoTextFormat);
            }
            if(this.ammoWarningIcon != null)
            {
                this.ammoWarningIcon.visible = param1;
                this.ammoWarningIcon.gotoAndStop(this.ammoNum.text.charAt(0) == "0" ? "noAmmo" : "lowAmmo");
            }
            if(this.AmmoIcon != null)
            {
                this.AmmoIcon.alpha = !!param1 ? Number(this.LOW_AMMO_ICON_ALPHA) : Number(1);
            }
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
            super.selected = param1;
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(this.itemWeight != null && this.weightIcon != null && data)
            {
                this.itemWeight.text = data.itemWeight;
                if(data.itemWeight <= 0)
                {
                    this.itemWeight.visible = false;
                    this.weightIcon.visible = false;
                }
                this.iconColor.setTint(!!selected ? uint(this.selectedTextColor) : uint(this.itemNameColor),1);
                this.weightIcon.transform.colorTransform = this.iconColor;
                if(!selected)
                {
                    this.itemWeight.textColor = this.itemNameColor;
                }
            }
            if(this.itemName != null && data)
            {
                this.itemName.text = data.itemName;
                if(!selected)
                {
                    this.itemName.textColor = this.itemNameColor;
                }
            }
        }
        
        protected function buyItem(param1:MouseEvent) : *
        {
            ExternalInterface.call("Callback_SellWeapon",index);
        }
        
        function buyMag(param1:MouseEvent) : *
        {
            ExternalInterface.call("Callback_BuyMagazine",index);
        }
        
        function fillItem(param1:MouseEvent) : *
        {
            ExternalInterface.call("Callback_FillAmmo",index);
        }
    }
}
