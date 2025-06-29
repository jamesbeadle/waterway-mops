module BaseEnums {

    public type Currency = {
        #CKBTC;
        #ICP;
        #USD;
        #GBP;
        #EUR;
        #ICFC;
    };

    public type Gender = {
        #Male;
        #Female;
    };

    public type EntryRequirement = {
        #FreeEntry;
        #InviteOnly;
        #PaidEntry;
        #PaidInviteEntry;
    };

    public type Error = {
        #AlreadyClaimed;
        #AlreadyExists;
        #AlreadyUsed;
        #NotAuthorized;
        #NotAllowed;
        #NotFound;
        #DecodeError;
        #MaxDataExceeded;
        #DuplicateData;
        #InvalidCall;
        #InvalidData;
        #InvalidProperty;
        #TooShort;
        #TooLong;
        #CallFailed;
        #CreateFailed;
        #UpdateFailed;
        #ReadFailed;
        #DeleteFailed;
        #InsufficientFunds;
        #InsufficientAmount;
        #NoneRemaining;
        #SystemOnHold;
        #IncorrectSetup;
        #InEligible;
    };

    public type CanisterType = {
        #Static;
        #Dynamic;
        #SNS;
    };

    public type PayoutStatus = {
        #Pending;
        #Failed;
        #Paid;
    };

    public type CanisterStatus = {
        #stopped;
        #stopping;
        #running;
    };

    public type DayOfWeek = {
        #Monday;
        #Tuesday;
        #Wednesday;
        #Thursday;
        #Friday;
        #Saturday;
        #Sunday;
    };

    public type MediaType = {
        #Image;
        #Video;
        #PDF;  
    };

    public type Continent = {
        #Africa;
        #Antarctica;
        #Asia;
        #Europe;
        #NorthAmerica;
        #Oceania;
        #SouthAmerica;
    };

};
