## import dependencies
from selenium import webdriver
import chromedriver_binary


chrome_options=webdriver.ChromeOptions()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("window-size=1400,2100") 
chrome_options.add_argument('--disable-gpu')

driver=webdriver.Chrome(chrome_options=chrome_options)
#############

#from selenium import webdriver
#from selenium.webdriver.support.select import Select

## create an object of the chrome webdriver
#driver = webdriver.Chrome(executable_path = r'./chromedriver')
## open selenium URL in chrome browser
driver.get('https://www.selenium.dev/')

## find element using xpath 
l = driver.find_element_by_xpath('//a[@href="/documentation/webdriver/"]')

## click button
driver.execute_script("arguments[0].click();", l);
## print resultant page title
print("Page title is: ")
print(driver.title)

## close browser window
driver.quit()