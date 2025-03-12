import pandas as pd 

def analyze_dna_patterns(samples: pd.DataFrame) -> pd.DataFrame:
    
    samples["has_start"] = samples["dna_sequence"].str.startswith("ATG").astype(int)
    samples["has_stop"] = samples["dna_sequence"].str.endswith(("TGA", "TAA","TAG")).astype(int)
    samples["has_atat"] = samples["dna_sequence"].str.contains("ATAT").astype(int)
    samples["has_ggg"] = samples["dna_sequence"].str.contains("GGG").astype(int)
    
    return samples

data = {
    'sample_id': [1, 2, 3, 4, 5, 6, 7],
    'dna_sequence': [
        'ATGCTAGCTAGCTAA', 
        'GGGTCAATCATC', 
        'ATATATCGTAGCTA', 
        'ATGGGGTCATCATAA', 
        'TCAGTCAGTCAG', 
        'ATATCGCGCTAG', 
        'CGTATGCGTCGTA'
    ],
    'species': ['Human', 'Human', 'Human', 'Mouse', 'Mouse', 'Zebrafish', 'Zebrafish']
}

df = pd.DataFrame(data)
result = analyze_dna_patterns(df)
print(result)