import Ids "../Ids";
import Management "../Management";
import CanisterUtilities "../CanisterUtilities";
import Principal "mo:base/Principal";
import Array "mo:base/Array";
import Result "mo:base/Result";
import Enums "../Enums";
import CanisterQueries "CanisterQueries";
import CanisterIds "../CanisterIds";

module {
    public class CanisterManager() {

        public func getCanisterInfo(dto : CanisterQueries.GetCanisterInfo, app : Enums.WaterwayLabsApp) : async Result.Result<CanisterQueries.CanisterInfo, Enums.Error> {

            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};

            let canisterStatusResult = await CanisterUtilities.getCanisterStatus_(canister_actor, IC);
            switch (canisterStatusResult) {
                case (?canisterStatus) {

                    let controllers_principal =

                    canisterStatus.settings.controllers;
                    var controllers : [Ids.PrincipalId] = [];
                    for (controllerPrincipal in controllers_principal.vals()) {
                        let controller = Principal.toText(controllerPrincipal);
                        controllers := Array.append<Ids.PrincipalId>(controllers, [controller]);
                    };

                    return #ok({
                        app = app;
                        canisterId = dto.canisterId;
                        canisterName = dto.canisterName;
                        canisterType = dto.canisterType;
                        cycles = canisterStatus.cycles;
                        computeAllocation = canisterStatus.settings.compute_allocation;
                        controllers = controllers;
                        freezeThreshold = canisterStatus.settings.freezing_threshold;
                        memoryAllocation = canisterStatus.settings.memory_allocation;
                        memoryUsage = canisterStatus.memory_size;
                        canisterStatus = canisterStatus.status;
                    });

                };
                case (null) {
                    return #err(#NotFound);
                };
            };
        };
    };
};
