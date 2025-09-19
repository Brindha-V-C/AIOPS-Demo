# File Organization Script

A shell script that automatically organizes files in a directory by sorting them into categorized folders based on their file extensions.

## Features

- Automatically creates organized folders (photos, docs, videos, music, archives, code)
- Sorts files by extension into appropriate categories
- Preserves the original script file during organization
- Provides feedback on moved files and total count
- Handles case-insensitive file extensions

## Usage

1. Make the script executable:
   ```bash
   chmod +x organize-files.sh
   ```

2. Run the script in the directory you want to organize:
   ```bash
   ./organize-files.sh
   ```

## File Categories

- **Photos**: jpg, jpeg, png, gif, bmp, svg, webp, tiff, ico
- **Documents**: pdf, doc, docx, txt, rtf, odt, xls, xlsx, ppt, pptx
- **Videos**: mp4, avi, mkv, mov, wmv, flv, webm, m4v
- **Music**: mp3, wav, flac, aac, ogg, wma, m4a
- **Archives**: zip, rar, 7z, tar, gz, bz2, xz
- **Code**: js, html, css, py, java, cpp, c, php, rb, go, rs, ts, json, xml, yml, yaml