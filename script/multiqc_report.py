import pandas as pd
import sys

OUTPUT_DIR = sys.argv[1]
REPORT_PATH = sys.argv[2]

OUTPUT_PATH = OUTPUT_DIR + "/caution_report_multiqc.tsv"

df = pd.read_csv(REPORT_PATH,sep="\t")
df_output = df[df["basic_statistics"] != "pass"]

if not df_output.empty:
    df_output.to_csv(OUTPUT_PATH,sep="\t",index=None)