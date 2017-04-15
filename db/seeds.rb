Country.destroy_all

class Seed
  def self.start
    seed = Seed.new
    seed.populate_countries_table
  end

  def populate_countries_table
    Country.populate_countries_table
    puts "Country table was populated."
  end
end

Seed.start
