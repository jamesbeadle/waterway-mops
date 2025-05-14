
module GolfCourseTypes {

    public type GolfCourse =
    {
        id: Nat;
        createdBy: Ids.PrincipalId;
        createdOn: Definitions.UnixTime;
        name: Text;
        address: Address;
        foundedYear: Definitions.Year;
        visitorInformation: Text;
        courseImage: ?Blob;
        bannerImage: ?Blob;
        branding: BaseTypes.Branding;
        flyoverVideo: ?Blob;
        status: CourseStatus;
        facilities: [CourseFacility];
        membershipOptions: [MembershipOption];
        managementTeam: [CourseStaffMember];
        openingHours: [OpeningHour];
        contacts: [Contact];
        teeGroup: [TeeGroup];
        mediaAlbums: [MediaAlbum];
    };
        
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




    public type Hole
    {
        public int Id { get; set; }
        public int HoleNumber { get; set; }
        public int Yardage { get; set; }
        public int StrokeIndex { get; set; }
        public int Par { get; set; }
        public string? Name { get; set; }
        public int TeeGroupId { get; set; }
        public virtual TeeGroup TeeGroup { get; set; } = default!;
    }


    public type OpeningHour
    {
        public int Id { get; set; }
        public DayOfWeek DayOfWeek { get; set; }
        public TimeSpan OpenTime { get; set; }
        public TimeSpan CloseTime { get; set; }
        public int GolfCourseId { get; set; }
        public virtual GolfCourse GolfCourse { get; set; } = default!;
    }

    public type TeeGroup
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? ColorHex { get; set; } = null;
        public ICollection<Hole> Holes { get; set; } = new List<Hole>();
        public int GolfCourseId { get; set; }
        public virtual GolfCourse GolfCourse { get; set; } = default!;
    }




    public type MembershipType
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public int GolfCourseId { get; set; }
        public virtual GolfCourse GolfCourse { get; set; } = default!;
    }


    public type ClubMembership = {
        startDate: Int;
        endDate: Int;
        fee: Nat;
        feeCurrency: Currency;
    };
};
