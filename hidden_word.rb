class HiddenWord

  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def asterisked_word
    index = 0
    length = @word.length()
    string_to_return = ""
    until index == length
      letter = '*'
      string_to_return.concat(letter)
      index += 1
    end
    return string_to_return
  end


end
