require('pry')

class Word
  def word_score(word)
    arr=word.split("")
    score=0
    arr.each do |letter|
      case letter.downcase
      when 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'
        score+=1 
      when 'd', 'g'
        score+=2 
      when 'b', 'c', 'm', 'p'
        score+=3
      when 'f', 'h', 'v', 'w', 'y'
        score+=4
      when 'k'
        score+=5
      when 'j', 'x'
        score+=8
      when 'q', 'z'
        score+=10            
      else
        score+=0
      end
    end
    score
  end
end

class Sentence < Word
  def get_sentence_score(words)
    big_score=0
    big_arr=words.split(" ")
    big_arr.each do |word|   
      big_score+=word_score(word)
    end
    big_score
  end
end



class ScrabbleScore < Sentence
  def initialize(words_or_path)
    if (File.exist?(words_or_path))
      file=File.open(words_or_path)
      data = file.read
      file.close
      @words=data
    else
      @words = words_or_path
    end
  end
  
  def words
    @words
  end
  def get_score
    get_sentence_score(@words)
  end
end
