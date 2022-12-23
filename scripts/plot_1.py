import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from distinctipy import distinctipy
from matplotlib.lines import Line2D

from plot_config import *
from save_figure import *


# PLOT 1
# Per un BGR, Vout vs T (R0 e R2 a 0111 e 0111) per i tre valori di Vdd usati nelle misure (1.08V, 1.2V, 1.32V).

main_input_path = "data"
github_output_main = "output"
drive_output_main = r"C:\Users\ghisl\Google Drive UniBG\UniBG\CORSI\PhD\misure_arcadia\plots_articolo_arcadia\plots"
TP_temp_slope_mean_vout = os.path.join(main_input_path, "TP_temp_slope_mean_vout")

plot1_output_folder_drive = os.path.join(drive_output_main, "plot_1")
plot1_output_folder_github = os.path.join(github_output_main, "plot_1")
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
temperatures_int = [-40, -30, -20, -10, 0, 10, 20, 30, 40, 50, 60, 70]
TPs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
Vins = [1.08, 1.2, 1.32]
R0 = 7
R2 = 7

markers = ["o", "s", "v"]

for TP in TPs:
    print("TP: " + str(TP))
    plt.clf()
    colors = distinctipy.get_colors(3)
    vin_index = 0
    Volt_values = np.zeros(shape=(len(temperatures_int), 1))
    for Vin in Vins:
        temp_index = 0
        print("Vin: " + str(Vin))
        for temp in temperatures_str:
            data_plot1 = pd.read_csv(
                os.path.join(
                    TP_temp_slope_mean_vout,
                    "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
                )
            )

            data_plot1_Vin = data_plot1[data_plot1["Vin"] == Vin]
            data_plot1_Vin_TP = data_plot1_Vin[data_plot1_Vin["TP"] == TP]
            data_plot1_Vin_TP_R0 = data_plot1_Vin_TP[data_plot1_Vin_TP["SLOPE"] == R0]
            data_plot1_Vin_TP_R0_R2 = data_plot1_Vin_TP_R0[
                data_plot1_Vin_TP_R0["MEAN"] == R2
            ]
            Volt = data_plot1_Vin_TP_R0_R2["Volt"].mean()
            print("Temp: " + str(temp) + " -> " + str(Volt))

            Volt_values[temp_index] = Volt
            temp_index = temp_index + 1

        plt.plot(
            temperatures_int,
            Volt_values,
            linewidth=1,
            marker=markers[vin_index],
            markerfacecolor=colors[vin_index],
            color=colors[vin_index],
        )
        plt.xticks(temperatures_int)
        plt.grid()

        vin_index = vin_index + 1

    Vin_0 = Line2D([0], [0], marker=markers[0], color=colors[0], label="1.08 V")
    Vin_1 = Line2D([0], [0], marker=markers[1], color=colors[1], label="1.20 V")
    Vin_2 = Line2D([0], [0], marker=markers[2], color=colors[2], label="1.32 V")

    plt.legend(handles=[Vin_0, Vin_1, Vin_2], title=r"\boldmath$V_{IN}$")
    plt.xlabel(r"Temperature [$^{\circ}$C]")
    plt.ylabel(r"$V_{OUT}$ [V]")
    plt.title(
        r"\boldmath$V_{OUT}$ \textbf{vs} \textbf{Temperature for every} \boldmath$V_{IN}$ \boldmath$(TP_{"
        + str(TP)
        + r"})$"
    )
    print_plot(
        plot1_output_folder_drive,
        plot1_output_folder_github,
        "plot_1_TP" + str(TP) + ".pdf",
    )
