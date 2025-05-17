import Definitions "../../base/definitions";
import Enums "../../base/enums";
import GolfIds "../../domain/golf/ids";
import Ids "../../base/ids";
import ICGCEnums "../icgc/enums";
import GolfPadEnums "enums";

module GolfPadRewardPayoutCommands = {
  
    public type PayoutRequest = {
        app : ICGCEnums.SubApp;
        rewardType: GolfPadEnums.RewardType;
        detail: PayoutRequestDetail;
        currency : Enums.Currency;
    };

    public type PayoutRequestDetail = {
        #TournamentLeaderboard : TournamentLeaderboard;
    };

    public type TournamentLeaderboard = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
        leaderboard : [LeaderboardEntry];
    };

    public type LeaderboardEntry = {
        position: Nat;
        appPrincipalId : Ids.PrincipalId;
    };
    
    public type LeaderboardPayoutResponse = {
        request: PayoutRequest;
        leaderboard : [PaidLeaderboardEntry];
        totalEntries : Nat;
        totalPaid : Nat;
    };
    
    public type PaidLeaderboardEntry = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
    };

};
