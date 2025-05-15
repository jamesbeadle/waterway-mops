import WWLEnums "../Enums";
import BaseEnums "../../../base/Enums";

module LogCommands {
    public type AddApplicationLog = {
        app : WWLEnums.WaterwayLabsApp;
        logType : WWLEnums.LogEntryType;
        title : Text;
        detail : Text;
        error : ?BaseEnums.Error;
    };
};
