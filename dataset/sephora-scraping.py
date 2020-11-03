import time
import re
import pandas as pd

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

chrome_path = '/Users/amy/Downloads/chromedriver'

def scrollDown(driver, n_scroll):
    body = driver.find_element_by_tag_name('body')
    while n_scroll >=0:
        body.send_keys(Keys.PAGE_DOWN)
        n_scroll -=1
    return driver

driver = webdriver.Chrome(executable_path = chrome_path)

url ='https://www.sephora.com'
driver.get(url)
time.sleep(5)

df = pd.DataFrame(columns=['Label', 'URL'])

tickers = ['face-wash-for-men','moisturizer-men','mens-grooming-kits-mens-shaving','mens-fragrance','eye-cream-men','deodorant-for-men-body-spray','mens-hair-products']

for ticker in tickers:
    url = 'https://www.sephora.com/shop/' + ticker + '?pageSize=300'
    driver.get(url)
   

    # xpath = '/html/body/div[5]/div/div/div[1]/div/div/button'
    # btn = driver.find_element_by_xpath(xpath)
    # btn.click()
    # time.sleep(20)

    browser = scrollDown(driver,20)
    time.sleep(10)
    browser = scrollDown(driver,20)
    time.sleep(10)
    browser = scrollDown(driver,20)
    time.sleep(10)
    browser = scrollDown(driver, 10)

    element = driver.find_elements_by_class_name('css-ix8km1')

    subpageURL =[]

    for a in element:
        subURL = a.get_attribute('href')
        subpageURL.append(subURL)

    dic = {'Label':ticker, 'URL': subpageURL}
    df =df.append(pd.DataFrame(dic), ignore_index = True)
   
df2 = pd.DataFrame(columns = ['brand_name','product_name','description','price','score','skin_type','ingredients','image_url'])
df = pd.concat([df, df2],axis =1)


for i in range(len(df)+1):
    url = df.URL[i]
    driver.get(url)
    time.sleep(5)

    #brand name
    xpath ='/html/body/div[1]/div[2]/div/main/div/div[1]/div/div[2]/div[1]/div[1]/h1/a/span'
    df.brand_name[i] = driver.find_element_by_xpath(xpath).text

    #price
    xpath1 ='/html/body/div[1]/div[2]/div/main/div/div[1]/div/div[2]/div[1]/div[2]/div[1]/span'
    df.price[i] = driver.find_element_by_xpath(xpath1).text
    
    # product name 
    xpath2 = '/html/body/div[1]/div[2]/div/main/div/div[1]/div/div[2]/div[1]/div[1]/h1/span'
    df.product_name[i] = driver.find_element_by_xpath(xpath2).text

    #image url 
    try:
        img = driver.find_element_by_class_name('css-1rovmyu')
        df.image_url[i] = img.get_attribute('src')
    except NoSuchElementException:
        df.image_url[i] = ' '
  
    # #skin type
    # xpath = '//*[@id="tabpanel0"]/div/b[2]'
    # skin_type = driver.find_element_by_xpath(xpath)

    #product description
    df.description[i] = driver.find_element_by_class_name('css-1rny024').text
    
    # ingredients
    xpath3 = '//*[@id="tab2"]'
    btn = driver.find_element_by_xpath(xpath3)
    btn.click()

    try:
        df.ingredients[i] = driver.find_element_by_xpath('//*[@id="tabpanel2"]/div').text
    except NoSuchElementException:
        df.ingredients[i] = "No Info"


    browser = scrollDown(driver,1)
    time.sleep(5)
    browser = scrollDown(driver,1)
    time.sleep(5)

    # score 

    try: 
        a = driver.find_element_by_class_name('css-1k3n1un').text
        score = re.match('\d.\d', a).group()
        df['score'][i] = str(score)
    
    except NoSuchElementException:
        df['score'][i] = 0
    

    df.to_csv('sephora_products.csv', encoding = 'utf-8')





