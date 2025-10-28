
module Enums {

    public type MatchPeriod = {
        #FirstHalf;
        #SecondHalf;
        #ExtraTimeFirstHalf;
        #ExtraTimeSecondHalf;
        #PenaltyShootout;
    };

    public type PlayerPosition = {
        #Goalkeeper;
        #Defender;
        #Midfielder;
        #Forward;
    };

    public type ShirtType = {
        #Filled;
        #Striped;
    };

    public type PlayerStatus = {
        #Active;
        #Injured;
        #Retired;
        #OnLoan;
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

    public type GameweekStatus = {
        #NotStarted;
        #Active;
        #Complete; 
    };

};
