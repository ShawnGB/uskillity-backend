ActiveAdmin.register Participation do
  actions :all, except: [:new, :create, :edit, :destroy]

  member_action :cancel_p do
    participation = Participation.find(params[:id])
    participation.update(is_cancelled: true)
    redirect_to admin_participation_path(participation)
  end

  action_item(:cancel, :only => :show) do
    unless  participation.is_cancelled
      link_to("Cancel", cancel_p_admin_participation_path(id: participation.id))
    end
  end

  index do
    selectable_column
    column :id
    column :workshop
    column :user
    column :is_cancelled
    actions
  end

end
