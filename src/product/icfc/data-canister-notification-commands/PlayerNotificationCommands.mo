import FootballIds "../../../domain/football/Ids";

module PlayerNotificationCommands = {

  public type PlayerChangeNotification = {
    leagueId: FootballIds.LeagueId;
    playerId: FootballIds.PlayerId;
  };

};