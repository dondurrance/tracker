module ApplicationHelper
    def item(name, data)
      output = "<div class='span-6 append-1'>
                <b>" << name << "</b><br />"
               
      output << "<div class='span-6 smallbox white'>" << data << '</div></div>'
      output.html_safe
    end 

    def page_title
        (@content_for_title + " - " if @content_for_title).to_s + 'Tracker'.html_safe
    end

    def page_heading(text)
        content_tag(:h1, content_for(:title){ text })
    end

end
