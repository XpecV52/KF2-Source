package
{
    import adobe.utils.*;
    import fl.motion.AnimatorFactory3D;
    import fl.motion.MotionBase;
    import fl.motion.motion_internal;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.media.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.engine.*;
    import flash.text.ime.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    import tripwire.controls.PartySlotButton;
    
    public dynamic class SquadMemberContainerMC extends PartySlotButton
    {
         
        
        public var __animFactory_AddHitboxMCaf1:AnimatorFactory3D;
        
        public var __animArray_AddHitboxMCaf1:Array;
        
        public var ____motion_AddHitboxMCaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_AddHitboxMCaf1_matArray__:Array;
        
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
                this.__motion_AddHitboxMCaf1.addPropertyArray("alphaMultiplier",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("blendMode",["normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal","normal"]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("cacheAsBitmap",[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("opaqueBackground",[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]);
                this.__motion_AddHitboxMCaf1.addPropertyArray("visible",[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]);
                this.__motion_AddHitboxMCaf1.is3D = true;
                this.__motion_AddHitboxMCaf1.motion_internal::spanStart = 0;
                this.____motion_AddHitboxMCaf1_matArray__ = new Array();
                this.____motion_AddHitboxMCaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_AddHitboxMCaf1_mat3DVec__[0] = 0.178574;
                this.____motion_AddHitboxMCaf1_mat3DVec__[1] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[2] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[3] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[4] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[5] = 1;
                this.____motion_AddHitboxMCaf1_mat3DVec__[6] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[7] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[8] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[9] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[10] = 1;
                this.____motion_AddHitboxMCaf1_mat3DVec__[11] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[12] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[13] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[14] = 0;
                this.____motion_AddHitboxMCaf1_mat3DVec__[15] = 1;
                this.____motion_AddHitboxMCaf1_matArray__.push(new Matrix3D(this.____motion_AddHitboxMCaf1_mat3DVec__));
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.____motion_AddHitboxMCaf1_matArray__.push(null);
                this.__motion_AddHitboxMCaf1.addPropertyArray("matrix3D",this.____motion_AddHitboxMCaf1_matArray__);
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
