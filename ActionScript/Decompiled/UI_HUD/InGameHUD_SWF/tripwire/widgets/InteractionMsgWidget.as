package tripwire.widgets
{
    import com.greensock.TimelineMax;
    import com.greensock.TweenMax;
    import com.greensock.easing.Circ;
    import com.greensock.easing.Expo;
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.utils.getDefinitionByName;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.TextFieldEx;
    
    public class InteractionMsgWidget extends UIComponent
    {
         
        
        public var hitbox:MovieClip;
        
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
        
        public var InteractionStartZ:Number;
        
        public var buttonText:TextField;
        
        public var textField:TextField;
        
        public var tempText:TextField;
        
        public var Scanlines:MovieClip;
        
        public var BG:MovieClip;
        
        public var mainTimeline:TimelineMax;
        
        public var adjustHeight:int = 48;
        
        public var BGTargetWidth:int = 16;
        
        public const ADJUST_X:int = 16;
        
        public const BGStartHeight:int = 48;
        
        public const BGMaxHeight:int = 80;
        
        public const TARGET_ALPHA:Number = 0.88;
        
        public function InteractionMsgWidget()
        {
            this.controllerIconObjects = new Array();
            this.mainTimeline = new TimelineMax({
                "paused":true,
                "useFrames":true
            });
            super();
            _enableInitCallback = true;
            visible = false;
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
                "width":40,
                "height":40,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.l2SubString,
                "image":this.l2Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.l3SubString,
                "image":this.l3Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r1SubString,
                "image":this.r1Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r2SubString,
                "image":this.r2Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r3SubString,
                "image":this.r3Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.dDownSubString,
                "image":this.dPadDownBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dLeftSubString,
                "image":this.dPadLeftBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dRightSubString,
                "image":this.dPadRightBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dUpSubString,
                "image":this.dPadUpBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.aButtonSubString,
                "image":this.aButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.bButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.bButtonSubString,
                "image":this.bButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.bButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.xButtonSubString,
                "image":this.xButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.bButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.yButtonSubString,
                "image":this.yButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":40,
                "height":40,
                "id":this.bButtonSubString
            });
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            this.InteractionStartZ = this.z;
            alpha = 0;
            visible = false;
            super.addedToStage(param1);
            TextFieldEx.setVerticalAlign(this.textField,TextFieldEx.VALIGN_CENTER);
            TextFieldEx.setVerticalAlign(this.buttonText,TextFieldEx.VALIGN_CENTER);
            this.textField.autoSize = TextFieldAutoSize.LEFT;
            this.buttonText.autoSize = TextFieldAutoSize.RIGHT;
        }
        
        public function showInteractionMessage(param1:String = "", param2:String = "") : void
        {
            param1 = param1.split("<%X%>").join("");
            this.tempText.text = param1;
            if(!visible)
            {
                this.textField.alpha = 0;
                this.buttonText.alpha = 0;
                this.assignVals(param1,param2,true,true);
            }
            else if(visible && this.textField.text == this.tempText.text)
            {
                if(this.textField.alpha < 1 && this.textField.alpha > 0)
                {
                    this.textField.alpha = 1;
                    this.buttonText.alpha = 1;
                }
                else if(alpha < this.TARGET_ALPHA)
                {
                    this.makeAnims(true,true,true,true);
                }
                else if(this.BG.width < this.BGTargetWidth)
                {
                    this.makeAnims(false,true,false,true);
                }
            }
            else
            {
                this.textField.alpha = 0;
                this.buttonText.alpha = 0;
                if(alpha < this.TARGET_ALPHA)
                {
                    this.assignVals(param1,param2,true,true);
                }
                else
                {
                    this.assignVals(param1,param2,false,false);
                }
            }
        }
        
        public function assignVals(param1:String = "", param2:String = "", param3:Boolean = false, param4:Boolean = false) : void
        {
            var _loc5_:Number = this.hitbox.width;
            this.buttonText.width = 0;
            this.textField.width = 0;
            this.buttonText.text = "";
            if(param2 != "")
            {
                this.buttonText.text = "〘 " + param2 + " 〙";
            }
            this.textField.text = param1;
            TextFieldEx.setImageSubstitutions(this.buttonText,this.controllerIconObjects);
            _loc5_ -= this.textField.width + this.buttonText.width;
            this.adjustHeight = this.textField.numLines > 1 ? int(this.BGMaxHeight) : int(this.BGStartHeight);
            this.BGTargetWidth = this.buttonText.width + this.textField.width + this.ADJUST_X * 2;
            this.buttonText.x = param2 == "" ? Number(_loc5_ / 2) : Number(_loc5_ / 2 - 8);
            this.textField.x = this.buttonText.x + this.buttonText.width;
            this.makeAnims(param3,true,param4,true);
        }
        
        public function makeAnims(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true) : void
        {
            this.mainTimeline.stop();
            this.mainTimeline.clear();
            if(param1)
            {
                this.mainTimeline.set(this,{"visible":false});
                this.mainTimeline.fromTo(this,4,{
                    "z":this.InteractionStartZ + 128,
                    "alpha":0,
                    "visible":true
                },{
                    "z":this.InteractionStartZ,
                    "alpha":this.TARGET_ALPHA + 0.01,
                    "immediateRender":false,
                    "ease":Circ.easeIn
                });
            }
            if(param5)
            {
                if(param3)
                {
                    this.mainTimeline.append(TweenMax.allFromTo([this.BG,this.Scanlines],4,{
                        "width":this.ADJUST_X,
                        "height":this.BGStartHeight
                    },{
                        "width":this.BGTargetWidth,
                        "height":this.adjustHeight,
                        "immediateRender":false,
                        "ease":Expo.easeOut
                    }));
                }
                else if(!param3)
                {
                    this.mainTimeline.append(TweenMax.allTo([this.BG,this.Scanlines],4,{
                        "width":this.BGTargetWidth,
                        "height":this.adjustHeight,
                        "ease":Expo.easeOut
                    }));
                }
            }
            else if(!param5)
            {
                this.mainTimeline.append(TweenMax.allTo([this.BG,this.Scanlines],1,{
                    "width":this.ADJUST_X,
                    "height":this.BGStartHeight
                }));
            }
            if(param2)
            {
                this.mainTimeline.append(TweenMax.allFromTo([this.textField,this.buttonText],4,{"alpha":0},{
                    "alpha":1,
                    "immediateRender":false,
                    "ease":Circ.easeOut
                }));
            }
            if(param4)
            {
                this.mainTimeline.seek(0);
                this.mainTimeline.play();
            }
            else if(!param4)
            {
                this.mainTimeline.reverse(0);
            }
        }
        
        public function outInteractionMessage() : void
        {
            if(visible && !this.mainTimeline.reversed())
            {
                if(this.textField.alpha > 0)
                {
                    this.makeAnims(true,true,true,false);
                }
                else if(alpha < this.TARGET_ALPHA)
                {
                    this.makeAnims(true,false,true,false,false);
                }
                else
                {
                    this.makeAnims(true,false,true,false);
                }
            }
        }
    }
}
