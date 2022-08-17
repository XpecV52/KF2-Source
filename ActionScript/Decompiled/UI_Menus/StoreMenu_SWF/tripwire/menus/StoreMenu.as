package tripwire.menus
{
    import flash.events.Event;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    
    public class StoreMenu extends TripContainer
    {
         
        
        public var storeHeader:SectionHeaderContainer;
        
        public var itemDetails:StoreItemDetailContainer;
        
        public var storeCart:StoreCartContainer;
        
        public var storeMainContainer:StoreMainContainer;
        
        public function StoreMenu()
        {
            super();
            enableInitCallback = true;
            sectionHeader = this.storeHeader;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(this.itemDetails.bOpen)
            {
                this.itemDetails.closeContainer();
                this.storeMainContainer.selectContainer();
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.itemDetails.bOpen)
            {
                this.itemDetails.selectContainer();
            }
            else
            {
                this.storeMainContainer.selectContainer();
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.storeHeader.text = !!param1.store ? param1.store : "__S_T_O_R_E";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.storeMainContainer.storeItemScrollingList.addEventListener(ListEvent.ITEM_CLICK,this.storeItemClicked,false,0,true);
            this.storeMainContainer.cartButton.addEventListener(ButtonEvent.CLICK,this.showCart,false,0,true);
            this.itemDetails.cancelButton.addEventListener(ButtonEvent.CLICK,this.onCancelClick,false,0,true);
        }
        
        public function onCancelClick(param1:ButtonEvent) : void
        {
            this.itemDetails.closeContainer();
            this.storeMainContainer.selectContainer();
        }
        
        public function onDetailsClosed(param1:Event) : void
        {
            if(this.itemDetails.bOpen)
            {
                this.storeMainContainer.selectContainer();
            }
        }
        
        public function showCart(param1:ButtonEvent) : void
        {
            this.storeCart.openContainer();
        }
        
        public function storeItemClicked(param1:ListEvent) : void
        {
            this.storeMainContainer.deselectContainer();
            this.itemDetails.openContainer();
            this.itemDetails.details = param1.itemData;
            this.storeMainContainer.pushToBackground();
        }
        
        override public function closeContainer() : void
        {
            if(this.itemDetails.bOpen)
            {
                this.itemDetails.closeContainer();
                this.storeMainContainer.selectContainer();
            }
            super.closeContainer();
        }
    }
}
