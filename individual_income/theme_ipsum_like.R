# 追加パッケージ不要
library(ggplot2)

# OSごとに候補フォント
.font_candidates <- function() {
  sys <- tolower(Sys.info()[["sysname"]])
  if (sys == "windows") return(c("Arial Narrow", "Arial", "Segoe UI", "Verdana"))
  if (sys == "darwin")  return(c("Helvetica Neue", "Helvetica", "Arial"))
  return(c("DejaVu Sans", "Liberation Sans", "Arial", "Helvetica"))
}

# grDevices のフォント関数を「ある時だけ」使う
.list_installed_families <- function() {
  fams <- character(0)
  for (fn in c("windowsFonts", "quartzFonts", "X11Fonts")) {
    f <- try(get(fn, envir = asNamespace("grDevices")), silent = TRUE)
    if (!inherits(f, "try-error")) fams <- unique(c(fams, names(f())))
  }
  tolower(fams)
}

# 候補の中から使えるもの／なければ "sans"
ipsum_base_family <- function() {
  cand <- .font_candidates()
  inst <- .list_installed_families()
  for (f in cand) if (tolower(f) %in% inst) return(f)
  "sans"
}

theme_ipsum <- function(
    base_family       = ipsum_base_family(),
    base_size         = 11,                 # ← hrbrthemes と同じ
    plot_title_family = base_family,
    plot_title_size   = base_size * 1.25,   # ← 約 1.25 倍（≈14pt）
    plot_title_face   = "bold",
    plot_title_margin = 10,                 # ← 既定 margin
    subtitle_family   = base_family,
    subtitle_size     = base_size,          # ← = 11
    subtitle_face     = "plain",
    subtitle_margin   = 15,
    strip_text_family = base_family,
    strip_text_size   = base_size,          # ← = 11
    strip_text_face   = "plain",
    caption_family    = base_family,
    caption_size      = base_size * 0.8,    # ← ≈ 8.8
    caption_face      = "italic",
    caption_margin    = 10,
    axis_text_size    = base_size,          # ← = 11（小さくしない）
    axis_title_family = subtitle_family,
    axis_title_size   = base_size,          # ← = 11（小さくしない）
    axis_title_face   = "plain",
    axis_title_just   = "rt",               # ← hrbrthemes と同じ位置指定
    plot_margin       = margin(30, 30, 30, 30),  # ← 余白
    grid_col          = "#cccccc",
    grid              = TRUE,               
    axis_col          = "#cccccc",
    axis              = FALSE,
    ticks             = FALSE
) {
  # "rt" → hjust 変換
  xj <- switch(tolower(substr(axis_title_just, 1, 1)),
               b=0, l=0, m=0.5, c=0.5, r=1, t=1, 1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)),
               b=0, l=0, m=0.5, c=0.5, r=1, t=1, 1)
  
  ret <- theme_minimal(base_family = base_family, base_size = base_size) +
    theme(
      plot.title    = element_text(family = plot_title_family, face = plot_title_face,
                                   size = plot_title_size, hjust = 0,
                                   margin = margin(b = plot_title_margin)),
      plot.subtitle = element_text(family = subtitle_family, face = subtitle_face,
                                   size = subtitle_size, hjust = 0,
                                   margin = margin(b = subtitle_margin)),
      plot.caption  = element_text(family = caption_family, face = caption_face,
                                   size = caption_size, hjust = 1,
                                   margin = margin(t = caption_margin)),
      strip.text    = element_text(family = strip_text_family, face = strip_text_face,
                                   size = strip_text_size, hjust = 0),
      
      axis.text.x   = element_text(size = axis_text_size),
      axis.text.y   = element_text(size = axis_text_size),
      axis.title    = element_text(size = axis_title_size,
                                   family = axis_title_family,
                                   face = axis_title_face),   # ← 太字なし
      axis.title.x  = element_text(hjust = xj),
      axis.title.y  = element_text(hjust = yj),
      
      panel.grid.major = element_line(color = grid_col, linewidth = 0.2),
      panel.grid.minor = element_line(color = grid_col, linewidth = 0.15),
      
      plot.margin = plot_margin,
      
      axis.ticks = if (isTRUE(ticks)) element_line(linewidth = 0.15) else element_blank(),
      axis.line.x = if (identical(axis, TRUE) || grepl("x", tolower(axis)))
        element_line(color = axis_col, linewidth = 0.15) else element_blank(),
      axis.line.y = if (identical(axis, TRUE) || grepl("y", tolower(axis)))
        element_line(color = axis_col, linewidth = 0.15) else element_blank()
    )
  
  # grid の on/off（"XxYy" 指定に対応）
  if (identical(grid, FALSE)) {
    ret <- ret + theme(panel.grid = element_blank())
  } else if (is.character(grid)) {
    if (!grepl("X", grid)) ret <- ret + theme(panel.grid.major.x = element_blank())
    if (!grepl("Y", grid)) ret <- ret + theme(panel.grid.major.y = element_blank())
    if (!grepl("x", grid)) ret <- ret + theme(panel.grid.minor.x = element_blank())
    if (!grepl("y", grid)) ret <- ret + theme(panel.grid.minor.y = element_blank())
  }
  
  ret
}
