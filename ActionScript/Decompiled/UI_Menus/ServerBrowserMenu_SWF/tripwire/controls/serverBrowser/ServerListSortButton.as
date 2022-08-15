package tripwire.controls.serverBrowser
{
    import flash.display.MovieClip;
    import scaleform.clik.controls.Button;
    
    public class ServerListSortButton extends Button
    {
        
        public static const NONE:int = 1;
        
        public static const ASCENDING:int = 2;
        
        public static const DESCENDING:int = 3;
         
        
        public var currentSortOrder:int = 1;
        
        public var sortIndicator:MovieClip;
        
        public function ServerListSortButton()
        {
            super();
        }
        
        public function toggleSortOrder() : *
        {
            switch(this.currentSortOrder)
            {
                case NONE:
                    this.sortOrder = ASCENDING;
                    break;
                case ASCENDING:
                    this.sortOrder = DESCENDING;
                    break;
                case DESCENDING:
                    this.sortOrder = ASCENDING;
                    break;
                default:
                    this.sortOrder = NONE;
            }
        }
        
        public function set sortOrder(param1:int) : void
        {
            if(this.currentSortOrder != param1)
            {
                this.currentSortOrder = param1;
                this.sortIndicator.gotoAndStop(this.currentSortOrder);
            }
        }
    }
}
