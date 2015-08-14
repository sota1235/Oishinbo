seeds_path = File.expand_path("../seeds", __FILE__)

Dir.glob(File.join(seeds_path, '*.rb')) do |file|
  load(file)
end
