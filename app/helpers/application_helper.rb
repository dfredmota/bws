module ApplicationHelper
  def nome_sistema
    "BWS Mobile"
  end

  def sigla_sistema
    "BWS"
  end

  def link_to_show(url, html_options= {})
    html_options.reverse_merge!(class: 'btn btn-default btn-sm has-tooltip fa fa-info-circle', title: t('helpers.links.show'))
    link_to '', url, html_options
  end

  def link_to_delete(url, html_options= {})
    html_options.reverse_merge!(method: :delete, data: { confirm: I18n.t("helpers.links.confirm") }, class: 'btn btn-danger btn-sm fa fa-trash-o has-tooltip', title: 'Excluir')
    link_to '', url, html_options
  end

  def link_to_index(url, html_options= {})
    html_options.reverse_merge!(class: 'btn btn-default btn-sm has-tooltip', title: t('helpers.links.index'))
    link_to t('index', default: t('helpers.links.index'), default: 'Listar'), url, html_options
  end

  def link_to_edit(url, html_options= {})
    html_options.reverse_merge!(class: 'btn btn-default btn-sm has-tooltip fa fa-edit', title: t('helpers.links.edit'))
    link_to '', url, html_options
  end

  def link_to_new_with_name(url, html_options= {})
    html_options.reverse_merge!(class: 'btn btn-default btn-sm has-tooltip', title: t('helpers.links.new'))
    link_to t('helpers.links.new'), url, html_options
  end

  def link_to_new(url, html_options= {})
    html_options.reverse_merge!(class: 'btn btn-primary btn-sm btn-sm has-tooltip', title: t('helpers.links.new'))
    link_to content_tag(:i, nil, class: 'fa fa-plus'), url, html_options
  end
end
