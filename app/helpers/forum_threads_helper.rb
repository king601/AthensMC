module ForumThreadsHelper
  def html_render(content)
    pipeline_context = { gfm: true }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter
    ], pipeline_context
    pipeline.call(content)[:output].to_s.html_safe
  end

  def forum_link_to(path, opts={}, &block)
    link_to path, class: ["list-group-item", "list-group-item-action", forum_link_class(path, opts)], &block
  end

  def forum_link_class(matches, opts={})
    case matches
    when Array
      "active" if matches.any?{ |m| request.path.starts_with?(m) }
    when String
      "active" if opts.fetch(:exact, false) ? request.path == matches : request.path.starts_with?(matches)
    end
  end
end
