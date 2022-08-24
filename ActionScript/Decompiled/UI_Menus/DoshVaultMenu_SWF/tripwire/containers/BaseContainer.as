package tripwire.containers
{
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.external.ExternalInterface;
    import scaleform.clik.constants.InputValue;
    import scaleform.clik.constants.NavigationCode;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.InputEvent;
    import scaleform.clik.ui.InputDetails;
    import scaleform.gfx.Extensions;
    import tripwire.controls.BaseButton;
    import tripwire.controls.ControllerButton;
    import tripwire.managers.MenuManager;
    
    public class BaseContainer extends UIComponent
    {
        
        public static const CANCELLED_INDEX:int = -1;
         
        
        protected var _selectedButton:BaseButton;
        
        protected var _selectedIndex:int;
        
        protected var _highlightedButton:BaseButton;
        
        protected var _highlightedIndex:int;
        
        protected var _traversableButtons:Vector.<BaseButton>;
        
        protected var _traversableContainers:Vector.<BaseContainer>;
        
        protected var _gamePadButtons:Vector.<ControllerButton>;
        
        private var _containerIndex:int;
        
        public function BaseContainer()
        {
            super();
            Extensions.enabled = true;
            _enableInitCallback = true;
            this._traversableButtons = new Vector.<BaseButton>();
            this._gamePadButtons = new Vector.<ControllerButton>();
            addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
            focused = 0;
        }
        
        public function get containerIndex() : int
        {
            return this._containerIndex;
        }
        
        public function set containerIndex(param1:int) : void
        {
            this._containerIndex = param1;
        }
        
        public function get bManagerUsingGamepad() : Boolean
        {
            if(MenuManager.manager != null)
            {
                return MenuManager.manager.bUsingGamepad;
            }
            return false;
        }
        
        protected function onAddedToStage(param1:Event) : void
        {
            if(this.bManagerUsingGamepad && this._traversableButtons.length > 0)
            {
                this._highlightedButton = this._traversableButtons[0];
                this._highlightedButton.highlighted();
            }
            stage.addEventListener(InputEvent.INPUT,this.handleInput,false,0,true);
            addEventListener(MouseEvent.ROLL_OVER,this.onOver,false,0,true);
            addEventListener(MouseEvent.ROLL_OUT,this.onOut,false,0,true);
        }
        
        protected function onOver(param1:MouseEvent) : void
        {
        }
        
        protected function onOut(param1:MouseEvent) : void
        {
        }
        
        public function SetControlScheme(param1:Boolean) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < this._gamePadButtons.length)
            {
                this._gamePadButtons[_loc2_].SetGamepadInput(param1);
                _loc2_++;
            }
        }
        
        override protected function changeFocus() : void
        {
            super.changeFocus();
            if(this.bManagerUsingGamepad)
            {
                if(focused)
                {
                    if(this._selectedButton)
                    {
                        this._selectedButton.unselected();
                    }
                    if(this._highlightedButton)
                    {
                        this._highlightedButton.unhighlighted();
                    }
                    if(this._traversableButtons.length > 0)
                    {
                        if(this._selectedIndex < this._traversableButtons.length)
                        {
                            this._highlightedButton = this._traversableButtons[this._highlightedIndex];
                            this._highlightedButton.highlighted();
                        }
                    }
                }
            }
        }
        
        public function addTraversableButton(param1:BaseButton, param2:int) : *
        {
            param1.addEventListener("buttonSelected",this.onButtonSelected);
            param1.bTraversable = true;
            param1.traversableIndex = param2;
            this._traversableButtons.push(param1);
        }
        
        public function addTraversableContainer(param1:BaseContainer, param2:int) : *
        {
            param1.containerIndex = param2;
            this._traversableContainers.push(param1);
        }
        
        protected function onButtonSelected(param1:Event) : void
        {
            var _loc2_:BaseButton = BaseButton(param1.currentTarget);
            this.switchButton(_loc2_);
        }
        
        protected function switchButton(param1:BaseButton) : void
        {
            if(param1.bTraversable)
            {
                if(this._selectedButton)
                {
                    this._selectedButton.unselected();
                }
                this._selectedIndex = param1.traversableIndex;
                this._selectedButton = param1;
            }
            param1.selected();
        }
        
        protected function decrementHighlightedIndex() : void
        {
            if(this._traversableButtons.length > 0)
            {
                this._highlightedIndex = this._highlightedIndex - 1;
                if(this._highlightedIndex < 0)
                {
                    this._highlightedIndex = this._traversableButtons.length - 1;
                }
                if(!this._traversableButtons[this._highlightedIndex].enabled)
                {
                    this.decrementHighlightedIndex();
                }
            }
        }
        
        protected function incrementHighlightedIndex() : void
        {
            if(this._traversableButtons.length > 0)
            {
                this._highlightedIndex += 1;
                if(this._highlightedIndex >= this._traversableButtons.length)
                {
                    this._highlightedIndex = 0;
                }
                if(!this._traversableButtons[this._highlightedIndex].enabled)
                {
                    this.incrementHighlightedIndex();
                }
            }
        }
        
        function highlightButton(param1:BaseButton) : *
        {
            if(this._highlightedButton)
            {
                this._highlightedButton.unhighlighted();
            }
            this._highlightedButton = param1;
            this._highlightedButton.highlighted();
        }
        
        override public function handleInput(param1:InputEvent) : void
        {
            if(param1.handled || !focused)
            {
                return;
            }
            var _loc2_:InputDetails = param1.details;
            if(_loc2_.value == InputValue.KEY_DOWN)
            {
                switch(_loc2_.navEquivalent)
                {
                    case NavigationCode.UP:
                        this.onUpPressed(_loc2_);
                        break;
                    case NavigationCode.DOWN:
                        this.onDownPressed(_loc2_);
                        break;
                    case NavigationCode.LEFT:
                        this.onLeftPressed(_loc2_);
                        break;
                    case NavigationCode.RIGHT:
                        this.onRightPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_A:
                        this.onAPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_X:
                        this.onXPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_B:
                        this.onBPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_Y:
                        this.onYPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_L1:
                        this.onLBPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_R1:
                        this.onRBPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_L2:
                        this.onLTPressed(_loc2_);
                        break;
                    case NavigationCode.GAMEPAD_R2:
                        this.onRTPressed(_loc2_);
                }
            }
            param1.handled = true;
        }
        
        protected function onAPressed(param1:InputDetails) : void
        {
            if(this._highlightedButton)
            {
                this.switchButton(this._highlightedButton);
            }
        }
        
        protected function onUpPressed(param1:InputDetails) : void
        {
            this.decrementHighlightedIndex();
            this.highlightButton(this._traversableButtons[this._highlightedIndex]);
        }
        
        protected function onDownPressed(param1:InputDetails) : void
        {
            this.incrementHighlightedIndex();
            this.highlightButton(this._traversableButtons[this._highlightedIndex]);
        }
        
        protected function onRightPressed(param1:InputDetails) : void
        {
        }
        
        protected function onLeftPressed(param1:InputDetails) : void
        {
        }
        
        protected function onXPressed(param1:InputDetails) : void
        {
        }
        
        protected function onBPressed(param1:InputDetails) : void
        {
        }
        
        protected function onYPressed(param1:InputDetails) : void
        {
        }
        
        protected function onLBPressed(param1:InputDetails) : void
        {
        }
        
        protected function onRBPressed(param1:InputDetails) : void
        {
        }
        
        protected function onLTPressed(param1:InputDetails) : void
        {
        }
        
        protected function onRTPressed(param1:InputDetails) : void
        {
        }
        
        public function closeMenu(param1:Number) : void
        {
            this.outroTween(param1);
        }
        
        protected function outroTween(param1:Number) : void
        {
        }
        
        protected function onOutroComplete() : void
        {
            ExternalInterface.call("Callback_CloseMenu");
        }
    }
}
