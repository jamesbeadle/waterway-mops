import Text "mo:base/Text";
import GolfIds "../../domain/golf/ids";
import Definitions "../../base/definitions";
import Ids "../../base/ids";
import Enums "../../base/enums";

module InterAppCallCommands = {
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

    public type LeaderboardPayoutResponse = {
        tournamentId : GolfIds.TournamentId;
        year : Definitions.Year;
        leaderboard : [LeaderboardEntry];
    };

};
