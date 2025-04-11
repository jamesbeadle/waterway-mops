import MopsClubNotificationCommands "./ClubNotificationCommands";
import MopsLeagueNotificationCommands "./LeagueNotificationCommands";
import MopsPlayerNotificationCommands "./PlayerNotificationCommands";
module NotificationCommands {
    public type Notification = {
        #CreateClub : MopsClubNotificationCommands.ClubChangeNotification;
        #UpdateClub : MopsClubNotificationCommands.ClubChangeNotification;
        #PromoteClub : MopsClubNotificationCommands.ClubChangeNotification;
        #RelegateClub : MopsClubNotificationCommands.ClubChangeNotification;
        #CreateLeague : MopsLeagueNotificationCommands.LeagueChangeNotification;
        #UpdateLeague : MopsLeagueNotificationCommands.LeagueChangeNotification;
        #AddInitialFixtures : MopsLeagueNotificationCommands.AddInitialFixtureNotification;
        #BeginSeason : MopsLeagueNotificationCommands.BeginSeasonNotification;
        #BeginGameweek : MopsLeagueNotificationCommands.BeginGameweekNotification;
        #CompleteGameweek : MopsLeagueNotificationCommands.CompleteGameweekNotification;
        #CompleteFixture : MopsLeagueNotificationCommands.CompleteFixtureNotification;
        #FinaliseFixture : MopsLeagueNotificationCommands.FinaliseFixtureNotification;
        #CompleteSeason : MopsLeagueNotificationCommands.CompleteSeasonNotification;
        #RevaluePlayerUp : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #RevaluePlayerDown : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #LoanPlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #RecallPlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #ExpireLoan : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #TransferPlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #SetFreeAgent : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #CreatePlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #UpdatePlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #InjuryUpdated : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #RetirePlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #UnretirePlayer : MopsPlayerNotificationCommands.PlayerChangeNotification;
        #ChangePlayerPosition : MopsPlayerNotificationCommands.PlayerChangeNotification;
    }
}