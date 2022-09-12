package tripwire.controls
{
    import flash.display.MovieClip;
    import scaleform.clik.controls.UILoader;
    
    public class BuffIconLoaderListItemRenderer extends TripListItemRenderer
    {
         
        
        public var iconLoader:UILoader;
        
        public var IconLoaderBG:MovieClip;
        
        public function BuffIconLoaderListItemRenderer()
        {
            super();
            visible = false;
            this.IconLoaderBG.visible = false;
        }
        
        override public function setData(param1:Object) : void
        {
            super.data = param1;
            if(data != null)
            {
                if(param1.iconPath != "")
                {
                    visible = true;
                    this.IconLoaderBG.visible = true;
                    this.iconLoader.source = !!param1.iconPath ? param1.iconPath : "";
                }
                else
                {
                    visible = false;
                    this.IconLoaderBG.visible = false;
                }
            }
            else
            {
                visible = false;
                this.IconLoaderBG.visible = false;
            }
        }
    }
}
