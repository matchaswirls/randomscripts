import requests
from bs4 import BeautifulSoup
import tkinter as tk
from tkinter import messagebox

def scrape_character_data(character_name):
    # Prepare the search URL with the character's name
    url = f'https://myanimelist.net/character.php?q={character_name.replace(" ", "+")}'
    response = requests.get(url)

    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find the first character in the search result
        character_link = soup.find('a', class_='hoverinfo_trigger fw-b')['href']
        character_url = f'https://myanimelist.net{character_link}'

        # Fetch the character's page
        character_response = requests.get(character_url)
        if character_response.status_code == 200:
            character_soup = BeautifulSoup(character_response.content, 'html.parser')
            # Extract stats or other information about the character
            # For demonstration purposes, let's just display the character's name
            character_name = character_soup.find('span', itemprop='name').text.strip()
            return f"Character: {character_name}"
        else:
            return "Failed to fetch character data"
    else:
        return "Character not found"

def show_stats():
    character_name = character_entry.get()

    if character_name:
        character_info = scrape_character_data(character_name)
        messagebox.showinfo("Character Stats", character_info)
    else:
        messagebox.showerror("Error", "Please enter a character name")

# Create the main window
root = tk.Tk()
root.title('MyAnimeList Character Stats')

# Create a label and entry for character input
character_label = tk.Label(root, text="Enter Character Name:")
character_label.pack()

character_entry = tk.Entry(root)
character_entry.pack()

# Create a button to trigger character stats display
stats_button = tk.Button(root, text='Show Stats', command=show_stats)
stats_button.pack(pady=10)

# Start the GUI
root.mainloop()
