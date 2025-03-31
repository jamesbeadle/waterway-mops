import Base "BaseTypes";
import Enums "Enums";
import List "mo:base/List";
import MopsIds "Ids";
import FootballIds "FootballIds";
module FootballTypes {

  public type GameweekNumber = Nat8;

  public type League = {
    id : FootballIds.LeagueId;
    name : Text;
    abbreviation : Text;
    teamCount : Nat8;
    relatedGender : Enums.Gender;
    governingBody : Text;
    formed : Int;
    countryId : MopsIds.CountryId;
    logo : Blob;
  };

  public type LeagueStatus = {
    leagueId : FootballIds.LeagueId;
    activeSeasonId : FootballIds.SeasonId;
    activeMonth : Base.CalendarMonth;
    unplayedGameweek : GameweekNumber;
    activeGameweek : GameweekNumber;
    completedGameweek : GameweekNumber;
    transferWindowActive : Bool;
    seasonActive : Bool;
    totalGameweeks : Nat8;
    transferWindowStartDay : Nat8;
    transferWindowStartMonth : Nat8;
    transferWindowEndDay : Nat8;
    transferWindowEndMonth : Nat8;
  };

  public type Club = {
    id : FootballIds.ClubId;
    name : Text;
    friendlyName : Text;
    primaryColourHex : Text;
    secondaryColourHex : Text;
    thirdColourHex : Text;
    abbreviatedName : Text;
    shirtType : ShirtType;
  };

  public type Fixture = {
    id : FootballIds.FixtureId;
    seasonId : FootballIds.SeasonId;
    gameweek : GameweekNumber;
    kickOff : Int;
    homeClubId : FootballIds.ClubId;
    awayClubId : FootballIds.ClubId;
    homeGoals : Nat8;
    awayGoals : Nat8;
    status : FixtureStatusType;
    highestScoringPlayerId : FootballIds.PlayerId;
    events : List.List<PlayerEventData>;
  };

  public type Season = {
    id : Nat16;
    name : Text;
    year : Nat16;
    fixtures : List.List<Fixture>;
    postponedFixtures : List.List<Fixture>;
  };

  public type Player = {
    id : FootballIds.PlayerId;
    leagueId : FootballIds.LeagueId;
    clubId : FootballIds.ClubId;
    position : PlayerPosition;
    firstName : Text;
    lastName : Text;
    shirtNumber : Nat8;
    valueQuarterMillions : Nat16;
    dateOfBirth : Int;
    nationality : MopsIds.CountryId;
    seasons : List.List<PlayerSeason>;
    valueHistory : List.List<ValueHistory>;
    status : PlayerStatus;
    currentLoanEndDate : Int;
    parentLeagueId : FootballIds.LeagueId;
    parentClubId : FootballIds.ClubId;
    latestInjuryEndDate : Int;
    injuryHistory : List.List<InjuryHistory>;
    transferHistory : List.List<TransferHistory>;
    retirementDate : Int;
    gender : Enums.Gender;
  };

  public type PlayerSeason = {
    id : FootballIds.SeasonId;
    gameweeks : List.List<PlayerGameweek>;
    totalPoints : Int16;
  };

  public type PlayerGameweek = {
    number : GameweekNumber;
    events : List.List<PlayerEventData>;
    points : Int16;
  };

  public type PlayerEventData = {
    fixtureId : FootballIds.FixtureId;
    playerId : Nat16;
    eventType : PlayerEventType;
    eventStartMinute : Nat8;
    eventEndMinute : Nat8;
    clubId : FootballIds.ClubId;
  };

  public type PlayerPosition = {
    #Goalkeeper;
    #Defender;
    #Midfielder;
    #Forward;
  };

  public type PlayerStatus = {
    #Active;
    #Retired;
    #OnLoan;
    #FreeAgent;
  };

  public type ShirtType = {
    #Filled;
    #Striped;
  };

  public type GoalType = {
    #LeftFoot;
    #RightFoot;
    #Header;
    #OutsideBox;
    #DirectSetPiece;
  };

  public type PlayerEventType = {
    #Appearance;
    #Goal;
    #GoalAssisted;
    #GoalConceded;
    #KeeperSave;
    #CleanSheet;
    #PenaltySaved;
    #PenaltyMissed;
    #YellowCard;
    #RedCard;
    #OwnGoal;
    #HighestScoringPlayer;
  };

  public type ValueHistory = {
    changedOn : Int;
    oldValue : Nat16;
    newValue : Nat16;
  };

  public type InjuryHistory = {
    description : Text;
    injuryStartDate : Int;
    expectedEndDate : Int;
  };

  public type TransferHistory = {
    transferDate : Int;
    fromLeagueId : FootballIds.LeagueId;
    toLeagueId : FootballIds.LeagueId;
    fromClub : FootballIds.ClubId;
    toClub : FootballIds.ClubId;
    loanEndDate : Int;
  };

  public type FixtureStatusType = {
    #Unplayed;
    #Active;
    #Complete;
    #Finalised;
  };

  public type FantasyTeamSnapshot = {
    principalId : Text;
    username : Text;
    favouriteClubId : ?FootballIds.ClubId;
    monthlyBonusesAvailable : Nat8;
    transfersAvailable : Nat8;
    bankQuarterMillions : Nat16;
    teamValueQuarterMillions : Nat16;
    playerIds : [FootballIds.PlayerId];
    captainId : FootballIds.PlayerId;
    gameweek : GameweekNumber;
    goalGetterGameweek : GameweekNumber;
    goalGetterPlayerId : FootballIds.PlayerId;
    passMasterGameweek : GameweekNumber;
    passMasterPlayerId : FootballIds.PlayerId;
    noEntryGameweek : GameweekNumber;
    noEntryPlayerId : FootballIds.PlayerId;
    teamBoostGameweek : GameweekNumber;
    teamBoostClubId : FootballIds.ClubId;
    safeHandsGameweek : GameweekNumber;
    safeHandsPlayerId : FootballIds.PlayerId;
    captainFantasticGameweek : GameweekNumber;
    captainFantasticPlayerId : FootballIds.PlayerId;
    oneNationGameweek : GameweekNumber;
    oneNationCountryId : MopsIds.CountryId;
    prospectsGameweek : GameweekNumber;
    braceBonusGameweek : GameweekNumber;
    hatTrickHeroGameweek : GameweekNumber;
    points : Int16;
    monthlyPoints : Int16;
    seasonPoints : Int16;
    transferWindowGameweek : GameweekNumber;
    month : Base.CalendarMonth;
    seasonId : FootballIds.SeasonId;
  };

  public type LeagueTable = {
    leagueId : FootballIds.LeagueId;
    seasonId : FootballIds.SeasonId;
    entries : [LeagueTableEntry];
  };

  public type LeagueTableEntry = {
    position : Nat;
    clubId : FootballIds.ClubId;
    played : Nat;
    won : Nat;
    drawn : Nat;
    lost : Nat;
    conceded : Nat;
    scored : Nat;
    points : Nat;
    homePlayed : Nat;
    homeWon : Nat;
    homeDrawn : Nat;
    homeLost : Nat;
    homeConceded : Nat;
    homeScored : Nat;
    homePoints : Nat;
    awayPlayed : Nat;
    awayWon : Nat;
    awayDrawn : Nat;
    awayLost : Nat;
    awayConceded : Nat;
    awayScored : Nat;
    awayPoints : Nat;
  };

};
