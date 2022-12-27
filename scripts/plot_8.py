import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from distinctipy import distinctipy

from plot_config import *
from save_figure import *


# PLOT 8
# Si considerino solo le misure a 1.2V.
# Vout vs configuration bits (da 0 a 11111111) a temperatura ambiente.

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
TP_temp_slope_mean_vout = os.path.join(main_input_path, "TP_temp_slope_mean_vout")

output_folder_drive = os.path.join(drive_output_main, "plot_8")
output_folder_github = os.path.join(github_output_main, "plot_8")

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
colors = distinctipy.get_colors(len(TPs))
markers = ["o", "s", "v", "^", "<", ">", "p", "*", "d", "D", "h", "H", 5, 6, 7, 8]

Vin = Vins[1]
total_range = range(0, 256)
R_range = range(0, 16)  # 000 - 111
temp_index = 0

# Plot all TPs for given temperature
for temp in temperatures_str:
    plt.clf()
    TP_index = 0
    for TP in TPs:
        data_plot8 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        volt_values = np.zeros(shape=(len(R_range) ** 2, 1))
        volt_index = 0
        for R0 in R_range:
            for R2 in R_range:
                data_plot8_Vin = data_plot8[data_plot8["Vin"] == Vin]
                data_plot8_Vin_TP = data_plot8_Vin[data_plot8_Vin["TP"] == TP]
                data_plot8_Vin_TP_R0 = data_plot8_Vin_TP[
                    data_plot8_Vin_TP["SLOPE"] == R0
                ]
                data_plot8_Vin_TP_R0_R2 = data_plot8_Vin_TP_R0[
                    data_plot8_Vin_TP_R0["MEAN"] == R2
                ]
                Volt = data_plot8_Vin_TP_R0_R2["Volt"].mean()
                volt_values[volt_index] = Volt
                print(
                    "R0:"
                    + str(R0)
                    + ", R2: "
                    + str(R2)
                    + " -> Volt: "
                    + str(Volt)
                    + ", index: "
                    + str(volt_index)
                )
                volt_index = volt_index + 1

        plt.plot(
            total_range,
            volt_values,
            linewidth=1,
            markersize=3,
            label=str(TP_index),
            linestyle="-" if TP_index < len(markers) / 2 else "--",
            marker=markers[TP_index],
        )

        TP_index = TP_index + 1

    plt.xlabel("Configuration bits [(00000000)$_{2}$ - (11111111)$_{2}$]")
    plt.ylabel(r"$V_{OUT}$ [V]")
    plt.title(
        r"\boldmath$V_{OUT}$ \textbf{vs configuration bits at "
        + str(temperatures_int[temp_index])
        + r"} \boldmath$^{\circ}$\textbf{C}"
    )
    plt.grid()
    plt.legend(title=r"\textbf{Bandgap}", loc="center left", bbox_to_anchor=(1, 0.5))

    print_plot(
        output_folder_drive,
        output_folder_github,
        "plot_8_" + str(temperatures_int[temp_index]) + "C.pdf",
    )

    temp_index = temp_index + 1


# Single TP plots given temperature
TP_index = 0
for TP in TPs:
    plt.clf()
    temp_index = 0
    for temp in temperatures_str:
        data_plot8 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        volt_values = np.zeros(shape=(len(R_range) ** 2, 1))
        volt_index = 0
        for R0 in R_range:
            for R2 in R_range:
                data_plot8_Vin = data_plot8[data_plot8["Vin"] == Vin]
                data_plot8_Vin_TP = data_plot8_Vin[data_plot8_Vin["TP"] == TP]
                data_plot8_Vin_TP_R0 = data_plot8_Vin_TP[
                    data_plot8_Vin_TP["SLOPE"] == R0
                ]
                data_plot8_Vin_TP_R0_R2 = data_plot8_Vin_TP_R0[
                    data_plot8_Vin_TP_R0["MEAN"] == R2
                ]
                Volt = data_plot8_Vin_TP_R0_R2["Volt"].mean()
                volt_values[volt_index] = Volt
                print(
                    "R0:"
                    + str(R0)
                    + ", R2: "
                    + str(R2)
                    + " -> Volt: "
                    + str(Volt)
                    + ", index: "
                    + str(volt_index)
                )
                volt_index = volt_index + 1

        plt.plot(
            total_range,
            volt_values,
            linewidth=1,
            markersize=3,
            label=str(temperatures_int[temp_index]) + r" $^{\circ}$C",
            linestyle="-" if temp_index < 6 else "--",
            marker=markers[temp_index],
        )

        temp_index = temp_index + 1

    plt.xlabel("Configuration bits [(00000000)$_{2}$ - (11111111)$_{2}$]")
    plt.ylabel(r"$V_{OUT}$ [V]")
    plt.title(
        r"\boldmath$V_{OUT}$ \textbf{vs configuration bits for TP"
        + str(TPs[TP_index])
        + r"}"
    )
    plt.grid()
    plt.legend(
        title=r"\textbf{Temperature}", loc="center left", bbox_to_anchor=(1, 0.5)
    )

    print_plot(
        output_folder_drive,
        output_folder_github,
        "plot_8_TP" + str(TPs[TP_index]) + ".pdf",
    )

    TP_index = TP_index + 1
