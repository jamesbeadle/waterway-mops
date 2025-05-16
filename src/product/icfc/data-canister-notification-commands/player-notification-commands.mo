import FootballIds "../../../domain/football/ids";

module PlayerNotificationCommands = {

  public type PlayerChangeNotification = {
    leagueId: FootballIds.LeagueId;
    playerId: FootballIds.PlayerId;
  };

};