require 'find'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: create_index_files.rb [options]"

  opts.on("-d", "--directory DIRECTORY", "Directory to process") do |d|
    options[:directory] = d
  end
end.parse!

if options[:directory].nil?
  puts "Directory is required"
  exit 1
end

Find.find(options[:directory]) do |path|
  if File.directory?(path)
    index_path = File.join(path, 'index.html')
    unless File.exist?(index_path)
      puts "Creating index.html in #{path}"
      File.open(index_path, 'w') do |f|
        f.write("<html>\n")
        f.write("<head>\n")
        f.write("<title>Index of #{path}</title>\n")
        f.write("</head>\n")
        f.write("<body>\n")
        f.write("<h1>Index of #{path}</h1>\n")
        f.write("<ul>\n")
        Dir.children(path).sort.each do |child|
          child_path = File.join(path, child)
          if File.directory?(child_path)
            f.write("<li><a href=\"#{child}/index.html\">#{child}/</a></li>\n")
          else
            f.write("<li><a href=\"#{child}\">#{child}</a></li>\n")
          end
        end
        f.write("</ul>\n")
        f.write("</body>\n")
        f.write("</html>\n")
      end
    end
  end
end
