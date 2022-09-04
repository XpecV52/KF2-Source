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
    import tripwire.containers.hud.ObjectiveProgressContainer;
    
    public dynamic class ObjectiveWidget extends ObjectiveProgressContainer
    {
         
        
        public var __animFactory_progressDoshIconMCaf1:AnimatorFactory3D;
        
        public var __animArray_progressDoshIconMCaf1:Array;
        
        public var ____motion_progressDoshIconMCaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_progressDoshIconMCaf1_matArray__:Array;
        
        public var __motion_progressDoshIconMCaf1:MotionBase;
        
        public function ObjectiveWidget()
        {
            super();
            addFrameScript(0,this.frame1,1,this.frame2);
            if(this.__animFactory_progressDoshIconMCaf1 == null)
            {
                this.__animArray_progressDoshIconMCaf1 = new Array();
                this.__motion_progressDoshIconMCaf1 = new MotionBase();
                this.__motion_progressDoshIconMCaf1.duration = 2;
                this.__motion_progressDoshIconMCaf1.overrideTargetTransform();
                this.__motion_progressDoshIconMCaf1.addPropertyArray("blendMode",["normal","normal"]);
                this.__motion_progressDoshIconMCaf1.addPropertyArray("cacheAsBitmap",[false,false]);
                this.__motion_progressDoshIconMCaf1.addPropertyArray("opaqueBackground",[null,null]);
                this.__motion_progressDoshIconMCaf1.addPropertyArray("visible",[true,true]);
                this.__motion_progressDoshIconMCaf1.is3D = true;
                this.__motion_progressDoshIconMCaf1.motion_internal::spanStart = 0;
                this.____motion_progressDoshIconMCaf1_matArray__ = new Array();
                this.____motion_progressDoshIconMCaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_progressDoshIconMCaf1_mat3DVec__[0] = 1;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[1] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[2] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[3] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[4] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[5] = 1;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[6] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[7] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[8] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[9] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[10] = 1;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[11] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[12] = 201;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[13] = 16;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[14] = 0;
                this.____motion_progressDoshIconMCaf1_mat3DVec__[15] = 1;
                this.____motion_progressDoshIconMCaf1_matArray__.push(new Matrix3D(this.____motion_progressDoshIconMCaf1_mat3DVec__));
                this.____motion_progressDoshIconMCaf1_matArray__.push(null);
                this.__motion_progressDoshIconMCaf1.addPropertyArray("matrix3D",this.____motion_progressDoshIconMCaf1_matArray__);
                this.__animArray_progressDoshIconMCaf1.push(this.__motion_progressDoshIconMCaf1);
                this.__animFactory_progressDoshIconMCaf1 = new AnimatorFactory3D(null,this.__animArray_progressDoshIconMCaf1);
                this.__animFactory_progressDoshIconMCaf1.addTargetInfo(this,"progressDoshIconMC",0,true,0,true,null,-1);
            }
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
