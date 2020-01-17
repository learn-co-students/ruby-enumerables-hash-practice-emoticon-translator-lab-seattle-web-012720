# require modules here
require "yaml"
require "pp"

def load_library(file_path)
  hash = YAML.load_file(file_path)
  jap_meaning_hash = hash.reduce({}) do |memo, (key,value)| 
      memo[value[1]] = key
      memo
  end
  us_meaning_hash = hash.reduce({}) do |memo, (key,value)| 
      memo[value[0]] = value[1]
      memo
  end
  {:get_meaning => jap_meaning_hash, :get_emoticon => us_meaning_hash}
  
end

def get_japanese_emoticon(file_path, emoticon)
  val = load_library(file_path)[:get_emoticon][emoticon]
  if(val== nil)
    val = "Sorry, that emoticon was not found"
  end
  val
end

def get_english_meaning(file_path, emoticon)
  val = load_library(file_path)[:get_meaning][emoticon]
  if(val== nil)
    val = "Sorry, that emoticon was not found"
  end
  val
end