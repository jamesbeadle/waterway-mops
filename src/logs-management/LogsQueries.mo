import Enums "../Enums";
import BaseTypes "../BaseTypes";
module LogsQueries {

    public type GetApplicationLogs = {
        app : Enums.WaterwayLabsApp;
    };

    public type ApplicationLogs = {
        app : Enums.WaterwayLabsApp;
        logs : [BaseTypes.ApplicationLog];
        totalEntries : Nat;
    };
};
