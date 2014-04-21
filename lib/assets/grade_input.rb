

def whitespace_pass(answer, user_input)
 '''
 Returns T/F depending of answer == user_input, after we remove all white spaces.
 '''
 space_removed_input = user_input.gsub(/\s+/, "")
 space_removed_answer = answer.gsub(/\s+/, "")
 if (space_removed_input == space_removed_answer)
  return true
 else
  return false
 end
end

def equalsign_pass(answer, user_input)
 '''
 Return T/F while taking into account that "<-" and "=" are the same
 Removes white spaces too
 '''
 space_removed_input = user_input.gsub(/\s+/, "")
 space_removed_answer = answer.gsub(/\s+/, "")

 equalized_input = space_removed_input.gsub('<-', '=')
 equalized_answer = space_removed_answer.gsub('<-', '=')

 if (equalized_input == equalized_answer)
  return true
 else
  return false
 end
end

def compare_inputs(answer, user_input)
 '''
 Given the correct code "answer" and "user_input", returns True if the user_input
 renders the same code
 '''

 if (answer == user_input)
  return true
 elsif whitespace_pass(answer, user_input)
  return true
 elsif equalsign_pass(answer, user_input)
  return true
 else
  return false
 end
end

puts compare_inputs("my_numbers = c(6, 7, 8)", "my_numbers= c(6, 7,8)")
puts compare_inputs("my_numbers = c(6, 7, 8)", "my_numbers <- c(6, 7,8)")
puts compare_inputs("my_dataframe = data.frame(my_numbers, my_strings, my_logicals)", "my_dataframe= data.frame(my_numbers,my_strings, my_logicals)")
puts compare_inputs("class(my_dataframe)", "class(my_dataframeee)")
