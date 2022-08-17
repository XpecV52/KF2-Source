package VersusLobbyWidget_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class MainTimeline extends MovieClip
    {
         
        
        public var partyWidget:SquadContainerMC;
        
        public function MainTimeline()
        {
            super();
            this.__setProp_partyWidget_Scene1_partyWidget_0();
        }
        
        function __setProp_partyWidget_Scene1_partyWidget_0() : *
        {
            try
            {
                this.partyWidget["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            this.partyWidget.enabled = true;
            this.partyWidget.enableInitCallback = true;
            this.partyWidget.visible = true;
            try
            {
                this.partyWidget["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
