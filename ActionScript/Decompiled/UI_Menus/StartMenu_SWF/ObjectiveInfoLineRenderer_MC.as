package
{
    import flash.events.Event;
    import flash.utils.Dictionary;
    import tripwire.controls.objectiveStart.ObjectiveInfoRenderer;
    
    public dynamic class ObjectiveInfoLineRenderer_MC extends ObjectiveInfoRenderer
    {
         
        
        public var __setPropDict:Dictionary;
        
        public var __lastFrameProp:int = -1;
        
        public function ObjectiveInfoLineRenderer_MC()
        {
            this.__setPropDict = new Dictionary(true);
            super();
            addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
            addEventListener(Event.FRAME_CONSTRUCTED,this.__setProp_handler,false,0,true);
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
                progressBar.fillBarOriginalWidth = 160;
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
        
        function __setProp_progressBar_ObjectiveInfoLineRenderer_MC_progressBar_1(param1:int) : *
        {
            if(progressBar != null && param1 >= 2 && param1 <= 3 && (this.__setPropDict[progressBar] == undefined || !(int(this.__setPropDict[progressBar]) >= 2 && int(this.__setPropDict[progressBar]) <= 3)))
            {
                this.__setPropDict[progressBar] = param1;
                try
                {
                    progressBar["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                }
                progressBar.enabled = true;
                progressBar.enableInitCallback = false;
                progressBar.fillBarOriginalWidth = 0;
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
        
        function __setProp_handler(param1:Object) : *
        {
            var _loc2_:int = currentFrame;
            if(this.__lastFrameProp == _loc2_)
            {
                return;
            }
            this.__lastFrameProp = _loc2_;
            this.__setProp_progressBar_ObjectiveInfoLineRenderer_MC_progressBar_1(_loc2_);
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
