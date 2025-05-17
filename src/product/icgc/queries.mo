import Enums "enums";
import GolfIds "../../domain/golf/ids";
import Ids "../../base/ids";

module ICFCQueries {
   
    public type GetICFCLinks = {};

    public type ICFCLinks = {
        icfcPrincipalId : Ids.PrincipalId;
        subAppUserPrincipalId : Ids.PrincipalId;
        membershipType : Enums.MembershipType;
        subApp : Enums.SubApp;
    };

    public type GetDataHashes = {
        tournamentId: GolfIds.TournamentId;
    };

    public type GetDataTotals = {

    };

    public type DataTotals = {
        totalLeagues: Nat;
        totalClubs: Nat;
        totalPlayers: Nat;
    };

    public type GetProfile = {

    };

    public type Profile = {
        principalId : Ids.PrincipalId;
        username : Text;
        displayName : Text;
        membershipType : Enums.MembershipType;
        memberships : [Membership];
        createdOn : Int;
        profilePicture : ?Blob;
        termsAgreed : Bool;
        subscriptionExpiryTime : Int;
        homeCourseId: GolfIds.GolfCourseId;
        nationalityId : ?Ids.CountryId;
    };

    public type Membership = {
        subscriptionType : Enums.MembershipType;
        purchasedOn : Int;
        expiresOn : ?Int;
    };

};
