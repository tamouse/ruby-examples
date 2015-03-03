class Attachment < ActiveRecord::Base

  has_attached_file :attachment,
    styles: lambda do|a| 
      if a.instance.is_image? {
        {
          :small => "x200>", 
          :medium => "x300>", 
          :large => "x400>"
        }
      }
      else {
        {
          :thumb => {
            :geometry => "100x100#", 
            :format => 'jpg', 
            :time => 10
          }, 
          :medium => {
            :geometry => "300x300#", 
            :format => 'jpg', 
            :time => 10
          }
        }
      }
  :processors => lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
}

  def is_video?
    attachment.instance.attachment_content_type =~ %r(video)
  end

  def is_image?
    attachment.instance.attachment_content_type =~ %r(image)
  end

end
