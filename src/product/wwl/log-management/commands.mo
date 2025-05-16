import AppEnums "../enums";
import BaseEnums "../../../base/enums";

module LogCommands {
    public type AddApplicationLog = {
        app : AppEnums.WaterwayLabsApp;
        logType : AppEnums.LogType;
        title : Text;
        detail : Text;
        error : ?BaseEnums.Error;
    };
};
