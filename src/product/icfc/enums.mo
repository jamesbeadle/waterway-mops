
module Enums {

    public type App = {
        #ICFC;
        #FootballGod;
        #OpenFPL;
        #OpenWSL;
        #TransferKings;
        #JeffBets;
        #ICPFA;
    };

    public type NotificationType = {
        #BeginGameweek;
        #CompleteGameweek;
        #FinaliseFixture;
        #RevaluePlayerUp;
        #RevaluePlayerDown;
        #LoanPlayer;
        #RecallPlayer;
        #ExpireLoan;
        #TransferPlayer;
        #SetFreeAgent;
        #RetirePlayer;
        #ChangePlayerPosition;
    }

};
