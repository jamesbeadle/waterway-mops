import Nat64 "mo:base/Nat64";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Time "mo:base/Time";

import Account "../../../base/def/account";
import Ids "../../../base/ids";
import Int "mo:base/Int";
import Ledger "../../../base/def/sns-wrappers/ledger";

module {
    public class PayoutManager() {
        
        public func payoutUser(principal : Ids.PrincipalId, amount : Nat64, tokenledgerId : Text) : async Result.Result<(), Ledger.TransferError> {
            let token_ledger : Ledger.Interface = actor (tokenledgerId);
            let transfer_fee = await token_ledger.icrc1_fee();

            let e8s_amount = amount;

            let transfer_dto : Ledger.TransferArg = {
                from_subaccount = ?Account.defaultSubaccount();
                to = {
                    owner = Principal.fromText(principal);
                    subaccount = ?Account.defaultSubaccount();
                };
                amount = Nat64.toNat(e8s_amount) - transfer_fee;
                created_at_time = ?Nat64.fromNat(Int.abs(Time.now()));
                memo = null;
                fee = ?transfer_fee;
            };
            let res : Ledger.TransferResult = await token_ledger.icrc1_transfer(transfer_dto);
            switch (res) {
                case (#Ok(_)) {
                    return #ok();
                };
                case (#Err(err)) {
                    return #err(err);
                };
            };
        };
    };
};