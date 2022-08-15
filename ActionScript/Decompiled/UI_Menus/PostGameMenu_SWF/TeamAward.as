package
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import tripwire.controls.postGameMenu.TeamAwardListItemRenderer;
    
    public dynamic class TeamAward extends TeamAwardListItemRenderer
    {
         
        
        public function TeamAward()
        {
            super();
            addFrameScript(0,this.frame1);
        }
        
        public function awardAnimIn() : void
        {
            TweenMax.fromTo(this,8,{
                "alpha":0,
                "visible":true
            },{
                "alpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(awardBG,8,{
                "delay":4,
                "width":536,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
            TweenMax.to(awardInfo,4,{
                "delay":12,
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "useFrames":true
            });
        }
        
        function frame1() : *
        {
        }
    }
}
