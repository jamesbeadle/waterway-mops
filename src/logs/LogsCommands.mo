import Enums "../Enums";

module LogsCommands {
    public type AddApplicationLog = {
        app : Enums.WaterwayLabsApp;
        logType : Enums.LogEntryType;
        title : Text;
        detail : Text;
        error : ?Enums.Error;
    };
};
