import WaterwayLabsEnums "../../../product/wwl/Enums";
import BaseEnums "../../../base/Enums";
import Ids "../../../base/Ids";

module CanisterQueries {

    public type GetProjectCanisters = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
    };

    public type CanisterInfo = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        cycles : Nat;
        computeAllocation : Nat;
        freezeThreshold : Nat;
        memoryAllocation : Nat;
        controllers : [Ids.PrincipalId];
        memoryUsage : Nat;
        canisterStatus : BaseEnums.CanisterStatus;
        idleCyclesBurnedPerDay : Nat;
    };

    public type Canister = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterName : Text;
        canisterId : Ids.CanisterId;
        canisterType : BaseEnums.CanisterType;
    };

    public type GetCanisterInfo = {
        canisterId : Ids.CanisterId;
        app : WaterwayLabsEnums.WaterwayLabsApp;
    };

    public type ProjectCanisters = {
        entries : [Canister];
    };

    public type ListCanisterSnapshots = {
        app : WaterwayLabsEnums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type CanisterSnapshot = {
        id : Blob;
        total_size : Nat64;
        taken_at_timestamp : Nat64;
    };
};
