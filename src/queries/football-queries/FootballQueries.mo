import FootballIds "../../football/FootballIds";

module FootballQueries {
    public type GetDataHashes = {
        leagueId : FootballIds.LeagueId;
    };

    public type DataHashes = {
        dataHashes : [DataHash];
    };

    public type DataHash = {
        category : Text;
        hash : Text;
    };
};
