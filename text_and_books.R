
gutenberg_works(title==str_extract(title,"Alice"))

dracula<-gutenberg_download(345)


gutenberg_works()

sns<-austen_books()

sns<-sns%>%
  filter(book == 'Sense & Sensibility')
  
av<-gutenberg_works()%>%
  select(gutenberg_id,title,author)%>%
  filter(author=='Carroll, Lewis')
View(av)


get_sentiments('nrc')
