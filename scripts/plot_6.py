import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from distinctipy import distinctipy


from plot_config import *
from save_figure import *


# PLOT 6
# Si considerino solo le misure a 1.2V.
# Plot delle 16 misure Vout vs T con R0 e R2 a 0111 e 0111. Stesso plot ma trimmato da R0 (in temperatura).
# Come si ottiene? Per ogni bandgap, si hanno 16 Temperature Coefficient, uno per ogni valore di R0. Si sceglie quello minore.

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

output_folder_drive = os.path.join(drive_output_main, "plot_6")
output_folder_github = os.path.join(github_output_main, "plot_6")

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

R0 = 7
R2 = 7
Vin = Vins[1]

plt.clf()
TP_index = 0
for TP in TPs:
    Volt_values_TP = np.zeros(shape=(len(temperatures_str), 1))
    temp_index = 0
    for temp in temperatures_str:
        data_plot6 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        data_plot6_Vin = data_plot6[data_plot6["Vin"] == Vin]
        data_plot6_Vin_TP = data_plot6_Vin[data_plot6_Vin["TP"] == TP]
        data_plot6_Vin_TP_R0 = data_plot6_Vin_TP[data_plot6_Vin_TP["SLOPE"] == R0]
        data_plot6_Vin_TP_R0_R2 = data_plot6_Vin_TP_R0[
            data_plot6_Vin_TP_R0["MEAN"] == R2
        ]
        Volt = data_plot6_Vin_TP_R0_R2["Volt"].mean()

        Volt_values_TP[temp_index] = Volt
        temp_index = temp_index + 1

    plt.plot(
        temperatures_int,
        Volt_values_TP,
        linewidth=1,
        marker=markers[TP_index],
        markerfacecolor=colors[TP_index],
        color=colors[TP_index],
        label=str(TP_index + 1),
    )

    TP_index = TP_index + 1

plt.xlabel(r"Temperature [$^{\circ}$C]")
plt.ylabel(r"$V_{OUT}$ [V]")
plt.title(r"\boldmath$V_{OUT}$ \textbf{vs} \textbf{Temperature for every bandgap}")
plt.xticks(temperatures_int)
plt.legend(title=r"\textbf{Bandgap}", loc="center left", bbox_to_anchor=(1, 0.5))
plt.grid()

print_plot(output_folder_drive, output_folder_github, "plot_6.pdf")


# Select best TP and optimize R0 maintaining R2 standard
TC_mean_slope_filepath = os.path.join(main_input_path, "TC_all_TPs.csv")
data_TC_raw = pd.read_csv(TC_mean_slope_filepath, header=None)
TC_TP_mean_slope = np.zeros(shape=(len(TPs), 2))

TP_index = 0
for TP in TPs:
    all_R2 = data_TC_raw[TP_index + 2]
    TC_single_TP = data_TC_raw.iloc[all_R2.index[all_R2 == R2].to_list()][
        [TP_index, TP_index + 1, TP_index + 2]
    ]

    min_index = TC_single_TP.index[
        TC_single_TP[TP_index] == min(TC_single_TP[TP_index])
    ].to_list()[0]
    min_mean = TC_single_TP.loc[min_index][TP_index + 1]
    min_slope = TC_single_TP.loc[min_index][TP_index + 2]
    TC_TP_mean_slope[TP - 1][0] = min_mean
    TC_TP_mean_slope[TP - 1][1] = min_slope

    TP_index = TP_index + 3

print(TC_TP_mean_slope)
plt.clf()
TP_index = 0
for TP in TPs:
    Volt_values_TP = np.zeros(shape=(len(temperatures_str), 1))
    temp_index = 0
    for temp in temperatures_str:
        data_plot6 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        data_plot6_Vin = data_plot6[data_plot6["Vin"] == Vin]
        data_plot6_Vin_TP = data_plot6_Vin[data_plot6_Vin["TP"] == TP]
        data_plot6_Vin_TP_R0 = data_plot6_Vin_TP[
            data_plot6_Vin_TP["SLOPE"] == TC_TP_mean_slope[TP_index][0]
        ]
        data_plot6_Vin_TP_R0_R2 = data_plot6_Vin_TP_R0[
            data_plot6_Vin_TP_R0["MEAN"] == TC_TP_mean_slope[TP_index][1]
        ]
        Volt = data_plot6_Vin_TP_R0_R2["Volt"].mean()

        Volt_values_TP[temp_index] = Volt
        temp_index = temp_index + 1

    plt.plot(
        temperatures_int,
        Volt_values_TP,
        linewidth=1,
        marker=markers[TP_index],
        markerfacecolor=colors[TP_index],
        color=colors[TP_index],
        label=str(TP_index + 1),
    )

    TP_index = TP_index + 1

plt.xlabel(r"Temperature [$^{\circ}$C]")
plt.ylabel(r"$V_{OUT}$ [V]")
plt.title(
    r"\boldmath$V_{OUT}$ \textbf{vs} \textbf{Temperature for every bandgap (optimal R0 and R2)}"
)
plt.xticks(temperatures_int)
plt.legend(title=r"\textbf{Bandgap}", loc="center left", bbox_to_anchor=(1, 0.5))
plt.grid()

print_plot(output_folder_drive, output_folder_github, "plot_6_optimized_R0.pdf")

# Save mean and slope estimate
filename = "mean_slope_optimized_R0.dat"
txt_filepath_drive = os.path.join(output_folder_drive, filename)
txt_filepath_github = os.path.join(output_folder_github, filename)

with open(
    txt_filepath_drive,
    "w",
) as fp:
    counter = 1
    fp.write("TP\tR0\tR2\n")
    for item in TC_TP_mean_slope:
        fp.write(
            str(str(counter) + "\t" + str(int(item[0])))
            + "\t"
            + str(int(item[1]))
            + "\n"
        )
        counter = counter + 1

with open(
    txt_filepath_github,
    "w",
) as fp:
    counter = 1
    fp.write("TP\tR0\tR2\n")
    for item in TC_TP_mean_slope:
        fp.write(
            str(str(counter) + "\t" + str(int(item[0])))
            + "\t"
            + str(int(item[1]))
            + "\n"
        )
        counter = counter + 1
