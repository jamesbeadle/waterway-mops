import FootballIds "../../../../domain/football/FootballIds";

module PlayerNotificationCommands = {

  public type PlayerChangeNotification = {
    leagueId: FootballIds.LeagueId;
    playerId: FootballIds.PlayerId;
  };

};