from pytube import YouTube

# Define function to download video from YouTube with the highest resolution using the pytube library.
def Down(giv_link):
    youtubeObject = YouTube(giv_link)
    youtubeObject = youtubeObject.streams.get_highest_resolution()
    try:
        youtubeObject.download()
    except:
        print("An error has occurred")
    print("Download is completed successfully")
    
giv_link = input("Paste the link of the YouTube video you want to download: ")
# Calls the download funtion and downloads input URL to home directory, in the folder.
Down(giv_link)

