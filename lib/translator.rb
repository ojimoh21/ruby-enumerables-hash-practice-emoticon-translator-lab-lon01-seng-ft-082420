require 'pry'
require "yaml"

def load_library(file_path)
  file = YAML.load_file(file_path)
    emoticons = {}
  file.each do |key, emoji|
    emoticons[key] = {}
    
    emoticons[key][:english] = emoji[0]
    emoticons[key][:japanese] = emoji[1]
  end 
  emoticons
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