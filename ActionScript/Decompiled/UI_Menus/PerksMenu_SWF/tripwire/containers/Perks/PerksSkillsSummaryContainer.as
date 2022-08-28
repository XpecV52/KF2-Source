package tripwire.containers.Perks
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.controls.ScrollingList;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.TripButton;
    import tripwire.controls.perks.PerkSkillsSummaryListRenderer;
    import tripwire.managers.MenuManager;
    
    public class PerksSkillsSummaryContainer extends PerkContainerBase
    {
         
        
        public var configureButton:TripButton;
        
        public var prestigeButton:TripButton;
        
        public var prestigeTextfield:TextField;
        
        public var titleTextfield:TextField;
        
        public var skillList:ScrollingList;
        
        public var BG:MovieClip;
        
        public var tier1:PerkSkillsSummaryListRenderer;
        
        public var tier2:PerkSkillsSummaryListRenderer;
        
        public var tier3:PerkSkillsSummaryListRenderer;
        
        public var tier4:PerkSkillsSummaryListRenderer;
        
        public var tier5:PerkSkillsSummaryListRenderer;
        
        public var controllerYButton:MovieClip;
        
        private var bCanPrestige:Boolean;
        
        private const TITLE_START_Y:Number = 52.9;
        
        private const TITLE_GAMEPADY_Y:Number = 4.9;
        
        private const SKILL_START_Y:int = 112;
        
        private const SKILL_GAMEPAD_Y:int = 80;
        
        private const SKILL_START_OFFSET:int = 80;
        
        private const SKILL_GAMEPAD_OFFSET:int = 96;
        
        private const PROMPT_ALPHA:Number = 0.32;
        
        public var owner:MovieClip;
        
        public function PerksSkillsSummaryContainer()
        {
            super();
            ANIM_OFFSET_X = 0;
            if(this.skillList.scrollBar != null)
            {
                this.skillList.scrollBar.visible = false;
            }
            this.skillList.mouseEnabled = false;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            if(MenuManager.manager != null)
            {
                defaultNumPrompts = !!MenuManager.manager.bOpenedInGame ? 5 : 4;
            }
            this.canPrestige = true;
            super.addedToStage(param1);
            this.setTabIndex();
            this.updateControllerIconVisibility();
        }
        
        private function setTabIndex() : void
        {
            this.configureButton.tabEnabled = false;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.updateControllerIconVisibility();
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.updateControllerIconVisibility();
        }
        
        public function get canPrestige() : Boolean
        {
            return this.bCanPrestige;
        }
        
        public function set canPrestige(param1:Boolean) : void
        {
            this.bCanPrestige = param1;
            this.prestigeTextfield.alpha = !!this.bCanPrestige ? Number(1) : Number(this.PROMPT_ALPHA);
            this.controllerYButton.alpha = this.prestigeTextfield.alpha;
        }
        
        private function updateControllerIconVisibility() : void
        {
            this.configureButton.visible = !bManagerUsingGamepad;
            this.controllerYButton.visible = this.prestigeButton.enabled && bManagerUsingGamepad && bSelected;
            this.BG.gotoAndStop(!!bManagerUsingGamepad ? 2 : 1);
            if(this.prestigeTextfield.text != this.prestigeButton.label)
            {
                this.prestigeTextfield.text = this.prestigeButton.label;
            }
            this.prestigeButton.visible = !bManagerUsingGamepad;
            this.prestigeTextfield.visible = this.prestigeButton.enabled && bManagerUsingGamepad && bSelected;
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            super.handleInput(param1);
            if(param1.handled || !visible)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN && MenuManager.manager != null && !MenuManager.manager.bPopUpOpen && this.owner.bSelected)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_X:
                        this.configureButton.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
                        break;
                    case NavigationCode.GAMEPAD_L3:
                        if(this.prestigeButton.enabled && this.canPrestige)
                        {
                            this.prestigeButton.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
                            param1.handled = true;
                        }
                }
            }
        }
        
        public function set bTierUnlocked(param1:Boolean) : *
        {
            var _loc2_:MovieClip = this.configureButton.getChildByName("highlightBG") as MovieClip;
            if(param1)
            {
                _loc2_.gotoAndPlay("Glow");
            }
            else
            {
                _loc2_.gotoAndStop("Off");
            }
        }
        
        public function set skillsData(param1:Array) : *
        {
            if(param1 != null)
            {
                this.skillList.dataProvider = new DataProvider(param1);
                if(this.skillList.scrollBar != null)
                {
                    this.skillList.scrollBar.visible = param1.length - 1 > this.skillList.rowCount;
                }
            }
        }
    }
}
