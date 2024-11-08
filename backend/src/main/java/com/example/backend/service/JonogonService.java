package com.example.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.repository.JonogonRepository;

@Service
public class JonogonService {

    @Autowired
    private JonogonRepository jonogonRepository;

    public Jonogon findById(Long jonogonId) {
        return jonogonRepository.findById(jonogonId).get();
    }

    public List<Jonogon> findAll() {
        return (List<Jonogon>) jonogonRepository.findAll();
    }

    public List<Initiative> initiativesTaken(Long jonogonId) {
        return jonogonRepository.findById(jonogonId).get().getInitiatives();
    }

    public List<Initiative> initiativesAppreciated(Long jonogonId) {
        return jonogonRepository.findById(jonogonId).get().getInitiatives();
    }

    public List<Initiative> initiativesIAmIn(Long jonogonId) {
        return jonogonRepository.findById(jonogonId).get().getInitiatives();
    }

    public Jonogon saveJonogon(Jonogon jonogon) {
        return jonogonRepository.save(jonogon);
    }

}
