package tripwire.containers.store
{
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    
    public class StoreCartContainer extends TripContainer
    {
         
        
        public var cartTotalText:TextField;
        
        public var totalText:TextField;
        
        public var titleText:TextField;
        
        public var cancelButton:TripButton;
        
        public var checkoutButton:TripButton;
        
        public var scrollingList:TripScrollingList;
        
        public function StoreCartContainer()
        {
            super();
            this.total = 15.03213123;
            enableInitCallback = true;
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.titleText.text = !!param1.cart ? param1.cart : "bin";
            this.cartTotalText.text = !!param1.total ? param1.total : "dosh";
            this.cancelButton.label = !!param1.cancel ? param1.cancel : "forget it";
            this.checkoutButton.label = !!param1.checkOut ? param1.checkOut : "do eet";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
            this.cancelButton.addEventListener(ButtonEvent.CLICK,this.onCancelClicked,false,0,true);
        }
        
        public function set total(param1:Number) : void
        {
            this.totalText.text = "$" + param1.toFixed(2).toString();
        }
        
        public function onCancelClicked(param1:ButtonEvent) : void
        {
            closeContainer();
        }
    }
}
