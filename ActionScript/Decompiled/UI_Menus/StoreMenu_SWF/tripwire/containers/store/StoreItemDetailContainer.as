package tripwire.containers.store
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
    
    public class StoreItemDetailContainer extends TripContainer
    {
         
        
        public var previewButton:TripButton;
        
        public var cancelButton:TripButton;
        
        public var addCartButton:TripButton;
        
        public var itemNameText:TextField;
        
        public var itemDescText:TextField;
        
        public var itemPriceText:TextField;
        
        public var imageLoader:TripUILoader;
        
        public var currentItemDataObject:Object;
        
        public function StoreItemDetailContainer()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = this.addCartButton;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.previewButton.label = !!param1.preview ? param1.preview : "check it";
            this.cancelButton.label = !!param1.cancel ? param1.cancel : "forget it";
            this.addCartButton.label = !!param1.addToCart ? param1.addToCart : "add it";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
            this.previewButton.enabled = false;
            this.previewButton.visible = false;
            this.cancelButton.addEventListener(ButtonEvent.CLICK,this.cancelClicked,false,0,true);
            this.addCartButton.addEventListener(ButtonEvent.CLICK,this.addToCartClicked,false,0,true);
            this.setTabIndex();
        }
        
        protected function setTabIndex() : *
        {
            this.cancelButton.tabIndex = 1;
            this.previewButton.tabIndex = 2;
            this.addCartButton.tabIndex = 3;
        }
        
        public function cancelClicked(param1:ButtonEvent) : void
        {
            this.closeContainer();
        }
        
        public function addToCartClicked(param1:ButtonEvent) : void
        {
            if(this.currentItemDataObject != null)
            {
                ExternalInterface.call("Callback_AddToCartClicked",this.currentItemDataObject.SKU);
            }
        }
        
        public function set details(param1:Object) : void
        {
            this.currentItemDataObject = param1;
            this.itemNameText.text = param1.label;
            this.itemDescText.text = param1.description;
            this.itemPriceText.text = param1.price;
            if(param1.imageURLLarge && param1.imageURLLarge != "")
            {
                this.imageLoader.source = param1.imageURLLarge;
            }
            if(bManagerUsingGamepad)
            {
                FocusManager.setFocus(this.addCartButton);
            }
        }
        
        override public function closeContainer() : void
        {
            dispatchEvent(new Event("detailsClosed"));
            super.closeContainer();
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
                "useFrames":true
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
                "useFrames":true
            });
        }
    }
}
