package tripwire.controls.scoreboard
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class ScoreboardLineRenderer extends ListItemRenderer
    {
         
        
        public var playerNameText:TextField;
        
        public var pingText:TextField;
        
        public var killsText:TextField;
        
        public var assistsText:TextField;
        
        public var perkInfoText:TextField;
        
        public var doshText:TextField;
        
        public var playerHealthText:TextField;
        
        public var healthGaugeMC:MovieClip;
        
        public var avatarMask:MovieClip;
        
        public var avatarContainer:MovieClip;
        
        public var avatarLoader:TripUILoader;
        
        public var perkIconLoader:TripUILoader;
        
        public var playerID:int;
        
        public function ScoreboardLineRenderer()
        {
            super();
            preventAutosizing = true;
        }
        
        override public function setData(param1:Object) : void
        {
            this.data = param1;
            if(param1)
            {
                visible = true;
                this.playerID = !!param1.playerID ? int(param1.playerID) : -1;
                this.playerNameText.text = !!param1.playername ? param1.playername : "---";
                this.pingText.text = !!param1.ping ? param1.ping : "-";
                this.killsText.text = !!param1.kills ? param1.kills : "0";
                this.assistsText.text = !!param1.assists ? param1.assists : "0";
                this.doshText.text = !!param1.dosh ? param1.dosh : "0";
                this.perkInfoText.text = (!!param1.perkLevel ? param1.perkLevel : "0") + " " + (!!param1.perkName ? param1.perkName : "");
                this.iconSource = param1.iconPath;
                if(param1.avatar)
                {
                    this.avatarIcon = param1.avatar;
                }
                this.setHealthState(!!param1.health ? int(param1.health) : 0,!!param1.healthPercent ? int(param1.healthPercent) : 0);
            }
            else
            {
                visible = false;
            }
        }
        
        public function set avatarIcon(param1:String) : void
        {
            if(param1 && param1 != "")
            {
                this.avatarLoader.source = param1;
                this.avatarLoader.visible = true;
            }
            else
            {
                this.avatarLoader.visible = false;
            }
        }
        
        public function setHealthState(param1:int, param2:int) : void
        {
            var _loc3_:int = param1;
            if(this.playerHealthText != null)
            {
                this.playerHealthText.text = param1.toString();
            }
            if(param2 > 100)
            {
                _loc3_ = 100;
            }
            else if(param2 < 0)
            {
                _loc3_ = 0;
            }
            if(param2 > 0)
            {
                if(currentFrameLabel != "Alive")
                {
                    gotoAndStop("Alive");
                }
            }
            else if(currentFrameLabel != "Dead")
            {
                gotoAndStop("Dead");
            }
            if(this.healthGaugeMC)
            {
                this.healthGaugeMC.gotoAndStop(param2 + 1);
            }
        }
        
        public function set iconSource(param1:String) : void
        {
            if(param1 && param1 != "")
            {
                this.perkIconLoader.source = param1;
            }
        }
    }
}
