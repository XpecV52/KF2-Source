package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import tripwire.controls.TripButton;
    
    public class TraderFilterButton extends TripButton
    {
         
        
        public var iconLoaderHolder:MovieClip;
        
        private var _source:String;
        
        private var _bIsMyPerk:Boolean;
        
        public var arrowTop:MovieClip;
        
        public var arrowBottom:MovieClip;
        
        public function TraderFilterButton()
        {
            super();
            overSoundEffect = "TRADER_STORE_PERK_ROLLOVER";
            this.arrowTop.visible = false;
            this.arrowBottom.visible = false;
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
        }
        
        public function get source() : String
        {
            return this._source;
        }
        
        public function set source(param1:String) : void
        {
            this._source = param1;
            invalidateData();
        }
        
        public function get bIsMyPerk() : Boolean
        {
            return this._bIsMyPerk;
        }
        
        public function set bIsMyPerk(param1:Boolean) : void
        {
            this._bIsMyPerk = param1;
            invalidateData();
            this.arrowTop.visible = param1;
            this.arrowBottom.visible = param1;
        }
        
        override protected function updateText() : void
        {
            super.updateText();
            if(this._source != "")
            {
                this.iconLoaderHolder.iconLoader.source = this._source;
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
    }
}
