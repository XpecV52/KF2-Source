package
{
    import tripwire.widgets.ControllerWeaponSelectWidget;
    
    public dynamic class ControllerWeaponSelectContainer extends ControllerWeaponSelectWidget
    {
         
        
        public function ControllerWeaponSelectContainer()
        {
            super();
            addFrameScript(0,this.frame1);
        }
        
        function frame1() : *
        {
            stop();
        }
    }
}
