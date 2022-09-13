package tripwire.containers.store
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.events.TweenEvent;
    import flash.display.InteractiveObject;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
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
        
        public var itemPriceLayer:MovieClip;
        
        public var featuredTagMC:MovieClip;
        
        public var featuredTagOnlySaleMC:MovieClip;
        
        public var imageLoader:TripUILoader;
        
        public var currentItemDataObject:Object;
        
        public function StoreItemDetailContainer()
        {
            super();
            enableInitCallback = true;
            defaultFirstElement = this.addCartButton;
            defaultNumPrompts = 2;
            TextFieldEx.setTextAutoSize(this.itemNameText,"shrink");
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
            if(_bReadyForInput)
            {
                this.closeContainer();
            }
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
            this.itemDescText.htmlText = param1.description;
            if(param1.imageURLLarge && param1.imageURLLarge != "")
            {
                this.imageLoader.source = param1.imageURLLarge;
            }
            if(bManagerConsoleBuild)
            {
                this.addCartButton.visible = param1.price != undefined && param1.price != "";
            }
            if(param1.price)
            {
                this.itemPriceLayer.visible = true;
                this.itemPriceLayer.itemPriceText.text = param1.price;
                if(param1.itemPriceBase)
                {
                    this.itemPriceLayer.itemBasePriceText.text = param1.itemPriceBase;
                    this.itemPriceLayer.itemBasePriceText.visible = true;
                    this.itemPriceLayer.ItemBasePriceCrossout.visible = true;
                }
                else
                {
                    this.itemPriceLayer.itemBasePriceText.visible = false;
                    this.itemPriceLayer.ItemBasePriceCrossout.visible = false;
                }
            }
            else
            {
                this.itemPriceLayer.visible = false;
            }
            if(param1.itemOnSale && param1.itemOnSale != "0")
            {
                if(param1.discountRate && param1.discountRate != "")
                {
                    this.featuredTagMC.visible = true;
                    this.featuredTagMC.textField.visible = true;
                    this.featuredTagMC.textField.text = "-" + param1.discountRate + "%";
                    this.featuredTagOnlySaleMC.visible = false;
                }
                else
                {
                    this.featuredTagOnlySaleMC.visible = true;
                    this.featuredTagMC.visible = false;
                    this.featuredTagMC.textField.visible = false;
                }
            }
            else
            {
                this.featuredTagMC.visible = false;
                this.featuredTagOnlySaleMC.visible = false;
            }
        }
        
        override public function closeContainer() : void
        {
            dispatchEvent(new Event("detailsClosed"));
            super.closeContainer();
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            TweenMax.fromTo(this,6,{
                "z":-128,
                "autoAlpha":0
            },{
                "z":0,
                "autoAlpha":(!!param1 ? _defaultAlpha : _dimmedAlpha),
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":this.onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,6,{
                "z":0,
                "alpha":alpha
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":onClosed
            });
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            if(bManagerUsingGamepad && _bReadyForInput)
            {
                FocusManager.setFocus(!!this.addCartButton.visible ? this.addCartButton : this.cancelButton);
            }
        }
    }
}
