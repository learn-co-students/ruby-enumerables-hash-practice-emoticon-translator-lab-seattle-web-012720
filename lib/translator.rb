require 'yaml'
require 'pry'


def load_library(file)
  working_hash = {get_meaning:{}, get_emoticon:{}}
  library = YAML.load_file(file)
  library.each do |feeling, emoticon|
    working_hash[:get_meaning][emoticon[1]] = feeling
    working_hash[:get_emoticon][emoticon[0]] = emoticon[1]
    #binding.pry
  end
working_hash
end

def get_japanese_emoticon(file, emoticon)
  working_hash = load_library(file)
  answer = nil
  working_hash[:get_emoticon].each do |english, japanese|
    if emoticon == english
      answer = japanese
    end
  end
  if answer == nil
    return "Sorry, that emoticon was not found"
  end
    return answer
end

def get_english_meaning(file, emoticon)
  working_hash = load_library(file)
  answer = nil
  working_hash[:get_meaning].each do |japanese, meaning|
    if emoticon == japanese
      answer = meaning
    end
  end
  if answer == nil
    return "Sorry, that emoticon was not found"
  end
    return answer
end

#emoticons is a hash following this structure:
# {"emotion": => ["english_emoji", "japanese_emoji"], etc. }