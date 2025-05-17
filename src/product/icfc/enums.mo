module Enums {

    public type TimerType = {
        #LoanComplete;
        #GameweekBegin;
        #GameKickOff;
        #GameComplete;
        #InjuryExpired;
        #TransferWindow;
    };

    public type SubscriptionType = {
        #Free;
        #Reward;
        #Paid;
        #Pro;
        #Expired;
        #NotClaimed;
        #NotEligible;
    };

    public type SubApp = {
        #OpenFPL;
        #OpenWSL;
        #JeffBets;
        #TransferKings;
        #FootballGod;
    };

    public type App = {
        #ICFC;
        #OpenFPL;
        #OpenWSL;
        #JeffBets;
        #TransferKings;
        #FootballGod;
    };

    public type NotificationType = {
        #CreateClub;
        #UpdateClub;
        #PromoteClub;
        #RelegateClub;
        #CreateLeague;
        #UpdateLeague;
        #AddInitialFixtures;
        #BeginSeason;
        #BeginGameweek;
        #CompleteGameweek;
        #CompleteFixture;
        #FinaliseFixture;
        #CompleteSeason;
        #RevaluePlayerUp;
        #RevaluePlayerDown;
        #LoanPlayer;
        #RecallPlayer;
        #ExpireLoan;
        #TransferPlayer;
        #SetFreeAgent;
        #CreatePlayer;
        #UpdatePlayer;
        #InjuryUpdated;
        #RetirePlayer;
        #UnretirePlayer;
        #ChangePlayerPosition;
    }

};
