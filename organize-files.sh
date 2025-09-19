#!/bin/bash

declare -A file_categories=(
    ["photos"]="jpg jpeg png gif bmp svg webp tiff ico"
    ["docs"]="pdf doc docx txt rtf odt xls xlsx ppt pptx"
    ["videos"]="mp4 avi mkv mov wmv flv webm m4v"
    ["music"]="mp3 wav flac aac ogg wma m4a"
    ["archives"]="zip rar 7z tar gz bz2 xz"
    ["code"]="js html css py java cpp c php rb go rs ts json xml yml yaml"
)

create_directories() {
    for category in "${!file_categories[@]}"; do
        if [ ! -d "$category" ]; then
            mkdir -p "$category"
        fi
    done
}

get_file_category() {
    local filename="$1"
    local extension="${filename##*.}"
    extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
    
    for category in "${!file_categories[@]}"; do
        local extensions="${file_categories[$category]}"
        if [[ " $extensions " == *" $extension "* ]]; then
            echo "$category"
            return
        fi
    done
    
    echo ""
}

organize_files() {
    create_directories
    
    local moved_count=0
    
    for file in *; do
        if [ -f "$file" ] && [ "$file" != "organize-files.sh" ]; then
            local category=$(get_file_category "$file")
            
            if [ -n "$category" ]; then
                if mv "$file" "$category/"; then
                    echo "Moved $file to $category/"
                    ((moved_count++))
                else
                    echo "Error moving $file"
                fi
            fi
        fi
    done
    
    echo
    echo "Organization complete! Moved $moved_count files."
}

organize_files