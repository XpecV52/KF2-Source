package tripwire.containers
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    import scaleform.gfx.TextFieldEx;
    import tripwire.controls.TripUILoader;
    import tripwire.managers.HudManager;
    
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
        
        public const controllerIconPrefix:String = "XboxTypeS_";
        
        public const imageReplaceSubstring:String = "<%x%>";
        
        public const assetSubstring:String = "_Asset";
        
        public const buttonIconWidth:int = 32;
        
        public const buttonIconHeight:int = 32;
        
        public const buttonIconBaseLine:int = 100;
        
        public const bloodAlpha:Number = 0.48;
        
        public function MoveIndicatorContainer()
        {
            this.controllerIconObjects = new Array();
            super();
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
            TextFieldEx.setImageSubstitutions(this.keyBindTxt,HudManager.manager.controllerIconObjects);
        }
    }
}
