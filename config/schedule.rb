set :output, "log/cron.log"
set :environment, "development"
set :job_template, "/bin/bash -l -c ':job'"

every 1.minute do
  rake "my_namespace:print_message"
end
