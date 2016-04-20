task :import_image => :environment do
  last_time = Time.new(2000,1,1,0,0,0,0)
  img = Image.last
  last_time = img.created_at if img

  Dir.glob(File.join(IMAGE_DIR,"*.png")) do |f|
    if File.ctime(f) > last_time
      next if Image.find_by(filename: f)
      img = Image.new(
        :filename => File.basename(f),
        :rate     => 0, 
        :bin      => File.read(f)
      ) 
      img.save
      p img
    end
  end
end
