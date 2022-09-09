package tripwire.controls
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    
    public class FriendsTitle extends MovieClip
    {
         
        
        public var btnPlus:PlusButton;
        
        public var btnMinus:MinusButton;
        
        public var titleTextField:TextField;
        
        public function FriendsTitle()
        {
            super();
            this.showMinus();
        }
        
        public function showMinus() : *
        {
            this.btnPlus.visible = false;
            this.btnMinus.visible = true;
        }
        
        public function showPlus() : *
        {
            this.btnPlus.visible = true;
            this.btnMinus.visible = false;
        }
    }
}
