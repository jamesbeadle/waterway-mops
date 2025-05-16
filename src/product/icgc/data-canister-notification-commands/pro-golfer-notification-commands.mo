import GolfIds "../../../domain/golf/ids";

module ProGolferNotificationCommands = {

    public type ProGolferAddedNotification = {
        proGolferId: GolfIds.ProGolferId;
    };
    
    public type ProGolferRetiredNotification = {
        proGolferId: GolfIds.ProGolferId;
    };

};