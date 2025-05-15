import FootballDefinitions "../../domain/football/Definitions";
import FootballIds "../../domain/football/Ids";
import ICGCEnums "Enums";
import InterAppCallCommands "./InterAppCallCommands";
import Text "mo:base/Text";

module ICFCTypes {
    public type GameweekNumber = Nat8;

    public type PayoutRequest = {
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        app : ICGCEnums.SubApp;
        leaderboard : [InterAppCallCommands.LeaderboardEntry];
        token : Text;
        totalEntries : Nat;
        totalPaid : Nat;
    };
};
