package
{
    import tripwire.controls.voiceComms.VoiceCommsOptionRenderer;
    
    public dynamic class VoiceCommTopRenderer extends VoiceCommsOptionRenderer
    {
         
        
        public function VoiceCommTopRenderer()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame2() : *
        {
            stop();
        }
        
        function frame3() : *
        {
            stop();
        }
    }
}
