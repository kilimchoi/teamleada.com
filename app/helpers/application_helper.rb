module ApplicationHelper

  def active_li_link(name=nil, options={}, html_options={}, link_html_options={}, &block)
    html_options[:class] = "#{html_options[:class]} active" if current_page?(options)
    content_tag :li, html_options do
      link_to(name, options, link_html_options)
    end
  end

  def active_sidebar_link(name=nil, options={}, html_options={}, link_html_options={}, &block)
    html_options[:class] = "#{html_options[:class]} sidebar-active" if current_page?(options)
    content_tag :li, html_options do
      link_to(name, options, link_html_options)
    end
  end

  def active_or_completed_sidebar_link(name=nil, options={}, html_options={}, link_html_options={}, &block)
    html_options[:class] = "#{html_options[:class]} sidebar-active fa fa-arrow-circle-right" if current_page?(options)
    content_tag :li, html_options do
      link_to(name, options, link_html_options)
    end
  end

  def active_settings_link(name=nil, options={}, html_options={}, &block)
    html_options[:class] = "#{html_options[:class]} active" if current_page?(options)
    link_to(name, options, html_options)
  end

  def active_admin_link(name=nil, options={}, html_options={}, &block)
    html_options[:class] = "#{html_options[:class]} active" if current_page?(options)
    link_to(name, options, html_options)
  end

  def valid_settings_tab?(tab)
    User::SETTINGS_TABS.include? tab
  end

  def is_admin_namespace?
    params[:controller].split('/').first == 'admin'
  end

  def is_company_namespace?
    params[:controller].split('/').first == 'company'
  end

  def is_user_controller?
    params[:controller] == "users"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, page: nil), {:class => css_class}
  end

  def prompt_user
    rand(1..100) <= 20 && current_user.is_student?
  end

end
