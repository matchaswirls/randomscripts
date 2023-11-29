import requests
from bs4 import BeautifulSoup
import tkinter as tk
from tkinter import ttk

def scrape_anime():
    url = 'https://myanimelist.net/topanime.php'
    response = requests.get(url)

    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        anime_titles = soup.find_all('h3', class_='fl-l fs14 fw-b anime_ranking_h3')

        for idx, title in enumerate(anime_titles, start=1):
            tab_title = f"{idx}"
            anime_name = title.text.strip()

            # Create a new tab
            tab = ttk.Frame(notebook)
            notebook.add(tab, text=tab_title)

            # Display anime name in a bigger font
            anime_label = ttk.Label(tab, text=anime_name, font=('Arial', 14))
            anime_label.pack(padx=10, pady=10)
    else:
        result_text.insert(tk.END, 'Failed to fetch data')

# Create the main window
root = tk.Tk()
root.title('Anime Scraper')

# Create a Notebook (tabs)
notebook = ttk.Notebook(root)
notebook.pack(fill='both', expand=True)

# Create a button to trigger scraping
scrape_button = ttk.Button(root, text='Scrape Anime', command=scrape_anime)
scrape_button.pack(pady=10)

# Start the GUI
root.mainloop()