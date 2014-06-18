module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Paul Bonneville: Interactive Developer"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def markdown(text)
		options = {
			filter_html:         true,
			hard_wrap:           true,
			link_attributes:     { rel: 'nofollow', target: "_blank" },
			space_after_headers: true,
			fenced_code_blocks:  true
		}

		extensions = {
			autolink:                     true,
			superscript:                  true,
			disable_indented_code_blocks: true
		}

		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)

		markdown.render(text).html_safe
	end

	def is_active?(link_path)
		current_page?(link_path) ? 'active' : ''
	end

	def admin_title_listing(controller)
		"#{t(:listing)} #{capitalize_each_word(controller.controller_name)}"
	end

	def admin_title_editing(controller)
		"#{t(:editing)} #{capitalize_each_word(controller.controller_name.singularize)}"
	end

	def admin_title_reviewing(controller)
		"#{t(:reviewing)} #{capitalize_each_word(controller.controller_name.singularize)}"
	end

	def admin_label_new_entry(controller)
		"#{t(:new)} #{capitalize_each_word(controller.controller_name.singularize)}"
	end

	# Takes a snake-case controller name, replaces the underscores with spaces, and capitializes each word
	def capitalize_each_word(string)
		string.gsub(/[_]/, ' ').split.map(&:capitalize).join(' ')
	end

end
