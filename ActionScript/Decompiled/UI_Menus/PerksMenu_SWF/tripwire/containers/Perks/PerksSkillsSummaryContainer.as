package tripwire.containers.Perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Linear;
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
    import tripwire.managers.MenuManager;
    
    public class PerksSkillsSummaryContainer extends PerkContainerBase
    {
         
        
        public var configureButton:TripButton;
        
        public var titleTextfield:TextField;
        
        public var skillList:ScrollingList;
        
        public var controllerIconContainer:MovieClip;
        
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
        
        override protected function addedToStage(event:Event) : void
        {
            super.addedToStage(event);
            this.setTabIndex();
        }
        
        private function setTabIndex() : void
        {
            this.configureButton.tabIndex = 1;
            this.configureButton.tabEnabled = false;
            this.controllerIconContainer.mouseEnabled = false;
            this.controllerIconContainer.mouseChildren = false;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.updateControllerIconVisibility();
        }
        
        override protected function onInputChange(e:Event) : *
        {
            super.onInputChange(e);
            this.updateControllerIconVisibility();
        }
        
        private function updateControllerIconVisibility() : void
        {
            this.controllerIconContainer.visible = bManagerUsingGamepad;
        }
        
        override public function handleInput(event:InputEvent) : void
        {
            super.handleInput(event);
            if(event.handled || !visible)
            {
                return;
            }
            var details:InputDetails = event.details;
            if(details.value == InputValue.KEY_DOWN && !MenuManager.manager.bPopUpOpen)
            {
                switch(details.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_X:
                        this.configureButton.dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
                }
            }
        }
        
        public function set bTierUnlocked(value:Boolean) : *
        {
            var highlightBG:MovieClip = this.configureButton.getChildByName("highlightBG") as MovieClip;
            if(value)
            {
                highlightBG.gotoAndPlay("Glow");
            }
            else
            {
                highlightBG.gotoAndStop("Off");
            }
        }
        
        public function set skillsData(data:Array) : *
        {
            if(data != null)
            {
                this.skillList.dataProvider = new DataProvider(data);
                if(this.skillList.scrollBar != null)
                {
                    this.skillList.scrollBar.visible = data.length - 1 > this.skillList.rowCount;
                }
            }
        }
        
        override protected function openAnimation() : *
        {
            TweenMax.killTweensOf(this);
            TweenMax.fromTo(this,ANIM_TIME,{
                "z":ANIM_OFFSET_Z,
                "x":ANIM_START_X + ANIM_OFFSET_X,
                "alpha":0,
                "blurFilter":{
                    "blurX":ANIM_BLUR_X,
                    "blurY":ANIM_BLUR_Y,
                    "quality":1
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "overwrite":1
            },{
                "z":ANIM_START_Z,
                "x":ANIM_START_X,
                "alpha":_defaultAlpha,
                "blurFilter":{
                    "blurX":AnimBLUR_OUT,
                    "blurY":AnimBLUR_OUT,
                    "quality":1,
                    "remove":true
                },
                "ease":Linear.easeNone,
                "useFrames":true,
                "onComplete":onOpened
            });
        }
    }
}
