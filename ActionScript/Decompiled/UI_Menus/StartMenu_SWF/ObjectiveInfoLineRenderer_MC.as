package
{
    import flash.utils.Dictionary;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    
    public dynamic class ObjectiveInfoLineRenderer_MC extends ObjectiveInfoRenderer
    {
         
        
        public var __setPropDict:Dictionary;
        
        public function ObjectiveInfoLineRenderer_MC()
        {
            this.__setPropDict = new Dictionary(true);
            super();
            addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
        }
        
        function __setProp_progressBar_ObjectiveInfoLineRenderer_MC_progressBar_0() : *
        {
            if(this.__setPropDict[progressBar] == undefined || int(this.__setPropDict[progressBar]) != 1)
            {
                this.__setPropDict[progressBar] = 1;
                try
                {
                    progressBar["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                }
                progressBar.enabled = true;
                progressBar.enableInitCallback = false;
                progressBar.fillBarOriginalWidth = 176;
                progressBar.visible = true;
                try
                {
                    progressBar["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                }
            }
        }
        
        function frame1() : *
        {
            this.__setProp_progressBar_ObjectiveInfoLineRenderer_MC_progressBar_0();
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
