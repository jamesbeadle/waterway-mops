module Enums {
    
    public type GameType = 
    {
        #MULLIGANS;
        #BANDS;
        #NEXT_UP;
        #BUILD_IT;
        #BOMBS;
        #PIN_HIGH;
        #BULLSEYE;
    };

    public type TimerType = {
        #TournamentBegin;
        #RoundBegin;
        #RoundComplete;
        #TournamentComplete;
    };

    public type MembershipType = {
        #Free;
        #Reward;
        #Paid;
        #Pro;
        #Business;
        #Expired;
        #NotClaimed;
        #NotEligible;
    };

    public type SubApp = {
        #GolfPad;
        #JeffBets;
    };

    public type NotificationType = {
        #TournamentBegun;
        #RoundBegun;
        #ProGolferScoreAdded;
        #RoundComplete;
        #TournamentComplete;
    };
};
