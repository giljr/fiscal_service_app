class FiscalFilesController < ApplicationController
  def new
    # Display a form to upload the fiscal file
  end

  def create
    uploaded_file = params[:file]

    if uploaded_file
      # Save the uploaded file to a temporary location
      file_path = Rails.root.join('tmp', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      # Process the file using the service
      FileReaderService.new(file_path).call

      flash[:notice] = 'File processed successfully!'
      redirect_to new_fiscal_file_path
    else
      flash[:alert] = 'No file selected!'
      render :new
    end
  end
end
