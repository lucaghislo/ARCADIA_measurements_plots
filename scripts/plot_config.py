import matplotlib
import matplotlib.pyplot as plt

# TEX INTERPRETER
# Interpreter set to LaTex
plt.rcParams.update({"text.usetex": True, "font.family": "serif"})

# FIGURE
# Font size
matplotlib.rcParams["font.size"] = 12

# BOXPLOT
# Boxplot line width
matplotlib.rcParams["axes.linewidth"] = 0.7

# TICKS
# Tick width
matplotlib.rcParams["xtick.major.width"] = 0.7
matplotlib.rcParams["ytick.major.width"] = 0.7
# Tick direction
matplotlib.rcParams["xtick.direction"] = "inout"
matplotlib.rcParams["ytick.direction"] = "inout"
# Tick label size
matplotlib.rcParams["xtick.labelsize"] = 12
matplotlib.rcParams["ytick.labelsize"] = 12

# LEGEND
# Legend font size
matplotlib.rcParams["legend.fontsize"] = 12

# AXIS
# Label size
matplotlib.rcParams["axes.labelsize"] = 12
