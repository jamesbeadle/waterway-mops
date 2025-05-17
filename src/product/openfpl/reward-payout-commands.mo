import Definitions "../../base/definitions";
import Enums "../../base/enums";
import FootballIds "../../domain/football/ids";
import FootballDefinitions "../../domain/football/definitions";
import ICFCEnums "../icfc/enums";
import Ids "../../base/ids";
import OpenFPLEnums "enums";

module OpenFPLRewardPayoutCommands = {
  
    public type PayoutRequest = {
        app : ICFCEnums.App;
        rewardType: OpenFPLEnums.RewardType;
        detail: PayoutRequestDetail;
        currency : Enums.Currency;
    };

    public type PayoutRequestDetail = {
        #SeasonLeaderboard : SeasonLeaderboard;
        #MonthlyLeaderboard : MonthlyLeaderboard;
        #WeeklyLeaderboard : WeeklyLeaderboard;
        #MostValuableTeam : MostValuableTeam;
        #HighestScoringPlayer : HighestScoringPlayer;
        #WeeklyATHScore : WeeklyATHScore;
        #MonthlyATHScore : MonthlyATHScore;
        #SeasonATHScore : SeasonATHScore;
    };

    public type SeasonLeaderboard = {
        seasonId: FootballIds.SeasonId;
        leaderboard : [LeaderboardEntry];
    };

    public type MonthlyLeaderboard = {
        seasonId: FootballIds.SeasonId;
        month: Definitions.CalendarMonth;
        clubId: FootballIds.ClubId;
        leaderboard : [LeaderboardEntry];
    };

    public type WeeklyLeaderboard = {
        seasonId: FootballIds.SeasonId;
        gameweek: FootballDefinitions.GameweekNumber;
        leaderboard : [LeaderboardEntry];
    };

    public type MostValuableTeam = {
        seasonId: FootballIds.SeasonId;
        principalId: Ids.PrincipalId;
        teamValueQuarterMillions: Nat16;
    };

    public type HighestScoringPlayer = {
        seasonId: FootballIds.SeasonId;
        gameweek: FootballDefinitions.GameweekNumber;
        fixtureId: FootballIds.FixtureId;
        playerId: FootballIds.PlayerId;
        managers : [Ids.PrincipalId];
    };

    public type WeeklyATHScore = {
        seasonId: FootballIds.SeasonId;
        gameweek: FootballDefinitions.GameweekNumber;
        newHighScore: Nat16;
    };

    public type MonthlyATHScore = {
        seasonId: FootballIds.SeasonId;
        month: Definitions.CalendarMonth;
        clubId: FootballIds.ClubId;
        newHighScore: Nat16;
    };

    public type SeasonATHScore = {
        seasonId: FootballIds.SeasonId;
        newHighScore: Nat16;
    };

    public type LeaderboardEntry = {
        position: Nat;
        appPrincipalId : Ids.PrincipalId;
    };
    
};
