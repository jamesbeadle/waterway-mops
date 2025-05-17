import Enums "enums";
import FootballIds "../../domain/football/ids";
import Ids "../../base/ids";

module ICFCQueries {
   
    public type GetICFCLinks = {};

    public type ICFCLinks = {
        icfcPrincipalId : Ids.PrincipalId;
        subAppUserPrincipalId : Ids.PrincipalId;
        subscriptionType : Enums.SubscriptionType;
        subApp : Enums.SubApp;
    };

    public type GetDataHashes = {
        leagueId: FootballIds.LeagueId;
    };

    public type GetDataTotals = {

    };

    public type DataTotals = {
        totalLeagues: Nat;
        totalClubs: Nat;
        totalPlayers: Nat;
    };

    public type GetProfile = {
        app: Enums.App;
        principalId: Ids.PrincipalId;
    };

    public type Profile = {
        principalId : Ids.PrincipalId;
        username : Text;
        displayName : Text;
        subscriptionType : Enums.SubscriptionType;
        subscriptions : [Subscription];
        createdOn : Int;
        profilePicture : ?Blob;
        termsAgreed : Bool;
        subscriptionExpiryTime : Int;
        favouriteLeagueId : ?FootballIds.LeagueId;
        favouriteClubId : ?FootballIds.ClubId;
        nationalityId : ?Ids.CountryId;
    };

    public type Subscription = {
        subscriptionType : Enums.SubscriptionType;
        purchasedOn : Int;
        expiresOn : ?Int;
    };

};
