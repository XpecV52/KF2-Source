package tripwire.containers.Perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.*;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import tripwire.managers.MenuManager;
    
    public class PerksConfigureSkillsContainer extends PerkContainerBase
    {
         
        
        public var configureSkillsTitleTextfield:TextField;
        
        public var confirmButton:Button;
        
        public var tier0:PerkSkillButtonContainer;
        
        public var tier1:PerkSkillButtonContainer;
        
        public var tier2:PerkSkillButtonContainer;
        
        public var tier3:PerkSkillButtonContainer;
        
        public var tier4:PerkSkillButtonContainer;
        
        public var tierList:Vector.<PerkSkillButtonContainer>;
        
        private const NUM_TIERS:int = 5;
        
        private var tabIndexHelper:int = 0;
        
        public function PerksConfigureSkillsContainer()
        {
            this.tierList = new Vector.<PerkSkillButtonContainer>();
            super();
            visible = false;
            defaultFirstElement = this.tier0.skillButton0;
            ANIM_OFFSET_X = 0;
            defaultNumPrompts = 2;
        }
        
        override protected function addedToStage(e:Event) : void
        {
            super.addedToStage(e);
            this.initTierList();
        }
        
        private function initTierList() : void
        {
            for(var i:int = 0; i < this.NUM_TIERS; i++)
            {
                this.tierList.push(this["tier" + i]);
            }
        }
        
        public function set skillList(data:Array) : void
        {
            var tempObj:Object = null;
            var tempIndex:int = 0;
            for each(tempObj in data)
            {
                this.tierList[tempIndex].setData(tempObj);
                this.tierList[tempIndex].tier = tempIndex;
                this.tierList[tempIndex].skillButton0.tabIndex = ++this.tabIndexHelper;
                this.tierList[tempIndex].skillButton1.tabIndex = ++this.tabIndexHelper;
                tempIndex++;
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
                "onComplete":this.onOpened
            });
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.updateControllerIconVisibility();
            trace("Bryan: " + this + " selectContainer:: defaultPromptNum: " + defaultNumPrompts + " manager numprompts: " + MenuManager.manager.numPrompts);
        }
        
        override protected function onInputChange(e:Event) : *
        {
            super.onInputChange(e);
            this.updateControllerIconVisibility();
        }
        
        private function updateControllerIconVisibility() : void
        {
            this.confirmButton.visible = !bManagerUsingGamepad;
        }
        
        override protected function onOpened(e:TweenEvent = null) : void
        {
            super.onOpened(e);
            ExternalInterface.call("Callback_SkillSelectionOpened");
        }
    }
}
