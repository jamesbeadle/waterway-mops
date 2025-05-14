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
        app : Enums.WaterwayLabsApp;
        leaderboard : [LeaderboardPayoutCommands.LeaderboardEntry];
        token : Text;
        totalEntries : Nat;
        totalPaid : Nat;
    };
};
