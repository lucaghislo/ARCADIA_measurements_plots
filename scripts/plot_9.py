import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from distinctipy import distinctipy
from operator import add

from plot_config import *
from save_figure import *


# PLOT 9
# Si considerino solo le misure a 1.2V.
# Vout vs T dove ogni punto è il mean dei 16 bandgap e ad esso è associata una banda di errore ampia +- una sigma calcolata sulle 16 misure a quella temperatura.
# Due plot, uno trimmato sia in R0 che in R2 e uno no (a 0111 e 0111).

main_input_path = "data"
github_output_main = "output"
drive_output_main = r"C:\Users\ghisl\Google Drive UniBG\UniBG\CORSI\PhD\misure_arcadia\plots_articolo_arcadia\plots"
TP_temp_slope_mean_vout = os.path.join(main_input_path, "TP_temp_slope_mean_vout")

output_folder_drive = os.path.join(drive_output_main, "plot_9")
output_folder_github = os.path.join(github_output_main, "plot_9")

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

volt_ref = 0.6
R0 = 7
R2 = 7

mean_values = np.zeros(shape=(len(temperatures_str), 1))
sigma_values = np.zeros(shape=(len(temperatures_str), 1))
temp_index = 0
for temp in temperatures_str:
    Volt_values = np.zeros(shape=(len(TPs), 1))
    TP_index = 0
    for TP in TPs:
        data_plot9 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        data_plot9_Vin = data_plot9[data_plot9["Vin"] == Vin]
        data_plot8_Vin_TP = data_plot9_Vin[data_plot9_Vin["TP"] == TP]
        data_plot9_Vin_TP_R0 = data_plot8_Vin_TP[data_plot8_Vin_TP["SLOPE"] == R0]
        data_plot9_Vin_TP_R0_R2 = data_plot9_Vin_TP_R0[
            data_plot9_Vin_TP_R0["MEAN"] == R2
        ]
        Volt = data_plot9_Vin_TP_R0_R2["Volt"].mean()

        Volt_values[TP_index] = Volt
        TP_index = TP_index + 1

    mean = np.mean(Volt_values)
    sigma = np.std(Volt_values)

    mean_values[temp_index] = mean
    sigma_values[temp_index] = sigma

    temp_index = temp_index + 1

mean_values = np.transpose(mean_values)[0]
sigma_values = np.transpose(sigma_values)[0]

plt.clf()
plt.errorbar(
    temperatures_int,
    mean_values,
    yerr=sigma_values,
    marker="o",
    markersize=4,
    capsize=4,
    color="limegreen",
)
plt.xticks(np.arange(-40, 80, 10))
min_y = volt_ref - 0.07
max_y = volt_ref + 0.07
plt.ylim(min_y, max_y)
plt.yticks(np.arange(min_y, max_y + 0.01, 0.01))
plt.xlabel(r"Temperature [$^{\circ}$C]")
plt.ylabel(r"$V_{OUT}$ [V]")
plt.title(r"\textbf{Mean} \boldmath$V_{OUT}$ \textbf{vs temperature}")
plt.grid()

# print_plot(
#     output_folder_drive,
#     output_folder_github,
#     "plot_9.pdf",
# )

optimal_R0_R2 = pd.read_csv(r"output\plot_6\mean_slope_optimized_R0_R2.dat", sep="\t")
print(optimal_R0_R2)

mean_values = np.zeros(shape=(len(temperatures_str), 1))
sigma_values = np.zeros(shape=(len(temperatures_str), 1))
temp_index = 0
for temp in temperatures_str:
    Volt_values = np.zeros(shape=(len(TPs), 1))
    TP_index = 0
    for TP in TPs:
        data_plot9 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        R0 = optimal_R0_R2.iloc[TP - 1]["R0"]
        R2 = optimal_R0_R2.iloc[TP - 1]["R2"]

        data_plot9_Vin = data_plot9[data_plot9["Vin"] == Vin]
        data_plot8_Vin_TP = data_plot9_Vin[data_plot9_Vin["TP"] == TP]
        data_plot9_Vin_TP_R0 = data_plot8_Vin_TP[data_plot8_Vin_TP["SLOPE"] == R2]
        data_plot9_Vin_TP_R0_R2 = data_plot9_Vin_TP_R0[
            data_plot9_Vin_TP_R0["MEAN"] == R0
        ]
        Volt = data_plot9_Vin_TP_R0_R2["Volt"].mean()

        Volt_values[TP_index] = Volt
        TP_index = TP_index + 1

    mean = np.mean(Volt_values)
    sigma = np.std(Volt_values)

    mean_values[temp_index] = mean
    sigma_values[temp_index] = sigma

    temp_index = temp_index + 1

mean_values = np.transpose(mean_values)[0]
sigma_values = np.transpose(sigma_values)[0]

plt.clf()
plt.errorbar(
    temperatures_int,
    mean_values,
    yerr=sigma_values,
    marker="o",
    markersize=4,
    capsize=4,
    color="orangered",
)
plt.xticks(np.arange(-40, 80, 10))
min_y = volt_ref - 0.07
max_y = volt_ref + 0.07
plt.ylim(min_y, max_y)
plt.yticks(np.arange(min_y, max_y + 0.01, 0.01))
plt.xlabel(r"Temperature [$^{\circ}$C]")
plt.ylabel(r"$V_{OUT}$ [V]")
plt.title(
    r"\textbf{Mean} \boldmath$V_{OUT}$ \textbf{vs temperature (optimal R0 and R2)}"
)
plt.grid()

print_plot(
    output_folder_drive,
    output_folder_github,
    "plot_9_optimized_R0_R2.pdf",
)
