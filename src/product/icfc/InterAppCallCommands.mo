import Text "mo:base/Text";
import Definitions "../../domain/football/Definitions";
import FootballIds "../../domain/football/Ids";
import Ids "../../base/Ids";
import Enums "../../base/Enums";
import ICFCEnums "./Enums";

module PayoutCommands = {
    public type LeaderboardPayoutRequest = {
        app : Text;
        leaderboard : [LeaderboardEntry];
        gameweek : Definitions.GameweekNumber;
        seasonId : FootballIds.SeasonId;
        token : Text;
    };

    public type LeaderboardEntry = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
    };

    public type PayoutRequest = {
        seasonId : FootballIds.SeasonId;
        gameweek : Definitions.GameweekNumber;
        app : ICFCEnums.SubApp;
        leaderboard : [LeaderboardEntry];
        token : Text;
        totalEntries : Nat;
        totalPaid : Nat;
    };

    public type CompleteLeaderboardPayout = {
        seasonId : FootballIds.SeasonId;
        gameweek : Definitions.GameweekNumber;
        leaderboard : [LeaderboardEntry];
    };

};
