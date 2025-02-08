import FootballTypes "../src";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Blob "mo:base/Blob";



func runTests() : async () {
    await testCountry();
    await testLeague();
    await testClub();
    await testFixture();
    await testPlayer();
    Debug.print("All tests passed!");
};

func testCountry() : async () {
    let country : FootballTypes.Country = {
        id = 1;
        name = "England";
        code = "ENG";
    };

    assert(country.id == 1);
    assert(country.name == "England");
    assert(country.code == "ENG");
    Debug.print("Country test passed!");
};

func testLeague() : async () {
    let league : FootballTypes.League = {
        id = 1;
        name = "Premier League";
        abbreviation = "PL";
        teamCount = 20;
        relatedGender = #Male;
        governingBody = "FA";
        formed = 1992;
        countryId = 1;
        logo = Blob.fromArray([]);
    };

    assert(league.id == 1);
    assert(league.name == "Premier League");
    assert(league.abbreviation == "PL");
    assert(league.teamCount == 20);
    assert(league.relatedGender == #Male);
    assert(league.governingBody == "FA");
    assert(league.formed == 1992);
    assert(league.countryId == 1);
    Debug.print("League test passed!");
};

func testClub() : async () {
    let club : FootballTypes.Club = {
        id = 1;
        name = "Manchester United";
        friendlyName = "Man Utd";
        primaryColourHex = "#FF0000";
        secondaryColourHex = "#FFFFFF";
        thirdColourHex = "#000000";
        abbreviatedName = "MUN";
        shirtType = #Filled;
    };

    assert(club.id == 1);
    assert(club.name == "Manchester United");
    assert(club.friendlyName == "Man Utd");
    assert(club.primaryColourHex == "#FF0000");
    assert(club.secondaryColourHex == "#FFFFFF");
    assert(club.thirdColourHex == "#000000");
    assert(club.abbreviatedName == "MUN");
    assert(club.shirtType == #Filled);
    Debug.print("Club test passed!");
};

func testFixture() : async () {
    let fixture : FootballTypes.Fixture = {
        id = 1;
        seasonId = 2023;
        gameweek = 1;
        kickOff = 1693526400; // Example timestamp
        homeClubId = 1;
        awayClubId = 2;
        homeGoals = 2;
        awayGoals = 1;
        status = #Complete;
        highestScoringPlayerId = 10;
        events = List.nil();
    };

    assert(fixture.id == 1);
    assert(fixture.seasonId == 2023);
    assert(fixture.gameweek == 1);
    assert(fixture.kickOff == 1693526400);
    assert(fixture.homeClubId == 1);
    assert(fixture.awayClubId == 2);
    assert(fixture.homeGoals == 2);
    assert(fixture.awayGoals == 1);
    assert(fixture.status == #Complete);
    assert(fixture.highestScoringPlayerId == 10);
    Debug.print("Fixture test passed!");
};

func testPlayer() : async () {
    let player : FootballTypes.Player = {
        id = 1;
        leagueId = 1;
        clubId = 1;
        position = #Forward;
        firstName = "Marcus";
        lastName = "Rashford";
        shirtNumber = 10;
        valueQuarterMillions = 80;
        dateOfBirth = 876432000; 
        nationality = 1;
        seasons = List.nil();
        valueHistory = List.nil();
        status = #Active;
        currentLoanEndDate = 0;
        parentLeagueId = 1;
        parentClubId = 1;
        latestInjuryEndDate = 0;
        injuryHistory = List.nil();
        transferHistory = List.nil();
        retirementDate = 0;
        gender = #Male;
    };

    assert(player.id == 1);
    assert(player.leagueId == 1);
    assert(player.clubId == 1);
    assert(player.position == #Forward);
    assert(player.firstName == "Marcus");
    assert(player.lastName == "Rashford");
    assert(player.shirtNumber == 10);
    assert(player.valueQuarterMillions == 80);
    assert(player.dateOfBirth == 876432000);
    assert(player.nationality == 1);
    assert(player.status == #Active);
    assert(player.gender == #Male);
    Debug.print("Player test passed!");
};


runTests();