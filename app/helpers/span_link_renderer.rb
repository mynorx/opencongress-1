class SpanLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer
  
  protected
    def page_number(page)
      unless page == current_page
        link(page, page, :rel => rel_value(page))
      else
        tag(:em, tag(:span, page))
      end
    end


    def previous_or_next_page(page, text, classname)
      if page
        link(text, page, :class => classname)
      else
        tag(:span, tag(:span, text), :class => classname + ' disabled')
      end
    end
          
          
          
  private
    def link(text, target, attributes = {})
      if target.is_a? Fixnum
        attributes[:rel] = rel_value(target)
        target = url(target)
      end
      attributes[:href] = target
      tag(:a, "<span>#{text}</span>".html_safe, attributes)
    end                                            
end