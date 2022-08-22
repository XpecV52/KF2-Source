package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.gfx.Extensions;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoaderQueue;
    
    public class TraderPlayerInventoryInfoRenderer extends TripListItemRenderer
    {
         
        
        public var itemName:TextField;
        
        public var ammoNum:TextField;
        
        public var itemWeight:TextField;
        
        public var weightIcon:MovieClip;
        
        public var weaponIcon:TripUILoaderQueue;
        
        public var _bHasLowAmmo:Boolean;
        
        private var lowAmmoColor:uint = 16252764;
        
        private var regularColor:uint = 12255231;
        
        public var gamepadHighlight:MovieClip;
        
        public function TraderPlayerInventoryInfoRenderer()
        {
            preventAutosizing = true;
            super();
            clickSoundEffect = "";
            overSoundEffect = "TRADER_INVENTORY_ITEM_CLICK";
            if(this.gamepadHighlight != null)
            {
                this.gamepadHighlight.visible = false;
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.weaponIcon.enabled = false;
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1)
            {
                visible = true;
                this.itemName.text = !!param1.itemName ? param1.itemName : "";
                this.ammoNum.text = !!param1.itemAmmo ? param1.itemAmmo : "";
                this.bHasLowAmmo = !!param1.lowAmmo ? Boolean(param1.lowAmmo) : Boolean("");
                if(this.weaponIcon != null && param1.itemSource && param1.itemSource != "")
                {
                    this.weaponIcon.source = param1.itemSource;
                }
                if(this.itemWeight != null && this.weightIcon != null)
                {
                    if(param1.itemWeight && param1.itemWeight >= 0)
                    {
                        this.itemWeight.visible = true;
                        this.weightIcon.visible = true;
                        this.itemWeight.text = !!param1.itemWeight ? param1.itemWeight : "";
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
            this._bHasLowAmmo = param1;
            this.ammoNum.textColor = !!param1 ? uint(this.lowAmmoColor) : uint(this.regularColor);
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
            }
            if(this.itemName != null && data)
            {
                this.itemName.text = data.itemName;
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
