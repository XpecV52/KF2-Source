package tripwire.menus
{
    import com.greensock.events.TweenEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.data.DataProvider;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.clik.events.IndexEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import scaleform.gfx.FocusManager;
    import tripwire.containers.GearListContainer;
    import tripwire.containers.SectionHeaderContainer;
    import tripwire.containers.TripContainer;
    import tripwire.controls.CategoryButton;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripTextArea;
    import tripwire.managers.MenuManager;
    
    public class GearMenu extends TripContainer
    {
         
        
        public const Item_None:int = 255;
        
        public var gearHeader:SectionHeaderContainer;
        
        public var gearList:GearListContainer;
        
        public var skinList:GearListContainer;
        
        public var characterButton:CategoryButton;
        
        public var bioTextArea:TripTextArea;
        
        public var headButton:CategoryButton;
        
        public var bodyButton:CategoryButton;
        
        public var attachmentButton:CategoryButton;
        
        public var rotateCameraWindow:MovieClip;
        
        public var rotateLeftButton:TripButton;
        
        private var _bSelectingSkin:Boolean;
        
        private var _meshIndex:int;
        
        private var _skinIndex:int;
        
        private var _selectedCharacterSkinIndex:int = 0;
        
        private var _selectedHeadSkinIndex:int = 0;
        
        private var _selectedBodySkinIndex:int = 0;
        
        private var _selectedAttachmentSkinIndex:int = 0;
        
        private var _selectedCharacterIndex:int = 0;
        
        private var _selectedHeadIndex:int = 0;
        
        private var _selectedBodyIndex:int = 0;
        
        private var _selectedAttachmentIndex:int = 0;
        
        private var _charactersString:String;
        
        private var _headsString:String;
        
        private var _bodiesString:String;
        
        private var _attachmentString:String;
        
        private var _skinsString:String;
        
        private var _weapons:Array;
        
        private var _weaponSkins:Array;
        
        private var _characters:Array;
        
        private var _heads:Array;
        
        private var _bodies:Array;
        
        private var _attachments:Array;
        
        private var _selectedButton:CategoryButton;
        
        private var _prevX:int = 0;
        
        private var _bRotating:Boolean;
        
        public var headCameraSoundEffect:String = "GEAR_CHAR_ZOOMIN";
        
        public var bodyCameraSoundEffect:String = "GEAR_CHAR_ZOOMOUT";
        
        public function GearMenu()
        {
            super();
            leftSidePanels = new Array();
            this.characterArray = new Array();
            this.bodyArray = new Array();
            this.attachmentsArray = new Array();
            this.setTabIndexes();
            sectionHeader = this.gearHeader;
        }
        
        public function set weaponArray(param1:Array) : void
        {
            this._weapons = param1;
            this.setOptionList(this.gearList,this._weapons,"WEAPons");
        }
        
        public function set weaponSkins(param1:Array) : void
        {
            this._weaponSkins = param1;
        }
        
        public function set characterArray(param1:Array) : void
        {
            this._characters = param1;
            this.characterButton.enabled = this._characters.length > 1;
        }
        
        public function set characterButtonEnabled(param1:Boolean) : void
        {
            this.characterButton.enabled = param1;
        }
        
        public function GetCanCustomize(param1:Array) : Boolean
        {
            var _loc2_:Boolean = false;
            var _loc3_:Boolean = false;
            if(param1.length > 1)
            {
                _loc2_ = true;
            }
            var _loc4_:int = 0;
            while(_loc4_ < param1.length)
            {
                if(param1[_loc4_].skinInfo && param1[_loc4_].skinInfo.length > 1)
                {
                    _loc3_ = true;
                }
                _loc4_++;
            }
            return _loc2_ || _loc3_;
        }
        
        public function set bodyArray(param1:Array) : void
        {
            this._bodies = param1;
            this.bodyButton.enabled = this.GetCanCustomize(this._bodies);
        }
        
        public function set headsArray(param1:Array) : void
        {
            this._heads = param1;
            this.headButton.enabled = this.GetCanCustomize(this._heads);
        }
        
        public function set attachmentsArray(param1:Array) : void
        {
            this._attachments = param1;
            this.attachmentButton.enabled = this.GetCanCustomize(this._attachments);
        }
        
        public function set listButton(param1:String) : void
        {
            this.gearList.buttonText = param1;
        }
        
        public function set selectedCharacter(param1:Object) : void
        {
            var _loc3_:Number = NaN;
            this.characterButton.infoString = !!param1.selectedCharacter ? param1.selectedCharacter : "";
            var _loc2_:* = 0;
            if(param1.selectedCharacterIndex)
            {
                _loc3_ = 0;
                while(_loc3_ < this._characters.length)
                {
                    if(this._characters[_loc3_].ItemIndex == param1.selectedCharacterIndex)
                    {
                        _loc2_ = _loc3_;
                        break;
                    }
                    _loc3_++;
                }
            }
            this._selectedCharacterIndex = _loc2_;
            this.bioTextArea.text = !!param1.characterBio ? param1.characterBio : "";
        }
        
        public function set selectedHead(param1:Object) : void
        {
            this.headButton.infoString = !!param1.selectedHead ? param1.selectedHead : "";
            this._selectedHeadIndex = !!param1.selectedHeadIndex ? int(param1.selectedHeadIndex) : 0;
            this._selectedHeadSkinIndex = !!param1.selectedHeadSkinIndex ? int(param1.selectedHeadSkinIndex) : 0;
            this._selectedHeadSkinIndex = this._selectedHeadSkinIndex == this.Item_None ? 0 : int(this._selectedHeadSkinIndex);
            this._selectedHeadIndex = this._selectedHeadIndex == this.Item_None ? 0 : int(this._selectedHeadIndex);
        }
        
        public function set selectedBody(param1:Object) : void
        {
            this.bodyButton.infoString = !!param1.selectedBody ? param1.selectedBody : "";
            this._selectedBodyIndex = !!param1.selectedBodyIndex ? int(param1.selectedBodyIndex) : 0;
            this._selectedBodySkinIndex = !!param1.selectedBodySkinIndex ? int(param1.selectedBodySkinIndex) : 0;
            this._selectedBodySkinIndex = this._selectedBodySkinIndex == this.Item_None ? 0 : int(this._selectedBodySkinIndex);
            this._selectedBodyIndex = this._selectedBodyIndex == this.Item_None ? 0 : int(this._selectedBodyIndex);
        }
        
        public function set selectedAttachment(param1:Object) : void
        {
            this.attachmentButton.infoString = !!param1.selectedAttachment ? param1.selectedAttachment : "";
            this._selectedAttachmentIndex = !!param1.selectedAttachmentIndex ? int(param1.selectedAttachmentIndex) : 0;
            this._selectedAttachmentSkinIndex = !!param1.selectedAttachmentSkinIndex ? int(param1.selectedAttachmentSkinIndex) : 0;
            this._selectedAttachmentSkinIndex = this._selectedAttachmentSkinIndex == this.Item_None ? 0 : int(this._selectedAttachmentSkinIndex);
            this._selectedAttachmentIndex = this._selectedAttachmentIndex == this.Item_None ? 0 : (int(this._selectedAttachmentIndex = this._selectedAttachmentIndex + 1));
        }
        
        public function set localizeText(param1:Object) : *
        {
            this.gearHeader.text = param1.header;
            this.gearList.buttonText = param1.listButton;
            this.bioTextArea.titleText = param1.biosString;
            this._charactersString = param1.charactersString;
            this.characterButton.label = this._charactersString;
            this._headsString = param1.headsString;
            this.headButton.label = this._headsString;
            this._bodiesString = param1.bodiesString;
            this.bodyButton.label = this._bodiesString;
            this._skinsString = param1.skinsString;
            this._attachmentString = param1.attachmentsString;
            this.attachmentButton.label = this._attachmentString;
        }
        
        override public function selectContainer() : void
        {
            if(_bOpen && this.gearList.bOpen)
            {
                this.gearList.selectContainer();
            }
            else if(bOpen && this.skinList.bOpen)
            {
                this.skinList.selectContainer();
            }
            else
            {
                showDimLeftSide(false);
                super.selectContainer();
            }
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer();
            if(!bManagerUsingGamepad)
            {
                this.characterButton.selected = false;
                this.headButton.selected = false;
                this.bodyButton.selected = false;
                this.attachmentButton.selected = false;
            }
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            currentElement = defaultFirstElement = !!this.characterButton.enabled ? this.characterButton : this.headButton;
            if(defaultFirstElement == null)
            {
                currentElement = defaultFirstElement = !!this.bodyButton.enabled ? this.bodyButton : this.attachmentButton;
            }
            if(!MenuManager.manager.bPopUpOpen && bManagerUsingGamepad && bSelected)
            {
                FocusManager.setFocus(currentElement);
            }
        }
        
        override public function deselectContainer() : void
        {
            super.deselectContainer();
            this.skinList.closeContainer();
            this.gearList.closeContainer();
        }
        
        override public function closeContainer() : void
        {
            super.closeContainer();
            if(this.gearList.bOpen)
            {
                this.gearList.closeContainer();
            }
            ExternalInterface.call("Callback_BodyCamera");
            if(bManagerUsingGamepad)
            {
                showDimLeftSide(false);
            }
        }
        
        override protected function onBPressed(param1:InputDetails) : void
        {
            super.onBPressed(param1);
            if(!this.gearList.bOpen)
            {
                ExternalInterface.call("Callback_BodyCamera");
                ExternalInterface.call("Callback_ControllerCloseMenu");
            }
        }
        
        override public function focusGroupOut() : void
        {
            super.focusGroupOut();
            this.selectButton();
            if(this.gearList.bOpen)
            {
                this.gearList.closeContainer();
            }
            if(this.skinList.bOpen)
            {
                this.skinList.closeContainer();
            }
        }
        
        protected function setTabIndexes() : *
        {
            this.characterButton.tabIndex = 1;
            this.headButton.tabIndex = 3;
            this.bodyButton.tabIndex = 4;
            this.attachmentButton.tabIndex = 5;
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.characterButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.headButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.bodyButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.attachmentButton.addEventListener(ButtonEvent.PRESS,this.handleButtonEvent,false,0,true);
            this.rotateCameraWindow.addEventListener(MouseEvent.MOUSE_DOWN,this.startRotate,false,0,true);
            this.gearList.addEventListener(IndexEvent.INDEX_CHANGE,this.listSelect,false,0,true);
            this.skinList.addEventListener(IndexEvent.INDEX_CHANGE,this.listSelect,false,0,true);
            this.gearList.visible = false;
            this.skinList.visible = false;
            this.gearHeader.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.characterButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.bioTextArea.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.headButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.bodyButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.attachmentButton.addEventListener(MouseEvent.MOUSE_OVER,handleLeftSideOver,false,0,true);
            this.gearList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            this.skinList.addEventListener(MouseEvent.MOUSE_OVER,handleRightSideOver,false,0,true);
            leftSidePanels.push(this.gearHeader);
            leftSidePanels.push(this.characterButton);
            leftSidePanels.push(this.bioTextArea);
            leftSidePanels.push(this.headButton);
            leftSidePanels.push(this.bodyButton);
            leftSidePanels.push(this.attachmentButton);
            rightSidePanels.push(this.gearList);
            rightSidePanels.push(this.skinList);
            this.hideWeaponOptions();
            this.testMenu();
        }
        
        protected function handleButtonEvent(param1:ButtonEvent) : void
        {
            this._meshIndex = 0;
            this._selectedButton = param1.currentTarget as CategoryButton;
            this.selectButton(this._selectedButton);
            if(this._selectedButton == null)
            {
                return;
            }
            if(this._selectedButton == this.headButton || this._selectedButton == this.attachmentButton)
            {
                ExternalInterface.call("Callback_HeadCamera");
                if(Extensions.gfxProcessSound != null && enabled == true)
                {
                    Extensions.gfxProcessSound(this,"UI",this.headCameraSoundEffect);
                }
            }
            else
            {
                ExternalInterface.call("Callback_BodyCamera");
                if(Extensions.gfxProcessSound != null && enabled == true)
                {
                    Extensions.gfxProcessSound(this,"UI",this.bodyCameraSoundEffect);
                }
            }
            switch(this._selectedButton)
            {
                case this.characterButton:
                    this.setOptionList(this.gearList,this._characters,this._charactersString);
                    if(bManagerUsingGamepad)
                    {
                        this.gearList.tileList.selectedIndex = this._selectedCharacterIndex;
                    }
                    break;
                case this.headButton:
                    this.buttonPressed(this._heads,this._headsString);
                    if(bManagerUsingGamepad)
                    {
                        this.gearList.tileList.selectedIndex = this._selectedHeadIndex;
                    }
                    break;
                case this.bodyButton:
                    this.buttonPressed(this._bodies,this._bodiesString);
                    if(bManagerUsingGamepad)
                    {
                        this.gearList.tileList.selectedIndex = this._selectedBodyIndex;
                    }
                    break;
                case this.attachmentButton:
                    this.buttonPressed(this._attachments,this._attachmentString);
                    if(bManagerUsingGamepad)
                    {
                        this.gearList.tileList.selectedIndex = this._selectedAttachmentIndex;
                    }
            }
        }
        
        function buttonPressed(param1:Array, param2:String) : void
        {
            if(param1.length > 1)
            {
                this.setOptionList(this.gearList,param1,param2);
            }
            else if(param1[this._meshIndex].skinInfo.length > 1)
            {
                this.setOptionList(this.skinList,param1[this._meshIndex].skinInfo,this._skinsString);
            }
        }
        
        protected function setOptionList(param1:GearListContainer, param2:Array, param3:String, param4:Boolean = false) : void
        {
            this.deselectContainer();
            param1.bIsSubMenu = param4;
            if(sectionHeader != null && bOpen)
            {
                sectionHeader.controllerIconVisible = false;
            }
            param1.dataProvider = new DataProvider(param2);
            param1.listTitle = param3;
            param1.openContainer(bManagerUsingGamepad);
            if(bManagerUsingGamepad)
            {
                dimLeftSide(true);
            }
            this._bSelectingSkin = param1 == this.skinList;
            if(this._bSelectingSkin)
            {
                this.setSkinListSelectedIndex();
            }
        }
        
        protected function setSkinListSelectedIndex() : void
        {
            if(bManagerUsingGamepad)
            {
                if(this._bSelectingSkin)
                {
                    switch(this._selectedButton)
                    {
                        case this.headButton:
                            this.skinList.tileList.selectedIndex = this._selectedHeadSkinIndex;
                            break;
                        case this.bodyButton:
                            this.skinList.tileList.selectedIndex = this._selectedBodySkinIndex;
                            break;
                        case this.attachmentButton:
                            this.skinList.tileList.selectedIndex = this._selectedAttachmentSkinIndex;
                    }
                }
            }
        }
        
        protected function listSelect(param1:IndexEvent) : void
        {
            if(param1.index != CANCELLED_INDEX)
            {
                switch(this._selectedButton)
                {
                    case this.characterButton:
                        ExternalInterface.call("Callback_Character",this._characters[param1.index].ItemIndex);
                        this.selectButton();
                        this.selectContainer();
                        break;
                    case this.headButton:
                        this.chosenItem(this._heads,param1.index,"Callback_Head");
                        break;
                    case this.bodyButton:
                        this.chosenItem(this._bodies,param1.index,"Callback_Body");
                        break;
                    case this.attachmentButton:
                        this.chosenItem(this._attachments,param1.index,"Callback_Attachment");
                }
            }
            else if(param1.target.bIsSubMenu)
            {
                switch(this._selectedButton)
                {
                    case this.characterButton:
                        this.setOptionList(this.gearList,this._characters,this._charactersString);
                        if(bManagerUsingGamepad)
                        {
                            this.gearList.tileList.selectedIndex = this._selectedCharacterIndex;
                        }
                        break;
                    case this.headButton:
                        this.buttonPressed(this._heads,this._headsString);
                        if(bManagerUsingGamepad)
                        {
                            this.gearList.tileList.selectedIndex = this._selectedHeadIndex;
                        }
                        break;
                    case this.bodyButton:
                        this.buttonPressed(this._bodies,this._bodiesString);
                        if(bManagerUsingGamepad)
                        {
                            this.gearList.tileList.selectedIndex = this._selectedBodyIndex;
                        }
                        break;
                    case this.attachmentButton:
                        this.buttonPressed(this._attachments,this._attachmentString);
                        if(bManagerUsingGamepad)
                        {
                            this.gearList.tileList.selectedIndex = this._selectedAttachmentIndex;
                        }
                }
            }
            else
            {
                this.selectButton();
                this.selectContainer();
            }
        }
        
        function chosenItem(param1:Array, param2:int, param3:String) : void
        {
            var _loc4_:int = 0;
            if(!this._bSelectingSkin)
            {
                this._meshIndex = this._selectedButton != this.attachmentButton ? int(param2) : int(param2);
                if(this._meshIndex >= 0 && param1[param2].skinInfo && param1[param2].skinInfo.length > 0)
                {
                    this.setOptionList(this.skinList,param1[param2].skinInfo,this._skinsString,true);
                }
                else
                {
                    this.selectButton();
                    _loc4_ = this.Item_None;
                    if(param1[param2].ItemIndex != undefined)
                    {
                        _loc4_ = param1[param2].ItemIndex;
                    }
                    ExternalInterface.call(param3,_loc4_,-1);
                    this.selectContainer();
                }
            }
            else
            {
                this.selectButton();
                this._skinIndex = param2;
                if(param1[this._meshIndex].skinInfo[this._skinIndex].ItemIndex == undefined)
                {
                    ExternalInterface.call(param3,param1[this._meshIndex].ItemIndex,-1);
                }
                else
                {
                    if(param3 == "Callback_Weapon")
                    {
                        ExternalInterface.call(param3,param1[this._meshIndex].ItemIndex,param1[this._meshIndex].skinInfo[this._skinIndex].definition);
                    }
                    ExternalInterface.call(param3,param1[this._meshIndex].ItemIndex,param1[this._meshIndex].skinInfo[this._skinIndex].ItemIndex);
                }
                this.selectContainer();
                this._bSelectingSkin = false;
            }
        }
        
        function showWeaponOptions(param1:ButtonEvent = null) : void
        {
            this.skinList.closeContainer();
            this.gearList.closeContainer();
            this.characterButton.visible = false;
            this.bioTextArea.visible = false;
            this.headButton.visible = false;
            this.bodyButton.visible = false;
            this.attachmentButton.visible = false;
        }
        
        function hideWeaponOptions(param1:ButtonEvent = null) : void
        {
            this.skinList.closeContainer();
            this.gearList.closeContainer();
            this.characterButton.visible = true;
            this.bioTextArea.visible = true;
            this.headButton.visible = true;
            this.bodyButton.visible = true;
            this.attachmentButton.visible = true;
        }
        
        protected function handleOverEvent(param1:MouseEvent) : void
        {
            if(!this.gearList.bOpen && !this._bRotating)
            {
                if(param1.currentTarget == this.headButton)
                {
                    ExternalInterface.call("Callback_HeadCamera");
                    if(Extensions.gfxProcessSound != null && enabled == true)
                    {
                        Extensions.gfxProcessSound(this,"UI",this.headCameraSoundEffect);
                    }
                }
                else
                {
                    ExternalInterface.call("Callback_BodyCamera");
                    if(Extensions.gfxProcessSound != null && enabled == true)
                    {
                        Extensions.gfxProcessSound(this,"UI",this.bodyCameraSoundEffect);
                    }
                }
            }
        }
        
        protected function startRotate(param1:MouseEvent) : void
        {
            this._bRotating = true;
            this._prevX = stage.mouseX;
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.rotateCamera,false,0,true);
            stage.addEventListener(MouseEvent.MOUSE_UP,this.endRotate,false,0,true);
        }
        
        protected function endRotate(param1:MouseEvent) : void
        {
            this._bRotating = false;
            var _loc2_:int = stage.mouseX;
            var _loc3_:int = _loc2_ - this._prevX;
            this._prevX = _loc2_;
            ExternalInterface.call("Callback_EndRotateCamera");
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.rotateCamera);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.endRotate);
        }
        
        protected function rotateCamera(param1:MouseEvent) : void
        {
            var _loc2_:int = 0;
            var _loc3_:int = 0;
            if(this._bRotating)
            {
                _loc2_ = stage.mouseX;
                _loc3_ = _loc2_ - this._prevX;
                this._prevX = _loc2_;
                if(_loc3_ != 0)
                {
                    ExternalInterface.call("Callback_RotateCamera",_loc3_);
                }
            }
        }
        
        override protected function onInputChange(param1:Event) : *
        {
            super.onInputChange(param1);
            this.skinList.backButton.visible = !bManagerUsingGamepad && !this.skinList.bIsSubMenu ? true : false;
            this.gearList.backButton.visible = !bManagerUsingGamepad && !this.gearList.bIsSubMenu ? true : false;
            this.skinList.arrowBackButton.visible = !bManagerUsingGamepad && this.skinList.bIsSubMenu ? true : false;
            this.gearList.backButton.visible = !bManagerUsingGamepad && this.gearList.bIsSubMenu ? true : false;
        }
        
        private function testMenu() : *
        {
            var _loc1_:Array = new Array();
            var _loc2_:int = 1;
            while(_loc2_ < 5)
            {
                _loc1_.push({"label":"Item " + _loc2_});
                _loc2_++;
            }
            this.characterArray = _loc1_;
            this.bodyArray = _loc1_;
            this.headsArray = _loc1_;
        }
        
        public function selectButton(param1:CategoryButton = null) : *
        {
            this.characterButton.selected = false;
            this.headButton.selected = false;
            this.bodyButton.selected = false;
            this.attachmentButton.selected = false;
            if(param1 != null)
            {
                param1.selected = true;
            }
        }
    }
}
