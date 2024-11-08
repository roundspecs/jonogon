package com.example.backend.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Comment;
import com.example.backend.repositories.CommentRepository;



@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public Comment save(Comment comment) {
        return commentRepository.save(comment);
    }

    public Comment findById(Long id) {
        return commentRepository.findById(id).get();
    }

    public List<Comment> findAll() {
        return (List<Comment>) commentRepository.findAll();
    }

}
