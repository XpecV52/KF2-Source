package tripwire.containers.inventory
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoader;
    
    public class InventoryItemDetailsContainer extends TripContainer
    {
         
        
        public var previewButton:TripButton;
        
        public var cancelButton:TripButton;
        
        public var equipButton:TripButton;
        
        public var itemNameText:TextField;
        
        public var itemDescText:TextField;
        
        public var itemTypeText:TextField;
        
        public var imageLoader:TripUILoader;
        
        public var currentItemDataObject:Object;
        
        public var useString:String;
        
        public var equipString:String;
        
        public var unequipString:String;
        
        public const ITP_WeaponSkin:int = 0;
        
        public const ITP_CharacterSkin:int = 1;
        
        public const ITP_Item:int = 2;
        
        public function InventoryItemDetailsContainer()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = this.equipButton;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.previewButton.label = !!param1.preview ? param1.preview : "check it";
            this.cancelButton.label = !!param1.cancel ? param1.cancel : "forget it";
            this.equipButton.label = !!param1.equip ? param1.aequip : "put it";
            this.useString = !!param1.useString ? param1.useString : "";
            this.equipString = !!param1.equip ? param1.equip : "";
            this.unequipString = !!param1.unequip ? param1.unequip : "";
            this.cancelButton.label = !!param1.back ? param1.back : "";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
            this.previewButton.addEventListener(ButtonEvent.CLICK,this.previewClicked,false,0,true);
            this.cancelButton.addEventListener(ButtonEvent.CLICK,this.cancelClicked,false,0,true);
            this.equipButton.addEventListener(ButtonEvent.CLICK,this.equipClicked,false,0,true);
            this.setTabIndex();
        }
        
        protected function setTabIndex() : *
        {
            this.previewButton.tabIndex = 1;
            this.cancelButton.tabIndex = 2;
            this.equipButton.tabIndex = 3;
        }
        
        public function cancelClicked(param1:ButtonEvent) : void
        {
            closeContainer();
        }
        
        public function equipClicked(param1:ButtonEvent) : void
        {
            if(this.currentItemDataObject.type == this.ITP_WeaponSkin)
            {
                ExternalInterface.call("Callback_Equip",this.currentItemDataObject.definition);
            }
            if(this.currentItemDataObject.exchangeable)
            {
                ExternalInterface.call("Callback_UseItem",this.currentItemDataObject.definition);
            }
            closeContainer();
        }
        
        public function previewClicked(param1:ButtonEvent) : void
        {
            if(this.currentItemDataObject != null)
            {
                ExternalInterface.call("Callback_PreviewItem",this.currentItemDataObject.definition);
            }
        }
        
        public function set details(param1:Object) : void
        {
            openContainer();
            this.currentItemDataObject = param1;
            this.itemNameText.text = param1.label;
            this.itemDescText.text = param1.description;
            this.equipButton.visible = param1.type == this.ITP_WeaponSkin || param1.exchangeable;
            if(param1.type == this.ITP_WeaponSkin)
            {
                this.equipButton.label = !!param1.active ? this.unequipString : this.equipString;
            }
            else if(param1.exchangeable)
            {
                this.equipButton.label = this.useString;
            }
            if(param1.iconURLLarge && param1.iconURLLarge != "")
            {
                this.imageLoader.source = param1.iconURLLarge;
            }
            if(bManagerUsingGamepad)
            {
                FocusManager.setFocus(this.equipButton);
            }
            this.itemTypeText.text = !!param1.typeRarity ? param1.typeRarity : "";
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":-128,
                "autoAlpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1
                }
            },{
                "z":0,
                "autoAlpha":1,
                "blurFilter":{
                    "blurX":0,
                    "blurY":0,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":0,
                "alpha":1
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "blurFilter":{
                    "blurX":12,
                    "blurY":12,
                    "quality":1,
                    "remove":true
                },
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
    }
}
