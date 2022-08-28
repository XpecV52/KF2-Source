package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    
    public class StoreMenu extends TripContainer
    {
         
        
        public var storeHeader:SectionHeaderContainer;
        
        public var itemDetails:StoreItemDetailContainer;
        
        public var storeMainContainer:StoreMainContainer;
        
        public var coverBG:MovieClip;
        
        public var coverBGTween:TweenMax;
        
        public function StoreMenu()
        {
            super();
            enableInitCallback = true;
            sectionHeader = this.storeHeader;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(this.coverBGTween.progress() == 1)
            {
                this.coverBGTween.reverse();
                if(this.itemDetails.bOpen)
                {
                    if(this.itemDetails.bReadyForInput)
                    {
                        this.itemDetails.closeContainer();
                        this.storeMainContainer.selectContainer();
                    }
                }
                else if(!this.storeMainContainer.leftSideFocused)
                {
                    this.storeMainContainer.selectContainer();
                }
            }
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.itemDetails.bOpen)
            {
                this.itemDetails.selectContainer();
                if(this.coverBGTween != null && this.coverBGTween.progress() < 1)
                {
                    this.coverBGTween.play();
                }
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
            this.storeMainContainer.Owner = this;
            this.storeMainContainer.storeItemScrollingList.addEventListener(ListEvent.ITEM_PRESS,this.storeItemClicked,false,0,true);
            this.storeMainContainer.storeItemFeaturedScrollingList.addEventListener(ListEvent.ITEM_PRESS,this.storeItemClicked,false,0,true);
            this.itemDetails.cancelButton.addEventListener(ButtonEvent.CLICK,this.onCancelClick,false,0,true);
            this.coverBGTween = new TweenMax(this.coverBG,8,{
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "paused":true
            });
        }
        
        public function onCancelClick(param1:ButtonEvent) : void
        {
            this.itemDetails.closeContainer();
            this.storeMainContainer.selectContainer();
            if(this.coverBGTween != null)
            {
                this.coverBGTween.reverse();
            }
        }
        
        public function onDetailsClosed(param1:Event) : void
        {
            if(this.itemDetails.bOpen)
            {
                this.storeMainContainer.selectContainer();
            }
        }
        
        public function storeItemClicked(param1:ListEvent) : void
        {
            this.coverBGTween.play();
            FocusManager.setFocus(null);
            FocusManager.setModalClip(this.itemDetails);
            this.storeMainContainer.deselectContainer();
            ExternalInterface.call("CallBack_ItemDetailsClicked",param1.itemData.SKU);
            this.storeMainContainer.pushToBackground();
        }
        
        public function set storeItemDetails(param1:Object) : void
        {
            this.itemDetails.openContainer();
            this.itemDetails.details = param1;
        }
        
        override public function closeContainer() : void
        {
            if(this.itemDetails.bOpen)
            {
                this.itemDetails.closeContainer();
                this.storeMainContainer.selectContainer();
                if(this.coverBGTween != null)
                {
                    this.coverBGTween.reverse();
                }
            }
            this.storeMainContainer.leftSideFocused = true;
            super.closeContainer();
        }
    }
}
