package tripwire.controls
{
    import scaleform.clik.core.UIComponent;
    
    public class TripUIPerkLoader extends UIComponent
    {
         
        
        public var perkIcon:TripUILoaderQueue;
        
        public var prestigeIcon:TripUILoaderQueue;
        
        private const PERK_ICON_DEFAULT_SIZE:int = 256;
        
        private const PERK_ICON_PRESTIGE_SIZE:int = 192;
        
        private const PERK_ICON_PRESTIGE_X:int = 32;
        
        private const PERK_ICON_PRESTIGE_Y:int = 16;
        
        public function TripUIPerkLoader()
        {
            super();
        }
        
        public function set data(param1:Object) : void
        {
            if(param1)
            {
                if(param1.perkIcon)
                {
                    this.perkIcon.source = param1.perkIcon;
                }
                else
                {
                    this.perkIcon.visible = false;
                }
                if(param1.prestigeIcon && param1.prestigeIcon != "")
                {
                    this.prestigeIcon.visible = true;
                    this.prestigeIcon.source = param1.prestigeIcon;
                    this.perkIcon.width = this.PERK_ICON_PRESTIGE_SIZE;
                    this.perkIcon.height = this.perkIcon.width;
                    this.perkIcon.x = this.PERK_ICON_PRESTIGE_X;
                    this.perkIcon.y = this.PERK_ICON_PRESTIGE_Y;
                }
                else
                {
                    this.prestigeIcon.visible = false;
                    this.perkIcon.width = this.PERK_ICON_DEFAULT_SIZE;
                    this.perkIcon.height = this.perkIcon.width;
                    this.perkIcon.x = 0;
                    this.perkIcon.y = 0;
                }
            }
        }
    }
}
