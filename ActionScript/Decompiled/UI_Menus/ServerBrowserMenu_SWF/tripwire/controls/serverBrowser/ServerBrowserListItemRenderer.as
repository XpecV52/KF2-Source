package tripwire.controls.serverBrowser
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import tripwire.controls.TripListItemRenderer;
    
    public class ServerBrowserListItemRenderer extends TripListItemRenderer
    {
         
        
        public var serverNameText:TextField;
        
        public var serverModeText:TextField;
        
        public var serverDifficultyText:TextField;
        
        public var serverMapText:TextField;
        
        public var waveCountText:TextField;
        
        public var playerCountText:TextField;
        
        public var pingText:TextField;
        
        public var custom_RankedIcon:MovieClip;
        
        public var lockIcon:MovieClip;
        
        public var serverExiledIcon:MovieClip;
        
        private var _bRanked:Boolean;
        
        private var _bCustom:Boolean;
        
        public const serverNameColor:uint = 14538703;
        
        public function ServerBrowserListItemRenderer()
        {
            super();
            visible = false;
            preventAutosizing = true;
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            var _loc2_:String = "0";
            if(param1 != null)
            {
                if(param1.maxWaveCount)
                {
                    if(param1.maxWaveCount == -1)
                    {
                        _loc2_ = "∞";
                    }
                    else
                    {
                        _loc2_ = param1.maxWaveCount;
                    }
                }
                this.serverNameText.text = !!param1.serverName ? param1.serverName : "";
                this.serverModeText.text = param1.mode;
                this.serverDifficultyText.text = param1.difficulty;
                this.serverMapText.text = param1.map;
                this.playerCountText.text = param1.playerCount + "/" + param1.maxPlayerCount;
                this.waveCountText.text = param1.waveCount + "/" + _loc2_;
                this.pingText.text = !!param1.ping ? param1.ping : "";
                this.locked = !!param1.locked ? Boolean(param1.locked) : false;
                this.ranked = !!param1.bRanked ? Boolean(param1.bRanked) : false;
                this.custom = !!param1.bCustom ? Boolean(param1.bCustom) : false;
                this.serverExiled = !!param1.serverExiled ? Boolean(param1.serverExiled) : false;
                this.updateServerTypeIcon();
            }
        }
        
        public function updateServerTypeIcon() : void
        {
            if(!this._bRanked)
            {
                this.custom_RankedIcon.gotoAndStop("unranked");
            }
            else if(this._bCustom)
            {
                this.custom_RankedIcon.gotoAndStop("custom");
            }
            else
            {
                this.custom_RankedIcon.gotoAndStop("ranked");
            }
        }
        
        public function set ranked(param1:Boolean) : void
        {
            this._bRanked = param1;
        }
        
        public function set custom(param1:Boolean) : void
        {
            this._bCustom = param1;
        }
        
        public function set locked(param1:Boolean) : void
        {
            if(this.lockIcon)
            {
                this.lockIcon.visible = param1;
            }
        }
        
        public function set serverExiled(param1:Boolean) : void
        {
            if(this.serverExiledIcon)
            {
                this.serverExiledIcon.visible = param1;
            }
        }
        
        override protected function highlightButton() : *
        {
            this.serverNameText.textColor = highlightColor;
            this.serverModeText.textColor = highlightColor;
            this.serverDifficultyText.textColor = highlightColor;
            this.serverMapText.textColor = highlightColor;
            this.playerCountText.textColor = highlightColor;
            this.waveCountText.textColor = highlightColor;
            this.pingText.textColor = highlightColor;
        }
        
        override protected function unhighlightButton() : *
        {
            this.serverNameText.textColor = this.serverNameColor;
            this.serverModeText.textColor = defaultColor;
            this.serverDifficultyText.textColor = defaultColor;
            this.serverMapText.textColor = defaultColor;
            this.playerCountText.textColor = defaultColor;
            this.waveCountText.textColor = defaultColor;
            this.pingText.textColor = defaultColor;
        }
    }
}
