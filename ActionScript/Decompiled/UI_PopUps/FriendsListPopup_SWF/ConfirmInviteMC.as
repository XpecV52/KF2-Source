package
{
    import flash.accessibility.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.ui.*;
    import flash.utils.*;
    import tripwire.popups.FriendsListPopup;
    
    public dynamic class ConfirmInviteMC extends FriendsListPopup
    {
         
        
        public function ConfirmInviteMC()
        {
            super();
            this.__setProp_listViewOtherFriends_ConfirmInviteMC_AnotherFriendList_0();
            this.__setProp_listViewFriends_ConfirmInviteMC_FriendList_0();
        }
        
        function __setProp_listViewOtherFriends_ConfirmInviteMC_AnotherFriendList_0() : *
        {
            try
            {
                listViewOtherFriends["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            listViewOtherFriends.columnWidth = 0;
            listViewOtherFriends.direction = "horizontal";
            listViewOtherFriends.enabled = true;
            listViewOtherFriends.enableInitCallback = false;
            listViewOtherFriends.externalColumnCount = 0;
            listViewOtherFriends.focusable = true;
            listViewOtherFriends.itemRendererName = "FriendInfoItem";
            listViewOtherFriends.itemRendererInstanceName = "";
            listViewOtherFriends.margin = 0;
            listViewOtherFriends.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            listViewOtherFriends.rowHeight = 0;
            listViewOtherFriends.scrollBar = "scrollbarOtherFriends";
            listViewOtherFriends.visible = true;
            listViewOtherFriends.wrapping = "normal";
            try
            {
                listViewOtherFriends["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
        
        function __setProp_listViewFriends_ConfirmInviteMC_FriendList_0() : *
        {
            try
            {
                listViewFriends["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            }
            listViewFriends.columnWidth = 0;
            listViewFriends.direction = "horizontal";
            listViewFriends.enabled = true;
            listViewFriends.enableInitCallback = false;
            listViewFriends.externalColumnCount = 0;
            listViewFriends.focusable = true;
            listViewFriends.itemRendererName = "FriendInfoItem";
            listViewFriends.itemRendererInstanceName = "";
            listViewFriends.margin = 0;
            listViewFriends.inspectablePadding = {
                "top":0,
                "right":0,
                "bottom":0,
                "left":0
            };
            listViewFriends.rowHeight = 0;
            listViewFriends.scrollBar = "scrollbarFriends";
            listViewFriends.visible = true;
            listViewFriends.wrapping = "normal";
            try
            {
                listViewFriends["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            }
        }
    }
}
