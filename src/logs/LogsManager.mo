import Result "mo:base/Result";
import Enums "../Enums";
import CanisterIds "../CanisterIds";
import LogsCommands "LogsCommands";

module {
    public class LogsManager() {
        public func addApplicationLog(log : LogsCommands.AddApplicationLog) : async Result.Result<(), Enums.Error> {
            let wwlActor = actor (CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID) : actor {
                addApplicationLog : (LogsCommands.AddApplicationLog) -> async Result.Result<(), Enums.Error>;
            };
            
            return await wwlActor.addApplicationLog(log);
        };
    };
};
