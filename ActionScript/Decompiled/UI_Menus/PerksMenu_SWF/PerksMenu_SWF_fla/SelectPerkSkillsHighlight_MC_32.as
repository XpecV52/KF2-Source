package PerksMenu_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class SelectPerkSkillsHighlight_MC_32 extends MovieClip
    {
         
        
        public function SelectPerkSkillsHighlight_MC_32()
        {
            super();
            addFrameScript(0,this.frame1,20,this.frame21);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame21() : *
        {
            gotoAndPlay("Glow");
        }
    }
}