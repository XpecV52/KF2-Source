package
{
    import fl.motion.Color;
    import flash.text.TextField;
    import tripwire.controls.TripDescriptionIconButton;
    
    public dynamic class PerkSkillsDetailContainer extends TripDescriptionIconButton
    {
         
        
        public var skillName:TextField;
        
        public var descriptionText:TextField;
        
        public var iconColor:Color;
        
        public function PerkSkillsDetailContainer()
        {
            super();
            addFrameScript(0,this.frame1,9,this.frame10,10,this.frame11,19,this.frame20,29,this.frame30,30,this.frame31,39,this.frame40,40,this.frame41,49,this.frame50,50,this.frame51,59,this.frame60,60,this.frame61,69,this.frame70,70,this.frame71,79,this.frame80);
        }
        
        function frame1() : *
        {
            iconLoader;
            textField;
            descriptionTextfield;
            this.skillName = new TextField();
            this.descriptionText = new TextField();
            this.iconColor = new Color();
            this.skillName = textField;
            this.descriptionText = descriptionTextfield;
            this.iconColor.setTint(12234399,1);
            this.skillName.textColor = 12234399;
            this.descriptionText.textColor = 12234399;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame10() : *
        {
            stop();
        }
        
        function frame11() : *
        {
            this.iconColor.setTint(16503487,1);
            this.skillName.textColor = 16503487;
            this.descriptionText.textColor = 16503487;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame20() : *
        {
            stop();
        }
        
        function frame30() : *
        {
            stop();
        }
        
        function frame31() : *
        {
            this.iconColor.setTint(6710886,1);
            this.skillName.textColor = 6710886;
            this.descriptionText.textColor = 6710886;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame40() : *
        {
            stop();
        }
        
        function frame41() : *
        {
            this.iconColor.setTint(16503487,1);
            this.skillName.textColor = 16503487;
            this.descriptionText.textColor = 16503487;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame50() : *
        {
            stop();
        }
        
        function frame51() : *
        {
            this.iconColor.setTint(16503487,1);
            this.skillName.textColor = 16503487;
            this.descriptionText.textColor = 16503487;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame60() : *
        {
            stop();
        }
        
        function frame61() : *
        {
            this.iconColor.setTint(16503487,1);
            this.skillName.textColor = 16503487;
            this.descriptionText.textColor = 16503487;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame70() : *
        {
            stop();
        }
        
        function frame71() : *
        {
            this.iconColor.setTint(6710886,1);
            this.skillName.textColor = 6710886;
            this.descriptionText.textColor = 6710886;
            iconLoader.transform.colorTransform = this.iconColor;
        }
        
        function frame80() : *
        {
            stop();
        }
    }
}
