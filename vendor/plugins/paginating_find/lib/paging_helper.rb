module PaginatingFind
  module Helpers
    DEFAULT_OPTIONS = { :name => :page, :window_size => 2, 
      :always_show_anchors => true, :link_to_current_page => false, 
      :params => {} }

    def paginating_links(paginator, options = {}, html_options = {})
      name = options[:name] || DEFAULT_OPTIONS[:name]
      params = (options[:params] || DEFAULT_OPTIONS[:params]).clone


      paginating_links_each(paginator, options) do |n|
        params[name] = n
        link_to_remote(n, {:url => params, 
                           :update => 'page-content', 
                           :before => "Element.show('spinner')", 
                           :success => "Element.hide('spinner')"}, html_options)
      end
    end

    def paginating_links_each(paginator, options = {})
      options = DEFAULT_OPTIONS.merge(options)

      window = ((paginator.page - options[:window_size] + 1)..(paginator.page + options[:window_size] - 1)).select {|w| w >= paginator.first_page && w <= paginator.last_page }

      html = ''

      if options[:always_show_anchors] && !window.include?(paginator.first_page)
        html << yield(paginator.first_page)
        html << ' ... ' unless window.empty? || (window.first - 1 == paginator.first_page)
        html << ' '
      end

      window.each do |p|
        if paginator.page == p && !options[:link_to_current_page]
          html << p.to_s
        else
          html << yield(p).gsub(/PP/, p.to_s)
        end
        html << ' '
      end

      if options[:always_show_anchors] && !window.include?(paginator.last_page) && paginator.first_page != paginator.last_page
        html << ' ... ' unless window.empty? || (window.last + 1 == paginator.last_page)
        html << yield(paginator.last_page).gsub(/PP/, paginator.last_page.to_s)
      end

      html
    end
  end
end
