import BaseEnums "../../../base/enums";
import Enums "../enums";
import Ids "../ids";

module LogQueries {

    public type GetApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        page : Nat;
    };

    public type ApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        logs : [ApplicationLog];
        totalEntries : Nat;
    };

    public type ApplicationLog = {
        app : Enums.WaterwayLabsApp;
        id : Ids.ApplicationLogId;
        createdOn : Int;
        logType : Enums.LogType;
        title : Text;
        detail : Text;
        error : ?BaseEnums.Error;
    }
};
