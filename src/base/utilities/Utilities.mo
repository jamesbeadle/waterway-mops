import Text "mo:base/Text";
import Char "mo:base/Char";

module {

    public func isHexColourValid(hex : Text) : Bool {

        if (Text.size(hex) != 7 or not Text.startsWith(hex, #text "#")) {
            return false;
        };

        let hexChars = "0123456789abcdefABCDEF";
        let strippedHex = switch (Text.stripStart(hex, #text "#")) {
            case (?h) h;
            case null hex;
        };

        for (char in Text.toIter(strippedHex)) {
            if (not Text.contains(hexChars, #char char)) {
                return false;
            };
        };

        return true;
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
