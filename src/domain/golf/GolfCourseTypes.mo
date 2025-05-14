import Enums "../../base/Enums";
import Ids "../../base/Ids";
import GolfCourseEnums "GolfCourseEnums";
import GolfIds "GolfIds";

module GolfCourseTypes {

     public type GolfCourse
    {
        public int Id { get; set; }
        public int? CreatedByUserId { get; set; }
        public DateTime CreatedOn { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Address { get; set; }
        public int? FoundedYear { get; set; }
        public string? InformationForVisitors { get; set; }
        public string? BannerUrl { get; set; }
        public string? PrimaryColorHex { get; set; }
        public string? SecondaryColorHex { get; set; }
        public string? TertiaryColorHex { get; set; }
        public string? ProfilePictureUrl { get; set; }
        public string? FlyoverVideoUrl { get; set; }
        public bool Verified { get; set; } = false;
        public DateTime? VerificationDate { get; set; } = null;
        
        public CourseStatus? CourseStatus { get; set; }
        public ICollection<CourseFacility> Facilities { get; set; } = new List<CourseFacility>();
        public ICollection<MembershipType> MembershipTypes { get; set; } = new List<MembershipType>();
        public ICollection<CourseStaffMember> KeyPeople { get; set; } = new List<CourseStaffMember>();
        public ICollection<OpeningHour> OpeningHours { get; set; } = new List<OpeningHour>();
        public ICollection<CourseContact> Contacts { get; set; } = new List<CourseContact>();
        public ICollection<TeeGroup> TeeGroups { get; set; } = new List<TeeGroup>();
        public ICollection<CourseMediaAlbum> MediaAlbums { get; set; } = new List<CourseMediaAlbum>();
        public ICollection<MembershipType> MembershipLevels { get; set; } = new List<MembershipType>();
    }
        //golf club
            //membership management
            //club tournament
                //tournament instance
            //boards
                //winners
                //records
            //course record
                //holder 
            //golf course
                //golf course media
            //linked club house
                //facilities
            //staff
            //diary
                //tee time bookings
                //restaurant reservations
                //events
                    //event media
            //menus
                //menu items
            //linked golf committee id
            //golf club media
        //golf committee


    public type GolfCourse = {
        id: GolfIds.GolfCourseId;
        name: Text;
        teeGroups: [TeeGroup];
        founded : Int;
        countryId : Ids.CountryId;
        members: [MembershipProfile];
        staffMembers: [CourseStaffMember];
        albums: [CourseAlbum];
        facilities: [GolfCourseEnums.FacilityType];
    };

    public type TeeGroup =
    {
        index: Nat8;
        colour: Text;
        holes: [GolfHole];
        par: Nat8;
        totalYardage: Nat16; 
    };

    public type GolfHole = {
        holeNumber: Nat8;
        par: Nat8;
        strokeIndex: Nat8;
        yardage: Nat16;
    };

    public type MembershipProfile = {
        
    };

    public type CourseContact =
    {
        principalId: Ids.PrincipalId;
        title: Text;
        email: Text;
        phoneNumber: Text;
    };

    public type CourseAlbum =
    {
        index: Nat;
        name: Text;
        courseImages: [CourseImage]
    };

    public type CourseImage =
    {
        blob: Blob;
        holeNumber: Nat8;
        description: Text;
    };

    public type CourseStaffMember =
    {
        principalId: Ids.PrincipalId;
        role: Text;
        name: Text;
        email: Text;
        phone: Text;
    };


    public type OpeningHour =
    {
        index: Nat8;
        day: Enums.DayOfWeek;
        openingTime: Int;
        closingTime: Int;
    };





};
