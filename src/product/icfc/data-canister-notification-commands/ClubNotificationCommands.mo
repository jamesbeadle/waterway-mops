import FootballIds "../../../domain/football/Ids";

module ClubNotificationCommands = {
    public type ClubChangeNotification = {
        leagueId: FootballIds.LeagueId;
        clubId: FootballIds.ClubId;
    };
};