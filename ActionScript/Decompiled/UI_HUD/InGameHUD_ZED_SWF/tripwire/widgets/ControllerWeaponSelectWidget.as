package tripwire.widgets
{
    import flash.events.Event;
    
    public class ControllerWeaponSelectWidget extends WeaponSelectWidget
    {
         
        
        public function ControllerWeaponSelectWidget()
        {
            super();
        }
        
        override protected function addedToStage(param1:Event) : void
        {
            super.addedToStage(param1);
        }
        
        override public function showOnlyHUDGroup(param1:int) : void
        {
            var _loc2_:int = 0;
            while(_loc2_ < weaponGroupContainers.length)
            {
                if(!weaponGroupContainers[_loc2_].visible)
                {
                    weaponGroupContainers[_loc2_].visible = true;
                }
                if(param1 == _loc2_)
                {
                    weaponGroupContainers[_loc2_].showAllElements();
                }
                else
                {
                    weaponGroupContainers[_loc2_].showFirstElement();
                }
                _loc2_++;
            }
        }
        
        override public function showAllHUDGroups() : void
        {
        }
        
        override public function setSelectedIndex(param1:int, param2:int) : void
        {
            if(_currentGroupIndex != param1)
            {
                weaponGroupContainers[_currentGroupIndex].unselectGroup();
            }
            this.updateIndex(param1,param2);
        }
        
        override public function updateIndex(param1:int, param2:int) : *
        {
            super.updateIndex(param1,param2);
            if(weaponGroupContainers[param1] && weaponGroupContainers[param1].weaponList[param2] && throwIndicator)
            {
                throwIndicator.visible = weaponGroupContainers[param1].weaponList[param2].throwable;
            }
        }
    }
}