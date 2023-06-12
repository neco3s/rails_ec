# frozen_string_literal: true

class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  def hidden_field(_attribute, _options = {})
    raise 'Happiness chainではhidden_fieldの使用を禁止しています'
  end
end
