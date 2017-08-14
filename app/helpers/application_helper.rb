module ApplicationHelper
  def simple_nkf(str)
    str.tr("０-９Ａ-Ｚａ-ｚ　", "0-9A-Za-z ")
  end

  def hbr(target)
    target = html_escape(target)
    target.gsub(/\r\n|\r|\n/, "<br />")
  end
end
