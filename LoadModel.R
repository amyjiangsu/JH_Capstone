load(file="data/search_1gram.RData")
load(file="data/search_2gram.RData")
load(file="data/search_3gram.RData")

contraction = function(x){
    #   This simple function does not cover ambiguities such as 's or 'd
    x = gsub("let's","let us", x)
    x = gsub("I'm","I am", x)
    x = gsub("'re", " are", x)
    x = gsub("n't", " not", x)
    x = gsub("'ll", " will", x)
    x = gsub("'ve"," have", x)
    x = gsub("[^a-zA-Z ]", "", x)
    x = gsub("\\s+", " ", x)
    return(x)
}

predict.word <- function(sentence) {
    
    sentence.short <- unlist(strsplit(sentence, "[,.?:!]"))
    sentence.short <- sentence.short[length(sentence.short)]
    if (nchar(sentence) > 0) {
        if (sentence.short != "") {
            if (substr(sentence.short, nchar(sentence.short), nchar(sentence.short))!=" "){
                cleaned.words <- contraction(tolower(sentence.short))
                search.words <- unlist(strsplit(cleaned.words, " "))
                search.word <- search.words[length(search.words)]
                if(nchar(search.word)>4) search.word <- substr(search.word, 1, 4)
                pred.1gram <- with(search.1gram, search.1gram[letter == search.word, ])
                
                if (nrow(pred.1gram) > 0) {
                    result <- data.frame(pred1="", pred2=paste("*", as.character(pred.1gram$pred), "*"), pred3 = "")
                    return(result)
                }
            }
        }
    }
    
    cleaned.words <- contraction(tolower(sentence.short))
    search.words <- unlist(strsplit(cleaned.words, " ")) 
    search.word2 <- search.words[length(search.words)]
    search.word1 <- search.words[length(search.words)-1]
    
    pred.3gram <- with(search.3gram, search.3gram[word1 == search.word1 & word2 == search.word2,])
    
    if (nrow(pred.3gram) > 0) {
        result <- data.frame(pred1=pred.3gram$pred1, pred2=pred.3gram$pred2, pred3 = pred.3gram$pred3)
        return(result)
    }
    
    pred.2gram <- with(search.2gram, search.2gram[word1 == search.word2,])
    
    if (nrow(pred.2gram) > 0) {
        result <- data.frame(pred1=pred.2gram$pred1, pred2=pred.2gram$pred2, pred3 = pred.2gram$pred3)
        return(result)
    }
    
    
    result <- data.frame(pred1="", pred2="No predictions", pred3="")
    return(result)
}
