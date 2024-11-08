package com.example.backend.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.backend.entity.Initiative;

public interface InitiativeRepository extends CrudRepository<Initiative, Long> {
}
