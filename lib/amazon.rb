module Amazon
AMAZON_SEARCH_URL = "http://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=PRODUCT_SEARCH_TERM&rh=i%3Aaps%2Ck%3APRODUCT_SEARCH_TERM"

  def amazon_product_search(product)
    agent        = Mechanize.new
    product.gsub!(" ", "+")
    search_url   = (AMAZON_SEARCH_URL.dup).gsub("PRODUCT_SEARCH_TERM", product)
    html         = agent.get(search_url)
    product_page = html.search("div#result_0").css("a").first['href']
    product_page = agent.get(product_page)
    price        = amazon_retrieve_price(product_page)
    #reviews      = amazon_retrieve_reviews(html)
  end

  def amazon_retrieve_price(html)
    html.search("b.priceLarge").first.text.sub("$", "")
  end

  def amazon_retrieve_reviews(html)

  end
end


