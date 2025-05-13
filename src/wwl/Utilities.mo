import Enums "Enums";
import CanisterIds "CanisterIds";
module {

  public func getAppCanisterId(app : Enums.WaterwayLabsApp) : ?Text {
    switch (app) {
      case (#ICFC) { return ?CanisterIds.ICFC_BACKEND_CANISTER_ID };
      case (#WaterwayLabs) {
        return ?CanisterIds.WATERWAY_LABS_BACKEND_CANISTER_ID;
      };
      case (#FootballGod) {
        return ?CanisterIds.FOOTBALL_GOD_BACKEND_CANISTER_ID;
      };
      case (#OpenFPL) { return ?CanisterIds.OPENFPL_BACKEND_CANISTER_ID };
      case (#OpenWSL) { return ?CanisterIds.OPENWSL_BACKEND_CANISTER_ID };
      case (#TransferKings) {
        return ?CanisterIds.TRANSFER_KINGS_BACKEND_CANISTER_ID;
      };
      case (#JeffBets) { return ?CanisterIds.JEFF_BETS_BACKEND_CANISTER_ID };
      case (#ICGC) { return ?CanisterIds.ICGC_BACKEND_CANISTER_ID };
      case (#ICF1) { return ?CanisterIds.ICF1_BACKEND_CANISTER_ID };
      case (#OpenBook) { return ?CanisterIds.OPENBOOK_BACKEND_CANISTER_ID };
      case (#GolfPad) { return ?CanisterIds.GOLFPAD_BACKEND_CANISTER_ID };
      case (_) { return null };
    };
  };

  public func appToText(app : Enums.WaterwayLabsApp) : ?Text {
    switch (app) {
      case (#ICFC) { return ?"ICFC" };
      case (#WaterwayLabs) { return ?"WaterwayLabs" };
      case (#FootballGod) { return ?"FootballGod" };
      case (#OpenFPL) { return ?"OpenFPL" };
      case (#OpenWSL) { return ?"OpenWSL" };
      case (#TransferKings) { return ?"TransferKings" };
      case (#JeffBets) { return ?"JeffBets" };
      case (#ICGC) { return ?"ICGC" };
      case (#ICF1) { return ?"ICF1" };
      case (#OpenBook) { return ?"OpenBook" };
      case (#OpenChef) { return ?"OpenChef" };
      case (#ICPCasino) { return ?"ICPCasino" };
      case (#OpenCare) { return ?"OpenCare" };
      case (#OpenBeats) { return ?"OpenBeats" };
      case (#GolfPad) { return ?"GolfPad" };
      case (#ICPFA) { return ?"ICPFA" };
    };
  };

  public func textToApp(app : Text) : ?Enums.WaterwayLabsApp {
    switch (app) {
      case ("ICFC") { return ?#ICFC };
      case ("WaterwayLabs") { return ?#WaterwayLabs };
      case ("FootballGod") { return ?#FootballGod };
      case ("OpenFPL") { return ?#OpenFPL };
      case ("OpenWSL") { return ?#OpenWSL };
      case ("TransferKings") { return ?#TransferKings };
      case ("JeffBets") { return ?#JeffBets };
      case ("ICGC") { return ?#ICGC };
      case ("ICF1") { return ?#ICF1 };
      case ("OpenBook") { return ?#OpenBook };
      case ("OpenChef") { return ?#OpenChef };
      case ("ICPCasino") { return ?#ICPCasino };
      case ("OpenCare") { return ?#OpenCare };
      case ("OpenBeats") { return ?#OpenBeats };
      case ("GolfPad") { return ?#GolfPad };
      case (_) { return null };
    };
  };

  public func tokenToText(token : Enums.TokenEcosystem) : Text {
    switch (token) {
      case (#ICFC) { return "ICFC" };
      case (#ICGC) { return "ICGC" };
      case (#ICF1) { return "ICF1" };
    };
  };

  public func textToToken(token : Text) : ?Enums.TokenEcosystem {
    switch (token) {
      case ("ICFC") { return ?#ICFC };
      case ("ICGC") { return ?#ICGC };
      case ("ICF1") { return ?#ICF1 };
      case (_) { return null };
    };
  };
};
