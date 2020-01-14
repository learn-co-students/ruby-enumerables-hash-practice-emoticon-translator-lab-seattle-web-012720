require "yaml"
require 'pry'
def load_library(file_path)
  nds = YAML.load_file(file_path)
  new_nds = {}
  new_nds['get_meaning'] = {}
  new_nds['get_emoticon'] = {}
  nds.each do |meaning, array|
    new_nds['get_meaning'][array[1]] = meaning
    new_nds['get_emoticon'][array[0]] = array[1]
  end
  new_nds
end

def get_japanese_emoticon(file_path, emoticon)
  results = load_library(file_path)['get_emoticon'][emoticon]
  if results
    results
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  results = load_library(file_path)['get_meaning'][emoticon]
  if results
    results
  else
    "Sorry, that emoticon was not found"
  end
end