package tripwire.controls.postGameMenu
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import tripwire.controls.TripListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class PostGameMenuPlayerSlotListItemRenderer extends TripListItemRenderer
    {
         
        
        public var voipIcon:MovieClip;
        
        public var defaultAvatar:MovieClip;
        
        public var avatarLoader:TripUILoader;
        
        public function PostGameMenuPlayerSlotListItemRenderer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            this.bTalking = false;
            super.addedToStage(param1);
        }
        
        override protected function handlePress(param1:uint = 0) : void
        {
        }
        
        override protected function handleMousePress(param1:MouseEvent) : void
        {
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
                if(param1.avatar != "" && param1.avatar != "img://")
                {
                    this.avatarLoader.source = param1.avatar;
                    this.defaultAvatar.visible = false;
                }
                else
                {
                    this.defaultAvatar.visible = true;
                }
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
