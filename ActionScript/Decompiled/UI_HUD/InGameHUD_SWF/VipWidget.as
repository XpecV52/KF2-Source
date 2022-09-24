package
{
    import tripwire.widgets.VIPWidget;
    
    public dynamic class VipWidget extends VIPWidget
    {
         
        
        public function VipWidget()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame2() : *
        {
            stop();
        }
    }
}
