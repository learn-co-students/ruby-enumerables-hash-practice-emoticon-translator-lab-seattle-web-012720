require "yaml"

def load_library(file)
  unfiltered_library = YAML.load_file(file)
  library = {get_meaning: {}, get_emoticon: {}}
  
  unfiltered_library.map do |key, value|
    
    library[:get_meaning][value[1]] = key
    library[:get_emoticon][value[0]] = value[1]
  
  end
  library
end

def get_japanese_emoticon(file, western_emoticon)
  
  library = load_library(file)
  return_value = library[:get_emoticon][western_emoticon]
  if return_value == nil
      return_value = "Sorry, that emoticon was not found"
  end
  return_value
end

def get_english_meaning(file, japanese_emoticon)
  
  library = load_library(file)
  return_value = library[:get_meaning][japanese_emoticon]
  if return_value == nil
      return_value = "Sorry, that emoticon was not found"
  end
  return_value
end