# require modules here
require "yaml"
def load_library(path)
  # code goes here
  emoticons= YAML.load_file(path)
  hash={"get_meaning"=>{},
  "get_emoticon"=>{}}
  emoticons.each {|key,value|
  hash["get_emoticon"][value[0]]=emoticons[key][1]
  hash["get_meaning"][value[1]]=key}
  hash
end

def get_japanese_emoticon(path, emoticon)
  YAML.load_file(path)
  result = load_library(path)["get_emoticon"][emoticon]
  if result
    result
  else
    result="Sorry, that emoticon was not found"
  end
  result
  
  # code goes here
end

def get_english_meaning(path, emoticon)
  result = load_library(path)["get_meaning"][emoticon]
  if result==nil
     result="Sorry, that emoticon was not found"
    
  else 
    
  end
   
  result
  
  # code goes here
end