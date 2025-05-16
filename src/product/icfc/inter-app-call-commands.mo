import Text "mo:base/Text";
import Definitions "../../domain/football/definitions";
import FootballIds "../../domain/football/ids";
import Ids "../../base/ids";
import Enums "../../base/enums";
import ICFCEnums "./enums";

module InterAppCallCommands = {
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
