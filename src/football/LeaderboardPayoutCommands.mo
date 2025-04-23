import Enums "../Enums";
import Ids "../Ids";
import FootballDefinitions "FootballDefinitions";
import FootballIds "FootballIds";
import Text "mo:base/Text";

module PayoutCommands = {
    public type LeaderboardPayoutRequest = {
        app : Enums.WaterwayLabsApp;
        leaderboard : [LeaderboardEntry];
        gameweek : FootballDefinitions.GameweekNumber;
        seasonId : FootballIds.SeasonId;
        token : Text;
        totalEntries : Nat;
        totalPaid : Nat;
    };

    public type LeaderboardEntry = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
    };

    public type PayoutRequest = {
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        totalEntries : Nat;
        totalPaid : Nat;
        leaderboard : [LeaderboardEntry];
    };

    public type CompleteLeaderboardPayout = {
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        totalEntries : Nat;
        totalPaid : Nat;
        leaderboard : [LeaderboardEntry];
    };

};
