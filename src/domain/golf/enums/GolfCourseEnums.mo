module GolfEnums {

    public type FacilityType = 
    {
        #DRIVING_RANGE;
        #CHIPPING_AREA;
        #PUTTING_GREEN;
        #PRO_SHOP;
        #RESTAURANT;
        #BAR;
    };

    public type PricingType = 
    {
        #GENERAL;
        #MEMBERSHIP;
    };

    public type CourseStatus = 
    {
        #OPEN;
        #CLOSED;
        #COURSE_ONLY;
        #FACILITIES_ONLY;
    };

    public type CompetitionType = {
        #STABLEFORD;
        #STROKE_PLAY;
        #MATCH_PLAY;
    };

    public type TeeBookingStatus = {
        #PAID;
        #CANCELLED;
        #UNPAID;
    };

};
