#!/bin/bash

# ===== USER SETTINGS =====
STEP=10

CAM0_SRC="/home/hapq/Documents/SLAM_Testings/zedx_mini/09/mav0/cam0/data"
CAM1_SRC="/home/hapq/Documents/SLAM_Testings/zedx_mini/09/mav0/cam1/data"

CAM0_DST="/home/hapq/Documents/VisLoc_Datasets/zedx_mini/09/cam0"
CAM1_DST="/home/hapq/Documents/VisLoc_Datasets/zedx_mini/09/cam1"
# =========================

process_folder () {
    SRC="$1"
    DST="$2"

    echo "Processing: $SRC"
    mkdir -p "$DST"

    COUNT=0

    # Use find + sort (safer than ls)
    find "$SRC" -maxdepth 1 -type f | sort | while read FILE; do
        if (( COUNT % STEP == 0 )); then
            cp "$FILE" "$DST/"
        fi
        ((COUNT++))
    done

    echo "Finished: $SRC"
}

process_folder "$CAM0_SRC" "$CAM0_DST"
process_folder "$CAM1_SRC" "$CAM1_DST"

echo "All done."
