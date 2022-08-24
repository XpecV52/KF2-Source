package tripwire.containers.inventory
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.events.TweenEvent;
    import flash.display.InteractiveObject;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    import tripwire.controls.TripButton;
    import tripwire.controls.TripUILoader;
    
    public class InventoryItemDetailsContainer extends TripContainer
    {
         
        
        public var recycleButton:TripButton;
        
        public var cancelButton:TripButton;
        
        public var equipButton:TripButton;
        
        public var itemNameText:TextField;
        
        public var itemDescText:TextField;
        
        public var itemTypeText:TextField;
        
        public var itemCountText:TextField;
        
        public var itemCountBG:MovieClip;
        
        public var imageLoader:TripUILoader;
        
        public var currentItemDataObject:Object;
        
        public var useString:String;
        
        public var equipString:String;
        
        public var unequipString:String;
        
        public const ITP_WeaponSkin:int = 0;
        
        public const ITP_CharacterSkin:int = 1;
        
        public const ITP_Item:int = 2;
        
        public var _itemCount:int;
        
        public var bForceFocusToDetails:Boolean;
        
        public var readyToReopen:Boolean = true;
        
        public function InventoryItemDetailsContainer()
        {
            super();
            enableInitCallback = true;
            defaultNumPrompts = 2;
            TextFieldEx.setTextAutoSize(this.itemNameText,"shrink");
            TextFieldEx.setTextAutoSize(this.itemTypeText,"shrink");
        }
        
        public function set localizedText(param1:Object) : void
        {
            this.recycleButton.label = !!param1.recycle ? param1.recycle : "deconstruct";
            this.cancelButton.label = !!param1.cancel ? param1.cancel : "forget it";
            this.equipButton.label = !!param1.equip ? param1.equip : "put it";
            this.useString = !!param1.useString ? param1.useString : "";
            this.equipString = !!param1.equip ? param1.equip : "";
            this.unequipString = !!param1.unequip ? param1.unequip : "";
            this.cancelButton.label = !!param1.back ? param1.back : "";
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
            this.recycleButton.addEventListener(ButtonEvent.CLICK,this.recycleClicked,false,0,true);
            this.cancelButton.addEventListener(ButtonEvent.CLICK,this.cancelClicked,false,0,true);
            this.equipButton.addEventListener(ButtonEvent.CLICK,this.equipClicked,false,0,true);
            this.setTabIndex();
        }
        
        protected function setTabIndex() : *
        {
            this.recycleButton.tabIndex = 1;
            this.cancelButton.tabIndex = 2;
            this.equipButton.tabIndex = 3;
        }
        
        public function cancelClicked(param1:ButtonEvent) : void
        {
            if(_bReadyForInput)
            {
                closeContainer();
            }
        }
        
        public function equipClicked(param1:ButtonEvent) : void
        {
            if(bReadyForInput)
            {
                if(this.currentItemDataObject.type == this.ITP_WeaponSkin)
                {
                    ExternalInterface.call("Callback_Equip",this.currentItemDataObject.definition);
                }
                if(this.currentItemDataObject.exchangeable)
                {
                    ExternalInterface.call("Callback_UseItem",this.currentItemDataObject.definition);
                }
                closeContainer();
            }
        }
        
        public function recycleClicked(param1:ButtonEvent) : void
        {
            if(this.currentItemDataObject != null)
            {
                ExternalInterface.call("Callback_RecycleItem",this.currentItemDataObject.definition);
                closeContainer();
            }
        }
        
        public function set details(param1:Object) : void
        {
            this.openContainer();
            this.currentItemDataObject = param1;
            this.itemNameText.text = param1.label;
            this.itemDescText.htmlText = param1.description;
            this.itemCount = !!param1.count ? int(param1.count) : 0;
            this.equipButton.visible = param1.type == this.ITP_WeaponSkin || param1.exchangeable;
            if(param1.type == this.ITP_WeaponSkin)
            {
                this.equipButton.label = !!param1.active ? this.unequipString : this.equipString;
            }
            else if(param1.exchangeable)
            {
                this.equipButton.label = this.useString;
            }
            this.recycleButton.visible = param1.recyclable;
            if(param1.iconURLLarge && param1.iconURLLarge != "")
            {
                this.imageLoader.source = param1.iconURLLarge;
            }
            if(bManagerUsingGamepad && _bReadyForInput)
            {
                FocusManager.setFocus(!!this.equipButton.visible ? this.equipButton : this.cancelButton);
            }
            else
            {
                this.bForceFocusToDetails = true;
            }
            this.itemTypeText.text = !!param1.typeRarity ? param1.typeRarity : "";
            var _loc2_:Boolean = !!param1.newlyAdded ? Boolean(param1.newlyAdded) : false;
            this.itemCountText.visible = !_loc2_ && this._itemCount > 0;
            this.itemCountBG.visible = !_loc2_ && this._itemCount > 0;
        }
        
        public function set itemCount(param1:int) : void
        {
            this._itemCount = param1;
            if(this.itemCountText == null)
            {
                return;
            }
            this.itemCountText.visible = param1 > 1;
            this.itemCountBG.visible = param1 > 1;
            if(param1 == 0)
            {
                this.itemCountText.text = "";
                this.itemCountBG.visible = false;
            }
            else
            {
                this.itemCountText.text = "☓ " + this._itemCount.toString();
            }
        }
        
        override protected function openAnimation(param1:Boolean = true) : *
        {
            TweenMax.fromTo(this,8,{
                "z":-128,
                "autoAlpha":0
            },{
                "z":0,
                "autoAlpha":(!!param1 ? _defaultAlpha : _dimmedAlpha),
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":this.onOpened
            });
        }
        
        override protected function closeAnimation() : *
        {
            TweenMax.fromTo(this,8,{
                "z":0,
                "alpha":alpha
            },{
                "visible":false,
                "z":-128,
                "alpha":0,
                "ease":Cubic.easeOut,
                "useFrames":true,
                "onComplete":this.onClosed
            });
        }
        
        public function testDetails(param1:KeyboardEvent) : void
        {
            var _loc2_:Object = null;
            if(param1.keyCode == Keyboard.U)
            {
                _loc2_ = {
                    "label":"TEST OBJECT",
                    "description":"THIS IS A TEST",
                    "count":40,
                    "exchangeable":true,
                    "typeRarity":"RARE TEST OBJECT"
                };
                this.details = _loc2_;
            }
        }
        
        override public function openContainer(param1:Boolean = true) : void
        {
            super.openContainer(param1);
            this.readyToReopen = false;
        }
        
        override protected function onOpened(param1:TweenEvent = null) : void
        {
            super.onOpened(param1);
            if(bManagerUsingGamepad && this.bForceFocusToDetails && _bReadyForInput)
            {
                FocusManager.setFocus(!!this.equipButton.visible ? this.equipButton : this.cancelButton);
            }
        }
        
        override protected function onClosed(param1:TweenEvent = null) : void
        {
            super.onClosed(param1);
            this.readyToReopen = true;
        }
    }
}
