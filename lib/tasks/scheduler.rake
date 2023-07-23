desc "This task is called by the Heroku scheduler add-on"
task :delete_cart_transaction => :environment do
  puts "Deleting cart transaction which passed 1 hour after created feed..."
  CartTransaction.where("created_at < ?", 1.minute.ago).destroy_all
  puts "done."
end