import FootballDefinitions "football/FootballDefinitions";
import FootballIds "football/FootballIds";
import Enums "Enums";
import LeaderboardPayoutCommands "football/LeaderboardPayoutCommands";
import Text "mo:base/Text";


module ICFCTypes {
    public type GameweekNumber = Nat8;

    public type PayoutRequest = {
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
        app: Enums.WaterwayLabsApp;
        entries : [LeaderboardPayoutCommands.LeaderboardEntry];
        token : Text;
    };
};
