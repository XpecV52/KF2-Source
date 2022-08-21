package tripwire.tutorial
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Cubic;
    import com.greensock.easing.Expo;
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.external.ExternalInterface;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import flash.utils.getDefinitionByName;
    import scaleform.clik.controls.Button;
    import scaleform.clik.core.UIComponent;
    import scaleform.clik.events.ButtonEvent;
    import scaleform.gfx.FocusManager;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripUILoader;
    
    public class TutorialPopupContainer extends UIComponent
    {
         
        
        public var titleTextField:TextField;
        
        public var textField:TextField;
        
        public var countTextField:TextField;
        
        public var displayImage:TripUILoader;
        
        public var skipButton:Button;
        
        public var backButton:Button;
        
        public var nextButton:Button;
        
        public var imageBG:MovieClip;
        
        public var nextString:String;
        
        public var doneString:String;
        
        protected var _dataArray:Array;
        
        protected var _pageIndex:int;
        
        protected var _bUsingGamepad:Boolean;
        
        public const imageReplaceSubstring:String = "<%x%>";
        
        public const assetSubstring:String = "_Asset";
        
        public const buttonIconWidth:int = 32;
        
        public const buttonIconHeight:int = 32;
        
        public const buttonIconBaseLine:int = 100;
        
        private var dPadLeftBitmapdata:BitmapData;
        
        private var dPadRightBitmapdata:BitmapData;
        
        private var dPadUpBitmapdata:BitmapData;
        
        private var dPadDownBitmapdata:BitmapData;
        
        private var aButtonBitmapdata:BitmapData;
        
        private var bButtonBitmapdata:BitmapData;
        
        private var xButtonBitmapdata:BitmapData;
        
        private var yButtonBitmapdata:BitmapData;
        
        private var l1Bitmapdata:BitmapData;
        
        private var l2Bitmapdata:BitmapData;
        
        private var l3Bitmapdata:BitmapData;
        
        private var r1Bitmapdata:BitmapData;
        
        private var r2Bitmapdata:BitmapData;
        
        private var r3Bitmapdata:BitmapData;
        
        private const controllerIconPrefix:String = "XboxTypeS_";
        
        private const dDownSubString:String = "DPad_Down";
        
        private const dLeftSubString:String = "DPad_Left";
        
        private const dRightSubString:String = "DPad_Right";
        
        private const dUpSubString:String = "DPad_Up";
        
        private const aButtonSubString:String = "XboxTypeS_A";
        
        private const bButtonSubString:String = "XboxTypeS_B";
        
        private const xButtonSubString:String = "XboxTypeS_X";
        
        private const yButtonSubString:String = "XboxTypeS_Y";
        
        private const l1SubString:String = "LeftShoulder";
        
        private const l2SubString:String = "LeftTrigger";
        
        private const l3SubString:String = "LeftThumbStick";
        
        private const r1SubString:String = "RightShoulder";
        
        private const r2SubString:String = "RightTrigger";
        
        private const r3SubString:String = "RightThumbStick";
        
        private var controllerIconObjects;
        
        public const IMAGE_START_X:int = 136;
        
        public const BRACKET_START_X:int = 128;
        
        public const TEXT_START_X:int = 28;
        
        public const ITEM_ADJUST_X:int = 48;
        
        public var openCloseTimeline;
        
        public var changePageTimeline;
        
        public var bIsNextPage:Boolean = true;
        
        public function TutorialPopupContainer()
        {
            this.controllerIconObjects = new Array();
            this.openCloseTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            this.changePageTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            stage.scaleMode = StageScaleMode.SHOW_ALL;
            enableInitCallback = true;
            this.initBitMapsForController();
            this.alpha = 0;
        }
        
        public function initBitMapsForController() : void
        {
            this.dPadDownBitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.dDownSubString + this.assetSubstring) as Class)() as BitmapData;
            this.dPadLeftBitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.dLeftSubString + this.assetSubstring) as Class)() as BitmapData;
            this.dPadRightBitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.dRightSubString + this.assetSubstring) as Class)() as BitmapData;
            this.dPadUpBitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.dUpSubString + this.assetSubstring) as Class)() as BitmapData;
            this.aButtonBitmapdata = new (getDefinitionByName(this.aButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.bButtonBitmapdata = new (getDefinitionByName(this.bButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.xButtonBitmapdata = new (getDefinitionByName(this.xButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.yButtonBitmapdata = new (getDefinitionByName(this.yButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.l1Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.l1SubString + this.assetSubstring) as Class)() as BitmapData;
            this.l2Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.l2SubString + this.assetSubstring) as Class)() as BitmapData;
            this.l3Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.l3SubString + this.assetSubstring) as Class)() as BitmapData;
            this.r1Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.r1SubString + this.assetSubstring) as Class)() as BitmapData;
            this.r2Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.r2SubString + this.assetSubstring) as Class)() as BitmapData;
            this.r3Bitmapdata = new (getDefinitionByName(this.controllerIconPrefix + this.r3SubString + this.assetSubstring) as Class)() as BitmapData;
            this.controllerIconObjects.push({
                "subString":this.l1SubString,
                "image":this.l1Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.l1SubString
            });
            this.controllerIconObjects.push({
                "subString":this.l2SubString,
                "image":this.l2Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.l2SubString
            });
            this.controllerIconObjects.push({
                "subString":this.l3SubString,
                "image":this.l3Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.l3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r1SubString,
                "image":this.r1Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r1SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r2SubString,
                "image":this.r2Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r2SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r3SubString,
                "image":this.r3Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.dDownSubString,
                "image":this.dPadDownBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dLeftSubString,
                "image":this.dPadLeftBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dLeftSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dRightSubString,
                "image":this.dPadRightBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dRightSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dUpSubString,
                "image":this.dPadUpBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dUpSubString
            });
            this.controllerIconObjects.push({
                "subString":this.aButtonSubString,
                "image":this.aButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.aButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.bButtonSubString,
                "image":this.bButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.bButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.xButtonSubString,
                "image":this.xButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.xButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.yButtonSubString,
                "image":this.yButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.yButtonSubString
            });
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.skipButton.tabIndex = 1;
            this.backButton.tabIndex = 2;
            this.nextButton.tabIndex = 3;
            this.nextButton.addEventListener(ButtonEvent.PRESS,this.nextPage,false,0,true);
            this.backButton.addEventListener(ButtonEvent.PRESS,this.previousPage,false,0,true);
            this.skipButton.addEventListener(ButtonEvent.PRESS,this.skipButtonPressed,false,0,true);
            this.nextButton.preventAutosizing = true;
            this.backButton.preventAutosizing = true;
            this.skipButton.preventAutosizing = true;
            TextFieldEx.setVerticalAlign(this.textField,TextFieldEx.VALIGN_CENTER);
        }
        
        public function makeAnims() : void
        {
            this.openCloseTimeline.clear();
            this.openCloseTimeline.fromTo(this,8,{"alpha":1},{
                "alpha":0,
                "x":"-32",
                "immediateRender":false
            });
            this.openCloseTimeline.set(this,{"x":this.x});
            this.openCloseTimeline.set({},{},"+=6");
            this.changePageTimeline.clear();
            this.changePageTimeline.fromTo(this.textField,4,{
                "alpha":1,
                "x":this.TEXT_START_X
            },{
                "alpha":0,
                "x":this.TEXT_START_X - this.ITEM_ADJUST_X,
                "ease":Cubic.easeIn,
                "immediateRender":false
            });
            this.changePageTimeline.fromTo(this.imageBG,4,{
                "alpha":1,
                "x":this.BRACKET_START_X
            },{
                "alpha":0,
                "x":this.BRACKET_START_X - this.ITEM_ADJUST_X,
                "ease":Cubic.easeIn,
                "immediateRender":false
            },"-=4");
            this.changePageTimeline.fromTo(this.displayImage,4,{
                "alpha":1,
                "x":this.IMAGE_START_X
            },{
                "alpha":0,
                "x":this.IMAGE_START_X - this.ITEM_ADJUST_X,
                "ease":Cubic.easeIn,
                "immediateRender":false
            },"-=4");
            this.changePageTimeline.append(TweenMax.delayedCall(0,this.setNextPage,[],true));
            this.changePageTimeline.fromTo(this.displayImage,4,{
                "alpha":0,
                "x":this.IMAGE_START_X + this.ITEM_ADJUST_X
            },{
                "alpha":1,
                "x":this.IMAGE_START_X,
                "ease":Cubic.easeOut,
                "immediateRender":false
            });
            this.changePageTimeline.fromTo(this.imageBG,4,{
                "alpha":0,
                "x":this.BRACKET_START_X + this.ITEM_ADJUST_X
            },{
                "alpha":1,
                "x":this.BRACKET_START_X,
                "ease":Cubic.easeOut,
                "immediateRender":false
            },"-=4");
            this.changePageTimeline.fromTo(this.textField,4,{
                "alpha":0,
                "x":this.TEXT_START_X + this.ITEM_ADJUST_X
            },{
                "alpha":1,
                "x":this.TEXT_START_X,
                "ease":Cubic.easeOut,
                "immediateRender":false
            },"-=4");
        }
        
        public function nextPage(param1:ButtonEvent) : void
        {
            var _loc2_:int = this._pageIndex + 1;
            this.bIsNextPage = true;
            if(this._dataArray && _loc2_ < this._dataArray.length)
            {
                this.changePageTimeline.restart();
            }
            else
            {
                this.closeTutorial("Callback_Done");
            }
        }
        
        public function setNextPage() : void
        {
            if(this.bIsNextPage)
            {
                this.pageIndex = this._pageIndex + 1;
            }
            else
            {
                this.pageIndex = this._pageIndex - 1;
            }
        }
        
        public function set bUsingGamepad(param1:Boolean) : void
        {
            if(param1 != this._bUsingGamepad)
            {
                if(param1)
                {
                    FocusManager.setFocus(this.nextButton);
                }
                this._bUsingGamepad = param1;
            }
        }
        
        public function previousPage(param1:ButtonEvent) : void
        {
            this.bIsNextPage = false;
            this.changePageTimeline.reverse(0);
        }
        
        public function skipButtonPressed(param1:ButtonEvent) : void
        {
            this.closeTutorial("Callback_Skip");
        }
        
        public function closeTutorial(param1:String = null) : void
        {
            this.openCloseTimeline.call(parent.dispatchEvent,[new Event("FadeOut")],"-=6");
            this.openCloseTimeline.call(ExternalInterface.call,[param1],"-=2");
            this.openCloseTimeline.progress(0,false);
            this.openCloseTimeline.tweenTo(this.openCloseTimeline.duration(),{"ease":Cubic.easeOut});
        }
        
        public function set localizedText(param1:Object) : void
        {
            if(param1)
            {
                this.skipButton.label = !!param1.skip ? param1.skip : "_skip";
                this.backButton.label = !!param1.back ? param1.back : "_previous";
                this.nextString = !!param1.next ? param1.next : "_next";
                this.doneString = !!param1.done ? param1.done : "_done";
            }
        }
        
        public function set pageIndex(param1:int) : void
        {
            if(this._dataArray)
            {
                this._pageIndex = param1;
                this.titleTextField.text = !!this._dataArray[param1].title ? this._dataArray[param1].title : "";
                this.textField.htmlText = !!this._dataArray[param1].description ? this._dataArray[param1].description : "";
                TextFieldEx.setImageSubstitutions(this.textField,this.controllerIconObjects);
                this.displayImage.source = !!this._dataArray[param1].image ? this._dataArray[param1].image : "";
                this.nextButton.label = param1 < this._dataArray.length - 1 ? this.nextString : this.doneString;
                this.backButton.enabled = param1 > 0;
                this.countTextField.text = (param1 + 1).toString() + "/" + this._dataArray.length.toString();
                if(this._bUsingGamepad)
                {
                    FocusManager.setFocus(this.nextButton);
                }
            }
        }
        
        public function set data(param1:Array) : void
        {
            if(param1)
            {
                this._dataArray = param1;
                this.pageIndex = 0;
                this.makeAnims();
                parent.dispatchEvent(new Event("FadeIn"));
                this.openCloseTimeline.progress(1,false);
                this.openCloseTimeline.tweenTo(0,{"ease":Expo.easeOut});
            }
        }
        
        public function makeTestData() : void
        {
            var _loc3_:Object = null;
            var _loc4_:Object = null;
            this.localizedText = {};
            var _loc1_:Array = new Array();
            var _loc2_:int = 0;
            while(_loc2_ < 5)
            {
                if(_loc2_ % 2 == 1)
                {
                    _loc3_ = {
                        "title":"test" + _loc2_.toString(),
                        "description":"TEST TEST TEST",
                        "image":"kf2.png"
                    };
                    _loc1_.push(_loc3_);
                }
                else
                {
                    _loc4_ = {
                        "title":"test" + _loc2_.toString(),
                        "description":"TEST TEST TEST",
                        "image":"DOGE.png"
                    };
                    _loc1_.push(_loc4_);
                }
                _loc2_++;
            }
            this.data = _loc1_;
        }
        
        public function testAnims(param1:KeyboardEvent) : void
        {
            if(param1.keyCode == Keyboard.A)
            {
                this.makeTestData();
                trace("PRESSED A");
            }
        }
    }
}
