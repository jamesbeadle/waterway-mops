import Bool "mo:base/Bool";
import Text "mo:base/Text";

module BaseQueries {

    public type AppStatus = { onHold : Bool; version : Text };
    public type GetAppStatus = {};

};
