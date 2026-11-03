library(shiny)

ui <- fluidPage(
  tags$style(HTML("
    body { color: #17324a; }
    .container-fluid { max-width: 1050px; margin: auto; }
    .well { background: #edf5f7; }
    .finding { border-left: 4px solid #0072B2; padding: 10px 14px; }
  ")),
  
  titlePanel("When did Capital Bikeshare rentals peak?"),
  p("For bike-share operations planners exploring hourly rentals in 2011–2012."),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "day_type", "Choose a day type",
        choices = c("Working day", "Non-working day")
      ),
      helpText("Non-working days include weekends and holidays."),
      
      checkboxGroupInput(
        "riders", "Rider groups to display",
        choices = c("Casual" = "casual", "Registered" = "registered"),
        selected = c("casual", "registered")
      ),
      helpText("Show both groups to compare peaks, or select one to follow its pattern.")
    ),
    
    mainPanel(
      h3("Average rentals by hour"),
      p("Each point on a line is the average rental count for that clock hour
        across recorded days of the selected type."),
      plotOutput("hourly_plot"),
      div(class = "finding", textOutput("peak_text"))
    )
  )
)

server <- function(input, output, session) {
  hourly <- reactive({
    bikehours::summarise_hourly(bikehours::bike_hourly, input$day_type)
  })
  
  selected_groups <- reactive({
    validate(need(length(input$riders) > 0,
                  "Select at least one rider group to see its hourly pattern."))
    input$riders
  })
  
  colours <- c(casual = "#0072B2", registered = "#D55E00")
  styles <- c(casual = 1, registered = 2)
  labels <- c(casual = "Casual", registered = "Registered")
  
  output$hourly_plot <- renderPlot({
    groups <- selected_groups()
    values <- hourly()
    
    matplot(
      values$hour, values[groups], type = "l", lwd = 3,
      col = colours[groups], lty = styles[groups],
      xlab = "Hour of day (24-hour clock)",
      ylab = "Average rentals per recorded hour",
      ylim = c(0, max(values[groups])), xaxt = "n"
    )
    axis(1, at = c(0, 4, 8, 12, 16, 20, 23))
    legend("topleft", legend = labels[groups], col = colours[groups],
           lty = styles[groups], lwd = 3, bty = "n")
  })
  
  output$peak_text <- renderText({
    req(length(input$riders) > 0)
    values <- hourly()
    peaks <- vapply(input$riders, function(group) {
      peak_hour <- values$hour[which.max(values[[group]])]
      sprintf("%s rentals peaked at %02d:00", labels[[group]], peak_hour)
    }, character(1))
    
    paste0(input$day_type, " averages: ", paste(peaks, collapse = ". "), ".")
  })
}

shinyApp(ui, server)