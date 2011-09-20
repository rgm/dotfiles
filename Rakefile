def link_task(file_name)
  src = ".dotfiles/#{file_name}"
  dst = File.expand_path("~/.#{file_name}")
  desc "Relink .#{file_name}"
  task file_name.intern do
    if File.exists?(dst)
      File.symlink?(dst) ? File.unlink(dst) : raise(ScriptError,"#{dst} already exists")
    end
    ln_s(src,dst)
  end
end

ALL_TASKS = %w{ackrc gitconfig zshrc vimrc vimrc.local gvimrc.local rvmrc gemrc}
ALL_TASKS.each {|fn| link_task(fn) }

task :default => ALL_TASKS
