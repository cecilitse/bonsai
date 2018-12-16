module ApplicationHelper
  def format_number(number)
    number_with_delimiter(number, delimiter: " ")
  end
end
