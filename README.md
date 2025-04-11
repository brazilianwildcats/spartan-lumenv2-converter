# spartan-lumenv2-converter
Convert Spartan Lumen MOV (PCM audio) files to MP4 with AAC audio

# Spartan Lumen (New Edition) model: SR5-CX Video Converter

A simple script to process `.MOV` files recorded by Spartan Lumen (New Edition) trail cameras.  
This tool fixes compatibility and playback issues by trimming, boosting audio, and converting formats — all while preserving video quality and metadata.

## 🎯 Features

- 🎬 Cuts the **first 0.5 seconds** (~12 frames) with frame-accurate trimming
- 🔊 Increases audio volume by **+10 dB**
- 🎧 Converts audio to **AAC** (256 kbps, mono, 32 kHz)
- 🎥 **Preserves the original video** (no re-encoding)
- 🕒 Keeps **original timestamps and metadata** using PowerShell
- 📁 Leaves the original `.mov` file **untouched**
- 📝 Generates a log file with conversion times and any errors

## 📦 Requirements

### ✅ 1. [FFmpeg](https://ffmpeg.org/download.html)
- Download the static version from: https://ffmpeg.org/download.html  
- Extract the ZIP archive to a location like `C:\FFmpeg`.

#### ➕ How to Add FFmpeg to the PATH on Windows:

1. Open the **Start Menu** and search for `Environment Variables`.
2. Click on **“Edit the system environment variables”**.
3. In the new window, click **“Environment Variables...”**.
4. Under **“System variables”**, select the `Path` variable and click **Edit...**.
5. Click **New** and paste the path to the `bin` folder of FFmpeg.  
   Example: C:\FFmpeg\bin
6. Click **OK** in all windows to save changes.
7. To test it: open **Command Prompt** and type:
   ffmpeg -version

---

🚀 How to Use
1. Install FFmpeg and make sure it's available in your system PATH.
   See the requirements section for instructions.
2. Download or clone this repository and place the script file (e.g., convert_lumenv2.bat) in the same folder as your .MOV files from the Spartan Lumen camera.
3. Double-click the script (convert_lumenv2.bat) or run it from a Command Prompt:
convert_lumen.bat

4. The script will:
    Process every .MOV file in the folder
    Create a new .MP4 file for each video
    Keep the original .MOV file untouched
    Preserve the original recording timestamp
    Log the duration of each conversion in conversion_times.log

5. Once the script finishes:
    Check the output .MP4 files in the same folder.
    Open conversion_times.log to review processing times or any error messages

## 📄 License

MIT License — free to use, modify, and share.

---

## 🙌 Contributions

Contributions, bug reports, and feature suggestions are welcome!  
Feel free to fork this project or open a pull request.

---
