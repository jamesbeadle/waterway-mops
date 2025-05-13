import Int "mo:base/Int";
import Int64 "mo:base/Int64";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat64 "mo:base/Nat64";
import Text "mo:base/Text";
import Time "mo:base/Time";
import ConversionUtilities "ConversionUtilities";

module {

  public let getHour = func() : Nat { return 1_000_000_000 * 60 * 60 };

  public func unixTimeToMonth(unixTime : Int) : Nat8 {

    let secondsInADay = 86400;
    let seconds = unixTime / 1000000000;
    var days = seconds / secondsInADay;

    var years = 1970;
    var dayCounter = days;
    label leapLoop while (dayCounter > 365) {
      if (years % 4 == 0 and (years % 100 != 0 or years % 400 == 0) and dayCounter > 366) {
        dayCounter -= 366;
      } else {
        dayCounter -= 365;
      };
      years += 1;
    };

    var dayOfYear : Int = dayCounter + 1;
    if (dayOfYear == 366) {
      dayOfYear := 1;
    };

    var isLeapYear = false;
    if (years % 4 == 0) {
      if (years % 100 != 0) {
        isLeapYear := true;
      } else if (years % 400 == 0) {
        isLeapYear := true;
      };
    };

    var monthEnds : [Nat] = [];

    if (isLeapYear) {
      monthEnds := [31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];
    } else {
      monthEnds := [31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];
    };

    var month = 0;
    label monthLoop for (m in Iter.range(0, 11)) {
      month += 1;
      if (dayOfYear <= monthEnds[m]) {
        break monthLoop;
      };
    };

    return Nat8.fromNat(month);
  };

  public func calculateAgeFromUnix(dobUnix : Int) : Nat {
    let secondsInADay : Int = 86_400;
    let currentUnixTime : Int = Time.now();

    let currentDays : Int = currentUnixTime / (1_000_000_000 * secondsInADay);
    let dobDays : Int = dobUnix / (1_000_000_000 * secondsInADay);

    let currentYear : Int = getYear(currentDays);
    let dobYear : Int = getYear(dobDays);

    let currentDayOfYear : Int = getDayOfYear(currentDays, currentYear);
    let dobDayOfYear : Int = getDayOfYear(dobDays, dobYear);

    var age : Int = currentYear - dobYear;
    if (currentDayOfYear < dobDayOfYear) {
      age := age - 1;
    };

    return Nat64.toNat(Int64.toNat64(Int64.fromInt(age)));

  };

  private func getDayOfYear(days : Int, year : Int) : Int {
    var dayCounter = days;
    for (y in Iter.range(1970, year - 1)) {
      if (y % 4 == 0 and (y % 100 != 0 or y % 400 == 0)) {
        dayCounter -= 366;
      } else {
        dayCounter -= 365;
      };
    };
    return dayCounter;
  };

  public func nextUnixTimeForDayOfYear(dayOfYear : Int) : Int {
    let currentUnixTime : Int = Time.now();
    let secondsInADay = 86400;
    let seconds = currentUnixTime / 1000000000;
    var days = seconds / secondsInADay;

    var years = 1970;
    var dayCounter = days;
    while (dayCounter > 365) {
      if (years % 4 == 0 and (years % 100 != 0 or years % 400 == 0) and dayCounter >= 366) {
        dayCounter -= 366;
      } else {
        dayCounter -= 365;
      };
      years += 1;
    };

    var currentDayOfYear : Int = dayCounter + 1;

    var isCurrentYearLeap = false;
    if (years % 4 == 0) {
      if (years % 100 != 0) {
        isCurrentYearLeap := true;
      } else if (years % 400 == 0) {
        isCurrentYearLeap := true;
      };
    };

    var daysTillNextInstance : Int = 0;

    if (currentDayOfYear == dayOfYear) {
      if (isCurrentYearLeap) {
        daysTillNextInstance := 366;
      } else {
        daysTillNextInstance := 365;
      };
    } else if (currentDayOfYear > dayOfYear) {
      let nextYear : Int = years + 1;
      var isNextYearLeap = false;
      if (nextYear % 4 == 0) {
        if (nextYear % 100 != 0) {
          isNextYearLeap := true;
        } else if (nextYear % 400 == 0) {
          isNextYearLeap := true;
        };
      };
      if (isNextYearLeap) {
        daysTillNextInstance := 366 - currentDayOfYear + dayOfYear;
      } else {
        daysTillNextInstance := 365 - currentDayOfYear + dayOfYear;
      };
    } else {
      daysTillNextInstance := dayOfYear - currentDayOfYear;
    };

    let nextInstanceUnixTime : Int = currentUnixTime + daysTillNextInstance * 1_000_000_000 * secondsInADay;
    return nextInstanceUnixTime;
  };

  public func getReadableDate(date : Int) : Text {
    let secondsInADay : Int = 86_400;
    let days = date / (1_000_000_000 * secondsInADay);

    let year = getYear(days);
    let dayOfYear = getDayOfYear(days, year);

    let isLeapYear = if (year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)) {
      true;
    } else {
      false;
    };

    let monthEnds = if (isLeapYear) {
      [31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];
    } else {
      [31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];
    };

    var month = 0;
    var day = dayOfYear;

    label monthLoop for (m in Iter.range(0, 11)) {
      if (day <= monthEnds[m]) {
        month := m + 1;
        if (m > 0) {
          day := day - monthEnds[m - 1];
        };
        break monthLoop;
      };
    };

    let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return Text.concat(Text.concat(Text.concat(Int.toText(day), " "), monthNames[month - 1]), Text.concat(" ", Int.toText(year)));
  };

  public func getNextHourOfDay(hourOfDay : Int) : Int {
    let secondsInADay : Int = 86400;
    let secondsInAnHour : Int = 3600;
    let currentUnixTime : Int = Time.now();
    let currentSeconds : Int = currentUnixTime / 1000000000;

    let currentDaySeconds : Int = currentSeconds % secondsInADay;

    var secondsToNextHourInstance : Int = 0;
    if (currentDaySeconds < 6 * secondsInAnHour) {
      secondsToNextHourInstance := 6 * secondsInAnHour - currentDaySeconds;
    } else {
      secondsToNextHourInstance := (24 * secondsInAnHour - currentDaySeconds) + hourOfDay * secondsInAnHour;
    };

    let next6AMUnixTime : Int = currentUnixTime + secondsToNextHourInstance * 1000000000;
    return next6AMUnixTime;
  };

  public func secondsToDays(seconds : Nat) : Nat {
    seconds / (60 * 60 * 24);
  };

  public func getYear(unixTime : Int) : Int {
    let secondsInADay : Int = 86_400;
    let seconds = unixTime / 1_000_000_000;
    let days = seconds / secondsInADay;

    var years = 1970;
    var dayCounter = days;
    label leapLoop while (dayCounter > 365) {
      if (years % 4 == 0 and (years % 100 != 0 or years % 400 == 0) and dayCounter >= 366) {
        dayCounter -= 366;
      } else {
        dayCounter -= 365;
      };
      years += 1;
    };
    return years;
  };

  public func getNextUnixTimestampForDayMonth(day : Nat8, month : Nat8) : ?Int {
    if (day < 1 or day > 31) { return null };
    if (month < 1 or month > 12) { return null };

    let currentUnixTime : Int = Time.now();
    let secondsInADay : Int = 86_400;
    let nowSeconds : Int = currentUnixTime / 1_000_000_000;
    let currentDays : Int = nowSeconds / secondsInADay;
    let currentYear : Int = getYear(currentDays);
    let currentDayOfYear : Int = getDayOfYear(currentDays, currentYear) + 1;
    let maybeDayOfYearTarget = dayOfYear(currentYear, month, day);
    switch (maybeDayOfYearTarget) {
      case (null) {
        return null;
      };
      case (?dayOfYearTarget) {
        if (dayOfYearTarget > currentDayOfYear) {
          return ?(makeUnixTimestamp(currentYear, dayOfYearTarget));
        } else if (dayOfYearTarget == currentDayOfYear) {
          let midnightToday = makeUnixTimestamp(currentYear, dayOfYearTarget);
          if (midnightToday > currentUnixTime) {
            return ?midnightToday;
          } else {
            let nextYear = currentYear + 1;
            let maybeNextDayOfYear = dayOfYear(nextYear, month, day);
            switch (maybeNextDayOfYear) {
              case (?foundNextDayOfYear) {
                return ?(makeUnixTimestamp(nextYear, foundNextDayOfYear));
              };
              case (null) { return null };
            };
          };
        } else {
          let nextYear = currentYear + 1;
          let maybeNextDayOfYear = dayOfYear(nextYear, month, day);
          switch (maybeNextDayOfYear) {
            case (?foundNextDayOfYear) {
              return ?(makeUnixTimestamp(nextYear, foundNextDayOfYear));
            };
            case (null) { return null };
          };
        };
      };
    };
  };

  private func isLeapYear(y : Int) : Bool {
    if (y % 400 == 0) return true;
    if (y % 100 == 0) return false;
    if (y % 4 == 0) return true;
    return false;
  };

  private func daysInMonth(y : Int, m : Nat8) : Nat8 {
    switch (m) {
      case (2) { if (isLeapYear(y)) 29 else 28 };
      case (4) { 30 };
      case (6) { 30 };
      case (9) { 30 };
      case (11) { 30 };
      case _ { 31 };
    };
  };

  private func dayOfYear(year : Int, month : Nat8, day : Nat8) : ?Int {
    if (day > daysInMonth(year, month)) return null;

    var total : Int = 0;
    var m : Nat8 = 1;
    while (m < month) {
      total += ConversionUtilities.natToInt(Nat8.toNat(daysInMonth(year, m)));
      m += 1;
    };
    let result = total + ConversionUtilities.natToInt(Nat8.toNat(day));
    return ?result;
  };

  private func makeUnixTimestamp(year : Int, dayOfYear : Int) : Int {
    let epochDays = daysSince1970(year, dayOfYear);
    let epochSeconds = epochDays * 86_400;
    return epochSeconds * 1_000_000_000;
  };

  private func daysSince1970(year : Int, dayOfYear : Int) : Int {
    var daysCount = 0;
    var y = 1970;

    while (y < year) {
      if (isLeapYear(y)) {
        daysCount += 366;
      } else {
        daysCount += 365;
      };
      y += 1;
    };
    daysCount += (ConversionUtilities.intToNat(dayOfYear) - 1);
    return daysCount;
  };

  public func convertDaysToNanosecondsInt(pauseDays : Nat) : Int {
    let secondsPerDay : Int = 24 * 60 * 60;
    let nanosecondsPerSecond : Int = 1_000_000_000;
    return ConversionUtilities.natToInt(pauseDays) * secondsPerDay * nanosecondsPerSecond;
  };

  public func getDay() : Int {
    let secondsPerDay : Int = 24 * 60 * 60;
    let nanosecondsPerSecond : Int = 1_000_000_000;
    return secondsPerDay * nanosecondsPerSecond;
  };

};
