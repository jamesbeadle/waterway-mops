module FootballEnums {

    public type PlayerPosition = {
        #Goalkeeper;
        #Defender;
        #Midfielder;
        #Forward;
    };

    public type PlayerStatus = {
        #Active;
        #Retired;
        #OnLoan;
        #FreeAgent;
    };

    public type ShirtType = {
        #Filled;
        #Striped;
    };

    public type GoalType = {
        #LeftFoot;
        #RightFoot;
        #Header;
        #OutsideBox;
        #DirectSetPiece;
    };

    public type PlayerEventType = {
        #Appearance;
        #Goal;
        #GoalAssisted;
        #GoalConceded;
        #KeeperSave;
        #CleanSheet;
        #PenaltySaved;
        #PenaltyMissed;
        #YellowCard;
        #RedCard;
        #OwnGoal;
        #HighestScoringPlayer;
    };

    public type FixtureStatusType = {
        #Unplayed;
        #Active;
        #Complete;
        #Finalised;
    };

    public type App = {
        #ICFC;
        #OpenFPL;
        #OpenWSL;
        #JeffBets;
        #TransferKings;
    };

};
