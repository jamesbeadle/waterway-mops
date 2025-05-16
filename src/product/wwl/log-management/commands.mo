import WWLEnums "../enums";
import BaseEnums "../../../base/enums";

module LogCommands {
    public type AddApplicationLog = {
        app : WWLEnums.WaterwayLabsApp;
        logType : WWLEnums.LogType;
        title : Text;
        detail : Text;
        error : ?BaseEnums.Error;
    };
};
