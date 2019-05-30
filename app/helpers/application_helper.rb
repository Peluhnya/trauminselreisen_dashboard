module ApplicationHelper

  def months_compact
    I18n.t("date.month_names").compact
  end

  def months_after_current
    months_compact.last(12-Date.today.month+1)
  end

  def months_before_current
    months_compact.first(Date.today.month-1)
  end


  def abbr_months_compact
    I18n.t("date.abbr_month_names").compact
  end

  def abbr_months_after_current
    abbr_months_compact.last(12-Date.today.month+1)
  end

  def abbr_months_before_current
    abbr_months_compact.first(Date.today.month-1)
  end

  def price_form(n)
    if n>0
      number_to_currency(n, unit: "€", format: "%u%n")
    else
      '-'
    end
  end

end
