package tripwire.managers
{
    import flash.display.Loader;
    import flash.display.MovieClip;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import flash.geom.*;
    import flash.net.URLRequest;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.core.CLIK;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.TripContainer;
    import tripwire.popups.BasePopup;
    
    public class MenuManager extends UIComponent
    {
        
        private static var _manager:MenuManager;
        
        public static var INPUT_CHANGED:String = "INPUT_CHANGED";
        
        public static var PROMPT_CHANGED:String = "PROMPT_CHANGED";
         
        
        public var mCursor:MovieClip;
        
        public var renderTexture:MovieClip;
        
        public var MenuBackground:MovieClip;
        
        public var MenuScanlines:MovieClip;
        
        private const MenuLayer = 2;
        
        private const WidgetLayer = 3;
        
        private var _menuLoader:Loader;
        
        private var _popupLoader:Loader;
        
        private var _widgetLoader:Loader;
        
        public var bPopUpOpen:Boolean;
        
        private var _bLoading:Boolean;
        
        private var _bUsingGamepad:Boolean;
        
        private var _bConsoleBuild:Boolean;
        
        private var _bMenuOpen:Boolean;
        
        private var _bWidgetsVisible:Boolean;
        
        private var _currentURL:String;
        
        private var _widgets:Vector.<TripContainer>;
        
        private var _currentMenu:MovieClip;
        
        private var _currentMenuIndex:int;
        
        private var _pendingPopupTitle:String;
        
        private var _pendingPopupDescription:String;
        
        private var _pendingPopupLeftButtonString:String;
        
        private var _pendingPopupRightButtonString:String;
        
        private var _pendingPopupMiddleButtonString:String;
        
        private var _currentPopUp:BasePopup;
        
        private var _numPrompts:int = 2;
        
        private var menuList:Array;
        
        public function MenuManager()
        {
            super();
            stage.scaleMode = StageScaleMode.SHOW_ALL;
            this.initializeManager();
            this.setMenuVisibility(true);
            var persp:PerspectiveProjection = new PerspectiveProjection();
            persp.fieldOfView = 30;
            persp.projectionCenter = new Point(960,540);
            stage.transform.perspectiveProjection = persp;
            addChild(this.MenuScanlines);
            this.MenuScanlines.mouseEnabled = false;
            this.MenuScanlines.mouseChildren = false;
            this.MenuBackground.addEventListener("menuClosed",this.onMenuClosed,false,0,true);
        }
        
        public static function get manager() : MenuManager
        {
            return _manager;
        }
        
        public function set backgroundVisible(value:Boolean) : void
        {
            this.renderTexture.visible = value;
        }
        
        public function get bUsingGamepad() : Boolean
        {
            return this._bUsingGamepad;
        }
        
        public function set bUsingGamepad(value:Boolean) : void
        {
            if(!this._bConsoleBuild)
            {
                if(this._bUsingGamepad != value)
                {
                    this._bUsingGamepad = value;
                    if(stage != null)
                    {
                        stage.dispatchEvent(new Event(INPUT_CHANGED));
                    }
                    this.controllerEnableWidgets(false);
                    if(this.bPopUpOpen && this._currentPopUp != null)
                    {
                        this._currentPopUp.openPopup();
                    }
                    else if(this.menuList.length > this._currentMenuIndex)
                    {
                        this.menuList[this._currentMenuIndex].menuObject.selectContainer();
                    }
                    this.mCursor.visible = !this._bUsingGamepad;
                    if(!this._bUsingGamepad)
                    {
                        FocusManager.setFocus(null);
                    }
                }
            }
        }
        
        public function get bConsoleBuild() : Boolean
        {
            return this._bConsoleBuild;
        }
        
        public function set bConsoleBuild(value:Boolean) : *
        {
            if(this._bConsoleBuild != value)
            {
                this.bUsingGamepad = value;
                this._bConsoleBuild = value;
            }
        }
        
        public function get numPrompts() : int
        {
            return this._numPrompts;
        }
        
        public function set numPrompts(value:int) : *
        {
            if(this._numPrompts == value)
            {
                return;
            }
            this._numPrompts = value;
            stage.dispatchEvent(new Event(PROMPT_CHANGED));
        }
        
        public function loadCurrentMenu(URL:String, bShowWidgets:Boolean) : void
        {
            if(this._bLoading)
            {
                return;
            }
            this._bWidgetsVisible = bShowWidgets;
            for(var i:int = 0; i < this.menuList.length; i++)
            {
                if(this.menuList[i].URL == URL)
                {
                    this.menuList[this._currentMenuIndex].menuObject.closeContainer();
                    this.menuList[i].menuObject.openContainer();
                    this.menuList[i].menuObject.enableInitCallback = true;
                    CLIK.queueInitCallback(this.menuList[i].menuObject);
                    this._currentMenuIndex = i;
                    this.setMenuVisibility(true);
                    this.menuList[this._currentMenuIndex].menuObject.selectContainer();
                    this.controllerEnableWidgets(false);
                    return;
                }
            }
            this._menuLoader.load(new URLRequest(URL));
            this._currentURL = URL;
            this._bLoading = true;
        }
        
        public function loadWidgets(Paths:Array) : void
        {
            for(var i:int = 0; i < Paths.length; i++)
            {
                this._widgetLoader.load(new URLRequest(Paths[i]));
            }
        }
        
        public function widgetLoaderComplete(evt:Event) : void
        {
            var MenuMC:TripContainer = evt.target.content.getChildAt(0) as TripContainer;
            this._widgets.push(MenuMC);
            stage.addChildAt(MenuMC,stage.numChildren - 1);
        }
        
        public function loadCurrentPopup(URL:String, newPopupTitle:String, newPopupDescription:String, newPopupLeftButtonString:String, newPopupRightButtonString:String, newPopupMiddleButtonString:String) : void
        {
            this._pendingPopupTitle = newPopupTitle;
            this._pendingPopupDescription = newPopupDescription;
            this._pendingPopupLeftButtonString = newPopupLeftButtonString;
            this._pendingPopupMiddleButtonString = newPopupMiddleButtonString;
            this._pendingPopupRightButtonString = newPopupRightButtonString;
            this._popupLoader.load(new URLRequest(URL));
            if(this.menuList.length > this._currentMenuIndex)
            {
                this.menuList[this._currentMenuIndex].menuObject.focusGroupOut();
            }
            this.bPopUpOpen = true;
        }
        
        protected function loaderComplete(evt:Event) : void
        {
            if(this._currentMenuIndex < this.menuList.length)
            {
                if(this.menuList[this._currentMenuIndex] != null)
                {
                    this.menuList[this._currentMenuIndex].menuObject.closeContainer();
                }
            }
            var NewMenu:Object = new Object();
            NewMenu.URL = this._currentURL;
            NewMenu.menuObject = evt.target.content.getChildAt(0) as TripContainer;
            this.menuList.push(NewMenu);
            this._currentMenuIndex = this.menuList.length - 1;
            this.setMenuVisibility(true);
            if(!this.bPopUpOpen)
            {
                this.menuList[this._currentMenuIndex].menuObject.selectContainer();
            }
            this.controllerEnableWidgets(false);
            stage.addChildAt(NewMenu.menuObject,this.MenuLayer);
            this._bLoading = false;
        }
        
        protected function popupLoaderComplete(evt:Event) : void
        {
            this._currentPopUp = evt.target.content.getChildAt(0) as BasePopup;
            stage.addChild(evt.target.content);
            this._currentPopUp.setPopupText(this._pendingPopupTitle,this._pendingPopupDescription,this._pendingPopupLeftButtonString,this._pendingPopupRightButtonString,this._pendingPopupMiddleButtonString);
            this.mCursor.visible = !this.bUsingGamepad;
            if(!this._bMenuOpen)
            {
                stage.removeChild(this.mCursor);
                stage.addChild(this.mCursor);
                this.setMenuEvents(true);
            }
        }
        
        public function unloadCurrentPopup() : void
        {
            this._currentPopUp = null;
            if(this._popupLoader != null)
            {
                this._popupLoader.unloadAndStop();
                this._pendingPopupTitle = "";
                this._pendingPopupDescription = "";
                this._pendingPopupLeftButtonString = "";
                this._pendingPopupRightButtonString = "";
            }
            if(!this._bMenuOpen)
            {
                this.mCursor.visible = false;
                this.setMenuEvents(false);
            }
            this.bPopUpOpen = false;
            if(this.menuList != null && this.menuList[this._currentMenuIndex] != null && this.menuList[this._currentMenuIndex].menuObject != null)
            {
                this.menuList[this._currentMenuIndex].menuObject.focusGroupIn();
            }
        }
        
        override protected function addedToStage(e:Event) : void
        {
            super.addedToStage(e);
        }
        
        protected function initializeManager() : void
        {
            _manager = this;
            _enableInitCallback = true;
            this.mCursor.mouseEnabled = false;
            this.mCursor.tabEnabled = false;
            this.menuList = new Array();
            this._menuLoader = new Loader();
            this._menuLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loaderComplete);
            this._menuLoader.addEventListener(IOErrorEvent.IO_ERROR,this.loadError);
            this._menuLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.contentLoadError);
            this._widgets = new Vector.<TripContainer>();
            this._widgetLoader = new Loader();
            this._widgetLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.widgetLoaderComplete);
            this._popupLoader = new Loader();
            this._popupLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.popupLoaderComplete);
        }
        
        protected function contentLoadError(e:IOErrorEvent) : void
        {
            trace("CONTENT LOAD ERROR: " + e.toString());
        }
        
        protected function loadError(e:IOErrorEvent) : void
        {
            trace("LOAD ERROR: " + e.toString());
        }
        
        protected function handleControllerInput(e:InputEvent) : void
        {
            super.handleInput(e);
            var details:InputDetails = e.details;
            if(this._bWidgetsVisible && details.value == InputValue.KEY_DOWN && !this.bPopUpOpen)
            {
                switch(e.details.navEquivalent)
                {
                    case NavigationCode.GAMEPAD_L2:
                        if(!this.menuList[this._currentMenuIndex].menuObject.bSelected)
                        {
                            this.menuList[this._currentMenuIndex].menuObject.focusGroupIn();
                            this.controllerEnableWidgets(false);
                        }
                        break;
                    case NavigationCode.GAMEPAD_R2:
                        this.menuList[this._currentMenuIndex].menuObject.focusGroupOut();
                        this.controllerEnableWidgets(true);
                }
            }
        }
        
        public function setFocusToPartyWidget() : void
        {
            this.menuList[this._currentMenuIndex].menuObject.focusGroupOut();
            this.controllerEnableWidgets(true);
        }
        
        public function setWidgetsVisiblity(value:Boolean) : void
        {
            for(var i:int = 0; i < this._widgets.length; i++)
            {
                if(value)
                {
                    this._widgets[i].openContainer();
                }
                else
                {
                    this._widgets[i].closeContainer();
                }
            }
        }
        
        public function setMenuVisibility(value:Boolean) : void
        {
            var i:int = 0;
            if(value && !this._bMenuOpen)
            {
                this.MenuBackground.gotoAndPlay("open");
                this.MenuBackground.visible = true;
            }
            else if(!value && this._bMenuOpen)
            {
                this.MenuBackground.gotoAndPlay("close");
            }
            this._bMenuOpen = value;
            this.setMenuEvents(value);
            if(this._bWidgetsVisible)
            {
                for(i = 0; i < this._widgets.length; i++)
                {
                    if(value)
                    {
                        this._widgets[i].openContainer();
                    }
                    else
                    {
                        this._widgets[i].closeContainer();
                    }
                }
            }
            else if(this._bMenuOpen)
            {
                for(i = 0; i < this._widgets.length; i++)
                {
                    this._widgets[i].closeContainer();
                }
            }
            if(this._currentMenuIndex < this.menuList.length)
            {
                if(value)
                {
                    this.menuList[this._currentMenuIndex].menuObject.openContainer();
                }
                else
                {
                    this.menuList[this._currentMenuIndex].menuObject.closeContainer();
                }
            }
            this.mCursor.visible = value && !this.bUsingGamepad;
            this.MenuScanlines.visible = value;
            this.mCursor.x = mouseX;
            this.mCursor.y = mouseY;
        }
        
        public function onMenuClosed() : void
        {
            if(!this._bMenuOpen)
            {
                this.MenuBackground.visible = false;
                if(this._currentMenuIndex < this.menuList.length)
                {
                    this.menuList[this._currentMenuIndex].menuObject.visible = false;
                }
                ExternalInterface.call("Callback_MenusFinishedClosing");
            }
        }
        
        public function setMenuEvents(value:Boolean) : void
        {
            if(value)
            {
                stage.addEventListener(MouseEvent.MOUSE_MOVE,this.handleMouseMove);
                stage.addEventListener(Event.ADDED,this.changeMouseLayer,false,0,true);
                stage.addEventListener(InputEvent.INPUT,this.handleControllerInput,false,0,true);
            }
            else
            {
                stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.handleMouseMove);
                stage.removeEventListener(Event.ADDED,this.changeMouseLayer);
                stage.removeEventListener(InputEvent.INPUT,this.handleControllerInput);
            }
        }
        
        public function currentFocus() : void
        {
            trace("Bryan: MenuManager currentFocus:: " + FocusManager.getFocus());
            trace("Bryan: MenuManager modalClip:: " + FocusManager.getModalClip());
        }
        
        protected function controllerEnableWidgets(value:Boolean) : void
        {
            for(var i:int = 0; i < this._widgets.length; i++)
            {
                if(value)
                {
                    this._widgets[i].selectContainer();
                }
                else
                {
                    this._widgets[i].deselectContainer();
                }
            }
        }
        
        protected function handleMouseMove(e:MouseEvent) : void
        {
            this.mCursor.x = e.stageX;
            this.mCursor.y = e.stageY;
        }
        
        protected function changeMouseLayer(e:Event) : void
        {
            if(e.target != this.mCursor)
            {
                stage.removeChild(this.mCursor);
                stage.addChild(this.mCursor);
            }
        }
        
        private function testMenus() : void
        {
            var Paths:Array = new Array("../UI_Widgets/PartyWidget_SWF.swf","../UI_Widgets/MenuBarWidget_SWF.swf");
            this.loadWidgets(Paths);
            this.loadCurrentMenu("../UI_Menus/GearMenu_SWF.swf",false);
        }
    }
}
