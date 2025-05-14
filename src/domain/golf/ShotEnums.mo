module ShotEnums {
        
    public type Club =
    {
        #DRIVER;
        #THREE_WOOD;
        #FIVE_WOOD;
        #SEVEN_WOOD;
        #NINE_WOOD;
        #TWO_HYBRID;
        #THREE_HYBRID;
        #FOUR_HYBRID;
        #FIVE_HYBRID;
        #TWO_IRON;
        #THREE_IRON;
        #FOUR_IRON;
        #FIVE_IRON;
        #SIX_IRON;
        #SEVEN_IRON;
        #EIGHT_IRON;
        #NINE_IRON;
        #PW;
        #GW;
        #SW;
        #LW;
        #AW;
    };

    public type Lie =
    {
        #FAIRWAY;
        #ROUGH;
        #DEEP_ROUGH;
        #SAND;
        #PATH;
        #PLUGGED;
        #WET;
        #OTHER;
    };

    public type ShotIntention = 
    {
        #DRAW;
        #FADE;
        #SLICE;
        #HOOK;
        #PUSH;
        #PULL;
        #STRAIGHT;
        #HIGH;
        #PUNCH;
        #STINGER;
        #CUT;
        #FLOP;
        #CHIP;
        #PITCH;
        #BUMPANDRUN;
        #BUNKER;
        #ESCAPE;
        #PUTT;
        #LAGPUTT;
        #TAPINPUTT;
        #BREAKINGPUTT;
    };

    public type ShotPosition =
    {
        #TEE;
        #FAIRWAY;
        #ROUGH;
        #DEEP_ROUGH;
        #DITCH;
        #PATH;
        #OTHER;
    };

    public type ShotResult =
    {
        #ASINTENDED;
        #SHANK;
        #TOP;
        #THIN;
        #FAT;
        #SKY;
        #PULL;
        #PUSH;
        #HOOK;
        #SLICE;
        #DRAW;
        #FADE;
        #STRAIGHT;
        #CHUNK;
        #POP;
        #LOST;
        #OTHER;
    };

    public type SwingLength = 
    {
        #FULL;
        #THREEQUARTER;
        #HALF;
        #SHORT;
    };

    public type WeatherType = 
    {
        #SUNNY;
        #CLOUDY;
        #RAINY;
        #HEAVY_RAIN;
        #SNOW;
        #ICE;
        #FOG;
        #COLD;
        #OTHER;
    };

};
