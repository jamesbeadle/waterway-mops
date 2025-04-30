import Enums "../Enums";
import BaseTypes "../BaseTypes";
module LogsQueries {

    public type GetApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        page : Nat;
    };

    public type ApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        logs : [BaseTypes.ApplicationLog];
        totalEntries : Nat;
    };
};
