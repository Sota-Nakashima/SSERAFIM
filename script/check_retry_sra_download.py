import sys
import os

OUTPUT_DIR = sys.argv[1]
SRA_LIST_PATH = sys.argv[2]

#make Retry file path
last_slash_index = SRA_LIST_PATH.rfind("/")
path_part = SRA_LIST_PATH[:last_slash_index + 1]  # 最後の"/"も含めるために+1をする
filename_part = SRA_LIST_PATH[last_slash_index + 1:]
RETRY_SRR_LIST_PATH = path_part + "Retry_" + filename_part

SRR_List_correct = []
SRR_List_download = []

# Open the text file, read it line by line, and add the lines to the array
with open(SRA_LIST_PATH, "r") as file:
    for line in file:
        SRR_List_correct.append(line.strip())

# Extract directory names from the directory and its subdirectories and save them in the array
for root, dirs, files in os.walk(OUTPUT_DIR + "/sra"):
    for dir_name in dirs:
        SRR_List_download.append(dir_name)

# Calculate the difference between the two arrays
difference = list(set(SRR_List_correct) - set(SRR_List_download))

# If there is a difference, write it to a text file
if difference:
    with open(RETRY_SRR_LIST_PATH, "w") as file:
        for item in difference:
            file.write(str(item) + "\n")
    sys.exit(1)
else:
    sys.exit(0)
