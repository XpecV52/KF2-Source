package PartyWidget_SWF_fla
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
    
    public dynamic class MainTimeline extends MovieClip
    {
         
        
        public var partyWidget:SquadContainerMC;
        
        public var __animFactory_partyWidgetaf1:AnimatorFactory3D;
        
        public var __animArray_partyWidgetaf1:Array;
        
        public var ____motion_partyWidgetaf1_mat3DVec__:Vector.<Number>;
        
        public var ____motion_partyWidgetaf1_matArray__:Array;
        
        public var __motion_partyWidgetaf1:MotionBase;
        
        public function MainTimeline()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE,this.__setPerspectiveProjection_);
            if(this.__animFactory_partyWidgetaf1 == null)
            {
                this.__animArray_partyWidgetaf1 = new Array();
                this.__motion_partyWidgetaf1 = new MotionBase();
                this.__motion_partyWidgetaf1.duration = 1;
                this.__motion_partyWidgetaf1.overrideTargetTransform();
                this.__motion_partyWidgetaf1.addPropertyArray("blendMode",["normal"]);
                this.__motion_partyWidgetaf1.addPropertyArray("cacheAsBitmap",[false]);
                this.__motion_partyWidgetaf1.addPropertyArray("opaqueBackground",[null]);
                this.__motion_partyWidgetaf1.addPropertyArray("visible",[true]);
                this.__motion_partyWidgetaf1.is3D = true;
                this.__motion_partyWidgetaf1.motion_internal::spanStart = 0;
                this.____motion_partyWidgetaf1_matArray__ = new Array();
                this.____motion_partyWidgetaf1_mat3DVec__ = new Vector.<Number>(16);
                this.____motion_partyWidgetaf1_mat3DVec__[0] = 0.961262;
                this.____motion_partyWidgetaf1_mat3DVec__[1] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[2] = -0.275637;
                this.____motion_partyWidgetaf1_mat3DVec__[3] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[4] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[5] = 1;
                this.____motion_partyWidgetaf1_mat3DVec__[6] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[7] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[8] = 0.275637;
                this.____motion_partyWidgetaf1_mat3DVec__[9] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[10] = 0.961262;
                this.____motion_partyWidgetaf1_mat3DVec__[11] = 0;
                this.____motion_partyWidgetaf1_mat3DVec__[12] = 1888.012939;
                this.____motion_partyWidgetaf1_mat3DVec__[13] = 32;
                this.____motion_partyWidgetaf1_mat3DVec__[14] = -0.047852;
                this.____motion_partyWidgetaf1_mat3DVec__[15] = 1;
                this.____motion_partyWidgetaf1_matArray__.push(new Matrix3D(this.____motion_partyWidgetaf1_mat3DVec__));
                this.__motion_partyWidgetaf1.addPropertyArray("matrix3D",this.____motion_partyWidgetaf1_matArray__);
                this.__animArray_partyWidgetaf1.push(this.__motion_partyWidgetaf1);
                this.__animFactory_partyWidgetaf1 = new AnimatorFactory3D(null,this.__animArray_partyWidgetaf1);
                this.__animFactory_partyWidgetaf1.sceneName = "Scene 1";
                this.__animFactory_partyWidgetaf1.addTargetInfo(this,"partyWidget",0,true,0,true,null,-1);
            }
            this.__setProp_partyWidget_Scene1_partyWidget_0();
        }
        
        public function __setPerspectiveProjection_(param1:Event) : void
        {
            root.transform.perspectiveProjection.fieldOfView = 30;
            root.transform.perspectiveProjection.projectionCenter = new Point(960,540);
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
