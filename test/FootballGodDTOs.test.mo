import FootballGodDTOs "../src/FootballGodDTOs";
import Text "mo:base/Text";
import Error "mo:base/Error";

func assertTrue(condition : Bool, message : Text) : async () {
    if (not condition) {
        assert (condition);
        throw Error.reject("Failed: " # message);
    };
};

func testSeasonDTO() : async () {
    let season : FootballGodDTOs.SeasonDTO = {
        id = 1;
        name = "2023-24 Season";
        year = 2023;
    };
    await assertTrue(season.id == 1, "SeasonDTO id should match");
    await assertTrue(season.name == "2023-24 Season", "SeasonDTO name should match");
    await assertTrue(season.year == 2023, "SeasonDTO year should match");
};

// Test 2: FixtureDTO
func testFixtureDTO() : async () {
    let fixture : FootballGodDTOs.FixtureDTO = {
        id = 100;
        seasonId = 1;
        gameweek = 1;
        kickOff = 1_677_628_800 * 1_000_000_000;
        homeClubId = 10;
        awayClubId = 11;
        homeGoals = 2;
        awayGoals = 1;
        status = #Finalised;
        highestScoringPlayerId = 5;
        events = [];
    };
    await assertTrue(fixture.id == 100, "FixtureDTO id should match");
    await assertTrue(fixture.homeGoals == 2, "FixtureDTO homeGoals should match");
    await assertTrue(fixture.awayGoals == 1, "FixtureDTO awayGoals should match");
};

// Test 3: PlayerDetailDTO
func testPlayerDetailDTO() : async () {
    let player : FootballGodDTOs.PlayerDetailDTO = {
        id = 7;
        clubId = 10;
        position = #Forward;
        firstName = "John";
        lastName = "Doe";
        shirtNumber = 9;
        valueQuarterMillions = 120;
        dateOfBirth = 946684800 * 1_000_000_000;
        nationality = 44;
        seasonId = 1;
        gameweeks = [];
        valueHistory = [];
        status = #Active;
        parentClubId = 10;
        latestInjuryEndDate = 0;
        injuryHistory = [];
        retirementDate = 0;
    };
    await assertTrue(player.firstName == "John", "PlayerDetailDTO firstName should match");
    await assertTrue(player.shirtNumber == 9, "PlayerDetailDTO shirtNumber should match");
    await assertTrue(player.position == #Forward, "PlayerDetailDTO position should match");
};

// Test 4: PlayerGameweekDTO
func testPlayerGameweekDTO() : async () {
    let gameweek : FootballGodDTOs.PlayerGameweekDTO = {
        number = 1;
        events = [];
        points = 10;
        fixtureId = 100;
    };
    await assertTrue(gameweek.number == 1, "PlayerGameweekDTO number should match");
    await assertTrue(gameweek.points == 10, "PlayerGameweekDTO points should match");
};

// Test 5: ClubDTO
func testClubDTO() : async () {
    let club : FootballGodDTOs.ClubDTO = {
        id = 10;
        name = "Test United";
        friendlyName = "Test Utd";
        primaryColourHex = "#FF0000";
        secondaryColourHex = "#FFFFFF";
        thirdColourHex = "#000000";
        abbreviatedName = "TST";
        shirtType = #Striped;
    };
    await assertTrue(club.name == "Test United", "ClubDTO name should match");
    await assertTrue(club.primaryColourHex == "#FF0000", "ClubDTO primaryColourHex should match");
};

// Test 6: PlayerScoreDTO
func testPlayerScoreDTO() : async () {
    let score : FootballGodDTOs.PlayerScoreDTO = {
        id = 7;
        points = 15;
        clubId = 10;
        goalsScored = 2;
        goalsConceded = 0;
        position = #Forward;
        nationality = 44;
        dateOfBirth = 946684800 * 1_000_000_000;
        saves = 0;
        assists = 1;
        events = [];
    };
    await assertTrue(score.points == 15, "PlayerScoreDTO points should match");
    await assertTrue(score.goalsScored == 2, "PlayerScoreDTO goalsScored should match");
};

// Test 7: PlayerPointsDTO
func testPlayerPointsDTO() : async () {
    let points : FootballGodDTOs.PlayerPointsDTO = {
        id = 7;
        gameweek = 1;
        points = 12;
        clubId = 10;
        position = #Forward;
        events = [];
    };
    await assertTrue(points.gameweek == 1, "PlayerPointsDTO gameweek should match");
    await assertTrue(points.points == 12, "PlayerPointsDTO points should match");
};

func runTests() : async () {
    await testSeasonDTO();
    await testFixtureDTO();
    await testPlayerDetailDTO();
    await testPlayerGameweekDTO();
    await testClubDTO();
    await testPlayerScoreDTO();
    await testPlayerPointsDTO();
};

runTests();
