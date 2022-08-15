package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.TripContainer;
    import tripwire.containers.perks.PerkDetailsContainer;
    import tripwire.containers.perks.PerkSelectionContainer;
    import tripwire.containers.perks.PerksConfigureSkillsContainer;
    import tripwire.containers.perks.PerksHeaderContainer;
    import tripwire.containers.perks.PerksNextRankContainer;
    import tripwire.containers.perks.PerksSkillsSummaryContainer;
    
    public class PerkSelectMenu extends TripContainer
    {
         
        
        public var SelectedPerkSummaryContainer:PerksSkillsSummaryContainer;
        
        public var HeaderContainer:PerksHeaderContainer;
        
        public var DetailsContainer:PerkDetailsContainer;
        
        public var NextRankContainer:PerksNextRankContainer;
        
        public var SkillsContainer:PerksConfigureSkillsContainer;
        
        public var SelectionContainer:PerkSelectionContainer;
        
        private var _bLocked:Boolean;
        
        public var _tempSelected:int;
        
        public var bCanUseMenu:Boolean = false;
        
        public function PerkSelectMenu()
        {
            super();
            defaultFirstElement = this.SelectionContainer.perkScrollingList;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.SelectedPerkSummaryContainer.configureButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.SelectedPerkSummaryContainer.configureButton.clickSoundEffect = "Button_Selected";
            this.SkillsContainer.confirmButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.addEventListener("changePerk",this.swapPerk);
            this.SkillsContainer.closeContainer();
            this.SelectionContainer.selectContainer();
            this.openPerkDetails();
            currentElement = this.SelectionContainer.perkScrollingList;
        }
        
        override public function focusGroupIn() : void
        {
            super.focusGroupIn();
            if(this._tempSelected > -1)
            {
                this.SelectionContainer.perkScrollingList.selectedIndex = this._tempSelected;
            }
        }
        
        override public function focusGroupOut() : void
        {
            super.focusGroupOut();
            this._tempSelected = this.SelectionContainer.perkScrollingList.selectedIndex;
            this.SelectionContainer.perkScrollingList.selectedIndex = -1;
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            this.SkillsContainer.closeContainer();
            this.openPerkDetails();
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            this.bCanUseMenu = true;
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.bCanUseMenu = false;
            this.SkillsContainer.closeContainer();
        }
        
        public function set locked(param1:Boolean) : void
        {
            this._bLocked = param1;
            this.SelectionContainer.perkSelectBlocker.visible = param1;
            this.SelectionContainer.perkScrollingList.enabled = !param1;
            this.SelectedPerkSummaryContainer.configureButton.enabled = !param1;
            if(param1)
            {
                this.closeSkillConfigure();
            }
        }
        
        public function get locked() : Boolean
        {
            return this._bLocked;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(this.SkillsContainer.bOpen)
            {
                this.closeSkillConfigure();
            }
            else
            {
                ExternalInterface.call("Callback_ControllerCloseMenu");
            }
        }
        
        private function openSkillConfigure() : void
        {
            currentElement = this.SkillsContainer;
            TweenMax.killTweensOf([this.DetailsContainer,this.HeaderContainer,this.SelectedPerkSummaryContainer]);
            this.closePerkDetails();
            this.SelectionContainer.deselectContainer();
            TweenMax.to(this,ANIM_TIME,{
                "useFrames":true,
                "onComplete":this.SkillsContainer.openContainer
            });
        }
        
        private function closeSkillConfigure() : void
        {
            currentElement = this.SelectionContainer.perkScrollingList;
            this.SkillsContainer.closeContainer();
            this.SelectionContainer.selectContainer();
            TweenMax.to(this,ANIM_TIME,{
                "useFrames":true,
                "onComplete":this.openPerkDetails
            });
        }
        
        private function openPerkDetails() : void
        {
            this.DetailsContainer.openContainer();
            this.HeaderContainer.openContainer();
            this.SelectedPerkSummaryContainer.openContainer();
        }
        
        private function closePerkDetails() : void
        {
            this.DetailsContainer.closeContainer();
            this.HeaderContainer.closeContainer();
            this.SelectedPerkSummaryContainer.closeContainer();
        }
        
        public function onButtonClick(param1:ButtonEvent) : void
        {
            if(!this.bCanUseMenu)
            {
                return;
            }
            switch(param1.currentTarget)
            {
                case this.SelectedPerkSummaryContainer.configureButton:
                    this.openSkillConfigure();
                    break;
                case this.SkillsContainer.confirmButton:
                    this.closeSkillConfigure();
            }
        }
        
        public function swapPerk(param1:Event) : void
        {
            if(this.DetailsContainer.visible)
            {
                this.closePerkDetails();
                TweenMax.to(this,ANIM_TIME,{
                    "useFrames":true,
                    "onComplete":this.openPerkDetails
                });
            }
            else
            {
                this.SkillsContainer.closeContainer();
                TweenMax.to(this,ANIM_TIME,{
                    "useFrames":true,
                    "onComplete":this.SkillsContainer.openContainer
                });
            }
        }
    }
}
