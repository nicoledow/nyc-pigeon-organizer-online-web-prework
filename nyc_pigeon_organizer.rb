require "pry"

=begin
pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}


pigeon_list = {
  "Theo" => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Subway"]
  },
  "Peter Jr." => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Library"]
  },
  "Lucky" => {
    :color => ["purple"],
    :gender => ["male"],
    :lives => ["Central Park"]
  },
  "Ms. K" => {
    :color => ["grey", "white"],
    :gender => ["female"],
    :lives => ["Central Park"]
  },
  "Queenie" => {
    :color => ["white", "brown"],
    :gender => ["female"],
    :lives => ["Subway"]
  },
  "Andrew" => {
    :color => ["white"],
    :gender => ["male"],
    :lives => ["City Hall"]
  },
  "Alex" => {
    :color => ["white", "brown"],
    :gender => ["male"],
    :lives => ["Central Park"]
  }
}
=end



def nyc_pigeon_organizer(data)
  pigeon_list = {}
  
  #setting first level keys to names of pigeons
  data.each do |attribute, type|
    type.each do |color, group|
      group.each do |individual|
        #creates new key for the pigeon's name, whose value is an empty hash
        pigeon_list[individual] = {}
      end
    end
  end
 
 #adding a "color" key to each bird in pigeon_list, whose value is an array containing all its colors 
 data[:color].each do |color, group_of_birds|
   group_of_birds.each do |bird|
    if pigeon_list[bird].has_key?(:color)
      pigeon_list[bird][:color] << color.to_s
    else
      pigeon_list[bird][:color] = []
      pigeon_list[bird][:color] << color.to_s
    end
   end
 end
 
 #adding a "gender" key to each bird in pigeon_list, whose value is an array
 data[:gender].each do |gender, group_of_birds|
   group_of_birds.each do |bird|
      pigeon_list[bird][:gender] = []
      pigeon_list[bird][:gender] << gender.to_s
    end
 end
  
  #adding a "lives" key to each bird in pigeon_list, whoes value is their location
  data[:lives].each do |location, group_of_birds|
    group_of_birds.each do |bird|
      pigeon_list[bird][:lives] = []
      pigeon_list[bird][:lives] << location.to_s
    end
  end
  
  
  pigeon_list
end