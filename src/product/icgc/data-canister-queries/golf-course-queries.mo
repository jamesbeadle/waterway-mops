import Definitions "../../../base/definitions";
import Enums "../../../base/enums";
import GolfIds "../../../domain/golf/ids";
import GolfCourseEnums "../../../domain/golf/enums/golf-course-enums";
import GolfDefinitions "../../../domain/golf/definitions";
import Ids "../../../base/ids";

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
        address: ?Address;
        openingHours: [OpeningHour];
        branding: ?BrandInformation;
        foundedOn: ?Definitions.UnixTime;
        foundedYear: ?Definitions.Year;
        courseImage: ?Blob;
        bannerImage: ?Blob;
        status: GolfCourseEnums.CourseStatus;
        countryId : Ids.CountryId;
    };

    public type Address = {
        buildingNameOrNumber: Text;
        addressLine1: Text;
        addressLine2: ?Text;
        addressLine3: ?Text;
        townOrCity: ?Text;
        countyOrState: ?Text;
        postCodeOrZip: ?Text;
    };


    public type OpeningHour =
    {
        index: Nat8;
        day: Enums.DayOfWeek;
        openingTime: Int;
        closingTime: Int;
    };

    public type BrandInformation = {
        displayImage: ?Blob;
        coverImage: ?Blob;
        primaryHexColour: ?Text;
        secondaryHexColour: ?Text;
        thirdHexColour: ?Text;
        className: ?Text;
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