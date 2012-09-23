set :application, "samantha-cook.com"
set :repository,  "git@github.com:evx001/sam_cms.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "samantha-cook.com"                          # Your HTTP server, Apache/etc
role :app, "samantha-cook.com"                          # This may be the same as your `Web` server
role :db,  "samantha-cook.com", :primary => true # This is where Rails migrations will run
	
	set :user, 'samantha'
	set :use_sudo, false
	set :deploy_to, /.../www/"#{app location}"
	set :deploy_via, :remote_cache # this so it will only pull the changes from github


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
  namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => { :no_release => true } do
      run "touch #{File.join(current_path,'tmp','restart.txt')}"
    end 
  end