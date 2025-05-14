import GolfIds "GolfIds";
import Ids "../../base/Ids";
import Enums "../../base/Enums";
import Definitions "../../base/Definitions";

module GolfTypes {

        /* ----- Pro Golfer Types ----- */

        public type ProGolfer = {
            id: GolfIds.ProGolferId;
            firstName: Text;
            lastName: Text;
            nationality: Ids.CountryId;
            worldRanking: Nat16;
            tournamentEntries: [TournamentEntry];
            rankingHistory: [RankingSnapshot];
            earningsSnapshot: [EarningsSnapshot];
            majorWinCount: Nat8;
            tournamentWinCount: Nat16;
        };  

        public type TournamentEntry = {
            tournamentId: GolfIds.TournamentId;
            year: Definitions.Year;
            rounds: [GolfRound];
            totalScore: Nat16;
            madeCut: Bool;
            finished: Nat;
            tiedFinish: Bool;
            earnings: Nat;
            earningsCurrency: Enums.Currency;
        };

        public type RankingSnapshot = {
            date: Int;
            ranking: Nat;
        };

        public type EarningsSnapshot = {
            date: Int;
            earnings: Nat;
            earningsCurrency: Enums.Currency;
        };

        public type GolfRound = {
            orderIndex: Nat8;
            teeTime: Int;
            hole1Score: Nat8;
            hole2Score: Nat8;
            hole3Score: Nat8;
            hole4Score: Nat8;
            hole5Score: Nat8;
            hole6Score: Nat8;
            hole7Score: Nat8;
            hole8Score: Nat8;
            hole9Score: Nat8;
            hole10Score: Nat8;
            hole11Score: Nat8;
            hole12Score: Nat8;
            hole13Score: Nat8;
            hole14Score: Nat8;
            hole15Score: Nat8;
            hole16Score: Nat8;
            hole17Score: Nat8;
            hole18Score: Nat8;
            totalShots: Nat;
            hole1Shots: [GolfShot];
            hole2Shots: [GolfShot];
            hole3Shots: [GolfShot];
            hole4Shots: [GolfShot];
            hole5Shots: [GolfShot];
            hole6Shots: [GolfShot];
            hole7Shots: [GolfShot];
            hole8Shots: [GolfShot];
            hole9Shots: [GolfShot];
            hole10Shots: [GolfShot];
            hole11Shots: [GolfShot];
            hole12Shots: [GolfShot];
            hole13Shots: [GolfShot];
            hole14Shots: [GolfShot];
            hole15Shots: [GolfShot];
            hole16Shots: [GolfShot];
            hole17Shots: [GolfShot];
            hole18Shots: [GolfShot];
        };

        public type GolfShot = {
            shotType: Enums.ShotType;
        };


};
