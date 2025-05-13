import Float "mo:base/Float";
import Int64 "mo:base/Int64";
import Nat64 "mo:base/Nat64";

module {
    public func intToNat(input : Int) : Nat {
        return Nat64.toNat(Int64.toNat64(Int64.fromInt(input)));
    };

    public func natToInt(input : Nat) : Int {
        return Int64.toInt(Int64.fromNat64(Nat64.fromNat(input)));
    };

    public func nat64Percentage(amount : Nat64, percentage : Float) : Nat64 {
        return Int64.toNat64(Float.toInt64(Float.fromInt64(Int64.fromNat64(amount)) * percentage));
    };

    public func natToFloat(input : Nat) : Float {
        return Float.fromInt(Int64.toInt(Int64.fromNat64(Nat64.fromNat(input))));
    };
}