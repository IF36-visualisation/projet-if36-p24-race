# Installer les bibliothèques nécessaires (à exécuter une seule fois)
# install.packages("rworldmap")

library(dplyr)
library(ggplot2)
library(readr)
library(plotly)
library(tidyr)
library(ggrepel)
library(gridExtra)
library(grid)
library(readxl)
library(GGally)
library(RColorBrewer)
library(tidyverse)
library(rworldmap)
library(shiny)
library(shinydashboard)



# Define UI for application that draws a world map
ui <- dashboardPage(
  
  skin = 'purple',
  dashboardHeader(title = 'Jeux olympiques'),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Carte", tabName = "carte", icon = icon("map")),
      menuItem("Statistiques", tabName = "Statistiques", icon = icon("users")),
      menuItem("Évolution", tabName = "evolution", icon = icon("line-chart")),
      checkboxGroupInput(
        "check_medaille","Medaille",choices = c("or","argent","bronze"),
        selected = c("or", "argent", "bronze")
      ),
      selectInput("pays","Pays",choices = c("Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo (Brazzaville)", "Congo (Kinshasa)", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "North Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "Norway", "Oman", "Pakistan", "Palau", "Palestinian Territories", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "UK", "USA", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe")
,selected = 'France')
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "carte",
              fluidRow(
                box(title = "Carte", background = 'purple', solidHeader = TRUE,width = 7,
                    plotlyOutput("carte_pays",height = "400px")
                )
              ),
              fluidRow(
                box(title = "Top 30", background = 'purple', solidHeader = TRUE,
                    plotOutput('question1')
                )
              )
      ),
      tabItem(tabName = "Statistiques",
              fluidRow(
                valueBoxOutput('Pays'),
                valueBoxOutput('nbre_medaille'),
                
              ),
              fluidRow(
                valueBoxOutput('medaille_or'),
                valueBoxOutput('medaille_argent'),
                valueBoxOutput('medaille_bronze'),
              ),
              fluidRow(
                box(title = "evolution ratio athlètes/ médailles", background = 'purple', solidHeader = TRUE,
                    plotlyOutput('ev')
                )
              )
      ),
      tabItem(tabName = "evolution",
              fluidRow(
                box(title = "evolution de la participation des femmes", background = 'purple', solidHeader = TRUE,
                plotlyOutput("evolution")
                )
              )
      )
    )
  )
  

)


# Define server logic
server <- function(input, output) {
  
  # import des différents datasets
  
  # import du dataset des résultats des JO
  data_jo <- read_csv('athlete_events.csv')
  
  # import dataset des régions
  data_noc_regions <- read_csv('noc_regions.csv')
  
  # import dataset des PIB
  data_PIB <- read_delim('GDP_per_capita.csv', delim = ';')
  
  # import dataset des régions
  data_iso_regions <- read_csv('iso_regions.csv')
  
  #fonction permet de définir un dataset du nombre de médailles par pays
  number_of_medals <- reactive({
    data_jo %>%
      distinct() %>%
      filter(!is.na(Medal)) %>%
      left_join(data_noc_regions, by = "NOC") %>%
      group_by(region) %>%
      summarize(Medals = n()) %>%
      right_join(data_iso_regions, by = "region") %>%
      mutate(Medals = ifelse(is.na(Medals), 0, Medals))
  })
  
  #fonction définissant le dataset de tous les pays possédant une médaille
  data_medals <- reactive({
    data_jo %>%
      distinct() %>%
      filter(!is.na(Medal)) %>%
      left_join(data_noc_regions, by = "NOC")
  })
  
  
  # fonction permettant d'obtenir un visuel de la carte
  output$carte_pays <- renderPlotly({
    
    plot_ly(
      data = number_of_medals(),
      type = 'choropleth',
      locations = ~ ISO,
      z = ~ Medals,
      text = ~ region,
      colorscale = list(
        c(0, 0.01,  0.5, 0.8, 1),
        c('white', 'lightblue', 'blue' , 'darkblue', 'black')
      ),
      autocolorscale = FALSE,
      marker = list(line = list(color = 'rgb(180,180,180)', width = 0.5)),
      colorbar = list(title = "Nombre de médailles")
    ) %>%
      layout(
        title = list(
          text = "Nombre de médailles obtenus par pays",
          y = 0.99,
          font = list(size = 24)
        ),
        margin = list(
          l = 0,
          r = 0,
          b = 0,
          t = 20,
          pad = 0
        ),
        geo = list(
          showframe = FALSE,
          showcoastlines = FALSE,
          projection = list(type = 'Mercator')
        )
      )
  })

  # graphique de l'évolution du ration athlètes nombres de médailles
  output$ev <- renderPlotly({
    data4 <- data_jo %>% 
      distinct() %>% 
      left_join(data_noc_regions, by = 'NOC') %>% 
      filter(region == input$pays) %>%
      filter(!is.na(Medal)) %>%
      group_by(Year, region) %>%
      summarise(Medal = n(),
                nbre_athlete = n_distinct(Name)) %>% 
      mutate(ratio = Medal / nbre_athlete)
    
    p <- ggplot(data = data4, aes(x = Year, y = ratio, color = region)) +
      geom_line() +
      labs(title = "Evolution du ratio nombre d'athlètes envoyés / nombre de médailles pour le pays sélectionné",
           x = "Année",
           y = "Ratio Athlètes/Médailles",
           color = "Région") +
      theme_minimal()
    
    ggplotly(p) %>%
      layout(
        title = "Evolution du ratio nombre d'athlètes envoyés / médailles",
        xaxis = list(title = "Année"),
        yaxis = list(title = "Ratio Athlètes/Médailles"),
        legend = list(title = list(text = "Région"), itemsizing = "constant")
      )
  })
  
  # valuebox du nom des pays
  output$Pays <- renderValueBox({
    valueBox("Nom Pays", value = input$pays, color = 'purple', icon = icon('weight'))
  })
  
  # valuebox du nombre de médailles
  output$nbre_medaille <- renderValueBox({
    valueBox("Nombre de médailles :", value = sum(!is.na(data_medals()$Medal) & data_medals()$region %in% input$pays, na.rm = TRUE), color = 'purple')
  })
  
  observe({
    if ("or" %in% input$check_medaille) {
      output$medaille_or <- renderValueBox({
        valueBox("Nombre de médailles d'or :", value = sum(data_medals()$Medal == "Gold" & data_medals()$region %in% input$pays, na.rm = TRUE), color = 'purple')
      })
    }else {
      output$medaille_or <- renderUI({
        NULL
      })
    } 
    
    if ("argent" %in% input$check_medaille) {
      output$medaille_argent <- renderValueBox({
        valueBox("Nombre de médailles d'argent :", value = sum(data_medals()$Medal == "Silver" & data_medals()$region %in% input$pays, na.rm = TRUE), color = 'purple')
      })
    } else {
      output$medaille_argent <- renderUI({
        NULL
      })
    }
    
    if ("bronze" %in% input$check_medaille) {
      output$medaille_bronze <- renderValueBox({
        valueBox("Nombre de médailles de bronze :", value = sum(data_medals()$Medal == "Bronze" & data_medals()$region %in% input$pays, na.rm = TRUE), color = 'purple')
      })
    } else {
      output$medaille_bronze <- renderUI({
        NULL
      })
    }
  })
  
  # graphique d'evolution des participations des femmes dans les jeux
  output$evolution <- renderPlotly({
    total_femmes <- data_jo %>%
      filter(Sex == "F") %>%
      group_by(Games) %>%
      summarise(Nombre_femmes = n())
    
    # Calculer la proportion de femmes parmi les athlètes pour chaque édition des Jeux Olympiques
    proportion_femmes <- data_jo %>%
      group_by(Games) %>%
      summarise(Proportion_femmes = mean(Sex == "F", na.rm = TRUE))
    
    # Fusionner les données de nombre total de femmes et de proportion de femmes
    data_femmes <- left_join(total_femmes, proportion_femmes, by = "Games")
    
    # Créer un graphique en ligne interactif avec Plotly pour visualiser les proportions au fil du temps
    plot_ly(data_femmes, x = ~Games, y = ~Proportion_femmes, type = 'scatter', mode = 'lines', line = list(color = 'blue')) %>%
      add_trace(y = ~Nombre_femmes, name = "Nombre de femmes", yaxis = "y2", type = 'scatter', mode = 'lines', line = list(color = 'red')) %>%
      layout(title = "Participation des femmes aux Jeux Olympiques au fil du temps",
             xaxis = list(title = "Édition des Jeux Olympiques"),
             yaxis = list(title = "Proportion de femmes parmi les athlètes", side = "left"),
             yaxis2 = list(title = "Nombre de femmes", side = "right", overlaying = "y", showgrid = FALSE),
             hovermode = "closest",
             showlegend = TRUE,
             legend = list(orientation = "h"))
    
  })
  
  
  
  # graphique du top 30 des pays les plus dominants
  output$question1 <- renderPlot({
    data_filtered <- data_jo %>%
      distinct() %>%
      filter(!is.na(Medal)) %>%
      left_join(data_noc_regions, by = "NOC")
    
    
    # Aggregate the total medal count per country and identify the top 10 countries
    top_30_countries <- data_filtered %>%
      count(region) %>%
      top_n(30, n)
    
    
    # Filter the original data to include only these top 10 countries
    top_30_data <- data_filtered %>%
      filter(region %in% top_30_countries$region)
    
    top_30_data$Medal <-
      factor(top_30_data$Medal, levels = c("Gold", "Silver", "Bronze"))
    
    # Aggregate the data to count the number of each type of medal per country
    medals_per_country <- top_30_data %>%
      count(region, Medal)
    
    # Create a stacked histogram of the number of medals per country by type, ordered by total medals
    ggplot(medals_per_country, aes(
      x = reorder(region,-n),
      y = n,
      fill = Medal
    )) +
      geom_bar(stat = "identity") +
      labs(title = "Les pays les plus dominants",
           x = "Country",
           y = "Number of Medals",
           fill = "Medal Type") +
      scale_fill_manual(values = c(
        "Gold" = "#FFD700",
        "Silver" = "#C0C0C0",
        "Bronze" = "#CD7F32"
      )) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      theme(plot.title = element_text(hjust = 0.5, size = 24))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

