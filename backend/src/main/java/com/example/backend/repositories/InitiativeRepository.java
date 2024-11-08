package com.example.backend.repositories;

import org.springframework.data.repository.CrudRepository;

import com.example.backend.entity.Initiative;


public interface InitiativeRepository extends CrudRepository<Initiative, Long> {
}
