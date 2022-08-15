package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.ui.InputDetails;
    import tripwire.controls.OverviewButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripScrollingList;
    
    public class StartOverviewContainer extends TripContainer
    {
         
        
        public var gameModeContainer:MovieClip;
        
        public var mapContainer:MovieClip;
        
        public var infoContainer:MovieClip;
        
        public var permissionsButton:OverviewButton;
        
        public var permissionsList:TripScrollingList;
        
        public var authorNameTextField:TextField;
        
        public var overviewHeader:SectionHeaderContainer;
        
        public var sharedContentButton:TripButton;
        
        public var sharedContentListContainer:SharedContentListContainer;
        
        public function StartOverviewContainer()
        {
            super();
            this.sharedContentButton.focusable = true;
            this.sharedContentListContainer.sharedContentConfirmButton.focusable = true;
            this.sharedContentButton.tabIndex = 1;
            this.sharedContentListContainer.sharedContentConfirmButton.tabIndex = 2;
        }
        
        override public function selectContainer() : void
        {
            super.selectContainer();
            if(this.sharedContentButton.visible)
            {
                currentElement = this.sharedContentButton;
                if(bManagerUsingGamepad)
                {
                    this.sharedContentButton.focused = 1;
                }
            }
            if(currentElement)
            {
                currentElement.tabEnabled = true;
                currentElement.tabChildren = true;
                if(bManagerUsingGamepad)
                {
                    currentElement.focused = 1;
                }
            }
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.overviewHeader.text = !!param1.header ? param1.header : "";
                this.gameModeContainer.titleTextField.text = !!param1.gameModeTitle ? param1.gameModeTitle : "";
                this.mapContainer.titleTextField.text = !!param1.mapTitle ? param1.mapTitle : "";
                this.infoContainer.titleTextField.text = !!param1.infoTitle ? param1.infoTitle : "";
                this.permissionsButton.sectionName = !!param1.permissionsTitle ? param1.permissionsTitle : "";
                this.infoContainer.difficultyTitle.text = !!param1.difficultyTitle ? param1.difficultyTitle : "";
                this.infoContainer.lengthTitle.text = !!param1.lengthTitle ? param1.lengthTitle : "";
                this.infoContainer.sererTypeTitle.text = !!param1.serverTitle ? param1.serverTitle : "";
                this.permissionsButton.changeName = !!param1.changedString ? param1.changedString : "";
                this.authorName = !!param1.authorName ? param1.authorName : "";
                this.sharedContentButton.label = !!param1.sharedContent ? param1.sharedContent : "";
                this.sharedContentListContainer.sharedContentTextField.text = !!param1.sharedContent ? param1.sharedContent : "";
                this.sharedContentListContainer.sharedContentConfirmButton.label = !!param1.confirm ? param1.confirm : "";
                if(param1.permissionOptions)
                {
                    this.permissionOptions = param1.permissionOptions;
                }
            }
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.initPermissionsItems();
            defaultFirstElement = this.sharedContentButton;
            currentElement = this.sharedContentButton;
        }
        
        private function initPermissionsItems() : void
        {
            this.sharedContentButton.addEventListener(ButtonEvent.PRESS,this.onSharedContentPress,false,0,true);
            this.sharedContentListContainer.sharedContentConfirmButton.addEventListener(ButtonEvent.PRESS,this.hideSharedContentList,false,0,true);
            this.permissionsButton.visible = false;
            this.permissionsList.visible = false;
            this.permissionsList.associatedButton = this.permissionsButton;
            this.hideSharedContentList();
        }
        
        public function hideSharedContentList(param1:ButtonEvent = null) : void
        {
            this.sharedContentListContainer.closeAnimation();
            currentElement = this.sharedContentButton;
            if(bManagerUsingGamepad)
            {
                this.sharedContentButton.focused = 1;
            }
        }
        
        public function showSharedContentList() : void
        {
            this.sharedContentListContainer.alpha = 0;
            this.sharedContentListContainer.visible = true;
            this.sharedContentListContainer.openAnimation();
            if(bManagerUsingGamepad)
            {
                this.sharedContentListContainer.sharedContentConfirmButton.focused = 1;
            }
        }
        
        public function set sharedContent(param1:Array) : void
        {
            this.sharedContentListContainer.sharedContentList.dataProvider = new DataProvider(param1);
        }
        
        private function onSharedContentPress(param1:ButtonEvent) : void
        {
            if(this.sharedContentListContainer.visible)
            {
                this.hideSharedContentList();
            }
            else
            {
                this.showSharedContentList();
            }
        }
        
        private function onPermissionsClicked(param1:ButtonEvent) : void
        {
            this.permissionsList.bOpen = true;
        }
        
        protected function onBack(param1:IndexEvent) : void
        {
            if(!(param1.currentTarget is TripScrollingList))
            {
                if(this.permissionsList.bOpen)
                {
                    this.permissionsList.bOpen = false;
                }
            }
            else
            {
                this.permissionsList.bOpen = false;
                if(param1.index != CANCELLED_INDEX)
                {
                    switch(param1.currentTarget)
                    {
                        case this.permissionsList:
                            ExternalInterface.call("Callback_InGamePermissionChange",param1.index);
                            this.permissionsText = this.permissionsList.dataProvider[param1.index].label;
                    }
                }
            }
        }
        
        public function set permissionOptions(param1:Array) : void
        {
            this.permissionsList.dataProvider = new DataProvider(param1);
        }
        
        public function set authorName(param1:String) : *
        {
            this.authorNameTextField.text = param1;
        }
        
        public function set gameMode(param1:String) : void
        {
            this.gameModeContainer.labelTextField.text = param1;
        }
        
        public function updateMap(param1:String, param2:String) : void
        {
            this.mapContainer.labelTextField.text = param1;
            if(param2 != "")
            {
                this.mapContainer.mapLoader.source = param2;
            }
        }
        
        public function set difficultyText(param1:String) : void
        {
            this.infoContainer.difficultyLabel.text = param1;
        }
        
        public function set lengthText(param1:String) : void
        {
            this.infoContainer.lengthLabel.text = param1;
        }
        
        public function set serverType(param1:String) : void
        {
            this.infoContainer.serverTypeLabel.text = param1;
        }
        
        public function set permissionsText(param1:String) : void
        {
            this.permissionsButton.label = param1;
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(!this.permissionsList.bOpen)
            {
                ExternalInterface.call("Callback_ControllerCloseMenu");
            }
        }
    }
}
