require "lcd_digit/version"

module LcdDigit
  extend self

  # Digits are represented by simple bit masks. Each bit identifies
  # whether a line should be displayed. The following ASCII
  # graphic shows the mapping from bit position to the belonging line.
  #
  #  =6
  # 5  4
  #  =3
  # 2  1
  #  =0
  DIGITS = [0b1110111, 0b0100100, 0b1011101, 0b1101101, 0b0101110, # 0..4
            0b1101011, 0b1111011, 0b0100101, 0b1111111, 0b1101111, # 5..9
            0b0001000, 0b1111000].freeze # Minus, Dot
  TOP, TOP_LEFT, TOP_RIGHT, MIDDLE, BOTTOM_LEFT, BOTTOM_RIGHT, BOTTOM = *(0..6).freeze
  SPECIAL_DIGITS = { "-" => 10, "." => 11 }.freeze

  # method: render
  # @params:
  #   => number: Digit
  #   => size:   Integer (Default: 2)
  # @return: String
  #
  def render(number, size = 2)
    number = number.to_s
    raise(ArgumentError, "Size has to be > 0") unless size > 0
    raise(ArgumentError, "Invalid number") unless number[/\A[\d.-]+\Z/]

    result = number.scan(/./).map do |digit|
              digit(SPECIAL_DIGITS[digit] || digit, size)
            end.transpose.map do |line|
              line.join(" ")
            end.join("\n")

    puts result
    "Cheers :)"
  end

  private

    # method: line
    # @params:
    #   => digit: Integer
    #   => bit:   Integer
    #   => char:  String (Default: "|")
    # @return: String
    #
    def line(digit, bit, char = "|")
      (digit & 1 << bit).zero? ? " " : char
    end

    # method: horizontal
    # @params:
    #   => digit: Integer
    #   => size:  Integer
    #   => bit:   Integer
    # @return: String
    #
    def horizontal(digit, size, bit)
      [" " + line(digit, bit, "-") * size + " "]
    end

    # method: vertical
    # @params:
    #   => digit: Integer
    #   => size:  Integer
    #   => left_bit:   Integer
    #   => right_bit:   Integer
    # @return: String
    #
    def vertical(digit, size, left_bit, right_bit)
      [line(digit, left_bit) + " " * size + line(digit, right_bit)] * size
    end

    # method: digit
    # @params:
    #   => digit: Integer
    #   => size:  Integer
    # @return: String
    #
    def digit(digit, size)
      digit = DIGITS[digit.to_i]
      horizontal(digit, size, TOP) +
      vertical(digit, size, TOP_LEFT, TOP_RIGHT) +
      horizontal(digit, size, MIDDLE) +
      vertical(digit, size, BOTTOM_LEFT, BOTTOM_RIGHT) +
      horizontal(digit, size, BOTTOM)
    end
end
