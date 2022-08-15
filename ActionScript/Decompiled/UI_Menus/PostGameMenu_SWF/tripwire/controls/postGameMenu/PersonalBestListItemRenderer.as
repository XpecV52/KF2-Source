package tripwire.controls.postGameMenu
{
    import flash.events.Event;
    import scaleform.gfx.Extensions;
    import tripwire.menus.PostGameMenu;
    
    public class PersonalBestListItemRenderer extends TeamAwardListItemRenderer
    {
         
        
        public function PersonalBestListItemRenderer()
        {
            super();
        }
        
        override public function animate() : void
        {
            if(Extensions.enabled)
            {
                if(_bHighlight)
                {
                    Extensions.gfxProcessSound(this,"AAR","Award_Yes");
                }
                else
                {
                    Extensions.gfxProcessSound(this,"AAR","Award_No");
                }
            }
            if(PostGameMenu.bkillAnims)
            {
                teamAwardTimeline.timeScale(20);
                teamAwardTimeline.play();
            }
            else if(!PostGameMenu.bkillAnims)
            {
                teamAwardTimeline.timeScale(timeDialation);
                teamAwardTimeline.play();
            }
        }
        
        override protected function doneAndDone() : *
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
        }
    }
}
