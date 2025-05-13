import ClubNotificationCommands "./ClubNotificationCommands";
import LeagueNotificationCommands "./LeagueNotificationCommands";
import PlayerNotificationCommands "./PlayerNotificationCommands";
module NotificationCommands {
    public type Notification = {
        #CreateClub : ClubNotificationCommands.ClubChangeNotification;
        #UpdateClub : ClubNotificationCommands.ClubChangeNotification;
        #PromoteClub : ClubNotificationCommands.ClubChangeNotification;
        #RelegateClub : ClubNotificationCommands.ClubChangeNotification;
        #CreateLeague : LeagueNotificationCommands.LeagueChangeNotification;
        #UpdateLeague : LeagueNotificationCommands.LeagueChangeNotification;
        #AddInitialFixtures : LeagueNotificationCommands.AddInitialFixtureNotification;
        #BeginSeason : LeagueNotificationCommands.BeginSeasonNotification;
        #BeginGameweek : LeagueNotificationCommands.BeginGameweekNotification;
        #CompleteGameweek : LeagueNotificationCommands.CompleteGameweekNotification;
        #CompleteFixture : LeagueNotificationCommands.CompleteFixtureNotification;
        #FinaliseFixture : LeagueNotificationCommands.FinaliseFixtureNotification;
        #CompleteSeason : LeagueNotificationCommands.CompleteSeasonNotification;
        #RevaluePlayerUp : PlayerNotificationCommands.PlayerChangeNotification;
        #RevaluePlayerDown : PlayerNotificationCommands.PlayerChangeNotification;
        #LoanPlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #RecallPlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #ExpireLoan : PlayerNotificationCommands.PlayerChangeNotification;
        #TransferPlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #SetFreeAgent : PlayerNotificationCommands.PlayerChangeNotification;
        #CreatePlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #UpdatePlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #InjuryUpdated : PlayerNotificationCommands.PlayerChangeNotification;
        #RetirePlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #UnretirePlayer : PlayerNotificationCommands.PlayerChangeNotification;
        #ChangePlayerPosition : PlayerNotificationCommands.PlayerChangeNotification;
    }
}