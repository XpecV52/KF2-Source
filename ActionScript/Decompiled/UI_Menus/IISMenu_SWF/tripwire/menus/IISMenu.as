package tripwire.menus
{
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.utils.getDefinitionByName;
    import scaleform.gfx.TextFieldEx;
    import tripwire.containers.TripContainer;
    
    public class IISMenu extends TripContainer
    {
         
        
        public var textField:TextField;
        
        public var loadingMC:MovieClip;
        
        private var _loginText:String;
        
        private var _showLoading:Boolean;
        
        public const buttonIconBaseLine:int = 130;
        
        private var controllerIconObjects;
        
        private var aButtonBitmapdata:BitmapData;
        
        private var bButtonBitmapdata:BitmapData;
        
        private var xButtonBitmapdata:BitmapData;
        
        private var yButtonBitmapdata:BitmapData;
        
        private const controllerIconPrefix:String = "XboxTypeS_";
        
        public const assetSubstring:String = "_Asset";
        
        private const aButtonSubString:String = "XboxTypeS_A";
        
        private const bButtonSubString:String = "XboxTypeS_B";
        
        private const xButtonSubString:String = "XboxTypeS_X";
        
        private const yButtonSubString:String = "XboxTypeS_Y";
        
        public function IISMenu()
        {
            this.controllerIconObjects = new Array();
            super();
            this.aButtonBitmapdata = new (getDefinitionByName(this.aButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.bButtonBitmapdata = new (getDefinitionByName(this.bButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.xButtonBitmapdata = new (getDefinitionByName(this.xButtonSubString + this.assetSubstring) as Class)() as BitmapData;
            this.yButtonBitmapdata = new (getDefinitionByName(this.yButtonSubString + this.assetSubstring) as Class)() as BitmapData;
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
            TextFieldEx.setImageSubstitutions(this.textField,this.controllerIconObjects);
            TextFieldEx.setVerticalAlign(this.textField,"center");
            this.loadingMC.visible = false;
            this.loadingMC.stop();
        }
        
        public function get loginText() : String
        {
            return this._loginText;
        }
        
        public function set loginText(param1:String) : *
        {
            if(this._loginText == param1)
            {
                return;
            }
            this._loginText = param1;
            this.textField.htmlText = this._loginText;
        }
        
        public function get showLoading() : Boolean
        {
            return this._showLoading;
        }
        
        public function set showLoading(param1:Boolean) : *
        {
            if(this._showLoading == param1)
            {
                return;
            }
            this._showLoading = param1;
            if(this._showLoading)
            {
                this.loadingMC.gotoAndPlay(1);
            }
            else
            {
                this.loadingMC.stop();
            }
            this.loadingMC.visible = this._showLoading;
        }
    }
}
