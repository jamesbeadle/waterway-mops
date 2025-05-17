import Enums "./enums";

module CanisterIds {
    public let Default = "aaaaa-aa";
    
    public let ICFC_SNS_GOVERNANCE_CANISTER_ID = "detjl-sqaaa-aaaaq-aacqa-cai";
    public let ICFC_SNS_LEDGER_CANISTER_ID = "ddsp7-7iaaa-aaaaq-aacqq-cai";
    public let ICFC_SNS_ROOT_CANISTER_ID = "gyito-zyaaa-aaaaq-aacpq-cai";
    public let ICFC_SNS_INDEX_CANISTER_ID = "dnqcx-eyaaa-aaaaq-aacrq-cai";
    public let ICFC_SNS_SWAP_CANISTER_ID = "dkred-jaaaa-aaaaq-aacra-cai";

    public let ICFC_BACKEND_CANISTER_ID = "cfalf-4yaaa-aaaal-qshrq-cai";
    public let ICFC_DATA_CANISTER_ID = "52fzd-2aaaa-aaaal-qmzsa-cai";
    
    public let ICGC_BACKEND_CANISTER_ID = "l4zxo-7iaaa-aaaal-qsnsa-cai";

    public let ICF1_BACKEND_CANISTER_ID = "fltoy-oaaaa-aaaal-qsmrq-cai";
    public let FOOTBALL_GOD_BACKEND_CANISTER_ID = "44kin-waaaa-aaaal-qbxra-cai";
    public let OPENFPL_BACKEND_CANISTER_ID = "y22zx-giaaa-aaaal-qmzpq-cai";
    public let OPENWSL_BACKEND_CANISTER_ID = "5bafg-ayaaa-aaaal-qmzqq-cai";
    public let JEFF_BETS_BACKEND_CANISTER_ID = "cmdaz-kqaaa-aaaal-qshqa-cai";
    public let TRANSFER_KINGS_BACKEND_CANISTER_ID = "fpmh5-ziaaa-aaaal-qjfbq-cai";
    public let OPENBOOK_BACKEND_CANISTER_ID = "eur5j-5iaaa-aaaal-qcrva-cai";
    public let GOLFPAD_BACKEND_CANISTER_ID = "elbip-aiaaa-aaaal-qjfhq-cai";

    public let CYCLES_MINTING_CANISTER_ID = "rkp4c-7iaaa-aaaaa-aaaca-cai";
    public let NNS_GOVERNANCE_CANISTER_ID = "rrkah-fqaaa-aaaaa-aaaaq-cai";
    public let NNS_LEDGER_CANISTER_ID = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    
    public let NEURON_CONTROLLER_CANISTER_ID = "hqfmc-cqaaa-aaaal-qitcq-cai";
    public let WATERWAY_LABS_BACKEND_CANISTER_ID = "rbqtt-7yaaa-aaaal-qcndq-cai";

    public let CKBTC_LEDGER_CANISTER_ID = "mxzaz-hqaaa-aaaar-qaada-cai";

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

};
