package
{
    import tripwire.controls.voiceComms.VoiceCommsOptionRenderer;
    
    public dynamic class VoiceCommBotRenderer extends VoiceCommsOptionRenderer
    {
         
        
        public function VoiceCommBotRenderer()
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
