import Enums "../Enums";
import Types "../Types";
module LogsQueries {

    public type GetApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        page : Nat;
    };

    public type ApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        logs : [Types.ApplicationLog];
        totalEntries : Nat;
    };
};
