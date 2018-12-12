navbarPage(theme = shinytheme("flatly"), fluid = TRUE, "Capstone",
          
    #### Home ####       
           
           tabPanel("Home", icon = icon("home"),
                   
                      img(src = 'homepage.png')
           ),
    
    #### News ####
          
           navbarMenu("News", icon = icon("newspaper"),
                      
            ### LDA Model ####        
                    tabPanel("LDA Model",
                             fluidPage(
                               
                               fluidRow(
                                 h3("Topic by Article Count")),
                               
                               fluidRow(
                                 plotlyOutput("plot1")),
                             
                             
                             fluidRow(
                               h3("Topic by Share Count"),
                               plotlyOutput("plot2")

                                  
                             )
                             )
                    ),
                    
            ### Neural Network ####
                    tabPanel("Neural Network",
                             fluidPage(
                               
                               fluidRow(
                                 
                                 h3("Brexit Twitter Users"),
                                 
                                 column(6, 
                                        
                                        h4("Network"),
                               
                               HTML('<iframe width="560" height="315" 
                                    src="https://www.youtube.com/embed/htw8CajCBLY" 
                                    frameborder="0" allow="accelerometer; 
                                    autoplay; encrypted-media; gyroscope; 
                                    picture-in-picture" allowfullscreen></iframe>')
                                 ),
                               
                               column (6, 
                                       h4("Output"),
                                       tags$img(src='brexituser2.png')
                                 
                               )
                               ),
                               
                               fluidRow(
                              
                                 column(6,div(style = "height:70px;background-color: white;"))),

                               
                               fluidRow(
                                 
                                 h3("Brexit: Twitter All"),
                                 
                                 column(6, 
                                        h4("Network"),
                               
                               HTML('<iframe width="560" height="315"
                                    src="https://www.youtube.com/embed/ZzRP5k70al8" 
                                    frameborder="0" allow="accelerometer; autoplay; 
                                    encrypted-media; gyroscope; picture-in-picture" 
                                    allowfullscreen></iframe>')
                               
                                 ),
                               
                               column(6, 
                                      h4("Output"),
                                      tags$img(src='brexit.png')
                               )
                               )
                             )
                    )
                    
                    
                    ),
    #### Twitter ####
    
           navbarMenu("Twitter Network", icon = icon("twitter"),
            ### Introduction ####          
                tabPanel("Introduction",
                    fluidPage(
                      fluidRow(
                        h3("Sample Twitter Network: Trump and Mueller Investigation")
                      ),
                      fluidRow(
                        actionButton("click2", "Start Visual"),
                        simpleNetworkOutput(
                          "simple2", width = "90%", height = "700px")
                        
                      )
                               )
                      )
                      
           ,           
            ### Network Theory I ####          
                      tabPanel("Network Theory I",
                          fluidPage(
                            fluidRow(
                            column(6, tags$img(src='image.png'))
                              ,
                              
                              column(6, actionButton("click", "Start Visual"),
                              
                              simpleNetworkOutput(
                                "simple", width = "100%", height = "450px"
                              )
                                
                              ) 
                            
                            
                                 ))
                              ),
           ### Network Theory II ####
           tabPanel("Network Theory II",
                    fluidPage(
                      
                      fluidRow(
                        tags$img(src='theory2.png')
                        )

                      
                      
                    )
           )
           ),
    #### Spread of Info ####   
    
      navbarMenu("Spread of Information", icon = icon("connectdevelop"),
          ### Community ####        
            tabPanel("Community",
               fluidPage(
                 plotOutput("plot3", width = "100%")

               )
            ),
          ### Speed #### 
            tabPanel("Speed",
                     fluidPage(
                       plotOutput("plot4", width = "100%")
                       
                     )
            ),
          ### Flow ####
          tabPanel("Flow of Information",
                   fluidPage(
                     sankeyNetworkOutput("plot5", width = "100%")
                     
                   )
          )
          
          
            
     ),    
    #### Resources ####   
    
           tabPanel("Resources", icon = icon("book"),
                    fluidPage(
                      fluidRow(
                      h5("Martin, T. (2018). Promoting Positive Climate Change Conversations via Twitter."),
                      h5("[online] Zeromh.github.io. Available at: https://zeromh.github.io/climate_change_conversations/")),
                      
                      fluidRow(
                        
                        div(style = "height:20px;background-color: white;")),
                      
                      fluidRow(
                      h5("Salvania, A. and Pabico, J. (2015). Information Spread Over an Internet-mediated"),
                      h5("Social Network: Phases, Speed, Width, and Effects of Promotion. [ebook] Los Banos: Institute of"),
                      h5("Computer Science University of the Philippines. Available at: https://arxiv.org/pdf/1507.06380.pdf")) 
                    )
           ),
    #### Contact ####    
    
           tabPanel("Contact", icon = icon("address-book"),
                    fluidPage(HTML(
                      paste(
                        h4("Aamash Haroon"),
                        #Email
                        "<b>", "Email:","</b>","<b>", 
                        "<a href = 'mailto:aamashharoon.16@gmail.com'>", 
                        "aamashharoon.16@gmail.com","</b>","</a>",
                        "<br>", "<b>", "LinkedIn:", "</b>","<b>", 
                        "<a href = 'https://www.linkedin.com/in/aamashharoon/'>", 
                        "Click Here","</b>" ,"</a>", "<br>","<br>",
                        
                        h4("Celina Sprague"),
                        #Email
                        "<b>", "Email:","</b>","<b>", 
                        "<a href = 'mailto:celina.sprague2@gmail.com'>", 
                        "celina.sprague2@gmail.com","</b>","</a>",
                        "<br>", "<b>", "LinkedIn:", "</b>","<b>", 
                        "<a href = 'https://www.linkedin.com/in/celinasprague/'>", 
                        "Click Here","</b>" ,"</a>", "<br>","<br>",
                        
                        h4("Raul Vallejo"),
                        #Email
                        "<b>", "Email:","</b>","<b>", 
                        "<a href = 'mailto:rvallejovillafuerte@gmail.com'>", 
                        "rvallejovillafuerte@gmail.com","</b>","</a>",
                        "<br>", "<b>", "LinkedIn:", "</b>","<b>", 
                        "<a href = 'https://www.linkedin.com/in/raul-vallejo/'>", 
                        "Click Here","</b>" ,"</a>"
                      )
                    ))
           )
 
           )
