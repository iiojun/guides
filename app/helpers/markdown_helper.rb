require 'rouge/plugins/redcarpet'

class CustomRenderHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module MarkdownHelper
  def markdown(text)
    options = {
      no_styles:     true,
      with_toc_data: true,
      hard_wrap:     true,
    }
    extensions = {
      no_intra_emphasis:   true,
      tables:              true,
      fenced_code_blocks:  true,
      autolink:            true,
      lax_spacing:         true,
      space_after_headers: true,
    }

    renderer = CustomRenderHTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
