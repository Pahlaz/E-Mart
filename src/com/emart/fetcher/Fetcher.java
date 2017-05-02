package com.emart.fetcher;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.jsoup.*;
import org.jsoup.nodes.Document;

public class Fetcher {
	public int i=0;
	public String[] img_urls = new String[10];
	public String[] product_price = new String[10];
	public String[] product_name = new String[10];
	public String[] refer_original_website = new String[10];
	public Elements sr1, sr2, sr3, sr4, sr5, sr6;
	public Document search_result_display_doc, doc;

	public int snapdeal(String search_query){
		try{
			search_result_display_doc = Jsoup.connect("http://www.snapdeal.com/search?keyword="+search_query).timeout(0).get();

			// For fetching Image URLs
			sr1 = search_result_display_doc.select("div.product-tuple-image");
			
			sr2 = sr1.select("img.product-image");
			for(Element sr : sr2){
				img_urls[i]=sr.attr("src");
				i++;
				if(i==4)
					break;
			}

			// For fetching Product Names
			i = 0;
			sr3 = search_result_display_doc.select("div.product-tuple-description");
			sr4 = sr3.select("p.product-title");
			for(Element sr : sr4){
				if(sr.hasText()){
					product_name[i]=sr.text();
					i++;
				}
				if(i == 4)
					break;
			}

			// For fetching Original site URLs
			sr5 = search_result_display_doc.select("div[class=\"product-tuple-description\"]").select("a[href]");
			i = 0;
			for(Element sr : sr5){
				if(sr.hasText()){
					refer_original_website[i]=sr.attr("href");
					i++;
				}
				if(i == 4)
					break;
			}

			// For fetching Product Prices
			i = 0;
			sr1 = search_result_display_doc.select("div[class=\"product-tuple-description\"]");
			sr2 = sr1.select("div[class=\"productPrice\"]");
			sr3 = sr2.select("div[class=\"product-price-row\"]");
			sr4 = sr3.select("span[class=\"product-price\"]");          
			for(Element sr : sr4){
				if(sr.hasText()){
					product_price[i]=sr.text();
					i++;
				}
				if(i == 4)
					break;
			}
		}catch(Exception e){
			// Error
			return 1;
		}   
		return 0;
	}

	public int amazon(String search_query){
		try{
			search_result_display_doc = Jsoup.connect("http://www.amazon.in/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords="+search_query).timeout(0).get();

			// For fetching Image URLs
			sr1 = search_result_display_doc.select("li[class=\"s-result-item celwidget\"]");
			sr2 = sr1.select("a[class=\"a-link-normal a-text-normal\"]");
			sr3=sr2.select("img[src]");
			i=0;
			for(Element sr : sr3){
				img_urls[i]=sr.attr("src");
				i++;
				if(i==6)
					break;
			}

			// For fetching Product Names
			i = 0;					        
			// sr4 = sr2.select("a[class=\"a-link-normal s-access-detail-page  a-text-normal\"]");
			sr5 =sr1.select("h2[data-attribute]");
			for(Element sr : sr5){
				if(sr.hasText()){
					product_name[i]=sr.attr("data-attribute");
					i++;
				}
				if(i == 6)
					break;
			}

			// For fetching Original site URLs
			i = 0;
			sr3 = sr2.select("a[href]");
			for(Element sr : sr3){
				if(sr.hasText()){
					refer_original_website[i]=sr.attr("href");
					i++;
				}
				if(i == 6)
					break;
			}

			// For fetching Product Prices
			i = 0;
			sr5 = sr2.select("span[class=\"a-size-base a-color-price s-price a-text-bold\"]");
			for(Element sr : sr5){
				if(sr.hasText()){
					product_price[i]=sr.text();
					i++;
				}
				if(i == 6)
					break;
			}
		}catch(Exception e){
			// Error
			return 1;
		}   
		return 0;
	}

	public int flipkart(String search_query){
		try{
			doc = Jsoup.connect("http://www.flipkart.com/search?q="+search_query).timeout(0).get();
			sr1 = doc.select("div[class=\"pu-visual-section\"]").select("img[src]");

			if(!sr1.isEmpty() || !(sr1=doc.select("div[class=\"lu-image\"]").select("img[src]")).isEmpty()){
				i=0;
				for( Element src : sr1){
					img_urls[i]=src.attr("data-src");
					img_urls[i] = img_urls[i].replaceAll("125x125", "250x250");
					i++;
					if(i==8)
						break;
				}

				sr2=doc.select("a[class=\"pu-image fk-product-thumb\"]").select("a[href");
				i=0;
				for( Element src : sr2){
					refer_original_website[i]="http://flipkart.com"+src.attr("href");
					i++;
					if(i==6)
						break;
				}

				sr3=doc.select("a[class=\"fk-display-block\"]").select("a[title");
				i=0;
				for( Element src : sr3){
					product_name[i]=src.attr("title");
					i++;
					if(i==6)
						break;
				}

				sr4=doc.select("div[class=\"pu-price\"]").select("span[class*=fk-font-17 fk-bold]");
				i=0;
				for( Element src : sr4){
					product_price[i]=src.text();
					i++;
					if(i==6)
						break;
				}
			}
		}catch(Exception e){
			// Error
			return 1;
		}   
		return 0;
	}

	public void more(String search_query){
		
	}
}
