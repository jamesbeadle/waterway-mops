import Ids "ids";
import Enums "enums";

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

    public type Address = {
        buildingNameOrNumber: Text;
        addressLine1: Text;
        addressLine2: ?Text;
        addressLine3: ?Text;
        townOrCity: ?Text;
        countyOrState: ?Text;
        postCodeOrZip: ?Text;
    };

    public type OpeningHour =
    {
        index: Nat8;
        day: Enums.DayOfWeek;
        openingTime: Int;
        closingTime: Int;
    };

    public type Contact = {
        name: Text;
        contactType: Text;
        details: Text;
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

    public type BrandInformation = {
        displayImage: ?Blob;
        coverImage: ?Blob;
        primaryHexColour: ?Text;
        secondaryHexColour: ?Text;
        thirdHexColour: ?Text;
        className: ?Text;
    };
};
