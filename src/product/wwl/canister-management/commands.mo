import Blob "mo:base/Blob";
import Enums "../../../base/enums";
import Ids "../../../base/ids";
import WaterwayLabsEnums "../../../product/wwl/enums";

module CanisterCommands {

    public type TopupCanister = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        cycles : Nat;
    };

    public type SetComputeAllocation = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        computeAllocation : Nat;
    };

    public type SetMemoryAllocation = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        memoryAllocation : Nat;
    };

    public type SetFreezingThreshold = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        freezingThreshold : Nat;
    };

    public type AddController = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        controller : Ids.PrincipalId;
        canisterType : Enums.CanisterType;
    };

    public type RemoveController = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        controller : Ids.PrincipalId;
    };

    public type TakeCanisterSnapshot = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type LoadCanisterSnapshot = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        snapshotId : Blob;
    };

    public type DeleteCanisterSnapshot = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        snapshotId : Blob;
    };

    public type DeleteCanister = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type StartCanister = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type StopCanister = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type CanisterSnapshot = {
        id : Blob;
        total_size : Nat64;
        taken_at_timestamp : Nat64;
    };

};
