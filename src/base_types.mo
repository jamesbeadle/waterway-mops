module BaseTypes {
    public type CalendarMonth = Nat8;
    public type CountryId = Nat16;

    public type Gender = {
        #Male;
        #Female;
    };

    public type Country = {
        id : CountryId;
        name : Text;
        code : Text;
    };
};
