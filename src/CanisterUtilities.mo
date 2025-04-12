import Cycles "mo:base/ExperimentalCycles";
import Management "Management";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Array "mo:base/Array";
import CanisterCommands "canister-management/CanisterCommands";

module {

  public func updateCanister_(a : actor {}, backendCanisterController : ?Principal, IC : Management.Management) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    switch (backendCanisterController) {
      case (null) {};
      case (?controller) {
        await (
          IC.update_settings({
            canister_id = cid.canister_id;
            settings = {
              controllers = ?[controller];
              compute_allocation = ?1;
              memory_allocation = null;
              freezing_threshold = ?2_592_000;
              reserved_cycles_limit = null;
              log_visibility = null;
              wasm_memory_limit = null;
            };
            sender_canister_version = null;
          })
        );
      };
    };
  };

  public func deleteCanister_(canisterId : Text, IC : Management.Management) : async () {
    await (
      IC.delete_canister({
        canister_id = Principal.fromText(canisterId);
      })
    );
  };

  public func topup_canister_(a : actor {}, IC : Management.Management, cycles : Nat) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    Cycles.add<system>(cycles);
    await (
      IC.deposit_cycles({
        canister_id = cid.canister_id;
      })
    );
  };

  public func getCanisterStatus_(a : actor {}, IC : Management.Management) : async ?Management.CanisterStatusResult {
    let cid = { canister_id = Principal.fromActor(a) };
    let result = await (
      IC.canister_status({
        canister_id = cid.canister_id;
      })
    );
    return ?result;
  };

  public func setComputeAllocation_(a : actor {}, IC : Management.Management, computeAllocation : Nat) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    let current_seetings = await (
      IC.canister_status({
        canister_id = cid.canister_id;
      })
    );
    await (
      IC.update_settings({
        canister_id = cid.canister_id;
        settings = {
          controllers = ?current_seetings.settings.controllers;
          compute_allocation = ?computeAllocation;
          memory_allocation = ?current_seetings.settings.memory_allocation;
          freezing_threshold = ?current_seetings.settings.freezing_threshold;
          reserved_cycles_limit = ?current_seetings.settings.reserved_cycles_limit;
          log_visibility = ?current_seetings.settings.log_visibility;
          wasm_memory_limit = ?current_seetings.settings.wasm_memory_limit;
        };
        sender_canister_version = null;
      })
    );
  };

  public func setMemoryAllocation_(a : actor {}, IC : Management.Management, memoryAllocation : Nat) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    let current_seetings = await (
      IC.canister_status({
        canister_id = cid.canister_id;
      })
    );
    await (
      IC.update_settings({
        canister_id = cid.canister_id;
        settings = {
          controllers = ?current_seetings.settings.controllers;
          compute_allocation = ?current_seetings.settings.compute_allocation;
          memory_allocation = ?memoryAllocation;
          freezing_threshold = ?current_seetings.settings.freezing_threshold;
          reserved_cycles_limit = ?current_seetings.settings.reserved_cycles_limit;
          log_visibility = ?current_seetings.settings.log_visibility;
          wasm_memory_limit = ?current_seetings.settings.wasm_memory_limit;
        };
        sender_canister_version = null;
      })
    );
  };
  public func setFreezingThreshold_(a : actor {}, IC : Management.Management, freezingThreshold : Nat) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    let current_seetings = await (
      IC.canister_status({
        canister_id = cid.canister_id;
      })
    );
    await (
      IC.update_settings({
        canister_id = cid.canister_id;
        settings = {
          controllers = ?current_seetings.settings.controllers;
          compute_allocation = ?current_seetings.settings.compute_allocation;
          memory_allocation = ?current_seetings.settings.memory_allocation;
          freezing_threshold = ?freezingThreshold;
          reserved_cycles_limit = ?current_seetings.settings.reserved_cycles_limit;
          log_visibility = ?current_seetings.settings.log_visibility;
          wasm_memory_limit = ?current_seetings.settings.wasm_memory_limit;
        };
        sender_canister_version = null;
      })
    );
  };

  public func addController_(a : actor {}, IC : Management.Management, controller : Principal) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    let current_seetings = await (
      IC.canister_status({
        canister_id = cid.canister_id;
      })
    );
    await (
      IC.update_settings({
        canister_id = cid.canister_id;
        settings = {
          controllers = ?Array.append<Principal>(current_seetings.settings.controllers, [controller]);
          compute_allocation = ?current_seetings.settings.compute_allocation;
          memory_allocation = ?current_seetings.settings.memory_allocation;
          freezing_threshold = ?current_seetings.settings.freezing_threshold;
          reserved_cycles_limit = ?current_seetings.settings.reserved_cycles_limit;
          log_visibility = ?current_seetings.settings.log_visibility;
          wasm_memory_limit = ?current_seetings.settings.wasm_memory_limit;
        };
        sender_canister_version = null;
      })
    );
  };

  public func removeController_(a : actor {}, IC : Management.Management, controller : Principal) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    let current_seetings = await (
      IC.canister_status({
        canister_id = cid.canister_id;
      })
    );
    await (
      IC.update_settings({
        canister_id = cid.canister_id;
        settings = {
          controllers = ?Array.filter<Principal>(current_seetings.settings.controllers, func(c) { c != controller });
          compute_allocation = ?current_seetings.settings.compute_allocation;
          memory_allocation = ?current_seetings.settings.memory_allocation;
          freezing_threshold = ?current_seetings.settings.freezing_threshold;
          reserved_cycles_limit = ?current_seetings.settings.reserved_cycles_limit;
          log_visibility = ?current_seetings.settings.log_visibility;
          wasm_memory_limit = ?current_seetings.settings.wasm_memory_limit;
        };
        sender_canister_version = null;
      })
    );
  };

  public func takeCanisterSnapshot_(a : actor {}, IC : Management.Management) : async CanisterCommands.CanisterSnapshot {
    let cid = { canister_id = Principal.fromActor(a) };
    await (
      IC.take_canister_snapshot({
        canister_id = cid.canister_id;
        replace_snapshot = null;
      })
    );
  };

  public func loadCanisterSnapshot_(a : actor {}, IC : Management.Management, snapshotId : Blob) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    await (
      IC.load_canister_snapshot({
        canister_id = cid.canister_id;
        snapshot_id = snapshotId;
        sender_canister_version = null;
      })
    );
  };

  public func deleteCanisterSnapshot_(a : actor {}, IC : Management.Management, snapshotId : Blob) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    await (
      IC.delete_canister_snapshot({
        canister_id = cid.canister_id;
        snapshot_id = snapshotId;
      })
    );
  };
  public func startCanister_(a : actor {}, IC : Management.Management) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    await (
      IC.start_canister({
        canister_id = cid.canister_id;
      })
    );
  };
  public func stopCanister_(a : actor {}, IC : Management.Management) : async () {
    let cid = { canister_id = Principal.fromActor(a) };
    await (
      IC.stop_canister({
        canister_id = cid.canister_id;
      })
    );
  };

  public func listCanisterSnapshots_(a : actor {}, IC : Management.Management) : async [CanisterCommands.CanisterSnapshot] {
    let cid = { canister_id = Principal.fromActor(a) };
    let result = await (
      IC.list_canister_snapshots({
        canister_id = cid.canister_id;
      })
    );
    return result;
  };

};
