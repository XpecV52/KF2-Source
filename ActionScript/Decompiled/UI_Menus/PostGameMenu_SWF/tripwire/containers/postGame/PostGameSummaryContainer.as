package tripwire.containers.postGame
{
    import flash.text.TextField;
    import tripwire.containers.TripContainer;
    
    public class PostGameSummaryContainer extends TripContainer
    {
         
        
        public var mapNameText:TextField;
        
        public var typeDifficultyText:TextField;
        
        public var waveGameInfoText:TextField;
        
        public var victoryDefeatText:TextField;
        
        public function PostGameSummaryContainer()
        {
            super();
        }
        
        public function set data(param1:Object) : void
        {
            if(param1)
            {
                this.mapNameText.text = !!param1.mapName ? param1.mapName : "";
                this.typeDifficultyText.text = !!param1.typeDifficulty ? param1.typeDifficulty : "";
                this.waveGameInfoText.text = !!param1.waveTime ? param1.waveTime : "";
                this.victoryDefeatText.text = !!param1.winLost ? param1.winLost : "";
            }
        }
    }
}
