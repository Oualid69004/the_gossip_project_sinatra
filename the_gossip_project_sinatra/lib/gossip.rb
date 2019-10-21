
require 'csv'
require 'pry'

class Gossip
  attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content = content

  end

  def save
    array = [@author, @content]
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << array
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    array_gossips = self.all
    return array_gossips[id.to_i]
  end
end
