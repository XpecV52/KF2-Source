package tripwire.controls.postGameMenu
{
    import flash.display.MovieClip;
    import tripwire.controls.TripListItemRenderer;
    
    public class PostGameMenuPlayerSlotListItemRenderer extends TripListItemRenderer
    {
         
        
        public var voipIcon:MovieClip;
        
        public function PostGameMenuPlayerSlotListItemRenderer()
        {
            super();
        }
        
        public function set bTalking(param1:Boolean) : void
        {
            if(this.voipIcon)
            {
                this.voipIcon.visible = param1;
            }
        }
        
        override public function set data(param1:Object) : void
        {
            if(param1)
            {
                super.data = param1;
                this.bTalking = !!param1.bTalking ? Boolean(param1.bTalking) : false;
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        
        override protected function highlightButton() : *
        {
        }
        
        override protected function unhighlightButton() : *
        {
        }
    }
}
