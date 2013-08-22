Given /^the blog of multiple users is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
  User.create!({:login => 'non-admin',
                :password => 'aaaaaaaa',
                :email => 'joe@rain.com',
                :profile_id => 2,
                :name => 'non-admin',
                :state => 'active'})
end

And /^Article "(.*)" with id "(.*)" body "(.*)" exists$/ do |title, id , body|
  Article.create(:allow_comments => true,
                 :allow_pings => true,
                 :author => "non-admin",
                 :body => body,
                 :id => id,
                 :permalink => "hello",
                 :post_type => "read",
                 :published => true,
                 :published_at => "2012-08-20 21:51:55 UTC",
                 :settings => {"password"=>""},
                 :state => "published",
                 :text_filter_id => 5,
                 :title => title,
                 :type => "Article",
                 :user_id => 2)
end

And /^I am logged in as non-admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'non-admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end


Then /^I should see text "(.*)"$/ do |string|
  page.body.should =~ /.*#{string}.*/
end

