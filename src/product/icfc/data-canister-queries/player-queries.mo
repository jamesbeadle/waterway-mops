import FootballDefinitions "../../../domain/football/definitions";
import FootballEnums "../../../domain/football/enums";
import FootballIds "../../../domain/football/ids";
import Ids "../../../base/ids";
import Definitions "../../../base/definitions";

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
        parentLeagueId: ?FootballIds.LeagueId;
        parentClubId: ?FootballIds.ClubId;
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
        parentLeagueId: ?FootballIds.LeagueId;
        parentClubId : ?FootballIds.ClubId;
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
        gameweek : FootballDefinitions.GameweekNumber;
        events : [PlayerEventData];
        points : Int16;
        fixtureId : FootballIds.FixtureId;
    };
    
    public type PlayerEventData = {
        fixtureId : FootballIds.FixtureId;
        playerId : FootballIds.PlayerId;
        clubId : FootballIds.ClubId;
        eventType : FootballEnums.PlayerEventType;
        eventStartMinute : FootballDefinitions.MatchMinute;
        eventEndMinute : FootballDefinitions.MatchMinute;
        minutesIntoExtraTime : FootballDefinitions.ExtraTimeMinuteTotal;
        matchPeriod: FootballEnums.MatchPeriod;
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

    public type GetPlayerValueLeaderboard = {};

    public type PlayerValueLeaderboard = {
        players : [PlayerSummary];
    };

    public type PlayerSummary = {
        playerId : FootballIds.PlayerId;
        clubId : FootballIds.ClubId;
        leagueId : FootballIds.LeagueId;
        position : Nat;
        positionText : Text;
        totalValue : Nat16;
        priorValue : Nat16;
    };

    public type PlayerSeason = {
        playerId: FootballIds.PlayerId;
        seasonId : FootballIds.SeasonId;
        gameweeks : [PlayerGameweek];
        totalPoints : Int16;
    };

    public type PlayerClubCup = {
        playerId: FootballIds.PlayerId;
        clubCupId: FootballIds.ClubCupId;
        seasonId : FootballIds.SeasonId;
        // TODO: add required information
    };

    public type PlayerInternationalFriendly = {
        playerId: FootballIds.PlayerId;
        fixtureDate: Definitions.UnixTime;
    };

    public type PlayerInternationalTournament = {
        playerId: FootballIds.PlayerId;
        internationalTournamentId: FootballIds.InternationalTournamentId;
        year : Definitions.Year;
        // TODO: add required information
    };


}