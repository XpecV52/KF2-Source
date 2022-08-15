/*******************************************************************************
 * DataStoreCache generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DataStoreCache extends Object
    config(webadmin);

struct GameTypeMaps
{
    var string GameType;
    var array<DCEMapInfo> Maps;

    structdefaultproperties
    {
        GameType=""
        Maps=none
    }
};

struct MutatorGroup
{
    var string GroupName;
    var array<DCEMutator> Mutators;

    structdefaultproperties
    {
        GroupName=""
        Mutators=none
    }
};

struct GameTypeMutators
{
    var string GameType;
    var array<MutatorGroup> mutatorGroups;

    structdefaultproperties
    {
        GameType=""
        mutatorGroups=none
    }
};

struct MutatorAllowance
{
    var string Id;
    var bool allowed;

    structdefaultproperties
    {
        Id=""
        allowed=false
    }
};

var UIDataStore_GameResource DataSource;
var array<DCEGameInfo> GameTypes;
var array<DCEMapInfo> Maps;
var array<GameTypeMaps> gameTypeMapCache;
var array<MutatorGroup> mutatorGroups;
var array<DCEMutator> Mutators;
var array<GameTypeMutators> gameTypeMutatorCache;
var config array<config MutatorAllowance> allowanceCache;

function Cleanup()
{
    GameTypes.Remove(0, GameTypes.Length;
    Maps.Remove(0, Maps.Length;
    gameTypeMapCache.Remove(0, gameTypeMapCache.Length;
    mutatorGroups.Remove(0, mutatorGroups.Length;
    gameTypeMutatorCache.Remove(0, gameTypeMutatorCache.Length;
}

function array<DCEGameInfo> GetGameTypes(optional string sorton)
{
    local array<DCEGameInfo> Result;
    local int I, J;

    sorton = "FriendlyName";
    if(GameTypes.Length == 0)
    {
        loadGameTypes();
    }
    if(sorton ~= "FriendlyName")
    {
        Result = GameTypes;
        return Result;
    }
    I = 0;
    J0x70:

    if(I < GameTypes.Length)
    {
        J = 0;
        J0x93:

        if(J < Result.Length)
        {
            if(compareGameType(Result[J], GameTypes[I], sorton))
            {
                Result.Insert(J, 1;
                Result[J] = GameTypes[I];
                goto J0x134;
            }
            ++ J;
            goto J0x93;
        }
        J0x134:

        if(J == Result.Length)
        {
            Result.AddItem(GameTypes[I];
        }
        ++ I;
        goto J0x70;
    }
    return Result;
}

function int resolveGameType(coerce string ClassName)
{
    local int Idx;

    if(GameTypes.Length == 0)
    {
        loadGameTypes();
    }
    ClassName = "." $ ClassName;
    Idx = 0;
    J0x3D:

    if(Idx < GameTypes.Length)
    {
        if(Right("." $ GameTypes[Idx].Data.ClassName, Len(ClassName)) ~= ClassName)
        {
            return Idx;
        }
        ++ Idx;
        goto J0x3D;
    }
    return -1;
}

function loadGameTypes()
{
    local array<UIResourceDataProvider> ProviderList;
    local UIGameInfoSummary Item;
    local DCEGameInfo Entry;
    local int I, J;

    if(GameTypes.Length > 0)
    {
        return;
    }
    getDatasource().GetResourceProviders('GameTypes', ProviderList);
    I = 0;
    J0x4F:

    if(I < ProviderList.Length)
    {
        Item = UIGameInfoSummary(ProviderList[I]);
        if(Item.bIsDisabled)
        {            
        }
        else
        {
            J = 0;
            J0xBD:

            if(J < GameTypes.Length)
            {
                if(GameTypes[J].Name == Item.Name)
                {
                    LogInternal("Found duplicate game mode with name: " $ string(Item.Name), 'webadmin');
                    goto J0x185;
                }
                ++ J;
                goto J0xBD;
            }
            J0x185:

            if(J != GameTypes.Length)
            {                
            }
            else
            {
                Entry = new (self, string(Item.Name)) Class'DCEGameInfo';
                Entry.Init(Item);
                J = 0;
                J0x20A:

                if(J < GameTypes.Length)
                {
                    if(compareGameType(GameTypes[J], Entry, "FriendlyName"))
                    {
                        GameTypes.Insert(J, 1;
                        GameTypes[J] = Entry;
                        goto J0x29C;
                    }
                    ++ J;
                    goto J0x20A;
                }
                J0x29C:

                if(J == GameTypes.Length)
                {
                    GameTypes.AddItem(Entry;
                }
            }
        }
        ++ I;
        goto J0x4F;
    }
}

static function bool compareGameType(DCEGameInfo g1, DCEGameInfo g2, string sorton)
{
    if(sorton ~= "FriendlyName")
    {
        return g1.FriendlyName > g2.FriendlyName;        
    }
    else
    {
        if(sorton ~= "GameName")
        {
            return g1.Data.GameName > g2.Data.GameName;            
        }
        else
        {
            if(sorton ~= "Description")
            {
                return g1.Description > g2.Description;                
            }
            else
            {
                if((sorton ~= "ClassName") || sorton ~= "GameMode")
                {
                    return g1.Data.ClassName > g2.Data.ClassName;                    
                }
                else
                {
                    if((sorton ~= "GameAcronym") || sorton ~= "Acronym")
                    {
                        return g1.Data.GameAcronym > g2.Data.GameAcronym;                        
                    }
                    else
                    {
                        if(sorton ~= "GameSettingsClass")
                        {
                            return g1.Data.GameSettingsClassName > g2.Data.GameSettingsClassName;
                        }
                    }
                }
            }
        }
    }
}

static function string getMapPrefix(string MapName)
{
    local int Idx;

    Idx = InStr(MapName, "-");
    if(Idx == -1)
    {
        Idx = InStr(MapName, "-");
    }
    if(Idx == -1)
    {
        return "";
    }
    return Caps(Left(MapName, Idx));
}

function array<DCEMapInfo> getMaps(optional string GameType, optional string sorton)
{
    local array<DCEMapInfo> Result, workset;
    local int I, J, Idx;
    local array<string> prefixes;
    local string Prefix;

    GameType = "";
    sorton = "MapName";
    if(Maps.Length == 0)
    {
        loadMaps();
    }
    if(GameType == "")
    {
        workset = Maps;        
    }
    else
    {
        Idx = resolveGameType(GameType);
        if(Idx == -1)
        {
            LogInternal("gametype not found " $ GameType);
            return Result;
        }
        J = gameTypeMapCache.Find('GameType', GameTypes[Idx].Data.ClassName;
        if(J == -1)
        {
            ParseStringIntoArray(Caps(GameTypes[Idx].Data.MapPrefix), prefixes, "|", true);
            I = 0;
            J0x181:

            if(I < Maps.Length)
            {
                Prefix = getMapPrefix(Maps[I].Data.MapName);
                if(prefixes.Find(Prefix > -1)
                {
                    workset.AddItem(Maps[I];
                }
                ++ I;
                goto J0x181;
            }
            gameTypeMapCache.Add(1;
            gameTypeMapCache[gameTypeMapCache.Length - 1].GameType = GameTypes[Idx].Data.ClassName;
            gameTypeMapCache[gameTypeMapCache.Length - 1].Maps = workset;            
        }
        else
        {
            workset = gameTypeMapCache[J].Maps;
        }
    }
    if(sorton ~= "MapName")
    {
        return workset;
    }
    I = 0;
    J0x33F:

    if(I < workset.Length)
    {
        J = 0;
        J0x362:

        if(J < Result.Length)
        {
            if(compareMap(Result[J], workset[I], sorton))
            {
                Result.Insert(J, 1;
                Result[J] = workset[I];
                goto J0x403;
            }
            ++ J;
            goto J0x362;
        }
        J0x403:

        if(J == Result.Length)
        {
            Result.AddItem(workset[I];
        }
        ++ I;
        goto J0x33F;
    }
    return Result;
}

function array<string> getGametypesByMap(string MapName)
{
    local string Prefix;
    local array<string> Result, prefixes;
    local int I;

    Prefix = getMapPrefix(MapName);
    if(Len(Prefix) == 0)
    {
        return Result;
    }
    loadGameTypes();
    I = 0;
    J0x4D:

    if(I < GameTypes.Length)
    {
        ParseStringIntoArray(Caps(GameTypes[I].Data.MapPrefix), prefixes, "|", true);
        if(prefixes.Find(Prefix > -1)
        {
            Result.AddItem(GameTypes[I].Data.ClassName;
        }
        ++ I;
        goto J0x4D;
    }
    return Result;
}

function loadMaps()
{
    local array<UIResourceDataProvider> ProviderList;
    local UIMapSummary Item;
    local DCEMapInfo Entry;
    local int I, J;

    if(Maps.Length > 0)
    {
        return;
    }
    gameTypeMapCache.Remove(0, gameTypeMapCache.Length;
    getDatasource().GetResourceProviders('Maps', ProviderList);
    I = 0;
    J0x65:

    if(I < ProviderList.Length)
    {
        Item = UIMapSummary(ProviderList[I]);
        J = 0;
        J0xAE:

        if(J < Maps.Length)
        {
            if(Maps[J].Name == Item.Name)
            {
                LogInternal("Found duplicate map with name: " $ string(Item.Name), 'webadmin');
                goto J0x170;
            }
            ++ J;
            goto J0xAE;
        }
        J0x170:

        if(J != Maps.Length)
        {            
        }
        else
        {
            Entry = new (self, string(Item.Name)) Class'DCEMapInfo';
            Entry.Init(Item);
            J = 0;
            J0x1F5:

            if(J < Maps.Length)
            {
                if(compareMap(Maps[J], Entry, "MapName"))
                {
                    Maps.Insert(J, 1;
                    Maps[J] = Entry;
                    goto J0x282;
                }
                ++ J;
                goto J0x1F5;
            }
            J0x282:

            if(J == Maps.Length)
            {
                Maps.AddItem(Entry;
            }
        }
        ++ I;
        goto J0x65;
    }
}

static function bool compareMap(DCEMapInfo g1, DCEMapInfo g2, string sorton)
{
    if(sorton ~= "MapName")
    {
        return g1.Data.MapName > g2.Data.MapName;        
    }
    else
    {
        if(sorton ~= "DisplayName")
        {
            return g1.Data.DisplayName > g2.Data.DisplayName;            
        }
        else
        {
            if(sorton ~= "FriendlyName")
            {
                return g1.FriendlyName > g2.FriendlyName;                
            }
            else
            {
                if(sorton ~= "Description")
                {
                    return g1.Description > g2.Description;
                }
            }
        }
    }
}

function array<MutatorGroup> getMutators(optional string GameType, optional string sorton)
{
    local array<MutatorGroup> Result, workset;
    local int J, Idx;

    GameType = "";
    sorton = "FriendlyName";
    if(mutatorGroups.Length == 0)
    {
        loadMutators();
    }
    if(GameType == "")
    {
        workset = mutatorGroups;        
    }
    else
    {
        Idx = resolveGameType(GameType);
        if(Idx == -1)
        {
            LogInternal("gametype not found " $ GameType);
            Result.Length = 0;
            return Result;
        }
        J = gameTypeMutatorCache.Find('GameType', GameTypes[Idx].Data.ClassName;
        if(J == -1)
        {
            workset = filterMutators(mutatorGroups, GameTypes[Idx].Data.ClassName);
            gameTypeMutatorCache.Add(1;
            gameTypeMutatorCache[gameTypeMutatorCache.Length - 1].GameType = GameTypes[Idx].Data.ClassName;
            gameTypeMutatorCache[gameTypeMutatorCache.Length - 1].mutatorGroups = workset;            
        }
        else
        {
            workset = gameTypeMutatorCache[J].mutatorGroups;
        }
    }
    if(sorton ~= "FriendlyName")
    {
        return workset;
    }
    return workset;
}

function array<MutatorGroup> filterMutators(array<MutatorGroup> Source, string GameType)
{
    local int I, J, K;
    local array<MutatorGroup> Result;
    local MutatorGroup Group;
    local class<GameInfo> GameModeClass;
    local bool findGameType, allowanceChanged;
    local string GameTypeMutatorId;

    findGameType = true;
    I = 0;
    J0x17:

    if(I < Source.Length)
    {
        Group.GroupName = Source[I].GroupName;
        Group.Mutators.Length = 0;
        J = 0;
        J0x9C:

        if(J < Source[I].Mutators.Length)
        {
            if(Source[I].Mutators[J].Data.SupportedGameTypes.Length > 0)
            {
                K = Source[I].Mutators[J].Data.SupportedGameTypes.Find(GameType;
                if(K != -1)
                {
                    Group.Mutators.AddItem(Source[I].Mutators[J];
                }                
            }
            else
            {
                GameTypeMutatorId = (GameType $ "@") $ Source[I].Mutators[J].Data.ClassName;
                K = allowanceCache.Find('Id', GameTypeMutatorId;
                if(K != -1)
                {
                    if(allowanceCache[K].allowed)
                    {
                        Group.Mutators.AddItem(Source[I].Mutators[J];
                    }                    
                }
                else
                {
                    if((GameModeClass == none) && findGameType)
                    {
                        findGameType = false;
                        GameModeClass = class<GameInfo>(DynamicLoadObject(GameType, Class'Class'));
                        if(GameModeClass == none)
                        {
                            LogInternal("DataStoreCache::filterMutators() - Unable to find game class: " $ GameType);
                        }
                    }
                    if(GameModeClass != none)
                    {
                        allowanceChanged = true;
                        K = allowanceCache.Length;
                        allowanceCache.Length = K + 1;
                        allowanceCache[K].Id = GameTypeMutatorId;
                        if(GameModeClass.static.AllowMutator(Source[I].Mutators[J].Data.ClassName))
                        {
                            Group.Mutators.AddItem(Source[I].Mutators[J];
                            allowanceCache[K].allowed = true;
                        }
                    }
                }
            }
            ++ J;
            goto J0x9C;
        }
        if(Group.Mutators.Length > 0)
        {
            Result.AddItem(Group;
        }
        ++ I;
        goto J0x17;
    }
    if(allowanceChanged)
    {
        SaveConfig();
    }
    return Result;
}

function loadMutators()
{
    local array<UIResourceDataProvider> ProviderList;
    local KFMutatorSummary Item;
    local DCEMutator Entry;
    local int I, J, GroupID, emptyGroupId;
    local array<string> Groups;
    local string Group;

    if(mutatorGroups.Length > 0)
    {
        return;
    }
    Mutators.Remove(0, Mutators.Length;
    gameTypeMutatorCache.Remove(0, gameTypeMutatorCache.Length;
    emptyGroupId = 0;
    mutatorGroups.Length = 1;
    getDatasource().GetResourceProviders('Mutators', ProviderList);
    I = 0;
    J0x92:

    if(I < ProviderList.Length)
    {
        Item = KFMutatorSummary(ProviderList[I]);
        if(Item.bIsDisabled)
        {            
        }
        else
        {
            J = 0;
            J0x100:

            if(J < Mutators.Length)
            {
                if(Mutators[J].Name == Item.Name)
                {
                    LogInternal("Found duplicate mutator with name: " $ string(Item.Name), 'webadmin');
                    goto J0x1C6;
                }
                ++ J;
                goto J0x100;
            }
            J0x1C6:

            if(J != Mutators.Length)
            {                
            }
            else
            {
                Entry = new (self, string(Item.Name)) Class'DCEMutator';
                Entry.Init(Item);
                Groups = Item.GroupNames;
                if(Groups.Length == 0)
                {
                    Groups.AddItem("";
                }
                foreach Groups(Group,)
                {
                    GroupID = mutatorGroups.Find('GroupName', Group;
                    if(GroupID == -1)
                    {
                        GroupID = 0;
                        J0x2E5:

                        if(GroupID < mutatorGroups.Length)
                        {
                            if(mutatorGroups[GroupID].GroupName > Group)
                            {
                                goto J0x342;
                            }
                            ++ GroupID;
                            goto J0x2E5;
                        }
                        J0x342:

                        mutatorGroups.Insert(GroupID, 1;
                        mutatorGroups[GroupID].GroupName = Caps(Group);
                    }
                    if((emptyGroupId == -1) && Len(Group) == 0)
                    {
                        emptyGroupId = GroupID;
                    }
                    J = 0;
                    J0x3CD:

                    if(J < mutatorGroups[GroupID].Mutators.Length)
                    {
                        if(compareMutator(mutatorGroups[GroupID].Mutators[J], Entry, "FriendlyName"))
                        {
                            mutatorGroups[GroupID].Mutators.Insert(J, 1;
                            mutatorGroups[GroupID].Mutators[J] = Entry;
                            goto J0x4D3;
                        }
                        ++ J;
                        goto J0x3CD;
                    }
                    J0x4D3:

                    if(J == mutatorGroups[GroupID].Mutators.Length)
                    {
                        mutatorGroups[GroupID].Mutators.AddItem(Entry;
                    }                    
                }                
                J = 0;
                J0x548:

                if(J < Mutators.Length)
                {
                    if(compareMutator(Mutators[J], Entry, "FriendlyName"))
                    {
                        Mutators.Insert(J, 1;
                        Mutators[J] = Entry;
                        goto J0x5DA;
                    }
                    ++ J;
                    goto J0x548;
                }
                J0x5DA:

                if(J == Mutators.Length)
                {
                    Mutators.AddItem(Entry;
                }
            }
        }
        ++ I;
        goto J0x92;
    }
    if(emptyGroupId == -1)
    {
        emptyGroupId = mutatorGroups.Length;
        mutatorGroups[emptyGroupId].GroupName = "";
    }
    I = mutatorGroups.Length - 1;
    J0x67D:

    if(I >= 0)
    {
        if(I == emptyGroupId)
        {            
        }
        else
        {
            if(mutatorGroups[I].Mutators.Length > 1)
            {                
            }
            else
            {
                Entry = mutatorGroups[I].Mutators[0];
                J = 0;
                J0x713:

                if(J < mutatorGroups[emptyGroupId].Mutators.Length)
                {
                    if(mutatorGroups[emptyGroupId].Mutators[J] == Entry)
                    {
                        goto J0x85A;
                    }
                    if(compareMutator(mutatorGroups[emptyGroupId].Mutators[J], Entry, "FriendlyName"))
                    {
                        mutatorGroups[emptyGroupId].Mutators.Insert(J, 1;
                        mutatorGroups[emptyGroupId].Mutators[J] = Entry;
                        goto J0x85A;
                    }
                    ++ J;
                    goto J0x713;
                }
                J0x85A:

                if(J == mutatorGroups[emptyGroupId].Mutators.Length)
                {
                    mutatorGroups[emptyGroupId].Mutators.AddItem(Entry;
                }
                mutatorGroups.Remove(I, 1;
            }
        }
        -- I;
        goto J0x67D;
    }
    if(mutatorGroups[emptyGroupId].Mutators.Length == 0)
    {
        mutatorGroups.Remove(emptyGroupId, 1;
    }
}

static function bool compareMutator(DCEMutator m1, DCEMutator m2, string sorton)
{
    if(sorton ~= "ClassName")
    {
        return m1.Data.ClassName > m2.Data.ClassName;        
    }
    else
    {
        if(sorton ~= "FriendlyName")
        {
            return m1.FriendlyName > m2.FriendlyName;            
        }
        else
        {
            if(sorton ~= "Description")
            {
                return m1.Description > m2.Description;
            }
        }
    }
}

function UIDataStore_GameResource getDatasource()
{
    if(DataSource == none)
    {
        DataSource = UIDataStore_GameResource(Class'UIRoot'.static.StaticResolveDataStore(Class'UIDataStore_GameResource'.default.Tag));
    }
    return DataSource;
}
