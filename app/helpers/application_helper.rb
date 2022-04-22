module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def search(params, where_params = {}, class_type, default_order)
    sort =  params[:sort].present? ? (params[:sort]) : default_order
    order = params[:order].present? ? (params[:order]) : 'asc'
    limit = params[:limit].present? ? (params[:limit]) : 10
    offset = params[:offset].present? ? (params[:offset]) : 0
    search = params[:search].present? ? (params[:search]) : '*'
    class_type.constantize.search search, where: where_params, limit: limit, offset: offset, order: {"#{sort}": order}
  end

  def actions_for_table(actions, id)
    html_actions = '<span class="dropdown">'
    html_actions = html_actions + '<button class="dropdown-toggle btn btn-default btn-xs" data-target="#h'+id+'" data-toggle="collapse">'
    html_actions = html_actions + '<span class="glyphicon glyphicon-cog"></span>'
    html_actions = html_actions + '<span class="caret"></span>'
    html_actions = html_actions + '</button>'
    html_actions = html_actions + '<ul class="collapse coll-action dropdown-menu-right" id="h'+id+'">'

    actions.each do |action|
      html_actions = html_actions + '<li>' + action + '</li>'
    end
    html_actions = html_actions + '</ul>'
    html_actions = html_actions + '</span>'
    html_actions
  end

end
