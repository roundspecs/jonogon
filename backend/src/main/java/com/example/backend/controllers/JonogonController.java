package com.example.backend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.services.JonogonService;


@RestController
@RequestMapping("/jonogon")
public class JonogonController {
  @Autowired
  private JonogonService jonogonService;

  @PostMapping
  public ResponseEntity<Jonogon> save(@RequestBody Jonogon citizen) {
    return new ResponseEntity<>(jonogonService.save(citizen), HttpStatus.CREATED);
  }

  @GetMapping("/{id}")
  public ResponseEntity<Jonogon> findById(@PathVariable Long id) {
    return new ResponseEntity<>(jonogonService.findById(id), HttpStatus.OK);
  }

  @GetMapping("/all")
  public ResponseEntity<List<Jonogon>> findAll() {
    return new ResponseEntity<>(jonogonService.findAll(), HttpStatus.OK);
  }

  @GetMapping("/{jonogonId}/initiative/all")
  public ResponseEntity<List<Initiative>> findAllInitiativeEntity(@PathVariable Long jonogonId) {
    Jonogon jonogon = jonogonService.findById(jonogonId);
    return new ResponseEntity<List<Initiative>>(jonogon.getInitiatives(), HttpStatus.OK);
  }
}
