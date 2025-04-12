import Enums "../Enums";
import Ids "../Ids";

module CanisterQueries {
    public type CanisterInfo = {
        app : Enums.WaterwayLabsApp;
        canisterName : Text;
        canisterId : Ids.CanisterId;
        cycles : Nat;
        computeAllocation : Nat;
        freezeThreshold : Nat;
        memoryAllocation : Nat;
        controllers : [Ids.PrincipalId];
        memoryUsage : Nat;
        canisterType : Enums.CanisterType;
        canisterStatus : Enums.CanisterStatus;
    };
    public type GetCanisterInfo = {
        canisterId : Ids.CanisterId;
        canisterType : Enums.CanisterType;
        canisterName : Text;
    };

    public type ProjectCanisters = {
        entries : [CanisterInfo];
    };

    public type ListCanisterSnapshots = {
        canisterId : Ids.CanisterId;
    };

    public type CanisterSnapshot = {
        id : Blob;
        total_size : Nat64;
        taken_at_timestamp : Nat64;
    };
};
