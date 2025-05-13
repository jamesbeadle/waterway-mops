import Ids "../../Ids";
import FootballIds "../../football/FootballIds";
import FootballEnums "../../football/FootballEnums";
import FootballDefinitions "../../football/FootballDefinitions";

module PlayerQueries {
    public type GetPlayers = {
        leagueId: FootballIds.LeagueId;
    };

    public type Players = {
        players: [Player];
    };

    public type Player = {
        id : Nat16;
        clubId : FootballIds.ClubId;
        position : FootballEnums.PlayerPosition;
        firstName : Text;
        lastName : Text;
        shirtNumber : Nat8;
        valueQuarterMillions : Nat16;
        dateOfBirth : Int;
        nationality : Ids.CountryId;
        status : FootballEnums.PlayerStatus;
        leagueId: FootballIds.LeagueId;
        parentLeagueId: FootballIds.LeagueId;
        parentClubId: FootballIds.ClubId;
        currentLoanEndDate: Int;

    };

    public type GetLoanedPlayers = {
        leagueId: FootballIds.LeagueId;
    };

    public type LoanedPlayers = {
        players: [Player];
    };

    public type GetRetiredPlayers = {
        leagueId: FootballIds.LeagueId;
        clubId : FootballIds.ClubId;

    };

    public type RetiredPlayers = {
        players: [Player];
    };

    public type GetPlayerDetails = {
        leagueId: FootballIds.LeagueId;
        playerId : FootballIds.PlayerId;
        seasonId : FootballIds.SeasonId;
    };

    public type PlayerDetails = {
        player: DetailedPlayer
    };


    public type DetailedPlayer = {
        id : FootballIds.PlayerId;
        clubId : FootballIds.ClubId;
        position : FootballEnums.PlayerPosition;
        firstName : Text;
        lastName : Text;
        shirtNumber : Nat8;
        valueQuarterMillions : Nat16;
        dateOfBirth : Int;
        nationality : Ids.CountryId;
        seasonId : FootballIds.SeasonId;
        gameweeks : [PlayerGameweek];
        valueHistory : [ValueHistory];
        status : FootballEnums.PlayerStatus;
        parentClubId : FootballIds.ClubId;
        latestInjuryEndDate : Int;
        injuryHistory : [InjuryHistory];
        retirementDate : Int;
    };

    public type ValueHistory = {
        oldValue: Nat16;
        changedOn: Int;
        newValue: Nat16;
    };

    public type InjuryHistory = {
        description: Text;
        injuryStartDate: Int;
        expectedEndDate: Int;
    };
        
    public type PlayerGameweek = {
        number : Nat8;
        events : [PlayerEventData];
        points : Int16;
        fixtureId : FootballIds.FixtureId;
    };

    public type PlayerEventData = {
        fixtureId : FootballIds.FixtureId;
        playerId : Nat16;
        eventType : FootballEnums.PlayerEventType;
        eventStartMinute : Nat8;
        eventEndMinute : Nat8;
        clubId : FootballIds.ClubId;
    };


    public type GetPlayerDetailsForGameweek = {
        leagueId: FootballIds.LeagueId;
        seasonId: FootballIds.SeasonId;
        gameweek: FootballDefinitions.GameweekNumber;
    };

    public type PlayerDetailsForGameweek = {
        playerPoints: [PlayerQueries.PlayerPoints];
    };

    public type PlayerPoints = {
        id : Nat16;
        gameweek : FootballDefinitions.GameweekNumber;
        points : Int16;
        clubId : FootballIds.ClubId;
        position : FootballEnums.PlayerPosition;
        events : [PlayerEventData];
    };

    public type GetPlayersMap = {
        leagueId: FootballIds.LeagueId;
        seasonId: FootballIds.SeasonId;
        gameweek: FootballDefinitions.GameweekNumber;
    };

    public type PlayersMap = {
        playersMap: [(FootballIds.PlayerId, PlayerQueries.PlayerScore)]
    };

    public type PlayerScore = {
         id : Nat16;
        points : Int16;
        clubId : FootballIds.ClubId;
        goalsScored : Int16;
        goalsConceded : Int16;
        position : FootballEnums.PlayerPosition;
        nationality : Ids.CountryId;
        dateOfBirth : Int;
        saves : Int16;
        assists : Int16;
        events : [PlayerEventData];
    };

}