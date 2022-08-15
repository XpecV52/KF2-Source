package tripwire.controls.postGameMenu
{
    import flash.events.Event;
    import scaleform.gfx.Extensions;
    
    public class PersonalBestListItemRenderer extends TeamAwardListItemRenderer
    {
         
        
        public function PersonalBestListItemRenderer()
        {
            super();
        }
        
        override protected function doneAndDone() : *
        {
            parent.dispatchEvent(new Event("PlayerNextAnim"));
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
        }
    }
}
