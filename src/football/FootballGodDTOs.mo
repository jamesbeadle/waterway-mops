import FootballTypes "FootballTypes";
import MopsIds "../Ids";
import FootballIds "FootballIds";
import FootballEnums "FootballEnums";

module DTOs {

    public type SeasonDTO = {
        id : FootballIds.SeasonId;
        name : Text;
        year : Nat16;
    };

    public type FixtureDTO = {
        id : Nat32;
        seasonId : FootballIds.SeasonId;
        gameweek : FootballTypes.GameweekNumber;
        kickOff : Int;
        homeClubId : FootballIds.ClubId;
        awayClubId : FootballIds.ClubId;
        homeGoals : Nat8;
        awayGoals : Nat8;
        status : FootballEnums.FixtureStatusType;
        highestScoringPlayerId : Nat16;
        events : [FootballTypes.PlayerEventData];
    };

    public type PlayerDetailDTO = {
        id : FootballIds.PlayerId;
        clubId : FootballIds.ClubId;
        position : FootballEnums.PlayerPosition;
        firstName : Text;
        lastName : Text;
        shirtNumber : Nat8;
        valueQuarterMillions : Nat16;
        dateOfBirth : Int;
        nationality : MopsIds.CountryId;
        seasonId : FootballIds.SeasonId;
        gameweeks : [PlayerGameweekDTO];
        valueHistory : [FootballTypes.ValueHistory];
        status : FootballEnums.PlayerStatus;
        parentClubId : FootballIds.ClubId;
        latestInjuryEndDate : Int;
        injuryHistory : [FootballTypes.InjuryHistory];
        retirementDate : Int;
    };

    public type PlayerGameweekDTO = {
        number : Nat8;
        events : [FootballTypes.PlayerEventData];
        points : Int16;
        fixtureId : FootballIds.FixtureId;
    };

    public type ClubDTO = {
        id : FootballIds.ClubId;
        name : Text;
        friendlyName : Text;
        primaryColourHex : Text;
        secondaryColourHex : Text;
        thirdColourHex : Text;
        abbreviatedName : Text;
        shirtType : FootballEnums.ShirtType;
    };

    public type PlayerScoreDTO = {
        id : Nat16;
        points : Int16;
        clubId : FootballIds.ClubId;
        goalsScored : Int16;
        goalsConceded : Int16;
        position : FootballEnums.PlayerPosition;
        nationality : MopsIds.CountryId;
        dateOfBirth : Int;
        saves : Int16;
        assists : Int16;
        events : [FootballTypes.PlayerEventData];
    };

    public type PlayerPointsDTO = {
        id : Nat16;
        gameweek : FootballTypes.GameweekNumber;
        points : Int16;
        clubId : FootballIds.ClubId;
        position : FootballEnums.PlayerPosition;
        events : [FootballTypes.PlayerEventData];
    };

};
