# Ruby Katas to learn concurrency
The goal of this repo is to have some exercises to learn concurrency in ruby. These are meant to accompany going through the material of the (working with ruby threads)[https://workingwithruby.com/wwrt/intro] book.

Importantly, these katas should include work that is both CPU-bound and IO-bound, so that it is possible to understand the differences.

The goal of the first kata is to count the total number of words associated with a list of wikipedia articles.
Thus, the program should: 
- fetch a number of articles from wikipedia
- parse the words
- count all the words in the article
- add the article word count to a total word count
- print the total word count at the end

Implementations should begin using a sequential approach, then move to implementations using Threads, Fibers, and then Ractors.
