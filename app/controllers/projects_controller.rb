class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def intro
    @project = Project.find(params[:id])
  end

  def eval
    @project = Project.find(params[:id])
    @images = @project.images.sample(6)
  end

  def result
    @project = Project.find(params[:id])
    @icons = %w( icon-circle.png icon-rect.png icon-triangle0.png 
                 icon-rectRounded.png icon-rectRot.png icon-triangle1.png )
  end

  def average
    results = []
    for image in params[:img] do
      ave_x = Score.where(image: image, x: true).average(:value)
      ave_y = Score.where(image: image, x: false).average(:value)
      results.push({ x: ave_x, y: ave_y })
    end
    render json: results
  end
end
