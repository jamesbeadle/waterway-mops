import Enums "../../Enums";
import Ids "../../Ids";
import FootballIds "../../football/FootballIds";
import BaseDefinitions "../../BaseDefinitions";
import FootballDefinitions "../../football/FootballDefinitions";

module LeagueQueries {

    public type GetLeagues = {
        
    };

    public type Leagues = {
        leagues: [League];
    };

    public type League = {
        id : FootballIds.LeagueId;
        name : Text;
        abbreviation : Text;
        teamCount : Nat8;
        relatedGender : Enums.Gender;
        governingBody : Text;
        formed : Int;
        countryId : Ids.CountryId;
        logo : Blob;
    };

    public type GetBettableLeagues = {

    };

    public type BettableLeagues = {
        leagues: [League];
    };

    public type GetLeagueStatus = {
        leagueId: FootballIds.LeagueId;
    };

    public type LeagueStatus = {
        leagueId : FootballIds.LeagueId;
        activeSeasonId : FootballIds.SeasonId;
        activeMonth : BaseDefinitions.CalendarMonth;
        unplayedGameweek : FootballDefinitions.GameweekNumber;
        activeGameweek : FootballDefinitions.GameweekNumber;
        completedGameweek : FootballDefinitions.GameweekNumber;
        transferWindowActive : Bool;
        seasonActive : Bool;
        totalGameweeks : Nat8;
        transferWindowStartDay : Nat8;
        transferWindowStartMonth : Nat8;
        transferWindowEndDay : Nat8;
        transferWindowEndMonth : Nat8;
    };

    public type GetLeagueTable = {
        leagueId: FootballIds.LeagueId;
        seasonId: FootballIds.SeasonId;
    };

    public type LeagueTable = {
        leagueId : FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
        entries : [LeagueTableEntry];
    };

    public type LeagueTableEntry = {
        position : Nat;
        clubId : FootballIds.ClubId;
        played : Nat;
        won : Nat;
        drawn : Nat;
        lost : Nat;
        conceded : Nat;
        scored : Nat;
        points : Nat;
        homePlayed : Nat;
        homeWon : Nat;
        homeDrawn : Nat;
        homeLost : Nat;
        homeConceded : Nat;
        homeScored : Nat;
        homePoints : Nat;
        awayPlayed : Nat;
        awayWon : Nat;
        awayDrawn : Nat;
        awayLost : Nat;
        awayConceded : Nat;
        awayScored : Nat;
        awayPoints : Nat;
    };


}