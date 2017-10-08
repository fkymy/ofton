module ApplicationHelper
  def simple_nkf(str)
    str.tr("０-９Ａ-Ｚａ-ｚ　", "0-9A-Za-z ")
  end

  def hbr(target)
    target = html_escape(target)
    target.gsub(/\r\n|\r|\n/, "<br />")
  end

  def simple_truncate(str, length = 15)
    str.size > length ? str.to_s[0..length] : str
  end

  def is_active_path?(path)
    current_page?(path) ? "active" : ""
  end
end
