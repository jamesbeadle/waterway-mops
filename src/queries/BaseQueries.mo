import Bool "mo:base/Bool";
import Text "mo:base/Text";
import Ids "../Ids";

module BaseQueries {

    public type AppStatus = { onHold : Bool; version : Text };
    public type GetAppStatus = {};

    public type GetCountries = {};

    public type Countries = {
        countries : [Country];
    };

    public type Country = {
        id : Ids.CountryId;
        name : Text;
        code : Text;
    };
};
