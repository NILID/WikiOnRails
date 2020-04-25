module ApplicationHelper

  def plural(count, value, locale = I18n.locale)
    # custom pluralization
    if ['ru', :ru].include? locale
      # for russian pluralization
      val = "plural.#{value}"
      text = Russian.p(count, t("#{val}_1", locale: locale), t("#{val}_2", locale: locale), t("#{val}_10", locale: locale))
    else
      text = value.pluralize(count)
    end
    [count, text].join(' ')
  end
end
