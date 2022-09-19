package tripwire.widgets
{
    import flash.text.TextField;
    import scaleform.clik.core.UIComponent;
    
    public class GunGameWidget extends UIComponent
    {
         
        
        public var GunGameLabel:TextField;
        
        public var GunPointsLabel:TextField;
        
        public var Level:TextField;
        
        public var Score:TextField;
        
        private var score:int = 0;
        
        private var max_score:int = 0;
        
        private var level:int = 0;
        
        private var max_level:int = 0;
        
        public function GunGameWidget()
        {
            super();
            enableInitCallback = true;
        }
        
        public function set GunGameSetVisibility(param1:Boolean) : void
        {
            this.visible = param1;
        }
        
        public function set WeaponLevelSetLocalised(param1:String) : *
        {
            this.GunGameLabel.text = param1;
        }
        
        public function set GunPointsSetLocalised(param1:String) : *
        {
            this.GunPointsLabel.text = param1;
        }
        
        public function set GunGameSetLevel(param1:int) : void
        {
            this.level = param1;
            this.Level.text = this.level.toString() + " / " + this.max_level.toString();
        }
        
        public function set GunGameSetMaxLevel(param1:int) : void
        {
            this.max_level = param1;
            this.Level.text = this.level.toString() + " / " + this.max_level.toString();
        }
        
        public function set GunGameSetScore(param1:int) : void
        {
            this.score = param1;
            this.Score.text = this.score.toString() + " / " + this.max_score.toString();
        }
        
        public function set GunGameSetMaxScore(param1:int) : void
        {
            this.max_score = param1;
            if(this.max_score >= 0)
            {
                this.Score.text = this.score.toString() + " / " + this.max_score.toString();
            }
            else
            {
                this.Score.text = this.score.toString() + " / -";
            }
        }
    }
}
