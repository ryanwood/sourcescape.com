module Helper
  # call-seq:
  #    breadcrumbs( page )    => html
  #
  # Create breadcrumb links for the current page. This will return an HTML
  # <ul></ul> object.
  #
  def breadcrumbs( page )
    list = ["<li>#{h(page.title)}</li>"]
    loop do
      page = @pages.parent_of(page)
      break if page.nil?
      list << "<li>#{link_to_page(page)}</li>"
    end
    list.reverse!

    html = "<ul class=\"breadcrumbs\">\n"
    html << list.join("\n")
    html << "\n</ul>\n"
    html
  end  
end  # module Helper

Webby::Helpers.register(Helper)

# EOF
