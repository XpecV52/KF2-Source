package tripwire.controls
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    
    public class PerkItemRenderer extends TripListItemRenderer
    {
         
        
        public var nameTextField:TextField;
        
        public var levelTextField:TextField;
        
        public var xpBar:MovieClip;
        
        public var perkIconLoader:UILoader;
        
        public var iconColor:Color;
        
        public function PerkItemRenderer()
        {
            this.iconColor = new Color();
            preventAutosizing = true;
            super();
            highlightColor = 6943;
            defaultColor = 12255231;
        }
        
        override public function setData(param1:Object) : void
        {
            if(param1)
            {
                this.nameTextField.text = !!param1.name ? param1.name : "";
                this.levelTextField.text = !!param1.level ? param1.level : "0";
                this.xpLevel = !!param1.perkXP ? int(param1.perkXP) : 0;
                if(param1.perkIconSource && param1.perkIconSource != "")
                {
                    this.perkIconLoader.source = param1.perkIconSource;
                }
                visible = true;
            }
            else
            {
                visible = false;
            }
            super.setData(param1);
        }
        
        public function set xpLevel(param1:int) : void
        {
            if(param1 > 100)
            {
                param1 = 100;
            }
            else if(param1 < 0)
            {
                param1 = 0;
            }
            this.xpBar.gotoAndStop(param1 + 1);
        }
        
        public function tintPerkIcon(param1:uint) : void
        {
            this.iconColor.setTint(param1,1);
            this.perkIconLoader.transform.colorTransform = this.iconColor;
        }
        
        override protected function highlightButton() : *
        {
            this.tintPerkIcon(highlightColor);
            this.nameTextField.textColor = highlightColor;
            this.levelTextField.textColor = highlightColor;
        }
        
        override protected function unhighlightButton() : *
        {
            this.tintPerkIcon(defaultColor);
            this.nameTextField.textColor = defaultColor;
            this.levelTextField.textColor = defaultColor;
        }
    }
}
