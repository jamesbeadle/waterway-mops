import Result "mo:base/Result";
import BaseEnums "../../../base/Enums";
import CanisterIds "../CanisterIds";
import LogCommands "LogCommands";

module {
    public class LogManager() {
        public func addApplicationLog(log : LogCommands.AddApplicationLog) : async Result.Result<(), BaseEnums.Error> {
            let wwlActor = actor (CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID) : actor {
                addApplicationLog : (LogCommands.AddApplicationLog) -> async Result.Result<(), BaseEnums.Error>;
            };
            
            return await wwlActor.addApplicationLog(log);
        };
    };
};
