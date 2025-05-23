import BaseDefinitions "../../../base/definitions";
import Enums "../../../base/enums";
import FootballDefinitions "../../../domain/football/definitions";
import FootballIds "../../../domain/football/ids";
import Ids "../../../base/ids";

module LeagueQueries {

    public type GetLeagues = { };

    public type Leagues = {
        leagues: [League];
    };

    public type League = {
        id : FootballIds.LeagueId;
        name : Text;
        abbreviation : Text;
        teamCount : Nat8;
        relatedGender : Enums.Gender;
        governingBodyId : FootballIds.GoverningBodyId;
        confederationId: FootballIds.ConfederationId;
        federationId: FootballIds.FederationId;
        formed : Int;
        countryId : Ids.CountryId;
        logo : ?Blob;
        nationalTier: Nat;
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