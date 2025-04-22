import Enums "../Enums";
import Ids "../Ids";

module CanisterQueries {

    public type GetProjectCanisters = {
        app : Enums.WaterwayLabsApp;
    };

    public type CanisterInfo = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
        cycles : Nat;
        computeAllocation : Nat;
        freezeThreshold : Nat;
        memoryAllocation : Nat;
        controllers : [Ids.PrincipalId];
        memoryUsage : Nat;
        canisterStatus : Enums.CanisterStatus;
        idleCyclesBurnedPerDay : Nat;
    };

    public type Canister = {
        app : Enums.WaterwayLabsApp;
        canisterName : Text;
        canisterId : Ids.CanisterId;
        canisterType : Enums.CanisterType;
    };

    public type GetCanisterInfo = {
        canisterId : Ids.CanisterId;
        app : Enums.WaterwayLabsApp;
    };

    public type ProjectCanisters = {
        entries : [Canister];
    };

    public type ListCanisterSnapshots = {
        app : Enums.WaterwayLabsApp;
        canisterId : Ids.CanisterId;
    };

    public type CanisterSnapshot = {
        id : Blob;
        total_size : Nat64;
        taken_at_timestamp : Nat64;
    };

    public type GetApplicationLogs = {
        app : Enums.WaterwayLabsApp;
    };

    public type ApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        logs : [SystemEvent];
        totalEntries : Nat;
    };

    public type SystemEvent = {
        eventId : Nat;
        eventTime : Int;
        eventType : Enums.LogEntryType;
        eventTitle : Text;
        eventDetail : Text;
    };
};
