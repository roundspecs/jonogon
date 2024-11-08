package com.example.backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Jonogon;
import com.example.backend.repository.JonogonRepository;

import lombok.NonNull;

@Service
public class JonogonService {
    
    @Autowired
    private JonogonRepository jonogonRepository;

    public @NonNull Jonogon findById(Long jonogonId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }


    
}
