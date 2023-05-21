class WordCountJob
  attr_reader :article

  def initialize article
    @article = article
  end

  def perform
    response = fetch!
    paragraphs = extract! response
    paragraphs_to_words(paragraphs).count
  end

  private

  def fetch!
    Nokogiri::HTML(URI.open(article))
  end

  def extract! response
    response.search('p')
  end

  def paragraphs_to_words paragraphs
    paragraphs.map(&:content).join(" ").split(" ")
  end
end