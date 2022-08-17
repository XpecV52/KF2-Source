package
{
    import tripwire.widgets.InteractionMsgWidget;
    
    public dynamic class InteractionMessage extends InteractionMsgWidget
    {
         
        
        public function InteractionMessage()
        {
            super();
            addFrameScript(0,this.frame1,6,this.frame7,11,this.frame12);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame7() : *
        {
            stop();
        }
        
        function frame12() : *
        {
            stop();
        }
    }
}
