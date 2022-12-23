import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from distinctipy import distinctipy
from matplotlib.lines import Line2D

from plot_config import *
from save_figure import *


# PLOT 2
# Vout vs Vdd (da 0 a 1.32V) dei 16 bandgap (R0 e R2 a 0111 e 0111) a T=20°C.

# PLOT CONFIGURATION
# Label size
matplotlib.rcParams["axes.labelsize"] = 13
# Tick label size
matplotlib.rcParams["xtick.labelsize"] = 13
matplotlib.rcParams["ytick.labelsize"] = 13
# Figure size
matplotlib.rcParams["figure.figsize"] = 6.4 * 1.3, 4.8 * 1.3

main_input_path = "data"
github_output_main = "output"
drive_output_main = r"C:\Users\ghisl\Google Drive UniBG\UniBG\CORSI\PhD\misure_arcadia\plots_articolo_arcadia\plots"
TP_temp_vin_vout = os.path.join(main_input_path, "TP_temp_vin_vout")

output_folder_drive = os.path.join(drive_output_main, "plot_2")
output_folder_github = os.path.join(github_output_main, "plot_2")

TPs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
temperatures_str = [
    "m40",
    "m30",
    "m20",
    "m10",
    "0",
    "10",
    "20",
    "30",
    "40",
    "50",
    "60",
    "70",
]
temperatures_int = [-40, 30, 70]
R0 = 7
R2 = 7

directions = ["UP", "DOWN"]
colors = distinctipy.get_colors(len(TPs))
markers = ["o", "s", "v", "^", "<", ">", "p", "*", "d", "D", "h", "H", 5, 6, 7, 8]

# All TPs in one plot per temperature
for direction in directions:
    temp_counter = 0
    for temp in temperatures_str:
        try:
            plt.clf()
            TP_index = 0
            for TP in TPs:
                if direction == "UP":
                    filename = (
                        "Results_TP" + str(TP) + "_TEMP_" + str(temp) + "_0_UP.csv"
                    )

                elif direction == "DOWN":
                    filename = (
                        "Results_TP" + str(TP) + "_TEMP_" + str(temp) + "_132_DOWN.csv"
                    )

                data_plot2 = pd.read_csv(
                    os.path.join(
                        TP_temp_vin_vout,
                        filename,
                    )
                )

                Vin = data_plot2["Vin_real"]
                Vout = data_plot2["Vout"]
                plt.plot(
                    Vin,
                    Vout,
                    linewidth=0.7,
                    linestyle="-" if TP_index < len(markers) / 2 else "--",
                    marker=markers[TP_index],
                    markersize=3,
                    label=str(TP),
                )
                TP_index = TP_index + 1

            plt.legend(loc="upper left", title=r"\textbf{Bandgap}")
            plt.xlabel(r"$V_{DD}$ [V]")
            plt.ylabel(r"$V_{OUT}$ [V]")
            plt.title(
                r"\boldmath$V_{OUT}$ \textbf{vs} \boldmath$V_{DD}$ \textbf{for all TPs at "
                + str(temp)
                + r"°C ("
                + str(direction)
                + r")}"
            )
            plt.grid()
            plt.xticks(np.arange(0, 1.32, 0.1))
            print_plot(
                output_folder_drive,
                output_folder_github,
                "plot_2_"
                + str(temperatures_int[temp_counter])
                + "C_"
                + str(direction)
                + ".pdf",
            )

            temp_counter = temp_counter + 1

        except Exception:
            pass
