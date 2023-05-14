# frozen_string_literal: true

module ApplicationHelper
  def hidden_field_tag(_name, _value = nil, _options = {})
    raise 'Hapiness chainではhidden_field_tagの使用を禁止しています'
  end
end
