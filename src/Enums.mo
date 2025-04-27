module Enums {

    public type Error = {
        #NotFound;
        #TooLong;
        #AlreadyExists;
        #AlreadyClaimed;
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
        #UpdateFailed;
        #InvalidProfilePicture;
        #InEligible;
        #NeuronAlreadyUsed;
        #FailedInterCanisterCall;
        #NoPacketsRemaining;
        #InsufficientPacketsRemaining;
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
    public type CanisterStatus = {
        #stopped;
        #stopping;
        #running;
    };

    public type Gender = {
        #Male;
        #Female;
    };

    public type LogEntryType = {
        #Warning;
        #Error;
        #Information;
        #Success;
        #SystemCheck;
        #CanisterTopup;
        #CanisterCreated;
    };

    public type WaterwayLabsApp = {
        #WaterwayLabs;
        #ICFC;
        #FootballGod;
        #OpenFPL;
        #OpenWSL;
        #TransferKings;
        #JeffBets;
        #ICPFA;
        #ICGC;
        #ICF1;
        #OpenBook;
        #OpenChef;
        #ICPCasino;
        #OpenCare;
        #OpenBeats;
        #GolfPad;
    };

    public type WaterwayLabsToken = {
        #ICFC;
        #Unknown;
    };

    public type PayoutStatus = {
        #Pending;
        #Paid;
    };

};
