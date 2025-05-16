import GolfIds "../../../domain/golf/ids";
import Definitions "../../../base/definitions";
import GolfDefinitions "../../../domain/golf/definitions";

module TournamentNotificationCommands = {

    public type TournamentAddedNotification = {
        tournamentId: GolfIds.TournamentId;
    };

    public type TournamentRemovedNotification = {
        tournamentId: GolfIds.TournamentId;
    };

    public type TournamentInstanceAddedNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
    };

    public type TournamentInstanceRemovedNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
    };

    public type TournamentBegunNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
    };

    public type TournamentCompleteNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
    };

    public type TournamentRoundBegunNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
        round: Nat8;
    };

    public type TournamentRoundCompleteNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
        round: Nat8;
    };

    public type ProGolferRoundBegunNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
        proGolferId: GolfIds.ProGolferId;
        round: Nat8;
    };

    public type ProGolferRoundCompleteNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
        proGolferId: GolfIds.ProGolferId;
        round: Nat8;
    };

    public type ProGolferScoreAddedNotification = {
        tournamentId: GolfIds.TournamentId;
        year: Definitions.Year;
        proGolferId: GolfIds.ProGolferId;
        round: Nat8;
        hole: GolfDefinitions.HoleNumber;
    };
};