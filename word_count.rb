require 'bundler/setup'
require 'benchmark'
require 'nokogiri'
require 'open-uri'
require 'debug'

require_relative 'word_count/word_count_job'

total_words = 0
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

Benchmark.bm(20) do |job|
  job.report(:sequential) do
    ARTICLES.each do |article_url|
      word_count = WordCountJob.new(article_url).perform
      total_words = total_words + word_count
    end
  end
  puts "The total words across all the articles are: #{total_words}"
end