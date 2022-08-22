package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import tripwire.controls.TripTabButton;
    
    public class TraderFilterTab extends TripTabButton
    {
         
        
        public var iconLoaderHolder:MovieClip;
        
        private var _source:String;
        
        public function TraderFilterTab()
        {
            super();
            tabClickSoundEffect = "TRADER_STORE_FILTER_CLICK";
            tabOverSoundEffect = "TRADER_STORE_FILTER_ROLLOVER";
        }
        
        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            mouseEnabled = mouseChildren = !param1;
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
