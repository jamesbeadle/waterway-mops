import Enums "../Enums";
import MopsIds "../Ids";
import Blob "mo:base/Blob";

module CanisterCommands {

    public type TopupCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        cycles : Nat;
    };

    public type SetComputeAllocation = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        computeAllocation : Nat;
    };

    public type SetMemoryAllocation = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        memoryAllocation : Nat;
    };

    public type SetFreezingThreshold = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        freezingThreshold : Nat;
    };

    public type AddController = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        controller : MopsIds.PrincipalId;
    };

    public type RemoveController = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        controller : MopsIds.PrincipalId;
    };

    public type TakeCanisterSnapshot = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
    };

    public type LoadCanisterSnapshot = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        snapshotId : Blob;
    };

    public type DeleteCanisterSnapshot = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
        snapshotId : Blob;
    };

    public type DeleteCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
    };

    public type StartCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
    };

    public type StopCanister = {
        app : Enums.WaterwayLabsApp;
        canisterId : MopsIds.CanisterId;
    };

    public type CanisterSnapshot = {
        id : Blob;
        total_size : Nat64;
        taken_at_timestamp : Nat64;
    };

};
