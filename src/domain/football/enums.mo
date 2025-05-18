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
        #OpenPlay;
        #Penalty;
        #FreeKick; 
        #OwnGoal;
        #DirectSetPiece;
    };

    public type GoalProperty = {
        #InsideBox;          
        #OutsideBox;       
        #CounterAttack;     
        #HalfVolley;         
        #Volley;             
        #BicycleKick;   
        #Chip;          
        #Curl;              
        #Driven;            
        #Low;         
        #Lob;           
        #DivingHeader;       
    };

    public type GoalScoredWith = {
        #LeftFoot;
        #RightFoot;
        #Header;
        #Chest; 
        #Knee;  
        #Shin;   
        #Backheel;          
        #Other;         
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

};
