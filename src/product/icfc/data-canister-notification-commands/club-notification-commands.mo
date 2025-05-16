import FootballIds "../../../domain/football/ids";

module ClubNotificationCommands = {
    public type ClubChangeNotification = {
        leagueId: FootballIds.LeagueId;
        clubId: FootballIds.ClubId;
    };
};