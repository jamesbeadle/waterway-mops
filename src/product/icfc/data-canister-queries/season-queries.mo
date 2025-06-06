import FootballIds "../../../domain/football/ids";

module SeasonQueries {
    public type GetSeasons = {
        leagueId: FootballIds.LeagueId;
    };

    public type Seasons = {
        seasons: [Season];
    };

    public type Season = {
        id : Nat16;
        name : Text;
        year : Nat16;
    }
}