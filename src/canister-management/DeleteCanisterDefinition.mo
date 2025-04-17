import CanisterCommands "CanisterCommands";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Enums "../Enums";
import CanisterIds "../CanisterIds";
import CanisterUtilities "../CanisterUtilities";
import Management "../Management";

actor class _DeleteCanisterDefinition() {

    public shared ({ caller }) func transferCycles(dto : CanisterCommands.TopupCanister) : async Result.Result<(), Enums.Error> {
        assert Principal.toText(caller) == CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID;

        let IC : Management.Management = actor (CanisterIds.Default);
        let canister_actor = actor (CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID) : actor {};
        let result = await CanisterUtilities.topup_canister_(canister_actor, IC, dto.cycles);
        switch (result) {
            case (()) {
                return #ok;
            };
        };

    };
};
