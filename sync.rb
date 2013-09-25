def syncFile(parent, file)
  require 'fileutils'
  local_path = (parent + "/" + file)[2..-1]
  target_path = "/home/#{ENV['USER']}/#{local_path}"
  puts "#{local_path} <> #{target_path}" unless FileUtils.compare_file(local_path, target_path)
end

def syncDir(parent, dir)
  new_parent = parent + "/" + dir
  local_list = Dir.entries(new_parent) - IGNORED
  syncList(new_parent, local_list)
end

def syncList(parent, list)
  list.each do |l|
    path = parent + "/" + l
    File.file?(path) ? syncFile(parent, l) : syncDir(parent, l)
  end
end

IGNORED = [ '.', '..', '.git', '.gitignore', '.gitconfig', 'sync.rb' , '.vim/bundle/bundle.list' ]
list = Dir.entries('.') - IGNORED
syncList('.', list)
