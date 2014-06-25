class PaginationLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer

	protected

	def page_number(page)
		unless page == current_page
			tag(:li, link(page, page))
		else
			tag(:li, link(page, '#'), :class => 'active')
		end
	end

	# def gap
	# 	text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
	# 	%(<li class="disabled"><a>#{text}</a></li>)
	# end


	def previous_or_next_page(page, text, classname)
		if page
			# tag(:li, link(text, page), :class => classname)
			tag(:li, link(text, page))
		else
			# tag(:li, text, :class => classname + ' disabled')
			tag(:li, link(text, '#'), :class => 'disabled')
		end
	end

	def previous_page
		num = @collection.current_page > 1 && @collection.current_page - 1
		previous_or_next_page(num, '<span class="glyphicon glyphicon-chevron-left" style="font-size: 12px"></span>', 'previous_page')
	end

	def next_page
		num = @collection.current_page < total_pages && @collection.current_page + 1
		previous_or_next_page(num, '<span class="glyphicon glyphicon-chevron-right" style="font-size: 12px"></span>', 'next_page')
	end

	def html_container(html)
		tag(:ul, html, container_attributes)
	end

	def default_url_params
		{}
	end

	def url(page)
		@base_url_params ||= begin
			url_params = merge_get_params(default_url_params)
			url_params[:only_path] = true
			merge_optional_params(url_params)
		end

		url_params = @base_url_params.dup
		add_current_page_param(url_params, page)

		@template.url_for(url_params)
	end

	def merge_get_params(url_params)
		if @template.respond_to? :request and @template.request and @template.request.get?
			symbolized_update(url_params, @template.params)
		end
		url_params
	end

	def merge_optional_params(url_params)
		symbolized_update(url_params, @options[:params]) if @options[:params]
		url_params
	end

	def add_current_page_param(url_params, page)
		unless param_name.index(/[^\w-]/)
			url_params[param_name.to_sym] = page
		else
			page_param = parse_query_parameters("#{param_name}=#{page}")
			symbolized_update(url_params, page_param)
		end
	end

end