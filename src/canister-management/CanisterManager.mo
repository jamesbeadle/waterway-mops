import Ids "../Ids";
import Management "../Management";
import CanisterUtilities "../CanisterUtilities";
import Principal "mo:base/Principal";
import Array "mo:base/Array";
import Result "mo:base/Result";
import Debug "mo:base/Debug";
import Enums "../Enums";
import CanisterQueries "CanisterQueries";
import CanisterCommands "CanisterCommands";
import CanisterIds "../CanisterIds";
import DeleteCanisterDefinition "DeleteCanisterDefinition";

module {
    public class CanisterManager() {

        public func getCanisterInfo(dto : CanisterQueries.GetCanisterInfo, app : Enums.WaterwayLabsApp) : async Result.Result<CanisterQueries.CanisterInfo, Enums.Error> {

            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};

            let ?canisterStatus = await CanisterUtilities.getCanisterStatus_(canister_actor, IC) else {
                return #err(#NotFound);
            };

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
                cycles = canisterStatus.cycles;
                computeAllocation = canisterStatus.settings.compute_allocation;
                controllers = controllers;
                freezeThreshold = canisterStatus.settings.freezing_threshold;
                memoryAllocation = canisterStatus.settings.memory_allocation;
                memoryUsage = canisterStatus.memory_size;
                canisterStatus = canisterStatus.status;
                idleCyclesBurnedPerDay = canisterStatus.idle_cycles_burned_per_day;

            });

        };

        public func topupCanister(dto : CanisterCommands.TopupCanister) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.topup_canister_(canister_actor, IC, dto.cycles);
            return #ok(());
        };

        public func setComputeAllocation(dto : CanisterCommands.SetComputeAllocation) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.setComputeAllocation_(canister_actor, IC, dto.computeAllocation);
            return #ok(());
        };

        public func setMemoryAllocation(dto : CanisterCommands.SetMemoryAllocation) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.setMemoryAllocation_(canister_actor, IC, dto.memoryAllocation);
            return #ok(());
        };

        public func setFreezingThreshold(dto : CanisterCommands.SetFreezingThreshold) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.setFreezingThreshold_(canister_actor, IC, dto.freezingThreshold);
            return #ok(());
        };

        public func addController(dto : CanisterCommands.AddController) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.addController_(canister_actor, IC, Principal.fromText(dto.controller));
            return #ok(());
        };

        public func removeController(dto : CanisterCommands.RemoveController) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.removeController_(canister_actor, IC, Principal.fromText(dto.controller));
            return #ok(());
        };

        public func takeCanisterSnapshot(dto : CanisterCommands.TakeCanisterSnapshot) : async Result.Result<CanisterCommands.CanisterSnapshot, Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let result = await CanisterUtilities.takeCanisterSnapshot_(canister_actor, IC);
            return #ok(result);
        };

        public func loadCanisterSnapshot(dto : CanisterCommands.LoadCanisterSnapshot) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.stopCanister_(canister_actor, IC);
            let _ = await CanisterUtilities.loadCanisterSnapshot_(canister_actor, IC, dto.snapshotId);
            let _ = await CanisterUtilities.startCanister_(canister_actor, IC);

            return #ok(());
        };

        public func deleteCanisterSnapshot(dto : CanisterCommands.DeleteCanisterSnapshot) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.deleteCanisterSnapshot_(canister_actor, IC, dto.snapshotId);
            return #ok(());
        };

        public func deleteCanister(dto : CanisterCommands.DeleteCanister) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {
                transferCycles : (dto : CanisterCommands.TopupCanister) -> async Result.Result<(), Enums.Error>;
            };

            // Install the deletion Canister Definition
            let _ = await CanisterUtilities.stopCanister_(canister_actor, IC);
            let _ = await (system DeleteCanisterDefinition._DeleteCanisterDefinition)(#reinstall canister_actor)();
            let _ = await CanisterUtilities.startCanister_(canister_actor, IC);

            // set compute allocation to 0
            let _ = await CanisterUtilities.setComputeAllocation_(canister_actor, IC, 0);
            // set frreezing threshold to 1hr
            let _ = await CanisterUtilities.setFreezingThreshold_(canister_actor, IC, 3600);

            // fetch the canister status
            let ?canisterStatus = await CanisterUtilities.getCanisterStatus_(canister_actor, IC) else {
                return #err(#NotFound);
            };
            let wwlCanisterId = CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID;

            // get the cycles of the canister to wwlCanister
            var cycles = canisterStatus.cycles;
            if (cycles > 150_000_000_000) {
                cycles := cycles - 150_000_000_000;
                let result = await canister_actor.transferCycles({
                    app = dto.app;
                    canisterId = wwlCanisterId;
                    cycles = cycles;
                });

                switch (result) {
                    case (#ok()) {};
                    case (#err(err)) {
                        return #err(err);
                    };
                };
            };
            Debug.print(debug_show (cycles));
            let _ = await CanisterUtilities.stopCanister_(canister_actor, IC);
            let _ = await CanisterUtilities.deleteCanister_(dto.canisterId, IC);

            return #ok(());

        };

        public func listCanisterSnapshots(dto : CanisterQueries.ListCanisterSnapshots) : async Result.Result<[CanisterQueries.CanisterSnapshot], Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let result = await CanisterUtilities.listCanisterSnapshots_(canister_actor, IC);
            return #ok(result);
        };

        public func startCanister(dto : CanisterCommands.StartCanister) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.startCanister_(canister_actor, IC);
            return #ok(());
        };

        public func stopCanister(dto : CanisterCommands.StopCanister) : async Result.Result<(), Enums.Error> {
            let IC : Management.Management = actor (CanisterIds.Default);
            let canister_actor = actor (dto.canisterId) : actor {};
            let _ = await CanisterUtilities.stopCanister_(canister_actor, IC);
            return #ok(());
        };

    };
};
