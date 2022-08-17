package tripwire.menus
{
    import com.greensock.TweenMax;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.containers.Perks.PerkDetailsContainer;
    import tripwire.containers.Perks.PerkSelectionContainer;
    import tripwire.containers.Perks.PerksConfigureSkillsContainer;
    import tripwire.containers.Perks.PerksHeaderContainer;
    import tripwire.containers.Perks.PerksNextRankContainer;
    import tripwire.containers.Perks.PerksSkillsSummaryContainer;
    import tripwire.containers.TripContainer;
    
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
        
        override protected function addedToStage(e:Event) : void
        {
            super.addedToStage(e);
            this.SelectedPerkSummaryContainer.configureButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.SelectedPerkSummaryContainer.configureButton.clickSoundEffect = "Button_Selected";
            this.SkillsContainer.confirmButton.addEventListener(ButtonEvent.CLICK,this.onButtonClick,false,0,true);
            this.addEventListener("changePerk",this.swapPerk);
            sectionHeader = this.SelectionContainer.header;
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
            this.SelectionContainer.header.controllerIconVisible = !bSelected;
        }
        
        override public function focusGroupOut() : void
        {
            super.focusGroupOut();
            this._tempSelected = this.SelectionContainer.perkScrollingList.selectedIndex;
            this.SelectionContainer.perkScrollingList.selectedIndex = -1;
            this.SelectionContainer.header.controllerIconVisible = !bSelected;
        }
        
        override public function openContainer() : void
        {
            super.openContainer();
            this.SkillsContainer.closeContainer();
            this.openPerkDetails();
        }
        
        override protected function onOpened(e:TweenEvent = null) : void
        {
            super.onOpened(e);
            this.bCanUseMenu = true;
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            this.bCanUseMenu = false;
            this.SkillsContainer.closeContainer();
            this.SelectionContainer.closeContainer();
        }
        
        public function set locked(value:Boolean) : void
        {
            this._bLocked = value;
            this.SelectionContainer.perkSelectBlocker.visible = value;
            this.SelectionContainer.perkScrollingList.enabled = !value;
            this.SelectedPerkSummaryContainer.configureButton.enabled = !value;
            if(value)
            {
                this.closeSkillConfigure();
            }
        }
        
        public function get locked() : Boolean
        {
            return this._bLocked;
        }
        
        override protected function onBPressed(details:InputDetails) : void
        {
            super.onBPressed(details);
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
        
        public function onButtonClick(e:ButtonEvent) : void
        {
            if(!this.bCanUseMenu)
            {
                return;
            }
            switch(e.currentTarget)
            {
                case this.SelectedPerkSummaryContainer.configureButton:
                    this.openSkillConfigure();
                    break;
                case this.SkillsContainer.confirmButton:
                    this.closeSkillConfigure();
            }
        }
        
        public function swapPerk(event:Event) : void
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
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(_bOpen)
            {
                this.SelectionContainer.header.controllerIconVisible = !bSelected;
                if(this.SkillsContainer.bSelected)
                {
                    this.SkillsContainer.selectContainer();
                }
            }
        }
    }
}
