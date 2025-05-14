module GolfEnums {

    public type TournamentFormat = {
        #StrokePlay;
        #MatchPlay;
        #RyderCup;
    };

    public type GolfTour = {
        #PGATour;
        #DPWorldTour;
        #LIVGolf;
        #AsianTour;
        #JapanGolfTour;
        #PGATourAustralia;
        #SunshineTour;
        #KornFerryTour;
        #ChallengeTour;
        #LPGATour;
        #LadiesEuropeanTour;
        #JLPGA;
        #KLPGA;
        #EpsonTour;
        #PGATourChampions;
        #LegendsTour;
    };

    public type GolfMajor = {
        #Masters;
        #BritishOpen;
        #USOpen;
        #PGAChampionship;
    };

    public type TournamentStage = {
        #NotStarted;
        #Round1Active;
        #Round1Complete;
        #Round2Active;
        #Round2Complete;
        #Round3Active;
        #Round3Complete;
        #Round4Active;
        #Completed;
    };

};
