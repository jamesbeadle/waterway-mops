import FootballIds "./FootballIds";
module MopsPlayerNotificationCommands = {

  public type PlayerChangeNotification = {
    leagueId: FootballIds.LeagueId;
    playerId: FootballIds.PlayerId;
  };

};