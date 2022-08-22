package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.events.TweenEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.containers.inventory.CraftingContainer;
    import tripwire.containers.inventory.InventoryItemDetailsContainer;
    import tripwire.containers.inventory.InventoryItemListContainer;
    import tripwire.containers.inventory.OpenCrateContainer;
    
    public class InventoryMenu extends TripContainer
    {
         
        
        public var header:SectionHeaderContainer;
        
        public var inventoryListContainer:InventoryItemListContainer;
        
        public var itemDetailsContainer:InventoryItemDetailsContainer;
        
        public var openCrateContainer:OpenCrateContainer;
        
        public var craftingPanelContainer:CraftingContainer;
        
        public var coverBG:MovieClip;
        
        public var coverBGTween:TweenMax;
        
        public function InventoryMenu()
        {
            super();
            sectionHeader = this.header;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(this.coverBGTween.progress() == 1)
            {
                this.coverBGTween.reverse();
                if(this.itemDetailsContainer.bOpen)
                {
                    this.itemDetailsContainer.closeContainer();
                }
                else if(this.openCrateContainer.bOpen)
                {
                    this.openCrateContainer.closeContainer();
                }
                else if(this.craftingPanelContainer.bOpen)
                {
                    this.craftingPanelContainer.closeContainer();
                }
                this.inventoryListContainer.selectContainer();
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.itemDetailsContainer.bOpen)
            {
                this.itemDetailsContainer.selectContainer();
                if(this.coverBGTween != null && this.coverBGTween.progress() < 1)
                {
                    this.coverBGTween.play();
                }
            }
            else if(this.openCrateContainer.bOpen)
            {
                FocusManager.setModalClip(null);
                this.openCrateContainer.selectContainer();
                if(this.coverBGTween != null && this.coverBGTween.progress() < 1)
                {
                    this.coverBGTween.play();
                }
            }
            else if(this.craftingPanelContainer.bOpen)
            {
                FocusManager.setModalClip(null);
                this.craftingPanelContainer.selectContainer();
                if(this.coverBGTween != null && this.coverBGTween.progress() < 1)
                {
                    this.coverBGTween.play();
                }
            }
            else
            {
                this.inventoryListContainer.selectContainer();
                if(this.coverBGTween != null)
                {
                    this.coverBGTween.reverse();
                }
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.inventoryListContainer.Owner = this;
            this.inventoryListContainer.inventoryItemScrollingList.addEventListener(ListEvent.ITEM_PRESS,this.onItemPress,false,0,true);
            this.inventoryListContainer.craftWeaponsButton.addEventListener(ButtonEvent.PRESS,this.onCraftWeaponClicked,false,0,true);
            this.inventoryListContainer.craftCosmeticsButton.addEventListener(ButtonEvent.PRESS,this.onCraftCosmeticClicked,false,0,true);
            this.itemDetailsContainer.cancelButton.addEventListener(ButtonEvent.CLICK,this.onCancelPressed,false,0,true);
            this.itemDetailsContainer.equipButton.addEventListener(ButtonEvent.CLICK,this.onCancelPressed,false,0,true);
            this.itemDetailsContainer.addEventListener("detailsClosed",this.onSubContainerClosed,false,0,true);
            this.openCrateContainer.addEventListener("containerClosed",this.onCrateContainerClosed,false,0,true);
            this.craftingPanelContainer.addEventListener("containerClosed",this.onSubContainerClosed,false,0,true);
            this.itemDetailsContainer.recycleButton.visible = false;
            this.coverBGTween = new TweenMax(this.coverBG,8,{
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "paused":true
            });
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            ExternalInterface.call("Callback_RequestInitialnventory");
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
            this.coverBGTween.reverse();
            this.itemDetailsContainer.closeContainer();
            this.inventoryListContainer.selectContainer();
        }
        
        public function onCraftWeaponClicked(param1:ButtonEvent) : void
        {
            this.coverBGTween.play();
            this.inventoryListContainer.currentFilter = param1.target as UIComponent;
            ExternalInterface.call("CallBack_RequestWeaponCraftInfo");
        }
        
        public function onCraftCosmeticClicked(param1:ButtonEvent) : void
        {
            this.coverBGTween.play();
            this.inventoryListContainer.currentFilter = param1.target as UIComponent;
            ExternalInterface.call("CallBack_RequestCosmeticCraftInfo");
        }
        
        public function onSubContainerClosed(param1:Event) : void
        {
            this.coverBGTween.reverse();
            this.inventoryListContainer.selectContainer();
        }
        
        public function onCrateContainerClosed(param1:Event) : void
        {
            this.coverBGTween.reverse();
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
                this.coverBGTween.play();
                this.inventoryListContainer.deselectContainer();
                this.inventoryListContainer.itemDetails = param1.itemData;
                this.itemDetailsContainer.details = param1.itemData;
                FocusManager.setFocus(null);
                FocusManager.setModalClip(this.itemDetailsContainer);
                ExternalInterface.call("CallBack_ItemDetailsClicked",param1.itemData.definition);
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
                this.craftingPanelContainer.localizedText = param1;
            }
        }
        
        public function set inventoryList(param1:Array) : void
        {
            this.inventoryListContainer.inventoryList = param1;
        }
        
        public function set details(param1:Object) : void
        {
            if(this.itemDetailsContainer != null)
            {
                this.coverBGTween.play();
                this.inventoryListContainer.deselectContainer();
                this.itemDetailsContainer.details = param1;
                FocusManager.setModalClip(null);
            }
        }
        
        public function set menuHidden(param1:Boolean) : void
        {
            visible = param1;
        }
        
        public function set craftOptions(param1:Object) : void
        {
            if(this.craftingPanelContainer != null)
            {
                this.inventoryListContainer.deselectContainer();
                this.craftingPanelContainer.craftIngData = param1;
            }
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
                this.coverBGTween.reverse();
                this.itemDetailsContainer.closeContainer();
                this.inventoryListContainer.selectContainer();
            }
            super.closeContainer();
            FocusManager.setModalClip(null);
            this.inventoryListContainer.leftSideFocused = true;
        }
    }
}
