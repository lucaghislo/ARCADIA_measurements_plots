import matplotlib.pyplot as plt
import os.path
from main import drive_output_main, github_output_main


def save_figure(plot_name):
    plt.savefig(os.path.join(drive_output_main, plot_name))
    plt.savefig(os.path.join(github_output_main, plot_name))
