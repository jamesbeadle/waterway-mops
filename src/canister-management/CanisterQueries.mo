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
};
