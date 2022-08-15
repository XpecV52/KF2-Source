package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.containers.inventory.InventoryItemDetailsContainer;
    import tripwire.containers.inventory.InventoryItemListContainer;
    import tripwire.containers.inventory.OpenCrateContainer;
    
    public class InventoryMenu extends TripContainer
    {
         
        
        public var header:SectionHeaderContainer;
        
        public var inventoryListContainer:InventoryItemListContainer;
        
        public var itemDetailsContainer:InventoryItemDetailsContainer;
        
        public var openCrateContainer:OpenCrateContainer;
        
        public function InventoryMenu()
        {
            super();
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(this.itemDetailsContainer.bOpen)
            {
                this.itemDetailsContainer.closeContainer();
                this.inventoryListContainer.selectContainer();
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.itemDetailsContainer.bOpen)
            {
                this.itemDetailsContainer.selectContainer();
            }
            else if(this.openCrateContainer.bOpen)
            {
                this.openCrateContainer.selectContainer();
            }
            else
            {
                this.inventoryListContainer.selectContainer();
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.inventoryListContainer.inventoryItemScrollingList.addEventListener(ListEvent.ITEM_PRESS,this.onItemPress,false,0,true);
            this.itemDetailsContainer.cancelButton.addEventListener(ButtonEvent.CLICK,this.onCancelPressed,false,0,true);
            this.itemDetailsContainer.equipButton.addEventListener(ButtonEvent.CLICK,this.onCancelPressed,false,0,true);
            this.itemDetailsContainer.addEventListener("detailsClosed",this.onSubContainerClosed,false,0,true);
            this.openCrateContainer.addEventListener("containerClosed",this.onCrateContainerClosed,false,0,true);
            this.itemDetailsContainer.previewButton.visible = false;
        }
        
        public function onItemUsed() : void
        {
            TweenMax.to(this.inventoryListContainer,8,{
                "alpha":0,
                "useFrames":true,
                "ease":Cubic.easeOut,
                "onComplete":this.openCrateContainer.startAnimating
            });
        }
        
        public function onCancelPressed(param1:ButtonEvent) : void
        {
            this.itemDetailsContainer.closeContainer();
            this.inventoryListContainer.selectContainer();
        }
        
        public function onSubContainerClosed(param1:Event) : void
        {
            this.inventoryListContainer.selectContainer();
        }
        
        public function onCrateContainerClosed(param1:Event) : void
        {
            this.inventoryListContainer.selectContainer();
            TweenMax.to(this.inventoryListContainer,8,{
                "delay":8,
                "alpha":1,
                "useFrames":true,
                "ease":Cubic.easeOut
            });
        }
        
        public function onItemPress(param1:ListEvent) : void
        {
            if(param1.itemData)
            {
                this.inventoryListContainer.deselectContainer();
                this.inventoryListContainer.itemDetails = param1.itemData;
                this.itemDetailsContainer.details = param1.itemData;
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.header.text = !!param1.inventory ? param1.inventory : "InVeNtOrY";
                this.itemDetailsContainer.equipButton.label = !!param1.useEquip ? param1.useEquip : "";
                this.openCrateContainer.confirmButton.label = !!param1.ok ? param1.ok : "";
                this.itemDetailsContainer.localizedText = param1;
                this.inventoryListContainer.localizedText = param1;
            }
        }
        
        public function set inventoryList(param1:Array) : void
        {
            this.inventoryListContainer.inventoryList = param1;
        }
        
        public function set crateOpen(param1:Object) : void
        {
            if(this.openCrateContainer != null)
            {
                this.openCrateContainer.data = param1;
            }
        }
        
        public function testCrate(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == 70)
            {
                this.openCrateContainer.testOpen();
            }
        }
        
        override public function closeContainer() : void
        {
            if(this.itemDetailsContainer.bOpen)
            {
                this.itemDetailsContainer.closeContainer();
                this.inventoryListContainer.selectContainer();
            }
            super.closeContainer();
        }
    }
}
