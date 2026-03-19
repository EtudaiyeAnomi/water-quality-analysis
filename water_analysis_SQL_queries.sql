-- ============================================================
--  WATER QUALITY ANALYSIS — SQL QUERIES
--  Author: Etudaiye Anomi | SHESTCO, Abuja
--  Data: Rainy Season (July 2023) & Dry Season (March 2024)
-- ============================================================


-- ============================================================
-- SECTION 1: CREATE TABLES
-- ============================================================

-- Physicochemical parameters table
CREATE TABLE water_physicochemical (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    sample_id       VARCHAR(20),
    location        VARCHAR(50),
    season          VARCHAR(10),   -- 'Rainy' or 'Dry'
    pH              DECIMAL(5,2),
    turbidity_NTU   DECIMAL(8,4),
    TDS_ppm         DECIMAL(8,2),
    acidity_mgl     DECIMAL(8,2),
    alkalinity_mgl  DECIMAL(8,2),
    chloride_mgl    DECIMAL(8,4),
    hardness_mgl    DECIMAL(8,2),
    NO3_mgl         DECIMAL(8,4),
    NO2_mgl         DECIMAL(8,4)
);

-- Elemental/heavy metals table
CREATE TABLE water_elementals (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    sample_id   VARCHAR(20),
    location    VARCHAR(50),
    season      VARCHAR(10),
    Co          DECIMAL(8,4),
    Fe          DECIMAL(8,4),
    Cu          DECIMAL(8,4),
    Cd          DECIMAL(8,4),
    Cr          DECIMAL(8,4),
    Ni          DECIMAL(8,4),
    Pb          DECIMAL(8,4),
    Mn          DECIMAL(8,4),
    Zn          DECIMAL(8,4),
    Mg          DECIMAL(8,4),
    Ca          DECIMAL(8,4),
    Na          DECIMAL(8,4),
    K           DECIMAL(8,4)
);


-- ============================================================
-- SECTION 2: INSERT DATA — RAINY SEASON PHYSICOCHEMICAL
-- ============================================================

INSERT INTO water_physicochemical
    (sample_id, location, season, pH, turbidity_NTU, TDS_ppm, acidity_mgl, alkalinity_mgl, chloride_mgl, hardness_mgl, NO3_mgl, NO2_mgl)
VALUES
    ('S1',  'KUT',  'Rainy', 6.94, 0.68,   30.47,  30,  48,  9.9828,   26,  1.2096, 0.0660),
    ('S2',  'KiLw', 'Rainy', 5.96, 0.82,   95.60,  100, 128, 12.4785,  44,  1.1880, 0.2018),
    ('S3',  'KiLT', 'Rainy', 5.99, 0.32,   82.98,  90,  112, 12.4785,  56,  1.0936, 0.0877),
    ('S4',  'KiLB', 'Rainy', 5.83, 0.32,   86.72,  130, 128, 14.9742,  54,  1.2789, 0.0363),
    ('S5',  'KWW',  'Rainy', 5.83, 13.60,  78.99,  60,  64,  17.4699,  120, 1.2395, 0.1295),
    ('S6',  'KWT',  'Rainy', 5.94, 7.33,   132.70, 150, 160, 14.9742,  50,  1.1705, 0.0346),
    ('S7',  'KwB',  'Rainy', 5.79, 2.00,   204.10, 90,  128, 57.4011,  52,  0.0683, 1.3313),
    ('S9',  'LCT',  'Rainy', 6.36, 0.90,   36.49,  50,  48,  14.9742,  44,  1.1654, 0.0706),
    ('S10', 'BkT',  'Rainy', 6.16, 0.40,   36.44,  40,  32,  14.9742,  30,  1.2699, 0.0411),
    ('S11', 'BKB',  'Rainy', 7.05, 0.17,   351.20, 80,  180, 44.9226,  112, 1.1814, 0.0045),
    ('S12', 'BKW',  'Rainy', 6.74, 0.96,   642.60, 80,  64,  102.3237, 114, 0.5871, 0.6752);


-- ============================================================
-- SECTION 3: INSERT DATA — DRY SEASON PHYSICOCHEMICAL
-- ============================================================

INSERT INTO water_physicochemical
    (sample_id, location, season, pH, turbidity_NTU, TDS_ppm, acidity_mgl, alkalinity_mgl, chloride_mgl, hardness_mgl, NO3_mgl, NO2_mgl)
VALUES
    ('S1',  'KUT',  'Dry', 6.81, 399.00, 32.63,  70, 200, 9.9828,   28,   0.9868, 0.1015),
    ('S2',  'KiLw', 'Dry', 6.45, 4.25,   87.65,  90, 144, 24.9570,  40,   1.0979, 0.1370),
    ('S3',  'KiLT', 'Dry', 6.41, 2.26,   78.99,  100,160, 14.9742,  36,   0.9316, 0.1679),
    ('S4',  'KiLB', 'Dry', 6.15, 1.94,   96.10,  90, 160, 19.9656,  52,   0.9138, 0.2440),
    ('S5',  'KWW',  'Dry', 6.54, 2.66,   312.30, 50, 160, 79.8624,  68,   0.9590, 0.1444),
    ('S6',  'KWT',  'Dry', 6.36, 5.20,   266.70, 20, 112, 54.9054,  80,   0.9815, 0.1781),
    ('S7',  'KwB',  'Dry', 6.44, 2.88,   448.20, 70, 128, 114.8022, 55.6, 0.3358, 1.4774),
    ('S9',  'LCT',  'Dry', 6.66, 2.57,   36.36,  40, 64,  29.9484,  44,   1.0509, 0.0907),
    ('S10', 'BkT',  'Dry', 6.77, 7.25,   42.66,  30, 96,  14.9742,  26,   0.8105, 0.1735),
    ('S11', 'BKB',  'Dry', 6.85, 2.71,   309.60, 70, 160, 84.8538,  90,   0.8157, 0.2303),
    ('S12', 'BKW',  'Dry', 6.90, 5.91,   532.00, 30, 112, 169.7076, 104,  0.7184, 0.4559),
    ('S13', 'S13',  'Dry', 6.37, 6.26,   307.20, 10, 192, 49.9140,  56,   0.5142, 0.5752);


-- ============================================================
-- SECTION 4: INSERT DATA — RAINY SEASON ELEMENTALS
-- ============================================================

INSERT INTO water_elementals
    (sample_id, location, season, Co, Fe, Cu, Cd, Cr, Ni, Pb, Mn, Zn, Mg, Ca, Na, K)
VALUES
    ('S1',  'KUT',  'Rainy', -1.5501, 0.1594, -0.4406, 0.7945, -1.9958, 0.0307,  1.3390, 0.9878, 0.4881,  1.1759,  2.4744,  2.3478,  3.0241),
    ('S9',  'LCT',  'Rainy', -1.4473, 0.3256,  0.0373, 0.7517, -1.6299, 0.3505, -0.0685, 1.2342, 0.6177,  1.4683,  2.2794,  2.7069,  3.9705),
    ('S6',  'KWT',  'Rainy', -2.4455, 0.3243,  0.3436, 0.7782, -1.4277, 0.2184,  1.6314, 1.0833, 0.5187,  6.8103,  5.7391, 18.7970,  4.0938),
    ('S5',  'KWW',  'Rainy', -1.8382, 0.6073, -0.3971, 0.7682, -2.3587, 0.0871,  1.0213, 0.6614, 0.4325,  3.7571,  6.0125,  4.7988,  2.3572),
    ('S7',  'KwB',  'Rainy', -1.8382, 0.6094, -0.4799, 0.8356, -0.8167, 0.2911,  1.9861, 1.1123, 0.4917, 15.6769, 23.2949, 51.8630,  5.3955),
    ('S3',  'KiLT', 'Rainy', -2.3197, 0.1852,  0.0082, 0.9099, -2.3151,-0.6977,  0.9639, 1.3589, 0.3018,  3.8490,  2.3321,  5.4928,  5.5393),
    ('S2',  'KiLw', 'Rainy', -2.2096, 0.1473, -0.4850, 0.7108, -1.4932, 0.1807,  1.7019, 0.7591, 0.4799,  4.1951,  3.7230,  5.5960,  5.2326),
    ('S4',  'KiLB', 'Rainy', -1.8659, 0.2267,  0.0297, 0.8266, -1.5994,-0.2921,  1.3890, 1.2268, 0.3285,  2.5839,  3.1476,  6.0098,  4.3207),
    ('S10', 'BkT',  'Rainy', -1.2412, 1.0783, -0.1117, 0.7151, -1.5587, 0.0638,  1.2316, 1.0962, 0.3254,  1.5703,  2.5339,  2.7021,  3.9020),
    ('S12', 'BKW',  'Rainy', -2.0195, 0.6054, -0.5623, 0.8041, -1.5500, 0.1299,  1.8445, 0.8846, 0.4293, 14.1947, 45.0995, 66.3730, 21.9500),
    ('S11', 'BKB',  'Rainy', -1.0260, 0.4565,  0.1025, 0.6170, -1.1951, 0.3283,  1.6943, 0.5140, 0.3539, 15.4758, 33.3697, 33.5200,  9.1806);


-- ============================================================
-- SECTION 5: INSERT DATA — DRY SEASON ELEMENTALS
-- ============================================================

INSERT INTO water_elementals
    (sample_id, location, season, Co, Fe, Cu, Cd, Cr, Ni, Pb, Mn, Zn, Mg, Ca, Na, K)
VALUES
    ('S1',  'KUT',  'Dry', -0.3039, -0.6808, -0.8251, 0.0686, -0.0322,  1.1008, -0.3799,  0.9636, 0.5214,  1.3588,  2.3881,  3.0218,  3.3916),
    ('S2',  'KiLw', 'Dry',  0.1577, -0.8090,  0.5040, 0.4428, -0.5238, -0.3170, -0.6544,  0.2433, 0.4794,  3.9566,  8.1348,  3.1945,  5.4844),
    ('S3',  'KiLT', 'Dry',  1.7961, -0.8969,  0.1680, 0.5803, -0.4487, -0.1212,  1.2566,  0.5632, 0.4546,  3.8326,  2.3602,  4.9742,  5.7233),
    ('S4',  'KiLB', 'Dry', -0.6891, -0.7004,  0.3797, 0.6971, -1.8965,  0.1839,  1.0321,  0.5529, 0.4913,  2.6557,  3.3372,  8.6518,  4.2692),
    ('S5',  'KWW',  'Dry', -0.0011, -0.1384,  0.2480, 0.1786, -1.2844,  0.7061,  0.0280,  0.1677, 0.5308, 11.0114, 18.0140, 55.7826,  4.1798),
    ('S6',  'KWT',  'Dry', -0.9112,  0.1469,  0.1700,-0.0261, -0.8627,  0.0487,  1.1470, -0.0504, 0.4928, 11.1439,  5.3662, 36.6895,  6.6147),
    ('S7',  'KwB',  'Dry',  0.1670,  0.7244, -0.1477, 0.7050, -0.8915,  0.4876,  0.8293, -0.3145, 0.4055, 16.5393, 27.7095, 54.5400,  5.3957),
    ('S9',  'LCT',  'Dry', -2.0465,  0.9028,  0.0190, 0.6238, -0.3217,  0.6728,  0.3657, -0.4015, 0.5755,  1.4288,  5.9415,  3.0833,  3.4209),
    ('S10', 'BkT',  'Dry', -1.0125,  0.5922, -0.4859, 0.7706, -0.3716,  0.3182,  0.3054,  1.1023, 0.3953,  1.5722,  6.0262,  4.1314,  3.9211),
    ('S11', 'BKB',  'Dry', -1.2509,  0.8942, -0.0194, 0.8115, -1.9523,  0.1382,  2.5970,  0.9968, 0.4713, 14.2732, 33.4516, 40.0211, 10.2208),
    ('S12', 'BKW',  'Dry', -1.6511,  0.6989, -0.7350, 0.6866, -1.4920,  0.6056,  1.3170,  1.1436, 0.5976, 11.5094, 20.2711, 45.6397,  9.7970);


-- ============================================================
-- SECTION 6: ANALYSIS QUERIES
-- ============================================================

-- Q1: Average physicochemical parameters by season
SELECT
    season,
    ROUND(AVG(pH), 3)             AS avg_pH,
    ROUND(AVG(turbidity_NTU), 3)  AS avg_turbidity,
    ROUND(AVG(TDS_ppm), 3)        AS avg_TDS,
    ROUND(AVG(acidity_mgl), 3)    AS avg_acidity,
    ROUND(AVG(alkalinity_mgl), 3) AS avg_alkalinity,
    ROUND(AVG(chloride_mgl), 3)   AS avg_chloride,
    ROUND(AVG(hardness_mgl), 3)   AS avg_hardness,
    ROUND(AVG(NO3_mgl), 4)        AS avg_NO3,
    ROUND(AVG(NO2_mgl), 4)        AS avg_NO2
FROM water_physicochemical
GROUP BY season;


-- Q2: Side-by-side seasonal comparison per location
SELECT
    r.location,
    r.pH        AS rainy_pH,      d.pH        AS dry_pH,
    r.TDS_ppm   AS rainy_TDS,     d.TDS_ppm   AS dry_TDS,
    r.turbidity_NTU AS rainy_turb, d.turbidity_NTU AS dry_turb,
    r.chloride_mgl  AS rainy_Cl,  d.chloride_mgl  AS dry_Cl,
    r.hardness_mgl  AS rainy_hard, d.hardness_mgl  AS dry_hard
FROM water_physicochemical r
JOIN water_physicochemical d
    ON r.location = d.location
WHERE r.season = 'Rainy' AND d.season = 'Dry'
ORDER BY r.location;


-- Q3: WHO/NSDWQ flag — parameters exceeding standard limits
--     WHO limits: pH 6.5-8.5, TDS 500ppm, turbidity 5 NTU,
--                 chloride 250mg/l, hardness 300mg/l
SELECT
    sample_id, location, season,
    pH, turbidity_NTU, TDS_ppm, chloride_mgl, hardness_mgl,
    CASE WHEN pH < 6.5 OR pH > 8.5     THEN 'FAIL' ELSE 'PASS' END AS pH_status,
    CASE WHEN turbidity_NTU > 5         THEN 'FAIL' ELSE 'PASS' END AS turbidity_status,
    CASE WHEN TDS_ppm > 500             THEN 'FAIL' ELSE 'PASS' END AS TDS_status,
    CASE WHEN chloride_mgl > 250        THEN 'FAIL' ELSE 'PASS' END AS chloride_status,
    CASE WHEN hardness_mgl > 300        THEN 'FAIL' ELSE 'PASS' END AS hardness_status
FROM water_physicochemical
ORDER BY season, location;


-- Q4: Highest turbidity samples (top 5)
SELECT location, season, turbidity_NTU
FROM water_physicochemical
ORDER BY turbidity_NTU DESC
LIMIT 5;


-- Q5: Average heavy metals by season
SELECT
    season,
    ROUND(AVG(Fe), 4) AS avg_Fe,
    ROUND(AVG(Pb), 4) AS avg_Pb,
    ROUND(AVG(Cd), 4) AS avg_Cd,
    ROUND(AVG(Zn), 4) AS avg_Zn,
    ROUND(AVG(Ca), 4) AS avg_Ca,
    ROUND(AVG(Na), 4) AS avg_Na,
    ROUND(AVG(Mg), 4) AS avg_Mg
FROM water_elementals
GROUP BY season;


-- Q6: Samples with highest lead (Pb) levels
SELECT location, season, Pb
FROM water_elementals
ORDER BY Pb DESC
LIMIT 5;


-- Q7: Full joined view — physicochemical + elementals
SELECT
    p.location, p.season,
    p.pH, p.turbidity_NTU, p.TDS_ppm, p.chloride_mgl, p.hardness_mgl,
    e.Fe, e.Pb, e.Cd, e.Zn, e.Ca, e.Na, e.Mg
FROM water_physicochemical p
JOIN water_elementals e
    ON p.location = e.location AND p.season = e.season
ORDER BY p.season, p.location;


-- Q8: Count of samples per season
SELECT season, COUNT(*) AS sample_count
FROM water_physicochemical
GROUP BY season;
