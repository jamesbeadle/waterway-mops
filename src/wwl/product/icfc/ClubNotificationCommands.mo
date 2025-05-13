import FootballIds "./FootballIds";
module ClubNotificationCommands = {
    public type ClubChangeNotification = {
        leagueId: FootballIds.LeagueId;
        clubId: FootballIds.ClubId;
    };
};