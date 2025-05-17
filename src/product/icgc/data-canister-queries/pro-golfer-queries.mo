import GolfIds "../../../domain/golf/ids";
import Ids "../../../base/ids";

module ProGolferQueries {
    public type GetProGolfers = {
        page: Nat;
    };

    public type ProGolfers = {
        proGolfers: [ProGolfer];
    };

    public type ProGolfer = {
        golferId: GolfIds.ProGolferId;
        firstName: Text;
        lastName: Text;
        nationality: Ids.CountryId;
        worldRanking: Nat16;
    };

}