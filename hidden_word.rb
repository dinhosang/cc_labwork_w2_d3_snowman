class HiddenWord

  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end


  def asterisked_word(guessed_letters)
    index = 0
    length = @word.length()
    string_to_return = ""
    until index == length
      found_letter = false
      for array_letter in guessed_letters
        if @word[index] == " "
          string_to_return.concat(" ")
          found_letter = true
          break
        end
        if @word[index] == array_letter
          string_to_return.concat(array_letter)
          found_letter = true
          break
        end
      end
      if found_letter == false
        letter = '*'
        string_to_return.concat(letter)
      end
      index += 1
    end
    return string_to_return
  end


end
