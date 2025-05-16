import Definitions "../../../base/definitions";
import GolfIds "../../../domain/golf/ids";
import GolfCourseEnums "../../../domain/golf/enums/golf-course-enums";
import GolfDefinitions "../../../domain/golf/definitions";
import Ids "../../../base/ids";
import Types "../../../base/types";

module GolfCourseQueries {
    public type GetGolfCourses = {
    };

    public type GolfCourses = {
        golfCourses: [GolfCourse];
    };

    public type GolfCourse = {
        id: GolfIds.GolfCourseId;
        name: Text;
        teeGroup: TeeGroup;
        visitorInformation: Text;
        facilities: [GolfCourseEnums.FacilityType];
        address: ?Types.Address;
        openingHours: [Types.OpeningHour];
        branding: ?Types.BrandInformation;
        foundedOn: ?Definitions.UnixTime;
        foundedYear: ?Definitions.Year;
        courseImage: ?Blob;
        bannerImage: ?Blob;
        status: GolfCourseEnums.CourseStatus;
        countryId : Ids.CountryId;
    };

    public type TeeGroup =
    {
        id: GolfIds.TeeGroupId;
        index: Nat8;
        colour: Text;
        holes: [GolfHole];
        par: Nat8;
        totalYardage: Nat16; 
    };

    public type GolfHole = {
        name: ?Text;
        holeNumber: GolfDefinitions.HoleNumber;
        par: Nat8;
        strokeIndex: Nat8;
        yardage: Nat16;
    };

}