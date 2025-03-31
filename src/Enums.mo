module MopsEnums {

    public type Error = {
        #NotFound;
        #AlreadyExists;
        #NotAuthorized;
        #NotAllowed;
        #DecodeError;
        #InvalidData;
        #SystemOnHold;
        #CanisterCreateError;
        #IncorrectSetup;
        #DuplicateData;
        #MaxDataExceeded;
        #InvalidProperty;
        #InsufficientFunds;
        #FailedInterCanisterCall;
    };

    public type EntryRequirement = {
        #FreeEntry;
        #InviteOnly;
        #PaidEntry;
        #PaidInviteEntry;
    };

    public type EventLogEntryType = {
        #SystemCheck;
        #UnexpectedError;
        #CanisterTopup;
        #ManagerCanisterCreated;
    };

    public type CanisterType = {
        #SNS;
        #Static;
        #Dynamic;
    };

    public type Gender = {
        #Male;
        #Female;
    };

};
