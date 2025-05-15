import BaseEnums "../../base/Enums";
import Enums "Enums";
import Ids "Ids";

module {

    public type SystemLog = {
        eventId : Nat;
        eventTime : Int;
        eventType : Enums.LogEntryType;
        eventTitle : Text;
        eventDetail : Text;
    };


    public type ApplicationLog = {
        app : Enums.WaterwayLabsApp;
        id : Ids.ApplicationLogId;
        createdOn : Int;
        logType : Enums.LogEntryType;
        title : Text;
        detail : Text;
        error : ?BaseEnums.Error;
    };
}