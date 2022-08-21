package
{
    import tripwire.controls.scoreboard.ZedScoreboardLineRenderer;
    
    public dynamic class ZedPlayerScoreItemRenderer extends ZedScoreboardLineRenderer
    {
         
        
        public function ZedPlayerScoreItemRenderer()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame2() : *
        {
            stop();
        }
    }
}
