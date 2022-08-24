package tripwire.widgets
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    import tripwire.containers.hud.BossArmorGaugeContainer;
    
    public class BossHealthBarWidget extends UIComponent
    {
         
        
        public var bossnameText:TextField;
        
        public var healthBarShield:MovieClip;
        
        public var healthBarRed:MovieClip;
        
        public var healthBarGlow:MovieClip;
        
        public var bossArmorName:String = "bossArmor_";
        
        protected var originalHealthBarWidth:Number;
        
        protected var previousHealthValue:Number = 1;
        
        protected var previousShieldValue:Number = 1;
        
        public var ArmorGaugeList:Vector.<BossArmorGaugeContainer>;
        
        public const barOffset:int = 56;
        
        private const BOSS_ARMOR_START_X:int = 304;
        
        private const BOSS_ARMOR_START_Y:int = 28;
        
        private const BOSS_ARMOR_TOTAL_WIDTH:int = 720;
        
        public function BossHealthBarWidget()
        {
            this.ArmorGaugeList = new Vector.<BossArmorGaugeContainer>();
            super();
            enableInitCallback = true;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.originalHealthBarWidth = this.healthBarRed.width;
            this.healthBarGlow.width = 0;
            visible = false;
            this.currentShieldPercecntValue = 0;
        }
        
        public function onGlowComplete(param1:Event = null) : void
        {
            this.healthBarGlow.width = 0;
        }
        
        public function set currentBattlePhaseColor(param1:uint) : void
        {
            var _loc2_:Color = new Color();
            _loc2_.setTint(param1,1);
            this.healthBarRed.transform.colorTransform = _loc2_;
        }
        
        public function set currentShieldPercecntValue(param1:Number) : void
        {
            var _loc2_:Number = NaN;
            if(param1 > 1)
            {
                param1 = 1;
            }
            if(param1 < 0)
            {
                param1 = 0;
            }
            if(this.previousShieldValue != param1)
            {
                _loc2_ = this.originalHealthBarWidth * param1;
                TweenMax.to(this.healthBarShield,4,{
                    "width":_loc2_,
                    "useFrames":true,
                    "easing":Cubic.easeOut
                });
                if(this.healthBarShield.width > this.originalHealthBarWidth)
                {
                    this.healthBarShield.width = this.originalHealthBarWidth;
                }
                this.previousShieldValue = param1;
            }
        }
        
        public function get currentShieldPercecntValue() : Number
        {
            return this.previousShieldValue;
        }
        
        public function set currentHealthPercentValue(param1:Number) : void
        {
            var _loc2_:Number = NaN;
            var _loc3_:Number = NaN;
            if(param1 > 1)
            {
                param1 = 1;
                visible = true;
            }
            if(param1 < 0)
            {
                param1 = 0;
                visible = false;
            }
            if(this.previousHealthValue != param1)
            {
                _loc2_ = this.healthBarRed.width;
                _loc3_ = this.originalHealthBarWidth * param1;
                this.healthBarGlow.x = _loc2_ + this.barOffset;
                TweenMax.to(this.healthBarRed,4,{
                    "width":_loc3_,
                    "useFrames":true,
                    "easing":Cubic.easeOut
                });
                if(this.healthBarRed.width > this.originalHealthBarWidth)
                {
                    this.healthBarRed.width = this.originalHealthBarWidth;
                    this.healthBarGlow.x = this.originalHealthBarWidth + this.barOffset;
                }
                TweenMax.killTweensOf(this.healthBarGlow);
                if(_loc2_ > _loc3_)
                {
                    this.healthBarGlow.alpha = 1;
                    TweenMax.to(this.healthBarGlow,4,{
                        "x":_loc3_ + this.barOffset,
                        "width":this.healthBarGlow.width + (_loc2_ - _loc3_),
                        "useFrames":true,
                        "easing":Cubic.easeOut
                    });
                    TweenMax.to(this.healthBarGlow,4,{
                        "delay":8,
                        "alpha":0,
                        "useFrames":true,
                        "easing":Cubic.easeOut
                    });
                    TweenMax.to(this.healthBarGlow,4,{
                        "delay":12,
                        "alpha":1,
                        "useFrames":true,
                        "repeat":3,
                        "yoyo":true,
                        "easing":Cubic.easeOut,
                        "onComplete":this.onGlowComplete
                    });
                }
                if(_loc2_ < _loc3_ && this.healthBarGlow.width != 0)
                {
                    TweenMax.to(this.healthBarGlow,2,{
                        "alpha":0,
                        "useFrames":true,
                        "easing":Cubic.easeOut,
                        "onComplete":this.onGlowComplete
                    });
                }
                this.previousHealthValue = param1;
            }
        }
        
        public function get currentHealthPercentValue() : Number
        {
            return this.previousHealthValue;
        }
        
        public function set armorData(param1:Array) : void
        {
            var _loc3_:int = 0;
            var _loc4_:int = 0;
            var _loc5_:BossArmorGaugeContainer = null;
            if(param1 != null && param1.length != this.ArmorGaugeList.length)
            {
                _loc3_ = this.BOSS_ARMOR_TOTAL_WIDTH / param1.length;
                this.clearArmorGaugeList();
                _loc4_ = 0;
                while(_loc4_ < param1.length)
                {
                    _loc5_ = new BossArmorGaugeContainer_MC() as BossArmorGaugeContainer;
                    addChild(_loc5_);
                    _loc5_.name = this.bossArmorName + _loc4_;
                    _loc5_.initArmorGauge(param1[_loc4_].iconSource,_loc3_);
                    _loc5_.x = this.BOSS_ARMOR_START_X + _loc3_ * _loc4_;
                    _loc5_.y = this.BOSS_ARMOR_START_Y;
                    this.ArmorGaugeList.push(_loc5_);
                    _loc4_++;
                }
            }
            var _loc2_:int = 0;
            while(_loc2_ < param1.length)
            {
                this.ArmorGaugeList[_loc2_].barPercentage = param1[_loc2_].armorPercent;
                _loc2_++;
            }
        }
        
        public function clearArmorGaugeList() : void
        {
            var _loc1_:BossArmorGaugeContainer = null;
            for each(_loc1_ in this.ArmorGaugeList)
            {
                removeChild(_loc1_);
                _loc1_ = null;
            }
            this.ArmorGaugeList.length = 0;
        }
    }
}
