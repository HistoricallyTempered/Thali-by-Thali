
import os
from PIL import Image

def convert_and_rename():
    # Mapping based on analysis
    files = {
        1: "Harappans - Episode 01.tif",
        2: "Early Indians - Episode 02.png",
        3: "Early South Indians - Episode 04.jpeg", # Assuming this is Ep 3 based on title "Early Southern India"
        4: "Guptas - Episode 04.jpeg"
    }

    base_path = "e:/Antigravity/HTwebsite/assets/"

    for ep_num, filename in files.items():
        old_path = os.path.join(base_path, filename)
        
        # Define new filename
        # maintain extension for non-tiff, convert tiff to png
        if filename.lower().endswith(('.tif', '.tiff')):
            new_filename = f"thumbnail-{ep_num}.png"
            new_path = os.path.join(base_path, new_filename)
            try:
                img = Image.open(old_path)
                img.save(new_path, "PNG")
                print(f"Converted and saved: {new_filename}")
                # Optional: remove old file? Keeping it for safety for now.
            except Exception as e:
                print(f"Error converting {filename}: {e}")
        else:
            ext = os.path.splitext(filename)[1].lower()
            new_filename = f"thumbnail-{ep_num}{ext}"
            new_path = os.path.join(base_path, new_filename)
            try:
                if os.path.exists(old_path):
                    os.rename(old_path, new_path)
                    print(f"Renamed: {filename} -> {new_filename}")
                else:
                    print(f"File not found: {old_path}")
            except Exception as e:
                print(f"Error renaming {filename}: {e}")

if __name__ == "__main__":
    convert_and_rename()
