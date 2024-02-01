class Admin::ProjectsController < Admin::ApplicationController
  def new
  end

  def create
    p = project_params
    if p[:name] == '' || p[:description] == '' || p[:consent] == ''|| p[:consent2] == '' || p[:x_axis] == '' || p[:y_axis]== ''
      flash[:alert] = 'Every item must be filled in.'
    else
      proj = Project.create(p)
      current_user.projects << proj
      flash[:notice] = 'A project was successfuly added.'
    end
    redirect_to admin_user_path(current_user)
  end

  def edit
    @project = Project.find(params[:id])
    @images = @project.images
  end

  def update
    p = project_params
    if p[:name] == '' || p[:description] == '' || p[:consent] == ''|| p[:consent2] == '' || p[:x_axis] == '' || p[:y_axis]== ''
      flash[:alert] = 'Every item must be filled in.'
    else
      proj = Project.find(params[:id])
      proj.update(p)
      flash[:notice] = 'The project was successfuly updated.'
    end
    redirect_to admin_user_path(current_user)
  end

  def destroy
    project = Project.find(params[:id])
    project.images.destroy_all
    project.destroy
    flash[:notice] = 'The project was deleted.'
    redirect_to admin_user_path(current_user)
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :consent, :consent2, :x_axis, :y_axis)
  end
end
