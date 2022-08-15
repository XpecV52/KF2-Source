package tripwire.containers
{
    import flash.text.TextField;
    import tripwire.controls.TripUILoader;
    
    public class PlayerNamePlateContainer extends TripContainer
    {
         
        
        public var playerNameText:TextField;
        
        public var perkIconLoader:TripUILoader;
        
        public var perkNameText:TextField;
        
        public var perkLevelText:TextField;
        
        public function PlayerNamePlateContainer()
        {
            super();
        }
        
        public function set data(param1:Object) : void
        {
            this.playerNameText.text = !!param1.playerName ? param1.playerName : "";
            this.perkIconLoader.source = !!param1.perkIcon ? param1.perkIcon : "";
            this.perkNameText.text = !!(param1.perkLevel + " " + param1.perkName) ? param1.perkLevel + " " + param1.perkName : "";
            this.perkLevelText.text = !!param1.perkLevel ? param1.perkLevel : "";
        }
    }
}
