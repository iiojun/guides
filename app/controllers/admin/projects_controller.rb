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
    if @project.consent == nil || @project.consent == ""
      @project.consent = "This experiment is made using GUIDE, an emotional evaluation tool that allows the recording of emotional responses to the images.

By taking part in this experiment, metrics will be recorded and uploaded to GUIDE's servers: This includes your response choice during the experiment. No personal or identifying information will be gathered or stored. All participation in this experiment is anonymous. We are not able to identify individual participants.

You have the right to withdraw from the experiment at any time - simply close the browser containing this experiment. If you leave the experiment at any time before the end, this will be taken as a 'withdrawal' from the experiment, and your metrics data will be deleted."
    end
    if @project.consent2 == nil || @project.consent2 == ""
      @project.consent2 = "I have read and understood the above and hereby give my consent to take part in this experiment in full knowledge that my responses are being recorded."
    end
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
