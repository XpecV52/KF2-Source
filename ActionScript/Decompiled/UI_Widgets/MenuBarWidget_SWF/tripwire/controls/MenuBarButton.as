package tripwire.controls
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import scaleform.gfx.TextFieldEx;
    
    public class MenuBarButton extends TripButton
    {
         
        
        public var highlight:MovieClip;
        
        public var superHighlight:MovieClip;
        
        public var disabledHighlight:MovieClip;
        
        public var iconContainer:MovieClip;
        
        public var iconColor:Color;
        
        public var menuText:TextField;
        
        public var menuTextFormat:TextFormat;
        
        public const HighLightColor:uint = 16503487;
        
        public const UnhighLightColor:uint = 12234399;
        
        public const DisabledColor:uint = 5393734;
        
        public var _bPulsing:Boolean;
        
        public function MenuBarButton()
        {
            this.iconColor = new Color();
            this.menuText = new TextField();
            this.menuTextFormat = new TextFormat();
            super();
            this.menuText = textField;
            this.menuText.autoSize = TextFieldAutoSize.CENTER;
            this.enabled = true;
            this.menuTextFormat = this.menuText.getTextFormat();
            this.menuTextFormat.letterSpacing = 2;
            this.menuText.defaultTextFormat = this.menuTextFormat;
            TextFieldEx.setVerticalAlign(this.menuText,TextFieldEx.VALIGN_CENTER);
        }
        
        public function set bPulsing(param1:Boolean) : void
        {
            this._bPulsing = param1;
            if(param1 && !selected)
            {
                gotoAndPlay("pulse");
            }
            else
            {
                gotoAndStop("unselected");
            }
        }
        
        public function pausePulse() : *
        {
            gotoAndStop("unselected");
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            this.highlight.visible = param1;
            this.superHighlight.visible = false;
            this.highlight.alpha = 1;
            if(param1)
            {
                this.menuText.textColor = this.HighLightColor;
                if(this._bPulsing)
                {
                    this.pausePulse();
                }
            }
            else
            {
                this.menuText.textColor = this.UnhighLightColor;
                this.bPulsing = this._bPulsing;
            }
        }
        
        override protected function highlightButton() : *
        {
            this.highlight.visible = false;
            this.superHighlight.visible = true;
            this.menuText.textColor = this.HighLightColor;
        }
        
        override protected function unhighlightButton() : *
        {
            this.highlight.visible = false;
            this.superHighlight.visible = false;
            this.menuText.textColor = this.UnhighLightColor;
        }
        
        public function set index(param1:int) : void
        {
            this.iconContainer.MenuButtonIcon.gotoAndStop(param1 + 1);
        }
        
        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            mouseEnabled = param1;
            mouseChildren = param1;
            this.disabledHighlight.visible = !param1;
            if(!param1)
            {
                this.menuText.textColor = this.DisabledColor;
                this.iconColor.setTint(this.DisabledColor,1);
                this.iconContainer.transform.colorTransform = this.iconColor;
            }
        }
    }
}
