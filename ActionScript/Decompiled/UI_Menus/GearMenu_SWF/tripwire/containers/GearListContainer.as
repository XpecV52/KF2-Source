package tripwire.containers
{
    import flash.text.TextField;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.interfaces.IDataProvider;
    import tripwire.controls.TripBackButton;
    import tripwire.controls.TripTileList;
    
    public class GearListContainer extends TripSubContainer
    {
         
        
        public var tileList:TripTileList;
        
        public var titleTextField:TextField;
        
        public var backButton:TripBackButton;
        
        public var arrowBackButton:TripBackButton;
        
        public var _bIsSubMenu:Boolean;
        
        public function GearListContainer()
        {
            super();
            this.setTabIndexes();
            ANIM_START_X = 576;
            ANIM_OFFSET_X = 0;
            defaultNumPrompts = 2;
            openSoundEffect = "GEAR_ITEMCONTAINER_OPEN";
            this.arrowBackButton.visible = false;
            this.backButton.visible = false;
            _defaultAlpha = 1;
            this.tileList.bResetSelectedIndex = false;
        }
        
        private function setTabIndexes() : *
        {
            this.tileList.tabIndex = 1;
            this.backButton.tabIndex = 2;
        }
        
        public function get bIsSubMenu() : Boolean
        {
            return this._bIsSubMenu;
        }
        
        public function set bIsSubMenu(param1:Boolean) : void
        {
            this._bIsSubMenu = param1;
            this.backButton.visible = !!bManagerUsingGamepad ? false : !param1;
            this.arrowBackButton.visible = !!bManagerUsingGamepad ? false : Boolean(param1);
        }
        
        public function set listTitle(param1:String) : void
        {
            this.titleTextField.text = param1;
        }
        
        public function set buttonText(param1:String) : void
        {
            this.backButton.label = param1;
        }
        
        public function get dataProvider() : IDataProvider
        {
            return this.tileList.dataProvider;
        }
        
        public function set dataProvider(param1:IDataProvider) : void
        {
            this.tileList.dataProvider = param1;
            this.tileList.invalidate();
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            this.tileList.open();
            this.tileList.addEventListener(IndexEvent.INDEX_CHANGE,this.onSelectionMade,false,0,true);
            this.backButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.arrowBackButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            closeContainer();
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,CANCELLED_INDEX));
        }
        
        function onSelectionMade(param1:IndexEvent) : void
        {
            closeContainer();
            dispatchEvent(new IndexEvent(IndexEvent.INDEX_CHANGE,false,true,param1.index));
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.tileList.removeEventListener(IndexEvent.INDEX_CHANGE,this.onSelectionMade);
            this.backButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
            this.arrowBackButton.removeEventListener(ButtonEvent.PRESS,this.handleButtonEvent);
        }
    }
}
