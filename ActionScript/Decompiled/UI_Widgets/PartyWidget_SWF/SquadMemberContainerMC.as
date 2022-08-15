package
{
    import fl.motion.AnimatorFactory3D;
    import fl.motion.MotionBase;
    import fl.motion.motion_internal;
    import flash.geom.Point;
    import tripwire.controls.PartySlotButton;
    
    public dynamic class SquadMemberContainerMC extends PartySlotButton
    {
         
        
        public var __animFactory_AddHitboxMCaf1:AnimatorFactory3D;
        
        public var __animArray_AddHitboxMCaf1:Array;
        
        public var __motion_AddHitboxMCaf1:MotionBase;
        
        public function SquadMemberContainerMC()
        {
            super();
            addFrameScript(9,this.frame10,10,this.frame11,19,this.frame20,20,this.frame21,29,this.frame30,30,this.frame31,39,this.frame40);
            if(this.__animFactory_AddHitboxMCaf1 == null)
            {
                this.__animArray_AddHitboxMCaf1 = new Array();
                this.__motion_AddHitboxMCaf1 = new MotionBase();
                this.__motion_AddHitboxMCaf1.duration = 40;
                this.__motion_AddHitboxMCaf1.overrideTargetTransform();
                this.__motion_AddHitboxMCaf1.addPropertyArray("x",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("y",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("scaleX",[0.178574,0.178574,0.178574,0.178574,0.178574,0.178574,0.178574,0.178574,0.178574,0.178574]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("scaleY",[1]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("skewX",[0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("skewY",[0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("z",[0,0,0,0,0,0,0,0,0,0,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("rotationX",[0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("rotationY",[0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("rotationZ",[0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("visible",[true]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("alphaMultiplier",[0]);
                this.__motion_AddHitboxMCaf1.motion_internal::transformationPoint = new Point(-223.95,40);
                this.__motion_AddHitboxMCaf1.motion_internal::initialPosition = [-40,40,0];
                this.__motion_AddHitboxMCaf1.is3D = true;
                this.__motion_AddHitboxMCaf1.motion_internal::spanStart = 0;
                this.__animArray_AddHitboxMCaf1.push(this.__motion_AddHitboxMCaf1);
                this.__animFactory_AddHitboxMCaf1 = new AnimatorFactory3D(null,this.__animArray_AddHitboxMCaf1);
                this.__animFactory_AddHitboxMCaf1.addTargetInfo(this,"AddHitboxMC",0,true,0,true,null,-1);
            }
        }
        
        function frame10() : *
        {
            stop();
        }
        
        function frame11() : *
        {
            stop();
        }
        
        function frame20() : *
        {
            stop();
        }
        
        function frame21() : *
        {
            stop();
        }
        
        function frame30() : *
        {
            stop();
        }
        
        function frame31() : *
        {
            stop();
        }
        
        function frame40() : *
        {
            stop();
        }
    }
}
