library(shiny)
library(shiny.router)

# This generates menu in user interface with links.
menu <- (
  tags$ul(
    tags$li(a(class = "item", href = route_link("/"), "Page")),
    tags$li(a(class = "item", href = route_link("other"), "Other page")),
    tags$li(a(class = "item", href = route_link("third"), "A third page"))
  )
)

# This creates UI for each page.
page <- function(title, content, table_id) {
  div(
    menu,
    titlePanel(title),
    p(content),
    dataTableOutput(table_id)
  )
}

# Both sample pages.
root_page <- page("Home page", "Welcome on sample routing page!", "table_one")
other_page <- page("Some other page", "Lorem ipsum dolor sit amet.", "table_two")
third_page <- div(menu, titlePanel("Third Page"))

# Callbacks on the server side for
# the sample pages
root_callback <- function(input, output, session) {
  output$table_one <- renderDataTable({
    data.frame(x = c(1, 2), y = c(3, 4))
  })
}

other_callback <- function(input, output, session) {
  output$table_two <- renderDataTable({
    data.frame(x = c(5, 6), y = c(7, 8))
  })
}

# Creates router. We provide routing path, a UI as
# well as a server-side callback for each page.
router <- make_router(
  route("/", root_page, root_callback),
  route("other", other_page, other_callback),
  route("third", third_page, NA)
)

# Creat output for our router in main UI of Shiny app.
ui <- shinyUI(fluidPage(
  router_ui()
))

# Plug router into Shiny server.
server <- shinyServer(function(input, output, session) {
  router(input, output, session)
})

# Run server in a standard way.
shinyApp(ui, server)
