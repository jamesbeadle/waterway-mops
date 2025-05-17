import Commands "reward-payout-commands";
import Enums "../../base/enums";
import ICFCEnums "../icfc/enums";
import Ids "../../base/ids";
import GolfPadEnums "enums";

module GolfPadRewardPayoutResponses = {

    public type PayoutResponse = {
        app : ICFCEnums.App;
        rewardType: GolfPadEnums.RewardType;
        detail: PayoutResponseDetail;
        currency : Enums.Currency;
    };

    public type PayoutResponseDetail = {
        #TournamentLeaderboard : LeaderboardPayoutResponse;
    };
    
    public type LeaderboardPayoutResponse = {
        request: Commands.PayoutRequest;
        leaderboardPayments : [Payment];
        totalEntries : Nat;
        totalPaid : Nat;
    };
    
    public type Payment = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
        currency: Enums.Currency;
    };

};
