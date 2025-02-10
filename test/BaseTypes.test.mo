import BaseTypes "../src/BaseTypes";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";


func runTests() : async () {
    await testPrincipalId();
    await testCanisterId();
    await testCalendarMonth();
    await testCountryId();
    await testProposalId();
    await testRustResult();
    await testGender();
    await testDataHash();
    await testCountry();
    await testCanisterTopup();
    await testSystemLog();
    await testLogEntryType();
    await testAccount();
    await testTimerInfo();
    Debug.print("All tests passed!");
};

func testPrincipalId() : async () {
    let principalId : BaseTypes.PrincipalId = "some-principal-id";

    assert(principalId == "some-principal-id");
    Debug.print("PrincipalId test passed!");
};

func testCanisterId() : async () {
    let canisterId : BaseTypes.CanisterId = "some-canister-id";

    assert(canisterId == "some-canister-id");
    Debug.print("CanisterId test passed!");
};

func testCalendarMonth() : async () {
    let calendarMonth : BaseTypes.CalendarMonth = 12;

    assert(calendarMonth == 12);
    Debug.print("CalendarMonth test passed!");
};

func testCountryId() : async () {
    let countryId : BaseTypes.CountryId = 1;

    assert(countryId == 1);
    Debug.print("CountryId test passed!");
};

func testProposalId() : async () {
    let proposalId : BaseTypes.ProposalId = 123;

    assert(proposalId == 123);
    Debug.print("ProposalId test passed!");
};

func testRustResult() : async () {
    let okResult : BaseTypes.RustResult = #Ok "success";
    let errResult : BaseTypes.RustResult = #Err "failure";

    switch (okResult) {
        case (#Ok(text)) { assert(text == "success"); };
        case (#Err(_)) { assert(false); };
    };

    switch (errResult) {
        case (#Ok(_)) { assert(false); };
        case (#Err(text)) { assert(text == "failure"); };
    };

    Debug.print("RustResult test passed!");
};

func testGender() : async () {
    let male : BaseTypes.Gender = #Male;
    let female : BaseTypes.Gender = #Female;

    switch (male) {
        case (#Male) { assert(true); };
        case (#Female) { assert(false); };
    };

    switch (female) {
        case (#Male) { assert(false); };
        case (#Female) { assert(true); };
    };

    Debug.print("Gender test passed!");
};

func testDataHash() : async () {
    let dataHash : BaseTypes.DataHash = {
        category = "example";
        hash = "abc123";
    };

    assert(dataHash.category == "example");
    assert(dataHash.hash == "abc123");
    Debug.print("DataHash test passed!");
};

func testCountry() : async () {
    let country : BaseTypes.Country = {
        id = 1;
        name = "United States";
        code = "US";
    };

    assert(country.id == 1);
    assert(country.name == "United States");
    assert(country.code == "US");
    Debug.print("Country test passed!");
};

func testCanisterTopup() : async () {
    let canisterTopup : BaseTypes.CanisterTopup = {
        canisterId = "some-canister-id";
        topupTime = 1234567890;
        cyclesAmount = 1000;
    };

    assert(canisterTopup.canisterId == "some-canister-id");
    assert(canisterTopup.topupTime == 1234567890);
    assert(canisterTopup.cyclesAmount == 1000);
    Debug.print("CanisterTopup test passed!");
};

func testSystemLog() : async () {
    let systemLog : BaseTypes.SystemLog = {
        eventId = 1;
        eventTime = 1234567890;
        eventType = #SystemCheck;
        eventTitle = "System Check";
        eventDetail = "System check completed successfully";
    };

    assert(systemLog.eventId == 1);
    assert(systemLog.eventTime == 1234567890);
    assert(systemLog.eventType == #SystemCheck);
    assert(systemLog.eventTitle == "System Check");
    assert(systemLog.eventDetail == "System check completed successfully");
    Debug.print("SystemLog test passed!");
};

func testLogEntryType() : async () {
    let systemCheck : BaseTypes.LogEntryType = #SystemCheck;
    let unexpectedError : BaseTypes.LogEntryType = #UnexpectedError;
    let canisterTopup : BaseTypes.LogEntryType = #CanisterTopup;
    let managerCanisterCreated : BaseTypes.LogEntryType = #ManagerCanisterCreated;

    switch (systemCheck) {
        case (#SystemCheck) { assert(true); };
        case (_) { assert(false); };
    }; 

    switch (unexpectedError) {
        case (#UnexpectedError) { assert(true); };
        case (_) { assert(false); };
    };

    switch (canisterTopup) {
        case (#CanisterTopup) { assert(true); };
        case (_) { assert(false); };
    };

    switch (managerCanisterCreated) {
        case (#ManagerCanisterCreated) { assert(true); };
        case (_) { assert(false); };
    };

    Debug.print("LogEntryType test passed!");
};

func testAccount() : async () {
    let account : BaseTypes.Account = {
        owner = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");
        subaccount = "some-subaccount";
    };

    assert(account.owner == Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai"));
    assert(account.subaccount == "some-subaccount");
    Debug.print("Account test passed!");
};

func testTimerInfo() : async () {
    let timerInfo : BaseTypes.TimerInfo = {
        id = 1;
        triggerTime = 1234567890;
        callbackName = "someCallback";
    };

    assert(timerInfo.id == 1);
    assert(timerInfo.triggerTime == 1234567890);
    assert(timerInfo.callbackName == "someCallback");
    Debug.print("TimerInfo test passed!");
};

runTests();