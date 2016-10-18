require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :parse_json do
  keywords = a
  for_yaml = keywords.map do |keyword_hash|
    {
      'keyword' => keyword_hash[0],
      'rank' => keyword_hash[1],
      'rules' => keyword_hash[2].map{|rule| {'decomp' => rule[0], 'reasmb' => rule[1].map{|str| str.gsub(/\s+\?/, '?')} }}
    }
  end
  puts for_yaml.to_yaml
end
