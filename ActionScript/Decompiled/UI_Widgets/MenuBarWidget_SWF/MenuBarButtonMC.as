package
{
    import tripwire.controls.MenuBarButton;
    
    public dynamic class MenuBarButtonMC extends MenuBarButton
    {
         
        
        public function MenuBarButtonMC()
        {
            super();
            addFrameScript(0,this.frame1,19,this.frame20);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame20() : *
        {
            gotoAndPlay("pulse");
        }
    }
}
