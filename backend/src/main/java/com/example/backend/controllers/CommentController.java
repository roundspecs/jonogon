package com.example.backend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;



import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.backend.entity.Comment;
import com.example.backend.services.CommentService;
import com.example.backend.services.InitiativeService;
import com.example.backend.services.JonogonService;

@RestController
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    JonogonService jonogonService;

    @Autowired
    InitiativeService initiativeService;

    @PostMapping("/jonogon/{jonogonId}/initiative/{initiativeId}")
    public ResponseEntity<Comment> save(@RequestBody Comment comment, @PathVariable Long jonogonId,
            @PathVariable Long initiativeId) {
        comment.setJonogon(jonogonService.findById(jonogonId));
        comment.setInitiative(initiativeService.findById(initiativeId));
        return new ResponseEntity<>(commentService.save(comment), HttpStatus.CREATED);
    }

}
