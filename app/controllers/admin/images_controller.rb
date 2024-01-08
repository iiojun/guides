class Admin::ImagesController < ApplicationController
  require 'roo'

  def create
    p = image_params
    proj = Project.find(p[:pid])
    excelfile = p[:excelfile]

    if excelfile == nil
      if p[:url] == ''
        flash[:alert] = 'URL must be filled in.'
      else
        image = Image.create(url: p[:url])
        proj.images << image
        flash[:notice] = 'An image was successfuly added.'
      end
    else
      if excelfile.content_type == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        excel = Roo::Spreadsheet.open(excelfile.path, extension: :xlsx)
        excel.each_with_index do |row, index|
          url = row[0] # The image url must be described in the row[0].
          if url.present?
            image = Image.create(url: url)
            proj.images << image
          else
            flash[:alert] = "URL missing on row #{index + 2}. Image not added."
          end
        end
  
        flash[:notice] = 'Images were successfully added from Excel file.'
      else
        flash[:alert] = 'Invalid file format. Please upload an Excel file.'
      end
    end
  
    redirect_to edit_admin_project_path(proj)
  end

  def destroy
    image_id = params[:id]
    img = Image.find(image_id)
    proj = img.project
    img.destroy
    flash[:notice] = 'The image was deleted.'
    redirect_to edit_admin_project_path(proj)
  end

  private
  def image_params
    params.require(:image).permit(:url, :pid, :excelfile)
  end
end
