require "yaml"
require "pry"

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticons_lib = {'get_meaning' => {},
                    'get_emoticon' => {} }
  emoticons.each do |meaning, value|
    english = value[0]
    japonese = value[1]
    emoticons_lib['get_meaning'][japonese] = meaning
    emoticons_lib['get_emoticon'][english] = japonese
  end
  emoticons_lib
end


def get_japanese_emoticon(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
  end
  
  

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  hash["get_meaning"].each do |jap_emot,meaning|
    if jap_emot == emoticon
      return meaning
      break
    end
  end
  "Sorry, that emoticon was not found"
  end
  
  
  
