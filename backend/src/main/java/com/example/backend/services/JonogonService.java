package com.example.backend.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Jonogon;
import com.example.backend.repositories.JonogonRepository;

@Service
public class JonogonService {
  @Autowired
  private JonogonRepository citizenRepository;

  public Jonogon save(Jonogon citizen) {
    return citizenRepository.save(citizen);
  }

  public Jonogon findById(Long id) {
    return citizenRepository.findById(id).get();
  }

  public List<Jonogon> findAll() {
    return (List<Jonogon>) citizenRepository.findAll();
  }
}
