require 'bundler/setup'
require 'benchmark'
require 'nokogiri'
require 'open-uri'
require 'debug'

ARTICLES = [
  'https://en.wikipedia.org/wiki/Concurrency_(computer_science)',
  'https://en.wikipedia.org/wiki/Concurrent_computing',
  'https://en.wikipedia.org/wiki/Concurrence_(quantum_computing)',
  'https://en.wikipedia.org/wiki/Concurrent_Computer_Corporation',
  'https://en.wikipedia.org/wiki/Multiuser_DOS#Concurrent_DOS',
  'https://en.wikipedia.org/wiki/Concurrent_engineering',
  'https://en.wikipedia.org/wiki/Concurrent_Design_Facility',
  'https://en.wikipedia.org/wiki/Concurrent_Design_Facility',
  'https://en.wikipedia.org/wiki/Concurrence'
].freeze

total_words = 0

Benchmark.bm(20) do |job|
  job.report(:sequential) do
    ARTICLES.each do |article_url|
      response = Nokogiri::HTML(URI.open(article_url))
      article_content = response.search('p')
      word_count = article_content.map(&:content).join(" ").split(" ").count
      total_words = total_words + word_count
    end
  end
  puts "the total words across all the articles are: #{total_words}"
end