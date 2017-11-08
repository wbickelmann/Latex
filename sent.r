bing<-get_sentiments('bing')
dracula<-gutenberg_download(345)
dim(dracula)
dracula$line<-1:15568
dracula$gutenberg_id<-NULL
dracula_words<-dracula%>%
  unnest_tokens(word,text)
dracula_words$group<-dracula_words$line %/% 80



dracula_words<-inner_join(dracula_words,bing)



rows<-which(dracula_words$sentiment=='negative')

dracula_words$score[rows]<--1
dracula_words$score[-rows]<-1
dracula_words$score<-as.numeric(dracula_words$score)
dracula_sent<-dracula_words%>%
  group_by(group)%>%
  summarize(group_sentiment=sum(score))
dracula_sent$group<-as.numeric(dracula_sent$group)
dracula_sent$group_sentiment<-as.numeric(dracula_sent$group_sentiment)
ggplot()+
  geom_col(data=dracula_sent,aes(x=group,y=group_sentiment))
