import Enums "../Enums";
import Ids "../Ids";
import Blob "mo:base/Blob";

module CanisterCommands {

    public type TopupCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        cycles : Nat;
    };

    public type SetComputeAllocation = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        computeAllocation : Nat;
    };

    public type SetMemoryAllocation = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        memoryAllocation : Nat;
    };

    public type SetFreezingThreshold = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        freezingThreshold : Nat;
    };

    public type AddController = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        controller : Ids.PrincipalId;
    };

    public type RemoveController = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        controller : Ids.PrincipalId;
    };

    public type TakeCanisterSnapshot = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type LoadCanisterSnapshot = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        snapshotId : Blob;
    };

    public type DeleteCanisterSnapshot = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        snapshotId : Blob;
    };

    public type DeleteCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type StartCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type StopCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type CanisterSnapshot = {
        id : Blob;
        total_size : Nat64;
        taken_at_timestamp : Nat64;
    };

};
