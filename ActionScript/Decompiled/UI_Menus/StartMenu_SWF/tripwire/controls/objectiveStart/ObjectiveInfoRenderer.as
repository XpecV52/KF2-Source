package tripwire.controls.objectiveStart
{
    import fl.motion.Color;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import scaleform.clik.controls.ListItemRenderer;
    import tripwire.controls.TripUILoader;
    
    public class ObjectiveInfoRenderer extends ListItemRenderer
    {
         
        
        public var background:MovieClip;
        
        public var checkBoxCheck:MovieClip;
        
        public var iconImageLoader:TripUILoader;
        
        public var descriptionTextField:TextField;
        
        public var progressBar:ProgressBarWithText;
        
        public var iconFrame:MovieClip;
        
        public var statusColor:Color;
        
        public var bumperColor:Color;
        
        public var inProgressColor:uint = 12453376;
        
        public var completeColor:uint = 15573775;
        
        public var inProgressTextColor:uint = 14538703;
        
        public var completeTextColor:uint = 0;
        
        public function ObjectiveInfoRenderer()
        {
            this.statusColor = new Color();
            this.bumperColor = new Color();
            super();
            preventAutosizing = true;
        }
        
        override public function set data(param1:Object) : void
        {
            var _loc2_:uint = 0;
            var _loc3_:uint = 0;
            super.data = param1;
            if(data)
            {
                visible = true;
                label = !!data.label ? data.label : "";
                this.iconImageLoader.source = !!data.iconPath ? data.iconPath : "";
                this.descriptionTextField.text = !!data.description ? data.description : "";
                this.checkBoxCheck.visible = !!data.complete ? Boolean(data.complete) : false;
                this.progressBar.visible = !!data.showProgres ? Boolean(data.showProgres) : false;
                this.progressBar.progress = !!data.progress ? Number(data.progress) : Number(0);
                this.progressBar.progressText.text = !!data.textValue ? data.textValue : "";
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
                this.iconImageLoader.alpha = 0.32;
                this.progressBar.progressText.textColor = this.completeTextColor;
            }
            else
            {
                _loc2_ = this.inProgressColor;
                _loc3_ = this.inProgressTextColor;
                textField.textColor = this.inProgressTextColor;
                this.iconImageLoader.alpha = 1;
                this.progressBar.progressText.textColor = this.inProgressTextColor;
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
