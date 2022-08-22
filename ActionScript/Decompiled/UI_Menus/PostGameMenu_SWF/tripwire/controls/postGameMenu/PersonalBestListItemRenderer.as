package tripwire.controls.postGameMenu
{
    import com.greensock.easing.Cubic;
    import flash.events.Event;
    import scaleform.gfx.Extensions;
    
    public class PersonalBestListItemRenderer extends TeamAwardListItemRenderer
    {
         
        
        public var noNewPBSoundEffect:String = "AAR_PERSONALBEST_ITEM_OPEN";
        
        public var newPBSoundEffect:String = "AAR_PERSONALBEST_NEWPERSONALBEST";
        
        public var textRevealSoundEffect:String = "AAR_PERSONALBEST_ITEM_TEXT";
        
        public function PersonalBestListItemRenderer()
        {
            super();
        }
        
        override public function setAnimations() : void
        {
            var _loc1_:String = _bHighlight == true ? this.newPBSoundEffect : this.noNewPBSoundEffect;
            teamAwardTimeline.fromTo(this,8,{
                "alpha":0,
                "visible":true
            },{
                "alpha":1,
                "ease":Cubic.easeOut,
                "onStart":this.playSound,
                "onStartParams":[_loc1_]
            }).to(awardBG,1,{"alpha":1}).to(awardBG,7,{
                "width":frameWidth,
                "ease":Cubic.easeOut
            }).to(awardInfo,4,{
                "autoAlpha":1,
                "ease":Cubic.easeOut,
                "onStart":this.playSound,
                "onStartParams":[this.textRevealSoundEffect],
                "onComplete":this.doneAndDone
            });
        }
        
        override public function playSound(param1:String) : void
        {
            if(Extensions.enabled)
            {
                Extensions.gfxProcessSound(this,"UI",param1);
            }
        }
        
        override protected function doneAndDone() : *
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
        }
    }
}
