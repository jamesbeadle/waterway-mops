import Commands "reward-payout-commands";
import Enums "../../base/enums";
import ICFCEnums "../icfc/enums";
import Ids "../../base/ids";
import OpenFPLEnums "enums";

module OpenFPLRewardPayoutResponses = {

    public type PayoutResponse = {
        app : ICFCEnums.App;
        rewardType: OpenFPLEnums.RewardType;
        detail: PayoutResponseDetail;
        currency : Enums.Currency;
    };

    public type PayoutResponseDetail = {
        #SeasonLeaderboard : LeaderboardPayoutResponse;
        #MonthlyLeaderboard : LeaderboardPayoutResponse;
        #WeeklyLeaderboard : LeaderboardPayoutResponse;
        #MostValuableTeam : MostValuableTeamPayoutResponse;
        #HighestScoringPlayer : HighestScoringPlayerPayoutResponse;
        #WeeklyATHScore : WeeklyATHScorePayoutResponse;
        #MonthlyATHScore : MonthlyATHScorePayoutResponse;
        #SeasonATHScore : SeasonATHScorePayoutResponse;
    };
    
    public type LeaderboardPayoutResponse = {
        request: Commands.PayoutRequest;
        leaderboardPayments : [Payment];
        totalEntries : Nat;
        totalPaid : Nat;
    };

    public type MostValuableTeamPayoutResponse = {
        request: Commands.PayoutRequest;
        payment: Payment;
    };

    public type HighestScoringPlayerPayoutResponse = {
        request: Commands.PayoutRequest;
        payment: Payment;
    };

    public type WeeklyATHScorePayoutResponse = {
        request: Commands.PayoutRequest;
        payment: Payment;
    };

    public type MonthlyATHScorePayoutResponse = {
        request: Commands.PayoutRequest;
        payment: Payment;
    };

    public type SeasonATHScorePayoutResponse = {
        request: Commands.PayoutRequest;
        payment: Payment;
    };
    
    public type Payment = {
        appPrincipalId : Ids.PrincipalId;
        rewardAmount : ?Nat64;
        payoutStatus : Enums.PayoutStatus;
        payoutDate : ?Int;
        currency: Enums.Currency;
    };

};
