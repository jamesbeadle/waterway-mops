import FootballIds "../../domain/football/ids";
import Ids "../../base/ids";
import Enums "enums";

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
        totalNeurons: Nat;
        totalProposals: Nat;
        totalGovernanceRewards: Nat;
    };

};
