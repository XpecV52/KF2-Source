package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import tripwire.controls.TripUILoader;
    
    public class TeamSlotContainer extends TripContainer
    {
         
        
        public var skullIconMC:MovieClip;
        
        public var zedAvatar:TripUILoader;
        
        public var healthBar:MovieClip;
        
        public var playerAvatar:TripUILoader;
        
        public var healthBarOriginalWidth:Number;
        
        public var previousHealthValue:Number;
        
        protected var _data:Object;
        
        public function TeamSlotContainer()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.healthBarOriginalWidth = this.healthBar.width;
            this.health = 0;
        }
        
        public function set data(param1:Object) : void
        {
            this._data = param1;
            if(this._data)
            {
                this.playerIcon = !!param1.playerIcon ? param1.playerIcon : "";
                this.zedIcon = !!param1.zedIcon ? param1.zedIcon : "";
                if(param1.health != undefined)
                {
                    this.health = param1.health;
                }
            }
        }
        
        public function set playerIcon(param1:String) : void
        {
            if(param1 && param1 != "")
            {
                this.playerAvatar.visible = true;
                this.playerAvatar.source = param1;
            }
            else
            {
                this.playerAvatar.visible = false;
            }
        }
        
        public function set zedIcon(param1:String) : void
        {
            if(param1 && param1 != "")
            {
                this.zedAvatar.visible = true;
                this.zedAvatar.source = param1;
            }
            else
            {
                this.zedAvatar.visible = false;
            }
        }
        
        public function set health(param1:Number) : void
        {
            if(param1 != this.previousHealthValue)
            {
                this.skullIconMC.visible = param1 == 0;
                this.zedAvatar.visible = param1 > 0;
                this.healthBar.width = this.healthBarOriginalWidth * (param1 / 100);
            }
        }
    }
}
