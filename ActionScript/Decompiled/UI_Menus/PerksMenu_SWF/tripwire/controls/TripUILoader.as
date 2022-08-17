package tripwire.controls
{
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import scaleform.clik.controls.UILoader;
    
    public class TripUILoader extends UILoader
    {
         
        
        public function TripUILoader()
        {
            super();
        }
        
        override public function set source(value:String) : void
        {
            if(!value)
            {
                return;
            }
            if(_source == value)
            {
                return;
            }
            if((value == "" || value == null) && loader.content == null)
            {
                unload();
            }
            else
            {
                this.load(value);
            }
        }
        
        override protected function load(url:String) : void
        {
            if(!url)
            {
                return;
            }
            if(url == "")
            {
                return;
            }
            unload();
            _source = url;
            if(!_isLoading)
            {
                _visiblilityBeforeLoad = visible;
                visible = false;
            }
            if(loader == null)
            {
                loader = new Loader();
                loader.contentLoaderInfo.addEventListener(Event.OPEN,handleLoadOpen,false,0,true);
                loader.contentLoaderInfo.addEventListener(Event.INIT,handleLoadInit,false,0,true);
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE,handleLoadComplete,false,0,true);
                loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,handleLoadProgress,false,0,true);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,handleLoadIOError,false,0,true);
            }
            addChild(loader);
            _isLoading = true;
            loader.load(new URLRequest(_source));
        }
    }
}
