package tripwire.controls
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    
    public class OtherFriendsTitle extends MovieClip
    {
         
        
        public var btnPlus:PlusButton;
        
        public var btnMinus:MinusButton;
        
        public var titleTextField:TextField;
        
        public var orangeTitleBG:MovieClip;
        
        public function OtherFriendsTitle()
        {
            super();
            this.showMinus();
            this.orangeTitleBG.visible = false;
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
        
        public function onFocusChange(param1:Boolean) : *
        {
            this.orangeTitleBG.visible = param1 || this.btnPlus.hasFocus || this.btnMinus.hasFocus;
        }
    }
}
