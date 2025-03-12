CREATE TABLE Samples (
    sample_id INT PRIMARY KEY,
    dna_sequence VARCHAR(255),
    species VARCHAR(50)
);

INSERT INTO Samples VALUES
(1, 'ATGCTAGCTAGCTAA', 'Human'),
(2, 'GGGTCAATCATC', 'Human'),
(3, 'ATATATCGTAGCTA', 'Human'),
(4, 'ATGGGGTCATCATAA', 'Mouse'),
(5, 'TCAGTCAGTCAG', 'Mouse'),
(6, 'ATATCGCGCTAG', 'Zebrafish'),
(7, 'CGTATGCGTCGTA', 'Zebrafish');
----------------------------------------------------------------------------------------------------


SELECT * FROM Samples
WHERE dna_sequence LIKE '%GCG%';

SELECT *, 
    CAST(CASE WHEN (dna_sequence LIKE 'ATG%') THEN 1 ELSE 0 END AS SMALLINT) AS has_start,
    CAST(CASE WHEN (
            (dna_sequence LIKE '%TAA') OR 
            (dna_sequence LIKE '%TAG') OR 
            (dna_sequence LIKE '%TGA')) 
        THEN 1 ELSE 0 END AS SMALLINT) AS has_stop,
    CAST(CASE WHEN (dna_sequence LIKE '%ATAT%') THEN 1 ELSE 0 END AS SMALLINT) AS has_atat,
    CAST(CASE WHEN (dna_sequence LIKE '%GGG%') THEN 1 ELSE 0 END AS SMALLINT) AS has_ggg
FROM Samples;

