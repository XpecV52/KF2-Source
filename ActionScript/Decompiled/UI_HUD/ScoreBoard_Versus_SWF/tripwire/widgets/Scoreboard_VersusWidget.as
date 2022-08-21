package tripwire.widgets
{
    import flash.text.TextField;
    
    public class Scoreboard_VersusWidget extends ScoreboardWidget
    {
         
        
        public var scoreText:TextField;
        
        public function Scoreboard_VersusWidget()
        {
            super();
        }
        
        override public function set localizeText(param1:Object) : void
        {
            super.localizeText = param1;
            this.scoreText.text = !!param1.scoreText ? param1.scoreText : "";
        }
    }
}
