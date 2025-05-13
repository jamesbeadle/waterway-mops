import Ids "Ids";

module BaseTypes {
    
    public type RustResult = { #Ok : Text; #Err : Text };

    public type AppStatus = {
        onHold : Bool;
        version : Text;
    };

    public type DataHash = {
        category : Text;
        hash : Text;
    };

    public type Country = {
        id : Ids.CountryId;
        name : Text;
        code : Text;
    };

    public type CanisterTopup = {
        canisterId : Ids.CanisterId;
        topupTime : Int;
        cyclesAmount : Nat;
    };

    public type Account = {
        owner : Principal;
        subaccount : Blob;
    };

    public type TimerInfo = {
        id : Int;
        triggerTime : Int;
        callbackName : Text;
    };
};
