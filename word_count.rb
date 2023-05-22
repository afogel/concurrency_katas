require 'bundler/setup'
require 'benchmark'
require 'nokogiri'
require 'open-uri'
require 'debug'

require_relative 'word_count/word_count_job'

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
EXPECTED_TOTAL_WORD_COUNT = 9_770

sequential_word_count = 0
threaded_word_count = 0


Benchmark.bm(20) do |job|
  job.report(:sequential) do
    ARTICLES.each do |article_url|
      word_count = WordCountJob.new(article_url).perform
      sequential_word_count += word_count
    end
  end
  job.report(:naive_threaded) do
    # IO-bound work
    article_word_counts = ARTICLES.map do |article_url|
      Thread.new { WordCountJob.new(article_url).perform }
    end.each(&:join).map(&:value)
    # CPU-bound work
    threaded_word_count = article_word_counts.reduce(:+)
  end
  puts "The sequential word count across all the articles are: #{sequential_word_count}"
  puts "The threaded word count across all the articles are: #{threaded_word_count}"
end