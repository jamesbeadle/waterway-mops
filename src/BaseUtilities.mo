import Hash "mo:base/Hash";
import Nat8 "mo:base/Nat8";
import Nat16 "mo:base/Nat16";
import Nat32 "mo:base/Nat32";
import Text "mo:base/Text";
import Char "mo:base/Char";

module {

  public let eqNat = func(a : Nat, b : Nat) : Bool {
    a == b;
  };

  public let hashNat = func(key : Nat) : Hash.Hash {
    Nat32.fromNat(key % (2 ** 8 - 1));
  };

  public let eqNat8 = func(a : Nat8, b : Nat8) : Bool {
    a == b;
  };

  public let hashNat8 = func(key : Nat8) : Hash.Hash {
    Nat32.fromNat(Nat8.toNat(key) % (2 ** 32 - 1));
  };

  public let eqNat16 = func(a : Nat16, b : Nat16) : Bool {
    a == b;
  };

  public let hashNat16 = func(key : Nat16) : Hash.Hash {
    Nat32.fromNat(Nat16.toNat(key) % (2 ** 32 - 1));
  };

  public let eqNat32 = func(a : Nat32, b : Nat32) : Bool {
    a == b;
  };

  public let hashNat32 = func(key : Nat32) : Hash.Hash {
    Nat32.fromNat(Nat32.toNat(key) % (2 ** 32 - 1));
  };

  public func toLowercase(t : Text.Text) : Text.Text {
    func charToLower(c : Char) : Char {
      if (Char.isUppercase(c)) {
        Char.fromNat32(Char.toNat32(c) + 32);
      } else {
        c;
      };
    };
    Text.map(t, charToLower);
  };

};
