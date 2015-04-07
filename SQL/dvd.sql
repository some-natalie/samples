CREATE  TABLE DVD(
    DVDKey          Int             NOT NULL,
    Title           VarChar(50)     NOT NULL,
    ReleaseYear     Int,
    Media           VarChar(20),
    Rating          Int,
    Price           Int,
    StudioKey       Int             NOT NULL UNIQUE,
    PRIMARY KEY (DVDKey)
);

CREATE  TABLE Studio(
    StudioKey       Int,
    StudioName      VarChar(50),
    PRIMARY KEY (StudioKey),
    FOREIGN KEY (StudioKey) REFERENCES DVD(StudioKey)
);

CREATE  TABLE Genre(
    GenreKey        Int,
    Genre           VarChar(20),
    PRIMARY KEY (GenreKey)
);

CREATE  TABLE DVDGenre(
    DVDKey          Int,
    GenreKey        Int,
    PRIMARY KEY (DVDKey),
    FOREIGN KEY (DVDKey) REFERENCES DVD(DVDKey),
    PRIMARY KEY (GenreKey),
    FOREIGN KEY (GenreKey) REFERENCES Genre(GenreKey)
);

CREATE  TABLE SpecialFeatures(
    SpecialFeature  Int,
    FeatureName     VarChar(100),
    PRIMARY KEY (SpecialFeature)
);

CREATE  TABLE DVDSpecialFeature(
    DVDKey          Int,
    SpecialFeature  Int,
    PRIMARY KEY (DVDKey),
    FOREIGN KEY (DVDKey) REFERENCES DVD(DVDKey),
    PRIMARY KEY (SpecialFeature),
    FOREIGN KEY (SpecialFeature) REFERENCES SpecialFeatures(SpecialFeature)
);

CREATE  TABLE Actor(
    ActorKey        Int,
    ActorName       VarChar(100),
    PRIMARY KEY (ActorKey)
);

CREATE  TABLE ActorDVD(
    DVDKey          Int,
    ActorKey        Int,
    PRIMARY KEY (DVDKey),
    FOREIGN KEY (DVDKey) REFERENCES DVD(DVDKey),
    PRIMARY KEY (ActorKey),
    FOREIGN KEY (ActorKey) REFERENCES Actor(ActorKey)
);
