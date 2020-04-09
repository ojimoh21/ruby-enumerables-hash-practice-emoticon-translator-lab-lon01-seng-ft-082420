require 'pry'
require "yaml"

def load_library(file_path)
  file = YAML.load_file(file_path)
  #loads the emoticon file 
    emoticons = {}
    #returns a hash to hold emoticons in 
  file.each do |key, emoji|
    #iterates through all the emoticons 
    emoticons[key] = {}
    #points each key to an inner hash
    emoticons[key][:english] = emoji[0]
    #creates english symbol that points to english emoji
    emoticons[key][:japanese] = emoji[1]
    #creates japanese symbol that points to japanese emoji
  end 
  emoticons
  #returns the array
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end