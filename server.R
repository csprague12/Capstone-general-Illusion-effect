function(input, output, session) {
  
    data <- eventReactive(input$click, {
      src <- c("START", "START", "START", "L", "B", "B", "C", "C","C", "C","D", "G","G", "G", "L", "C", "B", "S","S", "START")
      target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I","K", "L", "M", "N", "O", "P", "Q", "R", "U", "V", "S")
      zoom = TRUE
      Nodesize = "nodeBetweenness"
      networkData <- data.frame(src, target)
    })
    
    output$simple <- renderSimpleNetwork({
      simpleNetwork(data())
    })
  
  output$plot1 <- renderPlotly({
    p <- plot_ly(
      x = topic_dist$Topic.Bucket,
      y = topic_dist$Num.Documents,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Count of Articles'), 
             size = 9)
  })
  
  data2 <- eventReactive(input$click2, {
    src <- samplespread$retweet_user_name
    target <- samplespread$screen_name
    Group = "group"
    zoom = TRUE
    Nodesize = "nodeBetweenness"
    networkData <- data.frame(src, target, Group)
  })
  
  output$simple2 <- renderSimpleNetwork({
    simpleNetwork(data2())
  })
  
  output$plot2 <- renderPlotly({
    p <- plot_ly(
      x = sharecount$group,
      y = sharecount$all_shares,
      type = "bar") %>% 
      layout(yaxis = list(title = 'Total Social Media Shares'), 
             size = 9)
  })
  
  output$plot3 <- renderPlot({
    df_expansion %>% 
      ggplot() +
      geom_point(aes(x=source_path,y=n,color=reorder(headline,source_path,max))) +
      facet_wrap(.~reorder(headline,source_path,max),scales = "free_y") + 
      labs(x = "Degree of separation from patient zero",
           y = "Size of community",
           title = "Spread of information and community size") +
      theme(legend.position = "none")
    
  }, height = 600, width = 1200)
  
  output$plot4 <- renderPlot({
    df_speed %>% 
      mutate(date_time = as_datetime(date_time)) %>% 
      ggplot() +
      geom_point(aes(x=date_time,y=n,color=headline)) +
      facet_wrap(.~headline,scales = "free_y") + 
      labs(x = "Date",
           y = "Number of tweets p/hr",
           title = "Speed of information over time") +
      theme(legend.position = "none")}, height = 600, width = 1200)
  
  output$sanky <- renderSimpleNetwork({
    simpleNetwork(data2())
  })
}