package tripwire.controls.perks
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import flash.display.MovieClip;
    import flash.events.FocusEvent;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    import tripwire.controls.TripListItemRenderer;
    
    public class PerkSelectLineRenderer extends TripListItemRenderer
    {
         
        
        public var iconLoader:UILoader;
        
        public var perkLevelText:TextField;
        
        public var tierBG:MovieClip;
        
        public var bTierUnlocked:Boolean;
        
        public var alertBG:MovieClip;
        
        private var _perkLevelStr:String;
        
        private const ICON_WIDTH:Number = 40;
        
        private const ICON_HEIGHT:Number = 40;
        
        private var _originalPositionZ:Number;
        
        private const AnimTime = 8;
        
        private const AnimHighlightOffsetZ = 32;
        
        private const AnimSelectedOffsetZ = 0;
        
        public var hitbox:MovieClip;
        
        public const hitboxZ:int = 32;
        
        public function PerkSelectLineRenderer()
        {
            super();
            preventAutosizing = true;
            this._originalPositionZ = z;
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
            if(!enabled)
            {
                this.disableButton();
            }
        }
        
        override public function setData(param1:Object) : void
        {
            this.data = param1;
            if(param1)
            {
                visible = true;
                label = !!param1.Title ? param1.Title : "";
                if(label == "")
                {
                    visible = false;
                }
                if(this.perkLevelText != null)
                {
                    this._perkLevelStr = !!param1.PerkLevel ? param1.PerkLevel : "0";
                    this.perkLevelText.text = this._perkLevelStr;
                }
                enabled = !!param1.unlocked ? Boolean(param1.unlocked) : true;
                this.bTierUnlocked = !!param1.bTierUnlocked ? Boolean(param1.bTierUnlocked) : false;
                if(this.bTierUnlocked)
                {
                    if(this.alertBG != null)
                    {
                        this.alertBG.gotoAndPlay("Glow");
                    }
                }
                else if(this.alertBG != null)
                {
                    this.alertBG.gotoAndStop("Off");
                }
                if(param1.iconSource != null && param1.iconSource != "")
                {
                    if(this.iconLoader != null)
                    {
                        this.iconLoader.source = param1.iconSource;
                    }
                }
            }
            else
            {
                visible = false;
            }
        }
        
        override protected function updateAfterStateChange() : void
        {
            super.updateAfterStateChange();
            if(this.perkLevelText && this._perkLevelStr)
            {
                this.perkLevelText.text = this._perkLevelStr;
            }
        }
        
        protected function handleFocusIn(param1:FocusEvent) : *
        {
            addEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut,false,0,true);
            removeEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        protected function handleFocusOut(param1:FocusEvent) : *
        {
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
            removeEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override protected function handleMouseRollOver(param1:MouseEvent) : void
        {
            super.handleMouseRollOver(param1);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        override protected function handleMouseRollOut(param1:MouseEvent) : void
        {
            super.handleMouseRollOut(param1);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            if(param1)
            {
                this.highlightButton();
            }
            else
            {
                this.unhighlightButton();
            }
        }
        
        override protected function highlightButton() : *
        {
            if(enabled)
            {
                textField.textColor = highlightColor;
                this.perkLevelText.textColor = highlightColor;
                TweenMax.to(this,this.AnimTime,{
                    "z":this._originalPositionZ - this.AnimHighlightOffsetZ,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
                this.hitbox.z = this.hitboxZ;
            }
            else
            {
                this.disableButton();
            }
        }
        
        override protected function unhighlightButton() : *
        {
            if(enabled)
            {
                textField.textColor = defaultColor;
                this.perkLevelText.textColor = defaultColor;
                TweenMax.to(this,this.AnimTime,{
                    "z":this._originalPositionZ,
                    "ease":Cubic.easeOut,
                    "useFrames":true
                });
                this.hitbox.z = 0;
            }
            else
            {
                this.disableButton();
            }
        }
        
        protected function disableButton() : *
        {
            textField.textColor = disabledColor;
            this.perkLevelText.textColor = disabledColor;
        }
    }
}
