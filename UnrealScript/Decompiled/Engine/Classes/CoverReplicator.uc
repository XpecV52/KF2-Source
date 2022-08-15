/*******************************************************************************
 * CoverReplicator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CoverReplicator extends ReplicationInfo
    notplaceable
    hidecategories(Navigation,Movement,Collision);

struct ManualCoverTypeInfo
{
    var byte SlotIndex;
    var CoverLink.ECoverType ManualCoverType;

    structdefaultproperties
    {
        SlotIndex=0
        ManualCoverType=ECoverType.CT_None
    }
};

struct CoverReplicationInfo
{
    var CoverLink Link;
    var array<byte> SlotsEnabled;
    var array<byte> SlotsDisabled;
    var array<byte> SlotsAdjusted;
    var array<ManualCoverTypeInfo> SlotsCoverTypeChanged;

    structdefaultproperties
    {
        Link=none
        SlotsEnabled=none
        SlotsDisabled=none
        SlotsAdjusted=none
        SlotsCoverTypeChanged=none
    }
};

var array<CoverReplicationInfo> CoverReplicationData;

function PurgeOldEntries()
{
    local int I;

    I = 0;
    J0x0B:

    if(I < CoverReplicationData.Length)
    {
        if(CoverReplicationData[I].Link == none)
        {
            CoverReplicationData.Remove(-- I, 1;
        }
        ++ I;
        goto J0x0B;
    }
}

function ReplicateInitialCoverInfo()
{
    local CoverReplicator CoverReplicatorBase;

    CoverReplicatorBase = WorldInfo.Game.GetCoverReplicator();
    CoverReplicatorBase.PurgeOldEntries();
    CoverReplicationData = CoverReplicatorBase.CoverReplicationData;
    if(PlayerController(Owner) != none)
    {
        ClientSetOwner(PlayerController(Owner));
        ServerSendInitialCoverReplicationInfo(0);
    }
}

reliable client simulated function ClientSetOwner(PlayerController PC)
{
    SetOwner(PC);
}

reliable server function ServerSendInitialCoverReplicationInfo(int Index)
{
    local byte SlotsArrayIndex, NumSlotsEnabled, NumSlotsDisabled, NumSlotsAdjusted, NumCoverTypesChanged, SlotsEnabled,
	    SlotsDisabled, SlotsAdjusted;

    local ManualCoverTypeInfo SlotsCoverTypeChanged[8];
    local int I;
    local bool bDone;

    J0x00:
    if((Index < CoverReplicationData.Length) && CoverReplicationData[Index].Link == none)
    {
        CoverReplicationData.Remove(Index, 1;
        goto J0x00;
    }
    if(Index < CoverReplicationData.Length)
    {
        SlotsArrayIndex = 0;
        J0x82:

        NumSlotsEnabled = byte(Clamp(CoverReplicationData[Index].SlotsEnabled.Length - SlotsArrayIndex, 0, 8));
        NumSlotsDisabled = byte(Clamp(CoverReplicationData[Index].SlotsDisabled.Length - SlotsArrayIndex, 0, 8));
        NumSlotsAdjusted = byte(Clamp(CoverReplicationData[Index].SlotsAdjusted.Length - SlotsArrayIndex, 0, 8));
        NumCoverTypesChanged = byte(Clamp(CoverReplicationData[Index].SlotsCoverTypeChanged.Length - SlotsArrayIndex, 0, 8));
        if(NumSlotsEnabled == 0)
        {
            I = 0;
            J0x1B5:

            if(I < 8)
            {
                SlotsEnabled[I] = 0;
                ++ I;
                goto J0x1B5;
            }            
        }
        else
        {
            I = 0;
            J0x1F7:

            if(I < NumSlotsEnabled)
            {
                SlotsEnabled[I] = CoverReplicationData[Index].SlotsEnabled[SlotsArrayIndex + I];
                ++ I;
                goto J0x1F7;
            }
        }
        if(NumSlotsDisabled == 0)
        {
            I = 0;
            J0x28E:

            if(I < 8)
            {
                SlotsDisabled[I] = 0;
                ++ I;
                goto J0x28E;
            }            
        }
        else
        {
            I = 0;
            J0x2D0:

            if(I < NumSlotsDisabled)
            {
                SlotsDisabled[I] = CoverReplicationData[Index].SlotsDisabled[SlotsArrayIndex + I];
                ++ I;
                goto J0x2D0;
            }
        }
        if(NumSlotsAdjusted == 0)
        {
            I = 0;
            J0x367:

            if(I < 8)
            {
                SlotsAdjusted[I] = 0;
                ++ I;
                goto J0x367;
            }            
        }
        else
        {
            I = 0;
            J0x3A9:

            if(I < NumSlotsAdjusted)
            {
                SlotsAdjusted[I] = CoverReplicationData[Index].SlotsAdjusted[SlotsArrayIndex + I];
                ++ I;
                goto J0x3A9;
            }
        }
        if(NumCoverTypesChanged == 0)
        {
            I = 0;
            J0x440:

            if(I < 8)
            {
                SlotsCoverTypeChanged[I].SlotIndex = 0;
                SlotsCoverTypeChanged[I].ManualCoverType = 0;
                ++ I;
                goto J0x440;
            }            
        }
        else
        {
            I = 0;
            J0x4BE:

            if(I < NumCoverTypesChanged)
            {
                SlotsCoverTypeChanged[I] = CoverReplicationData[Index].SlotsCoverTypeChanged[SlotsArrayIndex + I];
                ++ I;
                goto J0x4BE;
            }
        }
        bDone = ((((CoverReplicationData[Index].SlotsEnabled.Length - SlotsArrayIndex) <= 8) && (CoverReplicationData[Index].SlotsDisabled.Length - SlotsArrayIndex) <= 8) && (CoverReplicationData[Index].SlotsAdjusted.Length - SlotsArrayIndex) <= 8) && (CoverReplicationData[Index].SlotsCoverTypeChanged.Length - SlotsArrayIndex) <= 8;
        ClientReceiveInitialCoverReplicationInfo(Index, CoverReplicationData[Index].Link, CoverReplicationData[Index].Link.bDisabled, NumSlotsEnabled, SlotsEnabled, NumSlotsDisabled, SlotsDisabled, NumSlotsAdjusted, SlotsAdjusted, NumCoverTypesChanged, SlotsCoverTypeChanged, bDone);
        SlotsArrayIndex += 8;
        if(!(bDone))
            goto J0x82;
    }
}

reliable client simulated function ClientReceiveInitialCoverReplicationInfo(int Index, CoverLink Link, bool bLinkDisabled, byte NumSlotsEnabled, byte SlotsEnabled[8], byte NumSlotsDisabled, byte SlotsDisabled[8], byte NumSlotsAdjusted, byte SlotsAdjusted[8], byte NumCoverTypesChanged, ManualCoverTypeInfo SlotsCoverTypeChanged[8], bool bDone)
{
    local int I;

    if(Link == none)
    {
        if(bDone)
        {
            ServerSendInitialCoverReplicationInfo(Index);
        }        
    }
    else
    {
        Link.bDisabled = bLinkDisabled;
        I = 0;
        J0x67:

        if(I < NumSlotsEnabled)
        {
            Link.SetSlotEnabled(SlotsEnabled[I], true);
            ++ I;
            goto J0x67;
        }
        I = 0;
        J0xCE:

        if(I < NumSlotsDisabled)
        {
            Link.SetSlotEnabled(SlotsDisabled[I], false);
            ++ I;
            goto J0xCE;
        }
        I = 0;
        J0x135:

        if(I < NumSlotsAdjusted)
        {
            if((Link.AutoAdjustSlot(SlotsAdjusted[I], false) && Link.Slots[SlotsAdjusted[I]].SlotOwner != none) && Link.Slots[SlotsAdjusted[I]].SlotOwner.Controller != none)
            {
                Link.Slots[SlotsAdjusted[I]].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            ++ I;
            goto J0x135;
        }
        I = 0;
        J0x2C4:

        if(I < NumCoverTypesChanged)
        {
            Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].CoverType = SlotsCoverTypeChanged[I].ManualCoverType;
            if((Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].SlotOwner != none) && Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].SlotOwner.Controller != none)
            {
                Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            ++ I;
            goto J0x2C4;
        }
        if(bDone)
        {
            ServerSendInitialCoverReplicationInfo(Index + 1);
        }
    }
}

function NotifyEnabledSlots(CoverLink Link, const out array<int> SlotIndices)
{
    local int Index, SlotIndex, I;
    local PlayerController PC;

    Index = CoverReplicationData.Find('Link', Link;
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        I = 0;
        J0xA3:

        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsEnabled[I] = byte(SlotIndices[I]);
            ++ I;
            goto J0xA3;
        }        
    }
    else
    {
        I = 0;
        J0x11D:

        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsEnabled.Find(byte(SlotIndices[I]);
            if(SlotIndex == -1)
            {
                CoverReplicationData[Index].SlotsEnabled[CoverReplicationData[Index].SlotsEnabled.Length] = byte(SlotIndices[I]);
            }
            SlotIndex = CoverReplicationData[Index].SlotsDisabled.Find(byte(SlotIndices[I]);
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsDisabled.Remove(SlotIndex, 1;
            }
            ++ I;
            goto J0x11D;
        }
    }
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                continue;
            }
            PC.MyCoverReplicator.NotifyEnabledSlots(Link, SlotIndices);            
        }        
    }
    if(PlayerController(Owner) != none)
    {
        ServerSendEnabledSlots(Index);
    }
}

reliable server function ServerSendEnabledSlots(int Index)
{
    local int SlotsArrayIndex;
    local byte NumSlotsEnabled, SlotsEnabled;
    local int I;
    local bool bDone;

    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumSlotsEnabled = byte(Clamp(CoverReplicationData[Index].SlotsEnabled.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        if(I < NumSlotsEnabled)
        {
            SlotsEnabled[I] = CoverReplicationData[Index].SlotsEnabled[SlotsArrayIndex + I];
            ++ I;
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsEnabled.Length - SlotsArrayIndex) <= 8;
        ClientReceiveEnabledSlots(Index, CoverReplicationData[Index].Link, NumSlotsEnabled, SlotsEnabled, bDone);
        SlotsArrayIndex += 8;
        if(!(bDone))
            goto J0x37;
    }
}

reliable client simulated function ClientReceiveEnabledSlots(int Index, CoverLink Link, byte NumSlotsEnabled, byte SlotsEnabled[8], bool bDone)
{
    local int I;

    if(Link == none)
    {
        if(bDone)
        {
            ServerSendEnabledSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        if(I < NumSlotsEnabled)
        {
            Link.SetSlotEnabled(SlotsEnabled[I], true);
            ++ I;
            goto J0x3D;
        }
    }
}

function NotifyDisabledSlots(CoverLink Link, const out array<int> SlotIndices)
{
    local int Index, SlotIndex, I;
    local PlayerController PC;

    Index = CoverReplicationData.Find('Link', Link;
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        I = 0;
        J0xA3:

        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsDisabled[I] = byte(SlotIndices[I]);
            ++ I;
            goto J0xA3;
        }        
    }
    else
    {
        I = 0;
        J0x11D:

        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsDisabled.Find(byte(SlotIndices[I]);
            if(SlotIndex == -1)
            {
                CoverReplicationData[Index].SlotsDisabled[CoverReplicationData[Index].SlotsDisabled.Length] = byte(SlotIndices[I]);
            }
            SlotIndex = CoverReplicationData[Index].SlotsEnabled.Find(byte(SlotIndices[I]);
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsEnabled.Remove(SlotIndex, 1;
            }
            ++ I;
            goto J0x11D;
        }
    }
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                continue;
            }
            PC.MyCoverReplicator.NotifyDisabledSlots(Link, SlotIndices);            
        }        
    }
    if(PlayerController(Owner) != none)
    {
        ServerSendDisabledSlots(Index);
    }
}

reliable server function ServerSendDisabledSlots(int Index)
{
    local int SlotsArrayIndex;
    local byte NumSlotsDisabled, SlotsDisabled;
    local int I;
    local bool bDone;

    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumSlotsDisabled = byte(Clamp(CoverReplicationData[Index].SlotsDisabled.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        if(I < NumSlotsDisabled)
        {
            SlotsDisabled[I] = CoverReplicationData[Index].SlotsDisabled[SlotsArrayIndex + I];
            ++ I;
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsDisabled.Length - SlotsArrayIndex) <= 8;
        ClientReceiveDisabledSlots(Index, CoverReplicationData[Index].Link, NumSlotsDisabled, SlotsDisabled, bDone);
        SlotsArrayIndex += 8;
        if(!(bDone))
            goto J0x37;
    }
}

reliable client simulated function ClientReceiveDisabledSlots(int Index, CoverLink Link, byte NumSlotsDisabled, byte SlotsDisabled[8], bool bDone)
{
    local int I;

    if(Link == none)
    {
        if(bDone)
        {
            ServerSendDisabledSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        if(I < NumSlotsDisabled)
        {
            Link.SetSlotEnabled(SlotsDisabled[I], false);
            ++ I;
            goto J0x3D;
        }
    }
}

function NotifyAutoAdjustSlots(CoverLink Link, const out array<int> SlotIndices)
{
    local int Index, SlotIndex, I;
    local PlayerController PC;

    Index = CoverReplicationData.Find('Link', Link;
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        I = 0;
        J0xA3:

        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsAdjusted[I] = byte(SlotIndices[I]);
            ++ I;
            goto J0xA3;
        }        
    }
    else
    {
        I = 0;
        J0x11D:

        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsAdjusted.Find(byte(SlotIndices[I]);
            if(SlotIndex == -1)
            {
                CoverReplicationData[Index].SlotsAdjusted[CoverReplicationData[Index].SlotsAdjusted.Length] = byte(SlotIndices[I]);
            }
            SlotIndex = CoverReplicationData[Index].SlotsCoverTypeChanged.Find('SlotIndex', byte(SlotIndices[I]);
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsCoverTypeChanged.Remove(SlotIndex, 1;
            }
            ++ I;
            goto J0x11D;
        }
    }
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                continue;
            }
            PC.MyCoverReplicator.NotifyAutoAdjustSlots(Link, SlotIndices);            
        }        
    }
    if(PlayerController(Owner) != none)
    {
        ServerSendAdjustedSlots(Index);
    }
}

reliable server function ServerSendAdjustedSlots(int Index)
{
    local int SlotsArrayIndex;
    local byte NumSlotsAdjusted, SlotsAdjusted;
    local int I;
    local bool bDone;

    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumSlotsAdjusted = byte(Clamp(CoverReplicationData[Index].SlotsAdjusted.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        if(I < NumSlotsAdjusted)
        {
            SlotsAdjusted[I] = CoverReplicationData[Index].SlotsAdjusted[SlotsArrayIndex + I];
            ++ I;
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsAdjusted.Length - SlotsArrayIndex) <= 8;
        ClientReceiveAdjustedSlots(Index, CoverReplicationData[Index].Link, NumSlotsAdjusted, SlotsAdjusted, bDone);
        SlotsArrayIndex += 8;
        if(!(bDone))
            goto J0x37;
    }
}

reliable client simulated function ClientReceiveAdjustedSlots(int Index, CoverLink Link, byte NumSlotsAdjusted, byte SlotsAdjusted[8], bool bDone)
{
    local int I;

    if(Link == none)
    {
        if(bDone)
        {
            ServerSendAdjustedSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        if(I < NumSlotsAdjusted)
        {
            if((Link.AutoAdjustSlot(SlotsAdjusted[I], true) && Link.Slots[SlotsAdjusted[I]].SlotOwner != none) && Link.Slots[SlotsAdjusted[I]].SlotOwner.Controller != none)
            {
                Link.Slots[SlotsAdjusted[I]].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            ++ I;
            goto J0x3D;
        }
    }
}

function NotifySetManualCoverTypeForSlots(CoverLink Link, const out array<int> SlotIndices, CoverLink.ECoverType NewCoverType)
{
    local int Index, SlotIndex, I;
    local PlayerController PC;

    Index = CoverReplicationData.Find('Link', Link;
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        CoverReplicationData[Index].SlotsCoverTypeChanged.Length = SlotIndices.Length;
        I = 0;
        J0xD5:

        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsCoverTypeChanged[I].SlotIndex = byte(SlotIndices[I]);
            CoverReplicationData[Index].SlotsCoverTypeChanged[I].ManualCoverType = NewCoverType;
            ++ I;
            goto J0xD5;
        }        
    }
    else
    {
        I = 0;
        J0x1AF:

        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsCoverTypeChanged.Find('SlotIndex', byte(SlotIndices[I]);
            if(SlotIndex == -1)
            {
                SlotIndex = CoverReplicationData[Index].SlotsCoverTypeChanged.Length;
                CoverReplicationData[Index].SlotsCoverTypeChanged.Length = CoverReplicationData[Index].SlotsCoverTypeChanged.Length + 1;
                CoverReplicationData[Index].SlotsCoverTypeChanged[SlotIndex].SlotIndex = byte(SlotIndices[I]);
            }
            CoverReplicationData[Index].SlotsCoverTypeChanged[SlotIndex].ManualCoverType = NewCoverType;
            SlotIndex = CoverReplicationData[Index].SlotsAdjusted.Find(byte(SlotIndices[I]);
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsAdjusted.Remove(SlotIndex, 1;
            }
            ++ I;
            goto J0x1AF;
        }
    }
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                continue;
            }
            PC.MyCoverReplicator.NotifySetManualCoverTypeForSlots(Link, SlotIndices, NewCoverType);            
        }        
    }
    if(PlayerController(Owner) != none)
    {
        ServerSendManualCoverTypeSlots(Index);
    }
}

reliable server function ServerSendManualCoverTypeSlots(int Index)
{
    local int SlotsArrayIndex;
    local byte NumCoverTypesChanged;
    local ManualCoverTypeInfo SlotsCoverTypeChanged[8];
    local int I;
    local bool bDone;

    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumCoverTypesChanged = byte(Clamp(CoverReplicationData[Index].SlotsCoverTypeChanged.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        if(I < NumCoverTypesChanged)
        {
            SlotsCoverTypeChanged[I] = CoverReplicationData[Index].SlotsCoverTypeChanged[SlotsArrayIndex + I];
            ++ I;
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsCoverTypeChanged.Length - SlotsArrayIndex) <= 8;
        ClientReceiveManualCoverTypeSlots(Index, CoverReplicationData[Index].Link, NumCoverTypesChanged, SlotsCoverTypeChanged, bDone);
        SlotsArrayIndex += 8;
        if(!(bDone))
            goto J0x37;
    }
}

reliable client simulated function ClientReceiveManualCoverTypeSlots(int Index, CoverLink Link, byte NumCoverTypesChanged, ManualCoverTypeInfo SlotsCoverTypeChanged[8], bool bDone)
{
    local int I;

    if(Link == none)
    {
        if(bDone)
        {
            ServerSendManualCoverTypeSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        if(I < NumCoverTypesChanged)
        {
            Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].CoverType = SlotsCoverTypeChanged[I].ManualCoverType;
            if((Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].SlotOwner != none) && Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].SlotOwner.Controller != none)
            {
                Link.Slots[SlotsCoverTypeChanged[I].SlotIndex].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            ++ I;
            goto J0x3D;
        }
    }
}

function NotifyLinkDisabledStateChange(CoverLink Link)
{
    local int Index;
    local PlayerController PC;

    Index = CoverReplicationData.Find('Link', Link;
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
    }
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                continue;
            }
            PC.MyCoverReplicator.NotifyLinkDisabledStateChange(Link);            
        }        
    }
    if(PlayerController(Owner) != none)
    {
        ServerSendLinkDisabledState(Index);
    }
}

reliable server function ServerSendLinkDisabledState(int Index)
{
    if(CoverReplicationData[Index].Link != none)
    {
        ClientReceiveLinkDisabledState(Index, CoverReplicationData[Index].Link, CoverReplicationData[Index].Link.bDisabled);
    }
}

reliable client simulated function ClientReceiveLinkDisabledState(int Index, CoverLink Link, bool bLinkDisabled)
{
    if(Link == none)
    {
        ServerSendLinkDisabledState(Index);        
    }
    else
    {
        Link.bDisabled = bLinkDisabled;
    }
}

defaultproperties
{
    bOnlyRelevantToOwner=true
    bAlwaysRelevant=false
    NetUpdateFrequency=0.1
}