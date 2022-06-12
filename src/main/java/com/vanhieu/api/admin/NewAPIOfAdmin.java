package com.vanhieu.api.admin;

import com.vanhieu.dto.NewsDTO;
import com.vanhieu.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "NewAPIOfAdmin")
public class NewAPIOfAdmin {

    @Autowired
    private INewsService newsService;

    @PostMapping("/api/new")
    public NewsDTO CreateNews(@RequestBody NewsDTO newsDTO) {
        return newsService.save(newsDTO);
    }

    @PutMapping("/api/new")
    public NewsDTO updateNews(@RequestBody NewsDTO newsDTO) {
        return newsService.save(newsDTO);
    }

    @DeleteMapping("/api/new")
    public void deleteNews(@RequestBody Long[] ids) {
        newsService.delete(ids);
    }
}
