import BaseTypes "../src/BaseTypes";
import Principal "mo:base/Principal";
import Blob "mo:base/Blob";
import Text "mo:base/Text";
import Error "mo:base/Error";
import Debug "mo:base/Debug";

// Helper function to run assertions
func assertTrue(condition : Bool, message : Text) : async () {
    if (not condition) {
        Debug.print("Assertion failed: " # message);
        assert (false);
    };
};

// Test 1: CalendarMonth (Nat8)
func testCalendarMonth() : async () {
    let month : BaseTypes.CalendarMonth = 12; // December
    await assertTrue(month <= 12, "CalendarMonth should be <= 12");
    await assertTrue(month >= 1, "CalendarMonth should be >= 1");
};

// Test 2: RustResult
func testRustResult() : async () {
    let okResult : BaseTypes.RustResult = #Ok("Success");
    let errResult : BaseTypes.RustResult = #Err("Failure");

    switch (okResult) {
        case (#Ok(text)) await assertTrue(text == "Success", "RustResult #Ok should match text");
        case (_) await assertTrue(false, "RustResult #Ok case failed");
    };

    switch (errResult) {
        case (#Err(text)) await assertTrue(text == "Failure", "RustResult #Err should match text");
        case (_) await assertTrue(false, "RustResult #Err case failed");
    };
};

// Test 3: AppStatus
func testAppStatus() : async () {
    let status : BaseTypes.AppStatus = {
        onHold = true;
        version = "1.0.0";
    };
    await assertTrue(status.onHold, "AppStatus onHold should be true");
    await assertTrue(status.version == "1.0.0", "AppStatus version should match");
};

// Test 4: Country
func testCountry() : async () {
    let country : BaseTypes.Country = {
        id = 1; // Assuming CountryId is Nat or similar
        name = "United States";
        code = "US";
    };
    await assertTrue(country.id == 1, "Country id should match");
    await assertTrue(country.name == "United States", "Country name should match");
    await assertTrue(country.code == "US", "Country code should match");
};

// Test 5: CanisterTopup
func testCanisterTopup() : async () {
    let topup : BaseTypes.CanisterTopup = {
        canisterId = "aaaaa-aa"; // Example canister ID
        topupTime = 1617235200000; // Example timestamp (2021-04-01 UTC)
        cyclesAmount = 1_000_000_000;
    };
    await assertTrue(topup.canisterId == "aaaaa-aa", "CanisterTopup canisterId should match");
    await assertTrue(topup.topupTime == 1617235200000, "CanisterTopup topupTime should match");
    await assertTrue(topup.cyclesAmount == 1_000_000_000, "CanisterTopup cyclesAmount should match");
};

// Test 6: SystemLog and LogEntryType
func testSystemLog() : async () {
    let log : BaseTypes.SystemLog = {
        eventId = 1;
        eventTime = 1617235200000;
        eventType = #CanisterTopup;
        eventTitle = "Topup Event";
        eventDetail = "Canister topped up with 1T cycles";
    };
    await assertTrue(log.eventId == 1, "SystemLog eventId should match");
    await assertTrue(log.eventTime == 1617235200000, "SystemLog eventTime should match");
    switch (log.eventType) {
        case (#CanisterTopup) await assertTrue(true, "SystemLog eventType should be CanisterTopup");
        case (_) await assertTrue(false, "SystemLog eventType mismatch");
    };
    await assertTrue(log.eventTitle == "Topup Event", "SystemLog eventTitle should match");
    await assertTrue(log.eventDetail == "Canister topped up with 1T cycles", "SystemLog eventDetail should match");
};

// Test 7: Account
func testAccount() : async () {
    let account : BaseTypes.Account = {
        owner = Principal.fromText("aaaaa-aa");
        subaccount = Blob.fromArray([0, 1, 2, 3]);
    };
    await assertTrue(Principal.toText(account.owner) == "aaaaa-aa", "Account owner should match");
    await assertTrue(Blob.toArray(account.subaccount) == [0, 1, 2, 3], "Account subaccount should match");
};

// Test 8: TimerInfo
func testTimerInfo() : async () {
    let timer : BaseTypes.TimerInfo = {
        id = 42;
        triggerTime = 1617235200000;
        callbackName = "executeTask";
    };
    await assertTrue(timer.id == 42, "TimerInfo id should match");
    await assertTrue(timer.triggerTime == 1617235200000, "TimerInfo triggerTime should match");
    await assertTrue(timer.callbackName == "executeTask", "TimerInfo callbackName should match");
};

func runTests() : async () {
    await testCalendarMonth();
    await testRustResult();
    await testAppStatus();
    await testCountry();
    await testCanisterTopup();
    await testSystemLog();
    await testAccount();
    await testTimerInfo();
};

runTests();
