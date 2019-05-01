module ApplicationHelper

  def months_compact
    I18n.t("date.abbr_month_names").compact
  end

  def months_after_current
    months_compact.last(12-Date.today.month+1)
  end

  def months_before_current
    months_compact.first(Date.today.month-1)
  end

end
