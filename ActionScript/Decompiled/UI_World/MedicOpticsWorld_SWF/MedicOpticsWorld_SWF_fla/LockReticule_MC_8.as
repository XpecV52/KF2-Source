package MedicOpticsWorld_SWF_fla
{
    import flash.display.MovieClip;
    
    public dynamic class LockReticule_MC_8 extends MovieClip
    {
         
        
        public var LockReticulInner:MovieClip;
        
        public var LockReticuleOuter:MovieClip;
        
        public var LockedReticule:MovieClip;
        
        public function LockReticule_MC_8()
        {
            super();
            addFrameScript(0,this.frame1,120,this.frame121,121,this.frame122);
        }
        
        function frame1() : *
        {
            stop();
        }
        
        function frame121() : *
        {
            this.gotoAndPlay("Locking");
        }
        
        function frame122() : *
        {
            stop();
        }
    }
}
