import FootballTypes "FootballTypes";
import MopsIds "Ids";

module DTOs {

    public type SeasonDTO = {
        id : FootballTypes.SeasonId;
        name : Text;
        year : Nat16;
    };

    public type FixtureDTO = {
        id : Nat32;
        seasonId : FootballTypes.SeasonId;
        gameweek : FootballTypes.GameweekNumber;
        kickOff : Int;
        homeClubId : FootballTypes.ClubId;
        awayClubId : FootballTypes.ClubId;
        homeGoals : Nat8;
        awayGoals : Nat8;
        status : FootballTypes.FixtureStatusType;
        highestScoringPlayerId : Nat16;
        events : [FootballTypes.PlayerEventData];
    };

    public type PlayerDetailDTO = {
        id : FootballTypes.PlayerId;
        clubId : FootballTypes.ClubId;
        position : FootballTypes.PlayerPosition;
        firstName : Text;
        lastName : Text;
        shirtNumber : Nat8;
        valueQuarterMillions : Nat16;
        dateOfBirth : Int;
        nationality : MopsIds.CountryId;
        seasonId : FootballTypes.SeasonId;
        gameweeks : [PlayerGameweekDTO];
        valueHistory : [FootballTypes.ValueHistory];
        status : FootballTypes.PlayerStatus;
        parentClubId : FootballTypes.ClubId;
        latestInjuryEndDate : Int;
        injuryHistory : [FootballTypes.InjuryHistory];
        retirementDate : Int;
    };

    public type PlayerGameweekDTO = {
        number : Nat8;
        events : [FootballTypes.PlayerEventData];
        points : Int16;
        fixtureId : FootballTypes.FixtureId;
    };

    public type ClubDTO = {
        id : FootballTypes.ClubId;
        name : Text;
        friendlyName : Text;
        primaryColourHex : Text;
        secondaryColourHex : Text;
        thirdColourHex : Text;
        abbreviatedName : Text;
        shirtType : FootballTypes.ShirtType;
    };

    public type PlayerScoreDTO = {
        id : Nat16;
        points : Int16;
        clubId : FootballTypes.ClubId;
        goalsScored : Int16;
        goalsConceded : Int16;
        position : FootballTypes.PlayerPosition;
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
        clubId : FootballTypes.ClubId;
        position : FootballTypes.PlayerPosition;
        events : [FootballTypes.PlayerEventData];
    };

};
