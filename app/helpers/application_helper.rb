module ApplicationHelper
  def display_errors_for(object)
    return unless object.errors.any?
    render partial: 'devise/shared/error_messages',
           locals: { object: object }
  end
end
