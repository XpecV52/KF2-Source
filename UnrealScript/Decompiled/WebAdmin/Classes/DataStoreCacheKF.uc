/*******************************************************************************
 * DataStoreCacheKF generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DataStoreCacheKF extends DataStoreCache
    config(webadmin);

function UIDataStore_GameResource getDatasource()
{
    if(DataSource == none)
    {
        Class'KFUIDataStore_GameResource'.static.InitializeProviders();
        DataSource = KFUIDataStore_GameResource(Class'UIRoot'.static.StaticResolveDataStore(Class'KFUIDataStore_GameResource'.default.Tag));
    }
    return DataSource;
}
