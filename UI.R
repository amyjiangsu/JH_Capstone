library(shiny)
shinyUI(bootstrapPage(theme = "bootstrap.min.css",
    titlePanel(windowTitle = "JH Data Science Capstone Project", title = HTML("<div class=\"title\"><div class=\"line1\">Data Science Capstone Project</div><div class=\"line2\">SwiftKey Prediction</div></div>")),
    tabsetPanel(
      tabPanel("Prediction", verticalLayout(
          HTML('<br />'),
          textInput("inputString", "Please start to write your message here:",value = ""),
          HTML('Your next word is going to be:'),
          verbatimTextOutput("textOutput"),
          HTML('<h4>Instructions</h4>
<p>Type a sentence of any length in the text input box above.  As you type, the prediction box will try to predict the next word 
that you intend to write. In order to achieve a higher coverage, this prediction model returns one word for auto-completion when 
user are typing a word, and returns three most possible options after user input a space at the end of a word, ordered 
from left to right. </p>

<p>In addition, the prediction model uses the Katz backoff algorithm and the full set of {1, 2, 3} grams language model:</p>

<ul>
  <li>unigram - The unigram model is used to proved auto-completion help when user are typing a word (before inputting a space character).</li>
  <li>bigram - The bigram model is the back-off model of trigram model. It predicts three most probable words conditioned on the last word of user input.</li>
  <li>trigram - The trigram model is a prefered prediction model with higher accuracy but lower coverage. It predicts three most probable words conditioned on the last two words of user input.</li><br/><br/>
</ul>'))),
      tabPanel("Bibliography", HTML('<br/>
        <ol>
          <li><a href="https://www.coursera.org/course/nlp">https://www.coursera.org/course/nlp</a></li>
          <li><a href="http://cran.r-project.org/web/packages/tm/tm.pdf">http://cran.r-project.org/web/packages/tm/tm.pdf</a></li>
          <li><a href="http://www.statsoft.com/textbook/text-mining">http://www.statsoft.com/textbook/text-mining</a></li>
          <li><a href="http://swiftkey.com/en/">http://swiftkey.com/en/</a></li>
          <li><a href="http://stackoverflow.com/questions/8161167/what-algorithm-i-need-to-find-n-grams">http://stackoverflow.com/questions/8161167/what-algorithm-i-need-to-find-n-grams</a></li>
          <li><a href="http://shiny.rstudio.com/articles/reactivity-overview.html">http://shiny.rstudio.com/articles/reactivity-overview.html</a></li>
          <li><a href="http://stackoverflow.com/questions/21921422/row-sum-for-large-term-document-matrix-simple-triplet-matrix-tm-package">http://stackoverflow.com/questions/21921422/row-sum-for-large-term-document-matrix-simple-triplet-matrix-tm-package</a></li>
          <li><a href="http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka">http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka</a></li>
          <li><a href="http://stackoverflow.com/questions/6025051/extracting-indices-for-data-frame-rows-that-have-max-value-for-named-field">http://stackoverflow.com/questions/6025051/extracting-indices-for-data-frame-rows-that-have-max-value-for-named-field</a></li>
          <li><a href="http://stackoverflow.com/questions/24191728/documenttermmatrix-error-on-corpus-argument">http://stackoverflow.com/questions/24191728/documenttermmatrix-error-on-corpus-argument</a></li>
          <li><a href="http://stackoverflow.com/questions/7804816/how-to-create-a-dictionary-hash-table-by-iterating-through-a-column">http://stackoverflow.com/questions/7804816/how-to-create-a-dictionary-hash-table-by-iterating-through-a-column</a></li>
          <li><a href="http://en.wikipedia.org/wiki/Katz%27s_back-off_model">http://en.wikipedia.org/wiki/Katz%27s_back-off_model</a></li>
        </ol>
                                    ')),
      tabPanel("About", HTML('<br/><div class = \'box\'><table>
            <tr><td><image src=\'bkgrnd.png\'></td><td class=\'txt\'>
                This prediction app is a simulation of SwiftKey\'s text input prediction app on tablets and smartphones.  The
                project is the capstone project of Johns Hopkins\' Data Science specialization.  All rights are reserved 
                according to <u> <a href = \'creativecommons.org/licenses/\'> Creative Common License</a></u>.             
            <br /><br /><br />
            <span>Author: Amy Jiang Su</span><br /></br />
            <span>Date: April 18, 2015</span><br /><br />
            <span>All code are avaiable at <u> <a href="https://github.com/amyjiangsu/JH_Capstone">https://github.com/</a></u>.
        </span></td></tr><table></div>'))
  )
))