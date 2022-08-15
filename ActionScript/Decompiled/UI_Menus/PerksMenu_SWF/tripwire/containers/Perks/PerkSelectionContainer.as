package tripwire.containers.perks
{
    import com.greensock.TweenMax;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ListEvent;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    
    public class PerkSelectionContainer extends TripContainer
    {
         
        
        public var perkScrollingList:ScrollingList;
        
        public var perkSelectBlocker;
        
        public var pendingPerkBox;
        
        public var header:SectionHeaderContainer;
        
        public var currentPerk:int = 1;
        
        public function PerkSelectionContainer()
        {
            super();
            defaultFirstElement = this.perkScrollingList;
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.perkSelectBlocker.descriptionTextfield.text = !!param1.oncePerkWave ? param1.oncePerkWave : "";
                this.header.text = !!param1.header ? param1.header : "";
            }
        }
        
        private function setTabIndex() : void
        {
            this.perkScrollingList.tabIndex = 1;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.setTabIndex();
            this.pendingPerkBox.visible = false;
            this.perkScrollingList.addEventListener(ListEvent.ITEM_CLICK,this.onPerkClick,false,0,true);
        }
        
        public function setPendingPerkChanges(param1:String, param2:String, param3:String) : void
        {
            if(param1 != null && param1 != "")
            {
                this.pendingPerkBox.visible = true;
                this.pendingPerkBox.pendingPerkTextField.text = param1;
                this.pendingPerkBox.notificationTextfield.text = param3;
                this.pendingPerkBox.iconLoader.source = param2;
            }
            else
            {
                this.pendingPerkBox.visible = false;
                this.pendingPerkBox.pendingPerkTextField.text = "";
            }
        }
        
        public function onPerkClick(param1:ListEvent) : *
        {
            if(param1.index != this.currentPerk)
            {
                TweenMax.killTweensOf(this);
                this.perkScrollingList.selectedIndex = param1.index;
                TweenMax.to(this,ANIM_TIME,{
                    "useFrames":true,
                    "onComplete":this.swapPerkInfo,
                    "onCompleteParams":[param1.index]
                });
                dispatchEvent(new Event("changePerk",true));
            }
        }
        
        public function set SelectedIndex(param1:int) : *
        {
            this.perkScrollingList.selectedIndex = param1;
            this.currentPerk = param1;
        }
        
        public function set perkData(param1:Array) : *
        {
            this.perkScrollingList.dataProvider = new DataProvider(param1);
            this.perkScrollingList.validateNow();
            this.perkScrollingList.scrollBar.visible = this.perkScrollingList.dataProvider.length > this.perkScrollingList.rowCount;
        }
        
        public function swapPerkInfo(param1:int) : void
        {
            ExternalInterface.call("Callback_PerkSelected",param1);
        }
    }
}
