package com.example.backend.services;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.repositories.InitiativeRepository;

import jakarta.transaction.Transactional;



@Service
public class InitiativeService {

    @Autowired
    private InitiativeRepository initiativeRepository;

    public Initiative save(Initiative initiative) {
        return initiativeRepository.save(initiative);
    }

    public List<Initiative> findAll() {
        return (List<Initiative>) initiativeRepository.findAll();
    }

    public Initiative findById(Long id) {
        return initiativeRepository.findById(id).orElse(null);
    }

}
