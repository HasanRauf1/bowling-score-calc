# Bowling Score Calculator

This Ruby application is designed to calculate the score of a standard ten-pin bowling game. It takes a series of rolls as input and outputs the score for each frame.

## Features

- Handles all standard bowling scoring rules, including strikes, spares, and open frames.
- Accurately calculates scores for incomplete games.
- Provides error handling for invalid roll sequences.

## How to Use

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run the application with Ruby.

Example usage:

```ruby
require 'bowling_score_calculator.rb'

sample_rolls = [4, 5, "X", 8, 1, ...] # Add your rolls here
scores = calculate_bowling_score(sample_rolls)
puts scores.inspect
```
