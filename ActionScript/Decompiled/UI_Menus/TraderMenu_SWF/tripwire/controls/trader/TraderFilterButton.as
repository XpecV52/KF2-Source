package tripwire.controls.trader
{
    import flash.display.MovieClip;
    import tripwire.controls.TripButton;
    
    public class TraderFilterButton extends TripButton
    {
         
        
        public var iconLoaderHolder:MovieClip;
        
        private var _source:String;
        
        public function TraderFilterButton()
        {
            super();
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
