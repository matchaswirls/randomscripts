import tkinter as tk
import tkinter.messagebox as messagebox
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
import turtle


def button_click(button_text):
    if button_text == "1":
        fig, ax = plt.subplots(figsize=(8, 4))
        grid_size = 100
        grid = np.random.randint(2, size=(grid_size, grid_size))
        img = ax.imshow(grid, cmap="binary")
        def update(frame):
            nonlocal grid
            new_grid = np.zeros_like(grid)
            for i in range(grid_size):
                for j in range(grid_size):
                    neighbors = grid[i-1:i+2, j-1:j+2]
                    count = np.sum(neighbors) - grid[i, j]
                    if count == 3 or (count == 2 and grid[i, j] == 1):
                        new_grid[i, j] = 1
            grid = new_grid
            img.set_data(grid)
            return img,
        ani = animation.FuncAnimation(fig, update, interval=50, blit=True)
        plt.show()

    if button_text == "2":
        turtle.bgcolor("black")
        turtle.speed(0)
        def starburst(size, angle, color):
            turtle.color(color)
            for i in range(12):
                turtle.forward(size)
                turtle.backward(size)
                turtle.left(angle)
        for i in range(36):
            starburst(100, 60, "red")
            turtle.right(10)
        turtle.hideturtle()
        turtle.mainloop()

    if button_text == "3":
        messagebox.showinfo("System Message", "Exiting")
        exit()

    else:
        print("exception")



root = tk.Tk()
root.title("GUI Test")
root.geometry("800x400")
headline_label = tk.Label(root, text="Select one", padx=20, pady=20)
headline_label.pack()
button1 = tk.Button(root, text="Conway's Game of Life", height= 3, width=15, padx=20, pady=20, command=lambda: button_click("1"))
button1.pack()

button2 = tk.Button(root, text="Turtle", height= 3, width=15, padx=20, pady=20, command=lambda: button_click("2"))
button2.pack()

button3 = tk.Button(root, text="Exit", height= 3, width=15, padx=20, pady=20, command=lambda: button_click("3"))
button3.pack()

root.mainloop()
