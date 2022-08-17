package tripwire.controls.perks
{
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
        
        public var SelectorArrow:MovieClip;
        
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
            this.active = false;
        }
        
        override public function setData(data:Object) : void
        {
            this.data = data;
            if(data)
            {
                visible = true;
                label = !!data.Title ? data.Title : "";
                if(label == "")
                {
                    visible = false;
                }
                if(this.perkLevelText != null)
                {
                    this._perkLevelStr = !!data.PerkLevel ? data.PerkLevel : "0";
                    this.perkLevelText.text = this._perkLevelStr;
                }
                enabled = !!data.unlocked ? Boolean(data.unlocked) : true;
                this.bTierUnlocked = !!data.bTierUnlocked ? Boolean(data.bTierUnlocked) : false;
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
                if(data.iconSource != null && data.iconSource != "")
                {
                    if(this.iconLoader != null)
                    {
                        this.iconLoader.source = data.iconSource;
                    }
                }
            }
            else
            {
                visible = false;
            }
        }
        
        public function set active(value:Boolean) : void
        {
            if(this.SelectorArrow)
            {
                this.SelectorArrow.visible = value;
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
        
        protected function handleFocusIn(e:FocusEvent) : *
        {
            addEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut,false,0,true);
            removeEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        protected function handleFocusOut(e:FocusEvent) : *
        {
            addEventListener(FocusEvent.FOCUS_IN,this.handleFocusIn,false,0,true);
            removeEventListener(FocusEvent.FOCUS_OUT,this.handleFocusOut);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override protected function handleMouseRollOver(event:MouseEvent) : void
        {
            super.handleMouseRollOver(event);
            if(!selected)
            {
                this.highlightButton();
            }
        }
        
        override protected function handleMouseRollOut(event:MouseEvent) : void
        {
            super.handleMouseRollOut(event);
            if(!selected)
            {
                this.unhighlightButton();
            }
        }
        
        override public function set selected(value:Boolean) : void
        {
            super.selected = value;
            if(value)
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
