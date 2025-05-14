import Text "mo:base/Text";
import GolfIds "../../../domain/golf/GolfIds";
import Definitions "../../../base/Definitions";
import Ids "../../../base/Ids";
import Enums "../../../base/Enums";

module PayoutCommands = {
    public type LeaderboardPayoutRequest = {
        app : Text;
        leaderboard : [LeaderboardEntry];
        tournamentId : GolfIds.TournamentId;
        year: Definitions.Year;
    };

    public type LeaderboardEntry = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
    };

    public type PayoutRequest = {
        tournamentId : GolfIds.TournamentId;
        year : Definitions.Year;
        leaderboard : [LeaderboardEntry];
    };

    public type CompleteLeaderboardPayout = {
        tournamentId : GolfIds.TournamentId;
        year : Definitions.Year;
        leaderboard : [LeaderboardEntry];
    };

};
