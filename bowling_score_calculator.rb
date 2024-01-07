# Method to calculate bowling scores
def calculate_bowling_score(rolls)
  scores = [] # Array to store scores for each frame
  frame_index = 0 # Index to track the current frame
  roll_index = 0 # Index to track the current roll

  # Loop through frames until 10 frames are processed or all rolls are consumed
  while frame_index < 10 && roll_index < rolls.length
    # Raise an error if a spare is incorrectly placed as the first roll of a frame
    raise "Invalid roll sequence: spare cannot be the first roll of a frame" if rolls[roll_index] == "/"

    if rolls[roll_index] == "X" # Check for a strike
      # Calculate strike score if the next two rolls are available
      if roll_index + 2 < rolls.length
        scores << 10 + strike_bonus(rolls, roll_index)
      else
        scores << nil # Incomplete frame
      end
      roll_index += 1 # Move to the next frame (one roll per frame for strike)
    elsif rolls[roll_index].is_a?(Integer) # Check for open frame or spare
      # Ensure there is another roll in the frame
      if roll_index + 1 < rolls.length
        if rolls[roll_index + 1].is_a?(Integer) # Open frame
          scores << rolls[roll_index] + rolls[roll_index + 1]
        elsif rolls[roll_index + 1] == "/" # Spare
          # Calculate spare score if the next roll is available
          if roll_index + 2 < rolls.length
            scores << 10 + spare_bonus(rolls, roll_index)
          else
            scores << nil # Incomplete frame
          end
        end
      else
        scores << nil # Incomplete frame
      end
      roll_index += 2 # Move to the next frame (2 rolls per frame)
    end
    frame_index += 1 # Increment frame index after processing a frame
  end

  return scores, frame_index # Return the scores and the last frame index processed
end

# Helper method to calculate strike bonus
def strike_bonus(rolls, index)
  # Initialize bonus to 0
  bonus = 0
  # Raise an error if the sequence is invalid (spare after a strike)
  raise "Invalid roll sequence: spare followed by strike" if rolls[index + 1] == "/"

  # Calculate bonus for the first roll after the strike
  if rolls[index + 1] == "X"
    bonus += 10
  else
    bonus += rolls[index + 1].to_i
  end

  # Calculate bonus for the second roll after the strike
  if rolls[index + 2] == "X"
    bonus += 10
  elsif rolls[index + 2] == "/"
    # Add remaining pins to make 10 if the previous roll was not a strike
    bonus += 10 - rolls[index + 1].to_i
  else
    bonus += rolls[index + 2].to_i
  end

  bonus # Return the total bonus
end

# Helper method to calculate spare bonus
def spare_bonus(rolls, index)
  # Raise an error if the sequence is invalid (spare followed by another spare)
  raise "Invalid roll sequence: spare followed by spare" if rolls[index + 2] == "/"
  # Return 10 if the next roll is a strike, otherwise return the number of pins knocked down
  rolls[index + 2] == "X" ? 10 : rolls[index + 2].to_i
end

# Test the method with some sample data
sample_rolls = ["X", 3, 6, "X", 4, 5, "X", 2, 7, "X", 6, 3, "X", 7, 1, "X", 9, 0]
puts calculate_bowling_score(sample_rolls).inspect
