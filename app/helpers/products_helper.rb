# frozen_string_literal: true

module ProductsHelper
  def truncate_string(str, length = 10)
    if str.length > length
      "#{str[0, length]}..."
    else
      str
    end
  end
end
