package tripwire.containers.Perks
{
    import com.greensock.TweenMax;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ListEvent;
    import scaleform.clik.managers.FocusHandler;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.controls.perks.PerkSelectLineRenderer;
    import tripwire.managers.MenuManager;
    
    public class PerkSelectionContainer extends PerkContainerBase
    {
         
        
        public var perkScrollingList:ScrollingList;
        
        public var perkSelectBlocker;
        
        public var pendingPerkBox;
        
        public var header:SectionHeaderContainer;
        
        public var currentPerk:int = 1;
        
        private var _bLostFocus:Boolean = false;
        
        public function PerkSelectionContainer()
        {
            super();
            defaultFirstElement = this.perkScrollingList;
        }
        
        public function set localizedText(textObject:Object) : void
        {
            if(textObject)
            {
                this.perkSelectBlocker.descriptionTextfield.text = !!textObject.oncePerkWave ? textObject.oncePerkWave : "";
                this.header.text = !!textObject.header ? textObject.header : "";
            }
        }
        
        public function setTabIndex() : void
        {
            this.perkScrollingList.tabIndex = 1;
        }
        
        override protected function addedToStage(e:Event) : void
        {
            super.addedToStage(e);
            this.setTabIndex();
            if(this.pendingPerkBox != null)
            {
                this.pendingPerkBox.visible = false;
            }
            this.perkScrollingList.addEventListener(ListEvent.ITEM_CLICK,this.onPerkClick,false,0,true);
            this.perkScrollingList.addEventListener(ListEvent.INDEX_CHANGE,this.onPerkChanged,false,0,true);
        }
        
        public function setPendingPerkChanges(perkClass:String, iconPath:String, message:String) : void
        {
            if(perkClass != null && perkClass != "")
            {
                this.pendingPerkBox.visible = true;
                this.pendingPerkBox.pendingPerkTextField.text = perkClass;
                this.pendingPerkBox.notificationTextfield.text = message;
                this.pendingPerkBox.iconLoader.source = iconPath;
            }
            else
            {
                this.pendingPerkBox.visible = false;
                this.pendingPerkBox.pendingPerkTextField.text = "";
            }
        }
        
        public function onPerkClick(e:ListEvent) : *
        {
            if(e.index != this.currentPerk)
            {
                TweenMax.killTweensOf(this);
                this.perkScrollingList.selectedIndex = e.index;
                if(bManagerUsingGamepad)
                {
                    this.swapPerkInfo(e.index,true);
                }
                else
                {
                    TweenMax.to(this,ANIM_TIME,{
                        "useFrames":true,
                        "onComplete":this.swapPerkInfo,
                        "onCompleteParams":[e.index,true]
                    });
                    dispatchEvent(new Event("changePerk",true));
                }
                FocusHandler.getInstance().setFocus(this.perkScrollingList);
            }
        }
        
        public function onPerkChanged(e:ListEvent) : *
        {
            if(bManagerUsingGamepad && this.perkScrollingList.hasFocus && !this._bLostFocus)
            {
                TweenMax.killTweensOf(this);
                TweenMax.to(this,ANIM_TIME,{
                    "useFrames":true,
                    "onComplete":this.swapPerkInfo,
                    "onCompleteParams":[e.index,false]
                });
                dispatchEvent(new Event("changePerk",true));
                FocusHandler.getInstance().setFocus(this.perkScrollingList);
            }
            this._bLostFocus = !this.perkScrollingList.hasFocus;
        }
        
        public function set SelectedIndex(value:int) : *
        {
            var tempLineRender:PerkSelectLineRenderer = null;
            for(var i:int = 0; i < this.perkScrollingList.dataProvider.length; i++)
            {
                tempLineRender = this.perkScrollingList.getRendererAt(i) as PerkSelectLineRenderer;
                if(i == value)
                {
                    tempLineRender.active = true;
                    if(bManagerUsingGamepad && !MenuManager.manager.bPopUpOpen)
                    {
                        FocusHandler.getInstance().setFocus(tempLineRender);
                    }
                }
                else
                {
                    tempLineRender.active = false;
                }
            }
            this.perkScrollingList.selectedIndex = value;
            this.currentPerk = value;
        }
        
        public function set perkData(arr:Array) : *
        {
            this.perkScrollingList.dataProvider = new DataProvider(arr);
            this.perkScrollingList.validateNow();
            this.perkScrollingList.scrollBar.visible = this.perkScrollingList.dataProvider.length > this.perkScrollingList.rowCount;
        }
        
        public function swapPerkInfo(_targetPerk:int, _bSelectedIndex:Boolean) : void
        {
            ExternalInterface.call("Callback_PerkSelected",_targetPerk,_bSelectedIndex);
        }
    }
}
