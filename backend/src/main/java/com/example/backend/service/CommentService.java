package com.example.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.repository.CommentRepository;

@Service
public class CommentService {
    
    @Autowired

    private CommentRepository commentRepository;

}
