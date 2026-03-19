// ============================================================
//  WATER QUALITY ANALYSIS — POWER BI M QUERIES (Power Query)
//  Author: Etudaiye Anomi | SHESTCO, Abuja
//  Data: Rainy Season (July 2023) & Dry Season (March 2024)
//  HOW TO USE: In Power BI Desktop → Home → Transform Data
//              → Advanced Editor → paste each query
// ============================================================


// ============================================================
// QUERY 1: Rainy Season — Physicochemical Parameters
// ============================================================
let
    Source = Excel.Workbook(File.Contents("C:\YOUR_PATH\2023-2024_water_and_season_analyis.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],

    RainyRows = Table.Range(Sheet1, 2, 11),

    RenamedCols = Table.RenameColumns(RainyRows, {
        {"Column1",  "Sample"},
        {"Column2",  "pH"},
        {"Column3",  "Turbidity_NTU"},
        {"Column4",  "TDS_ppm"},
        {"Column5",  "Acidity_mgl"},
        {"Column6",  "Alkalinity_mgl"},
        {"Column7",  "Chloride_mgl"},
        {"Column8",  "Hardness_mgl"},
        {"Column9",  "NO3_mgl"},
        {"Column10", "NO2_mgl"}
    }),

    SelectedCols = Table.SelectColumns(RenamedCols, {
        "Sample","pH","Turbidity_NTU","TDS_ppm",
        "Acidity_mgl","Alkalinity_mgl","Chloride_mgl",
        "Hardness_mgl","NO3_mgl","NO2_mgl"
    }),

    AddSeason = Table.AddColumn(SelectedCols, "Season", each "Rainy"),

    TypedTable = Table.TransformColumnTypes(AddSeason, {
        {"pH",             type number},
        {"Turbidity_NTU",  type number},
        {"TDS_ppm",        type number},
        {"Acidity_mgl",    type number},
        {"Alkalinity_mgl", type number},
        {"Chloride_mgl",   type number},
        {"Hardness_mgl",   type number},
        {"NO3_mgl",        type number},
        {"NO2_mgl",        type number}
    })
in
    TypedTable


// ============================================================
// QUERY 2: Dry Season — Physicochemical Parameters
// ============================================================
let
    Source = Excel.Workbook(File.Contents("C:\YOUR_PATH\2023-2024_water_and_season_analyis.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],

    DryRows = Table.Range(Sheet1, 35, 12),

    ShiftedCols = Table.RemoveColumns(DryRows, {"Column1"}),

    RenamedCols = Table.RenameColumns(ShiftedCols, {
        {"Column2",  "Sample"},
        {"Column3",  "pH"},
        {"Column4",  "Turbidity_NTU"},
        {"Column5",  "TDS_ppm"},
        {"Column6",  "Acidity_mgl"},
        {"Column7",  "Alkalinity_mgl"},
        {"Column8",  "Chloride_mgl"},
        {"Column9",  "Hardness_mgl"},
        {"Column10", "NO3_mgl"},
        {"Column11", "NO2_mgl"}
    }),

    SelectedCols = Table.SelectColumns(RenamedCols, {
        "Sample","pH","Turbidity_NTU","TDS_ppm",
        "Acidity_mgl","Alkalinity_mgl","Chloride_mgl",
        "Hardness_mgl","NO3_mgl","NO2_mgl"
    }),

    AddSeason = Table.AddColumn(SelectedCols, "Season", each "Dry"),

    TypedTable = Table.TransformColumnTypes(AddSeason, {
        {"pH",             type number},
        {"Turbidity_NTU",  type number},
        {"TDS_ppm",        type number},
        {"Acidity_mgl",    type number},
        {"Alkalinity_mgl", type number},
        {"Chloride_mgl",   type number},
        {"Hardness_mgl",   type number},
        {"NO3_mgl",        type number},
        {"NO2_mgl",        type number}
    })
in
    TypedTable


// ============================================================
// QUERY 3: Combined Physicochemical (Rainy + Dry)
// Use this as your MAIN TABLE in Power BI visuals
// ============================================================
let
    RainyData = RainyPhysicochemical,   // references Query 1
    DryData   = DryPhysicochemical,     // references Query 2
    Combined  = Table.Combine({RainyData, DryData}),

    CleanSample = Table.TransformColumns(Combined, {
        {"Sample", each Text.Trim(Text.Upper(_)), type text}
    }),

    AddLocation = Table.AddColumn(CleanSample, "Location", each
        if Text.Contains([Sample], "KUT")  then "Kubwa Upper Town"
        else if Text.Contains([Sample], "KILW") or Text.Contains([Sample], "KILW") then "Kuje Lower Well"
        else if Text.Contains([Sample], "KILT") then "Kuje Lower Top"
        else if Text.Contains([Sample], "KILB") then "Kuje Lower Bottom"
        else if Text.Contains([Sample], "KWW")  then "Kwali West Well"
        else if Text.Contains([Sample], "KWT")  then "Kwali West Top"
        else if Text.Contains([Sample], "KWB")  then "Kwali West Bottom"
        else if Text.Contains([Sample], "LCT")  then "Lugbe Central Top"
        else if Text.Contains([Sample], "BKT")  then "Bwari Top"
        else if Text.Contains([Sample], "BKB")  then "Bwari Bottom"
        else if Text.Contains([Sample], "BKW")  then "Bwari Well"
        else [Sample]
    )
in
    AddLocation


// ============================================================
// QUERY 4: Rainy Season — Elemental / Heavy Metals
// ============================================================
let
    Source = Excel.Workbook(File.Contents("C:\YOUR_PATH\2023-2024_water_and_season_analyis.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],

    RainyElemRows = Table.Range(Sheet1, 17, 11),

    RenamedCols = Table.RenameColumns(RainyElemRows, {
        {"Column1",  "Sample"},
        {"Column2",  "Co"},
        {"Column3",  "Fe"},
        {"Column4",  "Cu"},
        {"Column5",  "Cd"},
        {"Column6",  "Cr"},
        {"Column7",  "Ni"},
        {"Column8",  "Pb"},
        {"Column9",  "Mn"},
        {"Column10", "Zn"},
        {"Column11", "Mg"},
        {"Column12", "Ca"},
        {"Column13", "Na"},
        {"Column14", "K"}
    }),

    AddSeason = Table.AddColumn(RenamedCols, "Season", each "Rainy"),

    TypedTable = Table.TransformColumnTypes(AddSeason, {
        {"Co", type number}, {"Fe", type number}, {"Cu", type number},
        {"Cd", type number}, {"Cr", type number}, {"Ni", type number},
        {"Pb", type number}, {"Mn", type number}, {"Zn", type number},
        {"Mg", type number}, {"Ca", type number}, {"Na", type number},
        {"K",  type number}
    })
in
    TypedTable


// ============================================================
// QUERY 5: Dry Season — Elemental / Heavy Metals
// ============================================================
let
    Source = Excel.Workbook(File.Contents("C:\YOUR_PATH\2023-2024_water_and_season_analyis.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],

    DryElemRows = Table.Range(Sheet1, 51, 11),

    ShiftedCols = Table.RemoveColumns(DryElemRows, {"Column1"}),

    RenamedCols = Table.RenameColumns(ShiftedCols, {
        {"Column2",  "Sample"},
        {"Column3",  "Co"},
        {"Column4",  "Fe"},
        {"Column5",  "Cu"},
        {"Column6",  "Cd"},
        {"Column7",  "Cr"},
        {"Column8",  "Ni"},
        {"Column9",  "Pb"},
        {"Column10", "Mn"},
        {"Column11", "Zn"},
        {"Column12", "Mg"},
        {"Column13", "Ca"},
        {"Column14", "Na"},
        {"Column15", "K"}
    }),

    AddSeason = Table.AddColumn(RenamedCols, "Season", each "Dry"),

    TypedTable = Table.TransformColumnTypes(AddSeason, {
        {"Co", type number}, {"Fe", type number}, {"Cu", type number},
        {"Cd", type number}, {"Cr", type number}, {"Ni", type number},
        {"Pb", type number}, {"Mn", type number}, {"Zn", type number},
        {"Mg", type number}, {"Ca", type number}, {"Na", type number},
        {"K",  type number}
    })
in
    TypedTable


// ============================================================
// QUERY 6: Combined Elementals (Rainy + Dry)
// ============================================================
let
    RainyElem = RainyElementals,   // references Query 4
    DryElem   = DryElementals,     // references Query 5
    Combined  = Table.Combine({RainyElem, DryElem})
in
    Combined


// ============================================================
// QUERY 7: WHO Compliance Check (Calculated Table / DAX)
// Paste this as a NEW TABLE in Power BI (Modeling → New Table)
// ============================================================
/*
WHO_Compliance =
ADDCOLUMNS(
    CombinedPhysicochemical,
    "pH_Status",
        IF([pH] >= 6.5 && [pH] <= 8.5, "PASS", "FAIL"),
    "Turbidity_Status",
        IF([Turbidity_NTU] <= 5, "PASS", "FAIL"),
    "TDS_Status",
        IF([TDS_ppm] <= 500, "PASS", "FAIL"),
    "Chloride_Status",
        IF([Chloride_mgl] <= 250, "PASS", "FAIL"),
    "Hardness_Status",
        IF([Hardness_mgl] <= 300, "PASS", "FAIL")
)
*/


// ============================================================
// QUERY 8: KEY DAX MEASURES
// Paste each as a New Measure in Power BI
// ============================================================

/*
-- Average pH by Season
Avg pH = AVERAGE(CombinedPhysicochemical[pH])

-- Average TDS
Avg TDS = AVERAGE(CombinedPhysicochemical[TDS_ppm])

-- Average Turbidity
Avg Turbidity = AVERAGE(CombinedPhysicochemical[Turbidity_NTU])

-- pH Rainy Season
pH Rainy = CALCULATE(AVERAGE(CombinedPhysicochemical[pH]), CombinedPhysicochemical[Season] = "Rainy")

-- pH Dry Season
pH Dry = CALCULATE(AVERAGE(CombinedPhysicochemical[pH]), CombinedPhysicochemical[Season] = "Dry")

-- TDS Rainy Season
TDS Rainy = CALCULATE(AVERAGE(CombinedPhysicochemical[TDS_ppm]), CombinedPhysicochemical[Season] = "Rainy")

-- TDS Dry Season
TDS Dry = CALCULATE(AVERAGE(CombinedPhysicochemical[TDS_ppm]), CombinedPhysicochemical[Season] = "Dry")

-- Count of samples
Sample Count = COUNTROWS(CombinedPhysicochemical)

-- Count of WHO failures (pH)
pH Failures = COUNTROWS(FILTER(CombinedPhysicochemical, CombinedPhysicochemical[pH] < 6.5 || CombinedPhysicochemical[pH] > 8.5))

-- Max Lead (Pb)
Max Pb = MAX(CombinedElementals[Pb])

-- Avg Calcium by Season
Avg Ca = AVERAGE(CombinedElementals[Ca])
*/
