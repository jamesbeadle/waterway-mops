import Definitions "../../domain/football/definitions";
import Enums "../../base/enums";
import FootballIds "../../domain/football/ids";
import ICFCEnums "./enums";
import Ids "../../base/ids";

module InterAppCallCommands = {
    public type LeaderboardPayoutRequest = {
        app : ICFCEnums.App;
        leaderboard : [LeaderboardEntry];
        gameweek : Definitions.GameweekNumber;
        seasonId : FootballIds.SeasonId;
        currency : Enums.Currency;
    };

    public type LeaderboardEntry = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
    };

    public type LeaderboardPayoutResponse = {
        seasonId : FootballIds.SeasonId;
        gameweek : Definitions.GameweekNumber;
        app : ICFCEnums.App;
        leaderboard : [LeaderboardEntry];
        currency : Enums.Currency;
        totalEntries : Nat;
        totalPaid : Nat;
    };

};
