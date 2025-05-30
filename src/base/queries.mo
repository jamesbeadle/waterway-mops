import Bool "mo:base/Bool";
import Ids "ids";
import Text "mo:base/Text";

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

    public type DataHash = {
        category : Text;
        hash : Text;
    };
    public type GetDataHashes = {};

    public type DataHashes = {
        dataHashes : [DataHash];
    };

};
