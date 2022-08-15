package tripwire.controls
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.UILoader;
    
    public class PerkItemRenderer extends TripListItemRenderer
    {
         
        
        public var nameTextField:TextField;
        
        public var levelTextField:TextField;
        
        public var xpBar:MovieClip;
        
        public var perkIconLoader:UILoader;
        
        public function PerkItemRenderer()
        {
            preventAutosizing = true;
            super();
        }
        
        override public function setData(param1:Object) : void
        {
            if(param1)
            {
                this.nameTextField.text = !!param1.name ? param1.name : "";
                this.levelTextField.text = !!param1.level ? param1.level : "";
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
    }
}
