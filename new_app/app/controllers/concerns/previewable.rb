module Previewable
  def thumbnail(attachment)
    file_name = File.basename(attachment.path)
    "/thumbs/#{file_name}"
  end
end