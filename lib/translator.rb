require "pry"
require "yaml"

def load_library(file_path)
  emoticon_library = YAML.load_file(file_path)
  hash = {}
  hash['get_meaning'] = {}
  hash['get_emoticon'] = {}
  emoticon_library.each do |word, array|
    english, japanese = array
    hash['get_meaning'][japanese] = word
    hash['get_emoticon'][english] = japanese
  end
  hash 
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  if hash['get_emoticon'].include?(emoticon)
    return hash['get_emoticon'][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end 
end 

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  if hash['get_meaning'].include?(emoticon)
    return hash['get_meaning'][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end 
end