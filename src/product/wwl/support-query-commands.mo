import Enums "./enums";

module SupportQueryCommands {
    
    public type CreateSupportQuery = {
        contact : Text;
        message : Text;
        name : Text;
        app : Enums.WaterwayLabsApp;
    };

};
