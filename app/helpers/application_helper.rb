module ApplicationHelper


  def flash_class(level = :notice)
    style_klass = {
        notice: 'info-alert',
        success: 'info-alert',
        error: 'error-alert',
        alert: 'error-alert'
    }
    klass = style_klass[level.to_sym]
    klass.blank? ? 'info-alert' : klass
  end
end
