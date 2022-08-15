package tripwire.containers.perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.*;
    import com.greensock.events.TweenEvent;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.controls.Button;
    import tripwire.containers.TripContainer;
    
    public class PerksConfigureSkillsContainer extends TripContainer
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
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.initTierList();
        }
        
        private function initTierList() : void
        {
            var _loc1_:int = 0;
            while(_loc1_ < this.NUM_TIERS)
            {
                this.tierList.push(this["tier" + _loc1_]);
                _loc1_++;
            }
        }
        
        public function set skillList(param1:Array) : void
        {
            var _loc3_:Object = null;
            var _loc2_:int = 0;
            for each(_loc3_ in param1)
            {
                this.tierList[_loc2_].setData(_loc3_);
                this.tierList[_loc2_].tier = _loc2_;
                this.tierList[_loc2_].skillButton0.tabIndex = ++this.tabIndexHelper;
                this.tierList[_loc2_].skillButton1.tabIndex = ++this.tabIndexHelper;
                _loc2_++;
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
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            ExternalInterface.call("Callback_SkillSelectionOpened");
        }
    }
}
