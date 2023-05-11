#' Horizontal Bar Chart for The Mark USA, Inc.
#'
#' @param df Required, a tibble or data frame that has been pre-processed with dataSumm(),
#' @param color_scale a char vector of the colors for the scale items
#' @param width Input a value between 0.3 and 0.8 to set the thickness of the bars. Default is NULL.
#'
#' @return A ggplot object that plots the items into a stacked bar chart and can be exported.
#' @export
#'
#' @examples
#' data <- dplyr::tibble(
#'   role = c(
#'     "Faculty", "Postdoc", "Undergraduate student", "Graduate student",
#'     "Graduate student", "Postdoc", "Postdoc", "Faculty",
#'     "Faculty", "Graduate student", "Graduate student", "Postdoc",
#'     "Faculty", "Faculty", "Faculty", "Faculty", "Faculty", "Graduate student",
#'     "Undergraduate student", "Undergraduate student"
#'   )
#' )
#'
#' role_summ <- data %>%
#'   dplyr::select(role) %>%
#'   TheMarkUSA::dataSumm()
#'
#' role_color <- c("#2C2C4F", "#4B9FA6", "#79AB53", "#767171")
#'
#' horzBarChart(role_summ, role_color, width = 0.6)
horzBarChart <- function(df, color_scale, width = NULL) {
    extrafont::loadfonts(quiet = TRUE)

    bar_chart <- {{ df }} %>% ggplot2::ggplot(ggplot2::aes(x = forcats::fct_rev(.data$response), y = .data$n_answers, label = .data$percent_answers_label)) +
        ggplot2::geom_col(ggplot2::aes(fill = .data$response), width = width, color = "black") +
        ggplot2::scale_fill_manual(values = color_scale) +
        ggplot2::geom_text(nudge_y = 0.8, fontface = "bold",size = 4) +
        ggplot2::coord_flip() + ggplot2::theme_void(base_family = "Gill Sans MT", base_size = 14)  +
        ggplot2::theme(legend.position = "none",
              axis.text.y = ggplot2::element_text(angle = 0, hjust = 1,color = "black", face = "bold",
                                         margin = ggplot2::margin(t = 5, r = 0, b = 5, l = 5, unit = "pt")),
              axis.text.x = ggplot2::element_text(angle = 0, hjust = 1,color = "black", face = "bold",
                                         margin = ggplot2::margin(t = 5, r = 0, b = 5, l = 5, unit = "pt")),
              plot.margin = ggplot2::margin(t = 5, r = 5, b = 5, l = 5, unit = "pt"))

    return(bar_chart)

}