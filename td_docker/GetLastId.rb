require 'td'
require 'td-client'
require 'yaml'

puts "#{Time.now} GetLastId.rb start "

yml_file = '/in_tables.yml'
cln = TreasureData::Client.new(ENV['TD_APIKEY'],{:endpoint => "https://" + ENV['TD_ENDPOINT']})

if !File.exist?(yml_file)
  puts "#{Time.now} #{yml_file} is not found."
  exit 0
end
configs = YAML.load_file(yml_file)
configs.each do |config|
  config['td_database'] = ENV['TD_DATABASE']
  puts "#{Time.now} Search #{config['td_database']}.#{config['table_name']} in td. "
  table_exists = false
  cln.databases.each { |db|
    db.tables.each { |tbl|
      if tbl.db_name == config['td_database'] && tbl.table_name == config['table_name'] then
          table_exists = true
          break
      end
    }
  }
  if table_exists then
    query = "SELECT MAX(#{config['primary_key']}) FROM #{config['table_name']}"
    job = cln.query(config['td_database'], query, nil, nil, nil , {:type => :presto})
    until job.finished?
      sleep 2
      job.update_progress!
    end
    job.update_status!  # get latest info
    job.result_each { |row|
      puts "#{Time.now} #{config['td_database']}.#{config['table_name']}'s last_id is #{row.first} "
      config['last_id'] = row.first
    }
  else
    puts "#{Time.now} #{config['td_database']}.#{config['table_name']} is not found. "
    config['last_id'] = -1
  end
end

open(yml_file,"w") do |f|
  YAML.dump(configs,f)
end