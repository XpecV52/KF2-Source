package
{
    import flash.events.Event;
    import flash.utils.Dictionary;
    import tripwire.controls.store.FeaturedStoreListItemRenderer;
    
    public dynamic class FeaturedStoreItem_MC extends FeaturedStoreListItemRenderer
    {
         
        
        public var __setTabDict:Dictionary;
        
        public var __lastFrameTab:int = -1;
        
        public function FeaturedStoreItem_MC()
        {
            this.__setTabDict = new Dictionary(true);
            super();
            addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20,29,this.frame30,39,this.frame40,40,this.frame41,49,this.frame50,59,this.frame60,69,this.frame70,79,this.frame80);
            addEventListener(Event.FRAME_CONSTRUCTED,this.__setTab_handler,false,0,true);
        }
        
        function __setTab_itemPriceBaseText_FeaturedStoreItem_MC_itemPriceBase_0(param1:int) : *
        {
            if(itemPriceBaseText != null && param1 >= 1 && param1 <= 10 && (this.__setTabDict[itemPriceBaseText] == undefined || !(int(this.__setTabDict[itemPriceBaseText]) >= 1 && int(this.__setTabDict[itemPriceBaseText]) <= 10)))
            {
                this.__setTabDict[itemPriceBaseText] = param1;
                itemPriceBaseText.tabIndex = 1;
            }
        }
        
        function __setTab_handler(param1:Object) : *
        {
            var _loc2_:int = currentFrame;
            if(this.__lastFrameTab == _loc2_)
            {
                return;
            }
            this.__lastFrameTab = _loc2_;
            this.__setTab_itemPriceBaseText_FeaturedStoreItem_MC_itemPriceBase_0(_loc2_);
        }
        
        function frame1() : *
        {
        }
        
        function frame10() : *
        {
            stop();
        }
        
        function frame20() : *
        {
            stop();
        }
        
        function frame30() : *
        {
            stop();
        }
        
        function frame40() : *
        {
            stop();
        }
        
        function frame41() : *
        {
        }
        
        function frame50() : *
        {
            stop();
        }
        
        function frame60() : *
        {
            stop();
        }
        
        function frame70() : *
        {
            stop();
        }
        
        function frame80() : *
        {
            stop();
        }
    }
}
