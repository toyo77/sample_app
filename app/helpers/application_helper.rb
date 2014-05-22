module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    base_title = "seemore"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end