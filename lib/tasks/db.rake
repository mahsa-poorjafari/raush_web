#encoding: utf-8
namespace :db do
  

  desc "creates default users"
  task :create_default_users => :environment do
    User.create(name:"admin", password:"123qwe", email:"web.development@raush.ir") if User.where(name:"admin").blank?
    p "#{User.count} users created"
  end
  
  
  desc "creates default services"
  task :create_default_services => :environment do
    Service.create(title_fa: "هوشمندسازی", title_en: "bms") if Service.where(title_en:"bms").blank?
    Service.create(title_fa: "طراحی وب", title_en: "web") if Service.where(title_en:"web").blank?
    Service.create(title_fa: "طراحی گرافیک", title_en: "graphic") if Service.where(title_en:"graphic").blank?
    Service.create(title_fa: "نصب دوربین", title_en: "camera") if Service.where(title_en:"camera").blank?
    Service.create(title_fa: "راه اندازی شبکه", title_en: "network") if Service.where(title_en:"network").blank?
    p "#{Service.count} services created"
  end
  
  desc "creates default subservices"
  task :create_default_subservices => :environment do
    @bms = Service.find_by(title_en: "bms")
    @network = Service.find_by(title_en: "network")
    Subservice.create(title_fa:"هتل هوشمند", title_en:"Smart Hotel", service_id: @bms.id) if Subservice.where(title_en:"Smart Hotel").blank?
    Subservice.create(title_fa:" خانه هوشمند", title_en:"Smart House", service_id: @bms.id) if Subservice.where(title_en:"Smart House").blank?
    Subservice.create(title_fa:" اداره هوشمند", title_en:"Smart Office", service_id: @bms.id) if Subservice.where(title_en:"Smart Office").blank?
    Subservice.create(title_fa: "شبکه محلی", title_en:"LAN", service_id: @network.id) if Subservice.where(title_en:"LAN").blank?
    Subservice.create(title_fa: "شبکه شهری", title_en:"WAN", service_id: @network.id) if Subservice.where(title_en:"WAN").blank?
    Subservice.create(title_fa: "VOIP", title_en:"VOIP", service_id: @network.id) if Subservice.where(title_en:"VOIP").blank?
    p "#{Subservice.count} Subservices created"
  end
  
  

end
