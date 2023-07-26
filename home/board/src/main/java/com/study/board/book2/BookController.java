package com.study.board.book2;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.board.book.BookSearchQuery;
import com.study.board.book.BookSearchResult;

@Controller
public class BookController {

	private static final String BASE_URL = "http://www.aladdin.co.kr/ttb/api/ItemSearch.aspx?";

    public static String GetUrl(String searchWord) throws Exception {
		Map<String,String> hm = new HashMap<String,String>();
		hm.put("ttbkey", "ttbyejiniano1959001");
		hm.put("Query", URLEncoder.encode(searchWord, "UTF-8"));
		hm.put("QueryType", "Title");
		hm.put("MaxResults", "10");
		hm.put("start", "1");
		hm.put("SearchTarget", "Book");
		hm.put("output", "xml");

		StringBuffer sb = new StringBuffer();
		Iterator<String> iter = hm.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			String val  = hm.get(key);
			sb.append(key).append("=").append(val).append("&");
		}

		return BASE_URL + sb.toString();
	}  

    @GetMapping("/book/main")
    public String main()
    {
        return "/book/main";
    }

	@GetMapping("/book/result")
    public String result()
    {
        return "/book/result";
		
    }

    @PostMapping("/book/result")
    public String showResult(Model model, @RequestBody Item item) throws Exception
    {
        String url = GetUrl(item.getTitle());
		AladdinOpenAPIHandler api = new AladdinOpenAPIHandler();
		api.parseXml(url);
		model.addAttribute("items", api.Items);
		// for(Item item : api.Items){
		// 	System.out.println(item.Title + " : " + item.Link);
		// }
        return "/book/result";
    }
    
    
    
}
