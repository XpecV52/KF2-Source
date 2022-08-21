package tripwire.controls.scoreboard
{
    import flash.text.TextField;
    
    public class ZedScoreboardLineRenderer extends ScoreboardLineRenderer
    {
         
        
        public var scoreText:TextField;
        
        public function ZedScoreboardLineRenderer()
        {
            super();
        }
        
        override public function setData(param1:Object) : void
        {
            this.data = param1;
            if(param1)
            {
                visible = true;
                this.scoreText.text = !!param1.score ? param1.score : "0";
                playerID = !!param1.playerID ? int(param1.playerID) : -1;
                playerNameText.text = !!param1.playername ? param1.playername : "---";
                pingText.text = !!param1.ping ? param1.ping : "-";
                killsText.text = !!param1.kills ? param1.kills : "0";
                assistsText.text = !!param1.assists ? param1.assists : "0";
                if(param1.avatar)
                {
                    avatarIcon = param1.avatar;
                }
                setHealthState(!!param1.health ? int(param1.health) : 0,!!param1.healthPercent ? int(param1.healthPercent) : 0);
            }
            else
            {
                visible = false;
            }
        }
    }
}
