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

### SANKEY #### 
  temp_df <- df_expansion %>% 
    group_by(headline,community) %>% 
    summarise(n=sum(user_name)) %>% 
    top_n(5,n) %>% 
    mutate(id = paste0(headline,community))
  
  df_target <- df_expansion %>% 
    filter(headline == "data-privacy") %>% 
    select(headline,source_path,community,n=user_name) %>% 
    filter(paste0(headline,community) %in% temp_df$id) %>% 
    group_by(headline) %>% 
    mutate(source_path = source_path-1)
  
  df_source <- df_expansion %>% 
    filter(headline == "data-privacy") %>% 
    filter(paste0(headline,community) %in% temp_df$id) %>% 
    select(headline,source_path,community) %>% 
    left_join(., df_target,by="source_path") %>% 
    # mutate(community.x = ifelse(source_path == community.x & community.x == community.y,101,community.x)) %>% 
    mutate(comm_t = paste0(source_path,"-",community.x),
           comm_t_1 = paste0(source_path+1,"-",community.y)) %>% 
    select(-headline.y)
  
  # Make a connection data frame
  links=data.frame(source=df_source$comm_t,
                   target=df_source$comm_t_1,
                   value=df_source$n)
  
  # From these flows we need to create a node data frame: it lists every entities involved in the flow
  nodes=data.frame(name=c(as.character(links$source),as.character(links$target)) %>% unique())
  links$IDsource=match(links$source, nodes$name)-1
  links$IDtarget=match(links$target, nodes$name)-1
  
  # prepare color scale: I give one specific color for each node.
  my_color <- 'd3.scaleOrdinal() .domain(["group_A", "group_B","group_C", "group_D", "group_E", "group_F", "group_G", "group_H"]) .range(["blue", "blue" , "blue", "red", "red", "yellow", "purple", "purple"])'
  
  output$plot5 <- renderSankeyNetwork({
     
    # Make the Network. I call my colour scale with the colourScale argument
    sankeyNetwork(Links = links, Nodes = nodes,
                  Source = "IDsource",
                  Target = "IDtarget",
                  Value = "value", NodeID = "name", colourScale=my_color)
  })
}