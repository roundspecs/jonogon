package com.example.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Jonogon;
import com.example.backend.repository.JonogonRepository;


@Service
public class JonogonService {

    @Autowired
    private JonogonRepository jonogonRepository;

    public Jonogon findById(Long jonogonId) {
        return jonogonRepository.findById(jonogonId).get();
    }

}
