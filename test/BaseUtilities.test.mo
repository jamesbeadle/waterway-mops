import Error "mo:base/Error";
import ComparisonUtilties "../src/base/utilities/ComparisonUtilties";

func runTests() : async () {
    await testEqNat8();
    await testHashNat8();
    await testEqNat16();
    await testHashNat16();
    await testEqNat32();
    await testHashNat32();
};

func assertTrue(condition : Bool, message : Text) : async () {
    if (not condition) {

        throw Error.reject("Assertion failed: " # message);
    };
};

// Test 1: eqNat8 - Equality for Nat8
func testEqNat8() : async () {
    // Basic equality
    await assertTrue(ComparisonUtilties.eqNat8(5, 5), "eqNat8 should return true for equal values");
    await assertTrue(not ComparisonUtilties.eqNat8(5, 6), "eqNat8 should return false for unequal values");

    // Edge cases
    await assertTrue(ComparisonUtilties.eqNat8(0, 0), "eqNat8 should work for zero");
    await assertTrue(ComparisonUtilties.eqNat8(255, 255), "eqNat8 should work for Nat8 max value");
};

// Test 2: hashNat8 - Hashing for Nat8
func testHashNat8() : async () {
    // Consistency
    let hash1 = ComparisonUtilties.hashNat8(42);
    let hash2 = ComparisonUtilties.hashNat8(42);
    await assertTrue(hash1 == hash2, "hashNat8 should be consistent for the same input");

    // Valid range (Hash.Hash is Nat32)
    let hashZero = ComparisonUtilties.hashNat8(0);
    await assertTrue(hashZero >= 0 and hashZero < 2 ** 3, "hashNat8 should return a valid Nat32 for zero");

    let hashMax = ComparisonUtilties.hashNat8(255); // Nat8 max
    await assertTrue(hashMax >= 0 and hashMax < 2 ** 3, "hashNat8 should return a valid Nat32 for max value");

    // Different inputs should ideally produce different hashes (not guaranteed but good to check)
    let hashDiff = ComparisonUtilties.hashNat8(1);
    await assertTrue(hashDiff != hashMax, "hashNat8 should likely differ for different inputs");
};

// Test 3: eqNat16 - Equality for Nat16
func testEqNat16() : async () {
    // Basic equality
    await assertTrue(ComparisonUtilties.eqNat16(123, 123), "eqNat16 should return true for equal values");
    await assertTrue(not ComparisonUtilties.eqNat16(123, 124), "eqNat16 should return false for unequal values");

    // Edge cases
    await assertTrue(ComparisonUtilties.eqNat16(0, 0), "eqNat16 should work for zero");
    await assertTrue(ComparisonUtilties.eqNat16(65535, 65535), "eqNat16 should work for Nat16 max value");
};

// Test 4: hashNat16 - Hashing for Nat16
func testHashNat16() : async () {
    // Consistency
    let hash1 = ComparisonUtilties.hashNat16(5000);
    let hash2 = ComparisonUtilties.hashNat16(5000);
    await assertTrue(hash1 == hash2, "hashNat16 should be consistent for the same input");

    // Valid range
    let hashZero = ComparisonUtilties.hashNat16(0);
    await assertTrue(hashZero >= 0 and hashZero < 2 ** 3, "hashNat16 should return a valid Nat32 for zero");

    let hashMax = ComparisonUtilties.hashNat16(65535); // Nat16 max
    await assertTrue(hashMax >= 0 and hashMax < 2 ** 3, "hashNat16 should return a valid Nat32 for max value");
};

// Test 5: eqNat32 - Equality for Nat32
func testEqNat32() : async () {
    // Basic equality
    await assertTrue(ComparisonUtilties.eqNat32(1000, 1000), "eqNat32 should return true for equal values");
    await assertTrue(not ComparisonUtilties.eqNat32(1000, 1001), "eqNat32 should return false for unequal values");

    // Edge cases
    await assertTrue(ComparisonUtilties.eqNat32(0, 0), "eqNat32 should work for zero");
    await assertTrue(ComparisonUtilties.eqNat32(4294967295, 4294967295), "eqNat32 should work for Nat32 max value");
};

// Test 6: hashNat32 - Hashing for Nat32
func testHashNat32() : async () {
    // Consistency
    let hash1 = ComparisonUtilties.hashNat32(123456);
    let hash2 = ComparisonUtilties.hashNat32(123456);
    await assertTrue(hash1 == hash2, "hashNat32 should be consistent for the same input");

    // Valid range
    let hashZero = ComparisonUtilties.hashNat32(0);
    await assertTrue(hashZero >= 0 and hashZero < 2 ** 32, "hashNat32 should return a valid Nat32 for zero");

    let hashMax = ComparisonUtilties.hashNat32(4294967295); // Nat32 max
    await assertTrue(hashMax >= 0 and hashMax < 2 ** 32, "hashNat32 should return a valid Nat32 for max value");

    // Check modulo behavior
    let largeVal = ComparisonUtilties.hashNat32(4294967295);
    await assertTrue(largeVal == 4294967294, "hashNat32 should apply modulo correctly"); // 2^32 - 1 = 4294967295
};

runTests();
