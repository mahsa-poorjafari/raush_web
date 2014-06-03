#encoding: utf-8
namespace :db do
  

  desc "creates default users"
  task :create_default_users => :environment do
    User.create(name:"admin", password:"123qwe", email:"web.development@raush.ir") if User.where(name:"admin").blank?
    p "#{User.count} users created"
  end

end
