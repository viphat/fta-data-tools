class DataFile < ActiveRecord::Base
  def self.save(data_file)
    # name =  upload['datafile'].original_filename
    name = data_file.original_filename
    helper_obj = HelperService.new
    new_name = "#{helper_obj.generate_name}.zip"
    if File.extname(new_name) != ".zip"
      name = File.basename(new_name) + ".zip"
    end
    directory = "public/uploads"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(data_file.read) }
    path
  end
end