package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import tripwire.controls.TripListItemRenderer;
    
    public class TraderPlayerInventoryInfoRenderer extends TripListItemRenderer
    {
         
        
        public var itemName:TextField;
        
        public var ammoNum:TextField;
        
        public var itemWeight:TextField;
        
        public var weightIcon:MovieClip;
        
        public var weaponIcon:UILoader;
        
        public function TraderPlayerInventoryInfoRenderer()
        {
            preventAutosizing = true;
            super();
            clickSoundEffect = "TraderItem_Select";
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
