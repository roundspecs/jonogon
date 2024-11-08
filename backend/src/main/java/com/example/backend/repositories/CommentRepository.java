package com.example.backend.repositories;

import org.springframework.data.repository.CrudRepository;

import com.example.backend.entity.Comment;


public interface CommentRepository extends CrudRepository<Comment, Long> {
}
