module PostsHelper

  def display_text(text)
    highlight_syntax(text).html_safe
  end

  private

  def highlight_syntax(text)
    text.gsub(/\[code=([a-z]+)\](.+?)\[\/code\]/im) do
      "<pre data-highlight=#{$1}>#{CGI.escapeHTML($2)}</pre>"
    end
  end

end
