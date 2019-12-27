from tkinter import ttk
import tkinter as tk








root = tk.Tk()
root.title("Hello Aliens")
# raiz.resizable(1,1)
root.iconbitmap("G:/My Drive/Universidad/Semestre_12_2019_II/DSP/DSP/Code_Python/Icons/Icon_01.ico")
# raiz.geometry("650x350")
root.config(bg="dark grey")




miFrame=tk.Frame()
miFrame.pack(side="top", anchor="n")
miFrame.config(width="1200",heigh="300",bg="grey")

Label_Function = tk.Label(miFrame, text = "Función:")
Label_Function.grid(row = 0, column = 0, sticky="e", padx = 10, pady = 10)

Label_Amplitud = tk.Label(miFrame, text = "Amplitud:")
Label_Amplitud.grid(row = 1, column = 0, sticky="e", padx = 10, pady = 10)

Box_Function = ttk.Combobox(miFrame,state="readonly")
Box_Function["values"] = ["Delta de Dirac", "Escalón", "Rampa", "Exponencial", "Sinc", "Chirp"]
Value =Box_Function.get()
Box_Function.grid(row = 0, column = 1, sticky="e", padx = 10, pady = 10)





# Box_Amplitud = tk.Entry(miFrame)
Box_Amplitud = tk.Label(miFrame, text = Value)
Box_Amplitud.grid(row = 1, column = 1, sticky="e", padx = 10, pady = 10)



root.mainloop()


