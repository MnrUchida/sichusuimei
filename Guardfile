# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^config/data/(.+)\.yml$})                  { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^config/data/methods/(.+)\.yml$})          { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^config/data/methods/pillar_relation\.yml$}) { |m| "spec/models/meishiki_plr_spec.rb" }
  watch(%r{^lib/data/pillar_relation_data\.rb$})      { |m| "spec/models/meishiki_plr_spec.rb" }
  watch(%r{^lib/data/(.+)_data\.rb$})                 { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^lib/angle_value\.rb$})               { |m| "spec/models/junishi_spec.rb" }
end

