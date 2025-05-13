import WWLEnums "../wwl/Enums";
import BaseEnums "../base/Enums";

module LogsCommands {
    public type AddApplicationLog = {
        app : WWLEnums.WaterwayLabsApp;
        logType : WWLEnums.LogEntryType;
        title : Text;
        detail : Text;
        error : ?BaseEnums.Error;
    };
};
