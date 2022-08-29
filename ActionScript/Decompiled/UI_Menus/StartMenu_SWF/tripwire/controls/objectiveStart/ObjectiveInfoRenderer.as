package tripwire.controls.objectiveStart
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import scaleform.clik.controls.ListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class ObjectiveInfoRenderer extends ListItemRenderer
    {
         
        
        public var background:MovieClip;
        
        public var checkBoxCheck:MovieClip;
        
        public var leftFrame:MovieClip;
        
        public var rightFrame:MovieClip;
        
        public var rewardBG:MovieClip;
        
        public var tierNumberTextfield:TextField;
        
        public var rewardTextfield:TextField;
        
        public var iconImageLoader:TripUILoader;
        
        public var rewardImageLoader:TripUILoader;
        
        public var descriptionTextField:TextField;
        
        public var progressBar:ProgressBarWithText;
        
        public var iconFrame:MovieClip;
        
        public var rewardColor:Color;
        
        public var statusColor:Color;
        
        public var bumperColor:Color;
        
        public var inProgressColor:uint = 12453376;
        
        public var completeColor:uint = 15573775;
        
        public var inProgressTextColor:uint = 14538703;
        
        public var completeTextColor:uint = 0;
        
        private const TIER_1_COLOR:uint = 14538703;
        
        private const TIER_2_COLOR:uint = 14914404;
        
        private const TIER_3_COLOR:uint = 10921638;
        
        private const TIER_4_COLOR:uint = 8060927;
        
        private const TIER_5_COLOR:uint = 15573775;
        
        private const COMPLETE_ALPHA:Number = 0.32;
        
        private var tierColorArray:Array;
        
        public var bIsContracted:Boolean = false;
        
        public var descriptionFormat:TextFormat;
        
        private var oldDescription:String = "PLACEHOLDER_DESC";
        
        public function ObjectiveInfoRenderer()
        {
            this.rewardColor = new Color();
            this.statusColor = new Color();
            this.bumperColor = new Color();
            this.descriptionFormat = new TextFormat();
            super();
            preventAutosizing = true;
            this.leftFrame.visible = false;
            this.rightFrame.visible = false;
            this.rewardBG.visible = false;
            this.rewardImageLoader.visible = false;
            this.tierColorArray = [this.TIER_1_COLOR,this.TIER_2_COLOR,this.TIER_3_COLOR,this.TIER_4_COLOR,this.TIER_5_COLOR];
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
            this.descriptionTextField.autoSize = TextFieldAutoSize.LEFT;
            this.descriptionFormat = this.descriptionTextField.defaultTextFormat;
        }
        
        override public function set data(param1:Object) : void
        {
            var _loc2_:uint = 0;
            var _loc3_:uint = 0;
            super.data = param1;
            if(data)
            {
                visible = true;
                if(data.waveNum)
                {
                    gotoAndStop(!!this.bIsContracted ? "tierContracted" : "tierExpanded");
                    this.leftFrame.visible = true;
                    this.rightFrame.visible = true;
                    this.rewardImageLoader.visible = true;
                    this.rewardBG.visible = true;
                    this.tierNumberTextfield.text = !!data.waveNum ? data.waveNum : "";
                    this.tierNumberTextfield.textColor = !!data.tierNum ? uint(this.tierColorArray[data.tierNum]) : uint(this.TIER_1_COLOR);
                    this.rewardColor.setTint(!!data.tierNum ? uint(this.tierColorArray[data.tierNum]) : uint(this.TIER_1_COLOR),1);
                    this.rewardBG.transform.colorTransform = this.rewardColor;
                    this.leftFrame.gotoAndStop(!!data.tierNum ? data.tierNum + 1 : 1);
                    this.rightFrame.gotoAndStop(!!data.tierNum ? data.tierNum + 1 : 1);
                    this.rewardImageLoader.source = !!data.rewardPath ? data.rewardPath : "";
                    this.rewardTextfield.text = !!data.rewardName ? data.rewardName : "";
                    this.descriptionTextField.text = data.description && this.bIsContracted ? data.description : "";
                }
                else
                {
                    gotoAndStop("regular");
                    this.leftFrame.visible = false;
                    this.rightFrame.visible = false;
                    this.rewardImageLoader.visible = false;
                    this.rewardBG.visible = false;
                    this.descriptionTextField.text = !!data.description ? data.description : "";
                    this.iconImageLoader.source = !!data.iconPath ? data.iconPath : "";
                }
                label = !!data.label ? data.label : "";
                this.checkBoxCheck.visible = !!data.complete ? Boolean(data.complete) : false;
                this.progressBar.visible = !!data.showProgress ? Boolean(data.showProgress) : false;
                this.progressBar.progress = !!data.progress ? Number(data.progress) : Number(0);
                this.progressBar.progressText.text = !!data.textValue ? data.textValue : "";
                if(data.description && data.description != this.oldDescription)
                {
                    this.descriptionFormat.size = this.descriptionTextField.numLines > 2 ? 18 : 20;
                    this.descriptionTextField.setTextFormat(this.descriptionFormat);
                    this.oldDescription = data.description;
                }
            }
            else
            {
                visible = false;
            }
            if(this.checkBoxCheck.visible == true)
            {
                _loc2_ = this.completeColor;
                _loc3_ = this.completeColor;
                textField.textColor = this.completeColor;
                this.iconImageLoader.alpha = this.COMPLETE_ALPHA;
                this.progressBar.progressText.textColor = this.completeTextColor;
                if(data.waveNum)
                {
                    this.tierNumberTextfield.alpha = this.COMPLETE_ALPHA;
                    this.leftFrame.alpha = this.COMPLETE_ALPHA;
                    this.rightFrame.alpha = this.COMPLETE_ALPHA;
                    this.rewardBG.alpha = this.COMPLETE_ALPHA;
                    this.rewardTextfield.alpha = this.COMPLETE_ALPHA;
                }
            }
            else
            {
                _loc2_ = this.inProgressColor;
                _loc3_ = this.inProgressTextColor;
                textField.textColor = this.inProgressTextColor;
                this.iconImageLoader.alpha = 1;
                this.progressBar.progressText.textColor = this.inProgressTextColor;
                if(data.waveNum)
                {
                    this.tierNumberTextfield.alpha = 1;
                    this.leftFrame.alpha = 1;
                    this.rightFrame.alpha = 1;
                    this.rewardBG.alpha = 1;
                    this.rewardTextfield.alpha = 1;
                }
            }
            this.statusColor.setTint(_loc2_,1);
            this.bumperColor.setTint(_loc3_,1);
            this.iconFrame.transform.colorTransform = this.statusColor;
            this.progressBar.fillBar.transform.colorTransform = this.statusColor;
            this.progressBar.bumper_0.transform.colorTransform = this.bumperColor;
            this.progressBar.bumper_1.transform.colorTransform = this.bumperColor;
        }
    }
}
