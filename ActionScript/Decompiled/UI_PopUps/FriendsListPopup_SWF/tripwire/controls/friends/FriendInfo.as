package tripwire.controls.friends
{
    import flash.display.MovieClip;
    import flash.events.*;
    import flash.text.TextField;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;
    
    public class FriendInfo extends ListItemRenderer
    {
         
        
        public var defaultAvatar:MovieClip;
        
        public var friendName:TextField;
        
        public var profileLoader:UILoader;
        
        public var profileImageContainer:MovieClip;
        
        public var sendInviteIcon:MovieClip;
        
        public var sendInviteOrange:MovieClip;
        
        public var sendInviteRedBG:MovieClip;
        
        public var clickSoundEffect:String = "SHARED_BUTTON_CLICK";
        
        public var voipSliderSoundEffect:String = "VOIP_Click";
        
        public function FriendInfo()
        {
            super();
            this.sendInviteOrange.visible = false;
            this.profileLoader = UILoader(this.profileImageContainer.profileLoader);
            addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver,false,0,true);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut,false,0,true);
        }
        
        function onMouseOver(param1:MouseEvent) : *
        {
            if(this.sendInviteIcon.visible)
            {
                this.sendInviteOrange.visible = true;
            }
            if(Extensions.gfxProcessSound != null)
            {
                Extensions.gfxProcessSound(this,"UI",this.voipSliderSoundEffect);
            }
        }
        
        function onMouseOut(param1:MouseEvent) : *
        {
            this.sendInviteOrange.visible = false;
        }
        
        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if(param1 != null)
            {
                this.profileImageSource = param1.profileImageSource;
                this.friendName.text = param1.friendName;
                this.hideInviteButton(param1.sendInvite);
                visible = true;
            }
            else
            {
                visible = false;
            }
        }
        
        private function hideInviteButton(param1:Boolean) : *
        {
            if(Extensions.gfxProcessSound != null && this.sendInviteIcon.visible && param1)
            {
                Extensions.gfxProcessSound(this,"UI",this.clickSoundEffect);
            }
            if(param1)
            {
                this.sendInviteIcon.visible = false;
                this.sendInviteOrange.visible = false;
                this.sendInviteRedBG.visible = false;
            }
            else
            {
                this.sendInviteIcon.visible = true;
                this.sendInviteRedBG.visible = true;
            }
        }
        
        public function set profileImageSource(param1:String) : *
        {
            if(param1 && param1 != "" && param1 != "img://")
            {
                this.profileImageContainer.visible = true;
                this.defaultAvatar.visible = false;
                this.profileImageContainer.profileLoader.source = param1;
                this.profileLoader.visible = true;
            }
            else
            {
                this.profileImageContainer.visible = false;
                this.defaultAvatar.visible = true;
            }
        }
    }
}
