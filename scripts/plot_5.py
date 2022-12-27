import os.path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm
from matplotlib.artist import Artist

from plot_config import *
from save_figure import *
from plot_4 import *


# PLOT 5
# Si considerino solo le misure a 1.2V.
# Istogramma delle tensioni Vout dei 16 bandgap ottenute a 20°C con registri di configurazione a 0111 per R0 mentre per R2 si va a cercare il valore che rende Vout più vicino a 600mV.
# L'idea è quella di mostrare che agendo su un trimming è possibile compensare la tensione d'uscita del bandgap. Anche qui è interessante vedere mu e sigma.


def compute_histogram_bins(data, desired_bin_size):
    min_val = np.min(data)
    max_val = np.max(data)
    min_boundary = -1.0 * (min_val % desired_bin_size - min_val)
    max_boundary = max_val - max_val % desired_bin_size + desired_bin_size
    n_bins = int((max_boundary - min_boundary) / desired_bin_size) + 1
    bins = np.arange(
        min_boundary, min_boundary + (n_bins) * desired_bin_size, desired_bin_size
    )

    return bins


main_input_path = "data"
github_output_main = "output"
drive_output_main = r"C:\Users\ghisl\Google Drive UniBG\UniBG\CORSI\PhD\misure_arcadia\plots_articolo_arcadia\plots"
TP_temp_slope_mean_vout = os.path.join(main_input_path, "TP_temp_slope_mean_vout")

output_folder_drive = os.path.join(drive_output_main, "plot_5")
output_folder_github = os.path.join(github_output_main, "plot_5")

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
voltage_ref = 0.6

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

        data_plot5_Vin = data_plot6[data_plot6["Vin"] == Vin]
        data_plot5_Vin_TP = data_plot5_Vin[data_plot5_Vin["TP"] == TP]

        # Select standard SLOPE (R0 = 0111 = 7)
        data_plot5_Vin_TP_R0 = data_plot5_Vin_TP[data_plot5_Vin_TP["SLOPE"] == R0]

        print(data_plot5_Vin_TP_R0)

        min_Volt_delta = abs(voltage_ref - data_plot5_Vin_TP_R0.iloc[0]["Volt"])
        selected_Volt = data_plot5_Vin_TP_R0.iloc[0]["Volt"]
        min_index = 0

        for index, row in data_plot5_Vin_TP_R0.iterrows():
            delta = abs(voltage_ref - row["Volt"])
            if delta < min_Volt_delta:
                min_Volt_delta = delta
                min_index = index
                selected_Volt = row["Volt"]

        print(min_index)
        print(min_Volt_delta)
        print(selected_Volt)

        Volt_values[TP_index] = selected_Volt
        TP_index = TP_index + 1

    plt.clf()
    bin_width = 0.01
    bins = compute_histogram_bins(Volt_values, bin_width)
    n_sel, bins_out, patches = plt.hist(
        Volt_values,
        bins=bins,
        edgecolor="black",
        linewidth=1,
        align="left",
        color="teal",
        alpha=0.5,
        label="Optimized R2",
    )

    plt.yticks(range(0, int(max(n_sel)) + 1))
    plt.xlabel(r"$V_{OUT}$ [V]")
    plt.ylabel(r"Occurrences")
    plt.title(
        r"\boldmath$V_{OUT}$ \textbf{values of 16 bandgaps at "
        + str(temperatures_int[temp_index])
        + r"}\boldmath$^{\circ}$\textbf{C (optimal R2)}"
    )

    (mu, sigma) = norm.fit(Volt_values)

    print("")
    print(Volt_values)
    print(mu)
    print(sigma)

    frame = matplotlib.pyplot.text(
        min(bins) - bin_width / 2,
        int(max(n_sel)),
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
        "plot_5_" + str(temperatures_int[temp_index]) + "C.pdf",
    )

    plt.title(
        r"\boldmath$V_{OUT}$ \textbf{values of 16 bandgaps at "
        + str(temperatures_int[temp_index])
        + r"}\boldmath$^{\circ}$\textbf{C}"
    )
    Artist.set_visible(frame, False)
    standard_Volt = get_standard_Volt(temp)
    bins = compute_histogram_bins(standard_Volt, bin_width)
    n, bins_out, patches = plt.hist(
        standard_Volt,
        bins=bins,
        edgecolor="black",
        linewidth=1,
        align="left",
        color="orange",
        alpha=0.5,
        label="Standard R2",
    )
    plt.legend()

    print_plot(
        output_folder_drive,
        output_folder_github,
        "plot_5_" + str(temperatures_int[temp_index]) + "C_comparison.pdf",
    )

    temp_index = temp_index + 1
