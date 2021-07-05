# require modules here
require "yaml"

def load_library(file_path)
  emots = YAML.load_file(file_path)
  emot_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emots.reduce (emot_hash) do |memo, (meaning, emot_array)|
    memo["get_meaning"][emot_array[1]] = meaning
    memo["get_emoticon"][emot_array[0]] = emot_array[1]
    memo
  end
end

def get_japanese_emoticon(file_path, eng_emot)
  emot_hash = load_library(file_path)["get_emoticon"]
  jap_emot = emot_hash.reduce(nil) do |memo, (english, japanese)|
    if eng_emot == english
      return japanese
    end
    memo
  end
  "Sorry, that emoticon was not found" if !jap_emot
end

def get_english_meaning(file_path, jap_emot)
  meaning_hash = load_library(file_path)["get_meaning"]
  eng_emot = meaning_hash.reduce(nil) do |memo, (japanese, meaning)|
    if jap_emot == japanese
      return meaning
    end
    memo
  end
  "Sorry, that emoticon was not found" if !eng_emot
end