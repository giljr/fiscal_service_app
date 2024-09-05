# app/services/file_reader_service.rb
require 'csv'

class FileReaderService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    process_file
  end

  private

  def process_file
    CSV.foreach(@file_path, headers: true) do |row|
      # Assuming CSV has columns: number, date, total
      Invoice.create!(
        number: row['number'],
        date: Date.parse(row['date']),
        total: row['total'].to_f
      )
    end
  rescue StandardError => e
    Rails.logger.error "Error processing file: #{e.message}"
    # Handle error as needed
  ensure
    # Clean up the file if needed
    File.delete(@file_path) if File.exist?(@file_path)
  end
end
