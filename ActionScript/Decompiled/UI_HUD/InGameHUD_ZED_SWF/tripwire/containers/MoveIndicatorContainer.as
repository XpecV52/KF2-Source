package tripwire.containers
{
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.utils.getDefinitionByName;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripUILoader;
    
    public class MoveIndicatorContainer extends UIComponent
    {
         
        
        public var iconLoaderMC:TripUILoader;
        
        public var progressBarMC:MovieClip;
        
        public var moveBlood:MovieClip;
        
        public var progressBarDefaultWidth:Number;
        
        public var keyBindTxt:TextField;
        
        public var nameTxt:TextField;
        
        public var countTxt:TextField;
        
        private var _data:Object;
        
        private var controllerIconObjects;
        
        public const imageReplaceSubstring:String = "<%x%>";
        
        public const assetSubstring:String = "_Asset";
        
        public const buttonIconWidth:int = 32;
        
        public const buttonIconHeight:int = 32;
        
        public const buttonIconBaseLine:int = 100;
        
        public const bloodAlpha:Number = 0.48;
        
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
        
        public function MoveIndicatorContainer()
        {
            this.controllerIconObjects = new Array();
            super();
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
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.l2SubString,
                "image":this.l2Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.l3SubString,
                "image":this.l3Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r1SubString,
                "image":this.r1Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r3SubString
            });
            this.controllerIconObjects.push({
                "subString":this.r2SubString,
                "image":this.r2Bitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.r3SubString
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
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dRightSubString,
                "image":this.dPadRightBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.dUpSubString,
                "image":this.dPadUpBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.dDownSubString
            });
            this.controllerIconObjects.push({
                "subString":this.aButtonSubString,
                "image":this.aButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.bButtonSubString
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
                "id":this.bButtonSubString
            });
            this.controllerIconObjects.push({
                "subString":this.yButtonSubString,
                "image":this.yButtonBitmapdata,
                "baseLineY":this.buttonIconBaseLine,
                "width":32,
                "height":32,
                "id":this.bButtonSubString
            });
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            visible = false;
            this.progressBarDefaultWidth = this.progressBarMC.width;
            this.progressBarMC.visible = false;
        }
        
        public function set data(param1:Object) : void
        {
            var _loc2_:Number = NaN;
            if(param1)
            {
                visible = true;
                if(param1.image)
                {
                    this.iconLoaderMC.source = param1.image;
                }
                _loc2_ = param1.progressPercent * 100;
                this.progressBarMC.gotoAndStop(_loc2_ + 1);
                if(_loc2_ < 100 && this.moveBlood.alpha == 1)
                {
                    this.progressBarMC.visible = true;
                    this.moveBlood.alpha = this.bloodAlpha;
                    this.iconLoaderMC.alpha = this.bloodAlpha;
                }
                if(_loc2_ == 100 && this.moveBlood.alpha < 1)
                {
                    this.progressBarMC.visible = false;
                    this.moveBlood.alpha = 1;
                    this.iconLoaderMC.alpha = 1;
                }
                if(!this._data || param1.buttonString != undefined && this._data.buttonString != param1.buttonString)
                {
                    if(param1.buttonString != null)
                    {
                        this.updateButtonString(param1.buttonString);
                    }
                }
                if(param1.count != undefined)
                {
                    this.countTxt.text = !!param1.count ? param1.count : "";
                }
                this.nameTxt.text = !!param1.moveName ? param1.moveName : "";
            }
            else
            {
                visible = false;
            }
            this._data = param1;
        }
        
        public function updateButtonString(param1:String) : void
        {
            if(param1.length > 15)
            {
                param1 = param1.substring(this.controllerIconPrefix.length);
            }
            this.keyBindTxt.text = param1;
            TextFieldEx.setImageSubstitutions(this.keyBindTxt,this.controllerIconObjects);
        }
    }
}
