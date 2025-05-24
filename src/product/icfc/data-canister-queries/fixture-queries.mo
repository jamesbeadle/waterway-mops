import FootballDefinitions "../../../domain/football/definitions";
import FootballEnums "../../../domain/football/enums";
import FootballIds "../../../domain/football/ids";

module FixtureQueries {
    public type GetFixtures = {
        leagueId : FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
    };

    public type Fixtures = {
        leagueId : FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
        fixtures : [Fixture];
    };

    public type GetBettableFixtures = {
        leagueId : FootballIds.LeagueId;
    };

    public type BettableFixtures = {
        leagueId : FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
        fixtures : [Fixture];
    };

    public type GetPostponedFixtures = {
        leagueId : FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
    };

    public type PostponedFixtures = {
        leagueId : FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
        fixtures : [Fixture];
    };

    public type Fixture = {
        id : FootballIds.FixtureId;
        leagueId: FootballIds.LeagueId;
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        kickOff : Int;
        homeClubId : FootballIds.ClubId;
        awayClubId : FootballIds.ClubId;
        homeGoals : Nat8;
        awayGoals : Nat8;
        status : FootballEnums.FixtureStatusType;
        highestScoringPlayerId : FootballIds.PlayerId;
    };

    public type PlayerEventData = {
        fixtureId : FootballIds.FixtureId;
        playerId : Nat16;
        eventType : FootballEnums.PlayerEventType;
        eventStartMinute : Nat8;
        eventEndMinute : Nat8;
        clubId : FootballIds.ClubId;
    };

    public type GetFixtureEvents = {
        leagueId : FootballIds.LeagueId;
        fixtureId : FootballIds.FixtureId;
        seasonId : FootballIds.SeasonId;
    };

    public type FixtureWithEvents = {
        id : FootballIds.FixtureId;
        seasonId : FootballIds.SeasonId;
        gameweek : FootballDefinitions.GameweekNumber;
        kickOff : Int;
        homeClubId : FootballIds.ClubId;
        awayClubId : FootballIds.ClubId;
        homeGoals : Nat8;
        awayGoals : Nat8;
        status : FootballEnums.FixtureStatusType;
        highestScoringPlayerId : FootballIds.PlayerId;
        events : [PlayerEventData];
    };
};
