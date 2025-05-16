import Ids "../../base/ids";
import Enums "enums";

module ICFCQueries {
   
    public type GetICFCLinks = {};

    public type ICFCLinks = {
        icfcPrincipalId : Ids.PrincipalId;
        subAppUserPrincipalId : Ids.PrincipalId;
        membershipType : Enums.MembershipType;
        subApp : Enums.SubApp;
    };

};
