# Bowling Score Calculator

This Ruby application is designed to calculate the score of a standard ten-pin bowling game. It takes a series of rolls as input and outputs the score for each frame.

## Features

- Handles all standard bowling scoring rules, including strikes, spares, and open frames.
- Accurately calculates scores for incomplete games.
- Provides error handling for invalid roll sequences.

## Validations

- **Rolls Format**: Accepts only numbers between 0-9, 'X' for strikes, and '/' for spares. Invalid input will raise an error.
- **Spare as First Roll**: A spare ('/') cannot be the first roll of a frame. An error is raised if this rule is violated.
- **Strike Followed by Number**: A strike ('X') cannot be followed by a number in the same frame. This sequence will trigger an error.
- **Spare Followed by Strike in Strike Bonus**: In the strike bonus calculation, a spare ('/') cannot follow a strike ('X'). An error is raised if encountered.
- **Spare Followed by Spare in Spare Bonus**: In the spare bonus calculation, a spare ('/') cannot follow another spare. This will result in an error.

These checks ensure that the input adheres to standard bowling rules.

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
