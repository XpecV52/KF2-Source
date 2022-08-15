package gfxfontlib_fla
{
    import flash.display.MovieClip;
    import flash.text.Font;
    
    public dynamic class MainTimeline extends MovieClip
    {
         
        
        public var UIFontType:Font;
        
        public function MainTimeline()
        {
            super();
            addFrameScript(0,this.frame1);
        }
        
        function frame1() : *
        {
            this.UIFontType = new $UIFontBold();
            trace(this.UIFontType.fontName);
        }
    }
}
