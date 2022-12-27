import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

from plot_config import *
from save_figure import *


# PLOT 4
# Si considerino solo le misure a 1.2V.
# Istogramma delle tensioni Vout dei 16 bandgap ottenute a 20°C con registri di configurazione di R0 e R2 a 0111 e 0111.
# Si può valutare si sovrapporre un fit con una gaussiana... dipende da come viene, comunque nel plot evidenzierei il valor medio e la sigma (ottenute dai dati e non dal fit).


def compute_histogram_bins(data, desired_bin_size):
    min_val = np.min(data)
    max_val = np.max(data)
    min_boundary = -1.0 * (min_val % desired_bin_size - min_val)
    max_boundary = max_val - max_val % desired_bin_size + desired_bin_size
    n_bins = int((max_boundary - min_boundary) / desired_bin_size) + 1
    bins = np.arange(
        min_boundary, min_boundary + n_bins * desired_bin_size, desired_bin_size
    )

    return bins


main_input_path = "data"
github_output_main = "output"
drive_output_main = r"C:\Users\ghisl\Google Drive UniBG\UniBG\CORSI\PhD\misure_arcadia\plots_articolo_arcadia\plots"
TP_temp_slope_mean_vout = os.path.join(main_input_path, "TP_temp_slope_mean_vout")

output_folder_drive = os.path.join(drive_output_main, "plot_4")
output_folder_github = os.path.join(github_output_main, "plot_4")

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
Vin = 1.20
R0 = 7
R2 = 7

temp_index = 0
for temp in temperatures_str:
    Volt_values = np.zeros(shape=(len(TPs), 1))
    TP_index = 0
    for TP in TPs:
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

        Volt_values[TP_index] = Volt
        TP_index = TP_index + 1

    plt.clf()
    bin_width = 0.01
    bins = compute_histogram_bins(Volt_values, bin_width)
    n, bins_out, patches = plt.hist(
        Volt_values,
        bins=bins,
        edgecolor="black",
        linewidth=1,
        align="left",
        color="teal",
        alpha=0.5,
    )
    plt.yticks(range(0, int(max(n)) + 1))
    plt.xlabel(r"$V_{OUT}$ [V]")
    plt.ylabel(r"Occurrences")
    plt.title(
        r"\boldmath$V_{OUT}$ \textbf{values of 16 bandgaps at "
        + str(temperatures_int[temp_index])
        + r"}\boldmath$^{\circ}$\textbf{C}"
    )

    (mu, sigma) = norm.fit(Volt_values)

    matplotlib.pyplot.text(
        min(bins) - bin_width / 2,
        int(max(n)),
        "$\mu$ = "
        + str(round(mu, 5))
        + " V\n $\sigma$ = "
        + str(round(sigma, 5))
        + " V",
        fontsize=13,
        verticalalignment="top",
        bbox=dict(facecolor="white", edgecolor="#cdcdcd", boxstyle="round,pad=0.35"),
    )

    plt.grid()

    print_plot(
        output_folder_drive,
        output_folder_github,
        "plot_4_" + str(temperatures_int[temp_index]) + "C.pdf",
    )

    temp_index = temp_index + 1


def get_standard_Volt(temp):
    Volt_values = np.zeros(shape=(len(TPs), 1))
    TP_index = 0
    for TP in TPs:
        data_plot4 = pd.read_csv(
            os.path.join(
                TP_temp_slope_mean_vout,
                "Results_TP" + str(TP) + "_REG_" + str(temp) + ".csv",
            )
        )

        data_plot4_Vin = data_plot4[data_plot4["Vin"] == Vin]
        data_plot1_Vin_TP = data_plot4_Vin[data_plot4_Vin["TP"] == TP]
        data_plot4_Vin_TP_R0 = data_plot1_Vin_TP[data_plot1_Vin_TP["SLOPE"] == R0]
        data_plot4_Vin_TP_R0_R2 = data_plot4_Vin_TP_R0[
            data_plot4_Vin_TP_R0["MEAN"] == R2
        ]
        Volt = data_plot4_Vin_TP_R0_R2["Volt"].mean()

        Volt_values[TP_index] = Volt
        TP_index = TP_index + 1

    return Volt_values
