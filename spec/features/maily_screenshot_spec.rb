Capybara.app_host = 'http://0.0.0.0:3000'
Capybara.server_port = '3000'



describe "Visit ", type: :feature do
  before(:all) do
    page.driver.browser.manage.window.resize_to(1240, 1245)
  end
  describe "Maily dashboard" do
    it "will visit and take a screenshot" do
      visit "/maily_webui"
      page.execute_script("$('body').css('overflow','hidden')")
      save_screenshot
    end
  end
  describe "Maily lists" do
    it "will visit lists and take a screenshot" do
      visit "/maily_webui/lists"
      page.execute_script("$('body').css('overflow','hidden')")
      page.execute_script("$('.container').css('margin-top','140px')")
      save_screenshot
    end
  end
  describe "Maily ad hoc mailings" do
    it "will visit maily_webui/ad_hoc_mailings" do
      visit "/maily_webui/ad_hoc_mailings"
      page.execute_script("$('body').css('overflow','hidden')")
      page.execute_script("$('.container').css('margin-top','140px')")
      save_screenshot
    end
  end
  describe "Maily sequences" do
    it "will visit maily_webui/sequences/5" do
      visit "/maily_webui/sequences/5"
      page.execute_script("$('body').css('overflow','hidden')")
      save_screenshot
    end
  end
  describe "Maily log" do
    it "will visit maily_webui/logs/*/preview" do
      visit "/maily_webui"
      within find("#schedules") do
        first("a .fa-file-o", visible: false).hover
        first("a .fa-file-o").click
      end
      find("#modal-generic")
      save_screenshot
    end
  end
end
