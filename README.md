-- Create Farmers table
CREATE TABLE Farmers (
    FarmerID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    ContactInfo TEXT,
    Address TEXT
);

-- Create Fields table
CREATE TABLE Fields (
    FieldID INTEGER PRIMARY KEY AUTOINCREMENT,
    FarmerID INTEGER,
    FieldLocation TEXT NOT NULL,
    FieldSize REAL NOT NULL,
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);

-- Create Harvests table
CREATE TABLE Harvests (
    HarvestID INTEGER PRIMARY KEY AUTOINCREMENT,
    FieldID INTEGER,
    HarvestDate DATE NOT NULL,
    Yield REAL NOT NULL,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)
);

