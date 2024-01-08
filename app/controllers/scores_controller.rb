class ScoresController < ApplicationController
  def create
    p = score_params
    for i in 0..5 do
      image = Image.find(p["i#{i}"])
      sx = Score.create(value: p["x#{i}"].to_f, x: true)
      sy = Score.create(value: p["y#{i}"].to_f, x: false)
      image.scores << sx
      image.scores << sy
      proj = image.project
    end
      
    redirect_to result_project_path(proj)
  end

  private
  def score_params
    params.require(:score).permit(:i0, :i1, :i2, :i3, :i4, :i5,
                                  :x0, :x1, :x2, :x3, :x4, :x5,
                                  :y0, :y1, :y2, :y3, :y4, :y5)
  end
end
