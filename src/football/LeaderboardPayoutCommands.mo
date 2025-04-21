import Enums "../Enums";
import Ids "../Ids";
import FootballDefinitions "FootballDefinitions";
import FootballIds "FootballIds";

module PayoutCommands = {
    public type LeaderboardPayoutRequest = {
        app : Enums.WaterwayLabsApp;
        entries : [LeaderboardEntry];
        gameweek : FootballDefinitions.GameweekNumber;
        seasonId : FootballIds.SeasonId;
        token : Enums.WaterwayLabsToken;
    };

    public type LeaderboardEntry = {
        principalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
    };


    public type PayoutRequest = {
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
    }

};
