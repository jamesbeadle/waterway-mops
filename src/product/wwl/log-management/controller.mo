import Result "mo:base/Result";
import BaseEnums "../../../base/enums";
import CanisterIds "../canister-ids";
import LogCommands "commands";

module {
    public class LogController() {
        public func addApplicationLog(log : LogCommands.AddApplicationLog) : async Result.Result<(), BaseEnums.Error> {
            let wwlActor = actor (CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID) : actor {
                addApplicationLog : (LogCommands.AddApplicationLog) -> async Result.Result<(), BaseEnums.Error>;
            };
            
            return await wwlActor.addApplicationLog(log);
        };
    };
};
