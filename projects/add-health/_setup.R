# =============================================================================
# _setup.R — Shared formatting for all Dissertation Study 1 figures
# Sourced at the top of every .qmd for Risk Profiles file.
# Edit here to update colors, sizes, or themes across ALL figures at once.
# To override a setting in a single file, just reassign the variable after
# source("_setup.R") in that file's setup chunk.
# =============================================================================

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(patchwork)
library(knitr)
library(ragg)

# --- Data path ---------------------------------------------------------------
###originally set to project root, adjusted to direct path for portfolio generation purposes
data_path <- "C:/Users/rcm5550/OneDrive - The Pennsylvania State University/Rachel M & Rina/Dissertation/Analysis/Study 1/Study1_R/data/Tables.xlsx"

# --- Output folders (relative to this .qmd file's own directory) --------------
# All add-health figures are saved into the repo-level figures/ folder so
# they're committed to GitHub alongside the site, organized by project.
# Figure output paths, grouped by which consolidated file writes to them

# Profiles.qmd
fig_indicator    <- "../../figures/add-health/indicator-profiles"
fig_predictor    <- "../../figures/add-health/predictor-profiles"
fig_asp_profiles <- "../../figures/add-health/asp-scales/profiles"

# Odds-Ratios.qmd
fig_or_c1        <- "../../figures/add-health/odds-ratios/c1-reference"
fig_or_c3        <- "../../figures/add-health/odds-ratios/c3-reference"
fig_asp_or_c1    <- "../../figures/add-health/asp-scales/c1-reference"
fig_asp_or_c3    <- "../../figures/add-health/asp-scales/c3-reference"

# Interaction-and-Comparisons.qmd
fig_interactions <- "../../figures/add-health/interactions"

# --- Cluster fill colors --------------------------------------------
cluster_colors <- c(
  "C1" = "#44AA99",
  "C2" = "#88CCEE",   
  "C3" = "#882255",
  "C4" = "#DDCC77"   
)


# --- Age group colors (RdYlBu; blue = youngest, red = oldest) ----------------
age_colors <- c(
  "13 years old"    = "#332288",
  "14-15 years old" = "#88CCEE",
  "16 years old"    = "#117733",
  "17 years old"    = "#CC6677",
  "18-19 years old" = "#882255"
)

# --- Bar appearance -----------------------------------------------------------
bar_width       <- 0.75
bar_alpha       <- 1.0
bar_outline_lwd <- 0.4
dodge_width     <- 0.85

# --- Reference lines ---------------------------------------------------------
ref_line_color <- "gray47"
ref_line_lwd   <- 1
ref_line_type  <- "dashed"

# --- OR-specific settings ----------------------------------------------------
y_lab          <- "Odds Ratio"
or_label_size  <- 12
or_label_color <- "black"
or_label_vjust <- 2.0
ast_text_size  <- 30
ast_nudge_pct  <- 0.05

# --- Text sizes --------------------------------------------------------------
title_size       <- 24
axis_title_size  <- 20
axis_text_size   <- 18
legend_text_size <- 16
strip_text_size  <- 12
plot_font <- "sans"


# --- ggsave defaults ---------------------------------------------------------
fig_dpi    <- 600

# --- Shared ggplot2 theme (predictor & indicator profiles) -------------------
base_theme <- theme_classic() +
  theme(
    plot.title       = element_text(size = title_size, face = "bold", hjust = .5, family = plot_font),
    axis.title.y     = element_text(size = axis_title_size, family = plot_font),
    axis.title.x     = element_blank(),
    #axis.text        = element_text(size = axis_text_size, color = "black", family = plot_font),
    axis.text.x     = element_text(size = axis_text_size, face = "bold", family = plot_font, color = "black"),
    axis.text.y     = element_text(size = axis_text_size, family = plot_font),
    axis.ticks.x     = element_blank(),
    legend.title     = element_blank(),
    legend.text      = element_text(size = legend_text_size, family = plot_font),
   # legend.position  = "bottom",
    legend.position = "none",
    strip.text       = element_text(size = strip_text_size, face = "bold", family = plot_font),
    strip.background = element_rect(fill = "#BBBBBB", color = NA),
    plot.caption     = element_text(size = 16, hjust = 0, face = "italic", family = plot_font,
                                    margin = margin(t = 8)),
    plot.margin      = margin(12, 14, 12, 12)
  )

# --- OR-specific theme -------------------------------------------------------
or_theme <- theme_classic() +
  theme(
    plot.title      = element_text(size = title_size, face = "bold", hjust = 0.5, family = plot_font),
    axis.title.y    = element_text(size = axis_title_size, family = plot_font),
    axis.title.x    = element_text(size = axis_title_size, family = plot_font, margin = margin(t = 6)),
    axis.text.x     = element_text(size = axis_text_size, face = "bold", family = plot_font, 
                                   color = cluster_colors[c("C1","C2","C3","C4")]),
    axis.text.y     = element_text(size = axis_text_size, family = plot_font),
    axis.ticks.x    = element_blank(),
    legend.position = "bottom",
    plot.caption    = element_text(size = 16, hjust = .5, face = "plain", family = plot_font,
                                   margin = margin(t = 8)),
    plot.margin     = margin(12, 14, 12, 12)
  )
