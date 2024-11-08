package com.example.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.service.InitiativeService;
import com.example.backend.service.JonogonService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/jonogon")
public class JonogonController {
    @Autowired
    private JonogonService jonogonService;

    @PostMapping
    public ResponseEntity<Jonogon> save(@RequestBody Jonogon jonogon) {
        return new ResponseEntity<>(jonogonService.saveJonogon(jonogon), HttpStatus.CREATED);
    }

    // @GetMapping("/search/{query}")
    // public ResponseEntity<List<Jonogon>> searchJonogons(@PathVariable String
    // query) {
    // return new ResponseEntity<>(jonogonService.searchJonogons(query),
    // HttpStatus.OK);
    // }

    @GetMapping("/all")
    public ResponseEntity<List<Jonogon>> getAll() {
        return new ResponseEntity<>(jonogonService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jonogon> findById(@PathVariable Long id) {
        return new ResponseEntity<>(jonogonService.findById(id), HttpStatus.OK);
    }

    @GetMapping("/{id}/initiativesTaken")
    public ResponseEntity<List<Initiative>> initiativesTaken(@PathVariable Long id) {
        return new ResponseEntity<List<Initiative>>(jonogonService.initiativesTaken(id), HttpStatus.OK);
    }

    @GetMapping("{id}/initiativesAppreciated")
    public ResponseEntity<List<Initiative>> initiativesAppreciated(@PathVariable Long id) {
        return new ResponseEntity<List<Initiative>>(jonogonService.initiativesAppreciated(id), HttpStatus.OK);
    }

    @GetMapping("{id}/initiativesIAmIn")
    public ResponseEntity<List<Initiative>> initiativesIAmIn(@PathVariable Long id) {
        return new ResponseEntity<List<Initiative>>(jonogonService.initiativesIAmIn(id), HttpStatus.OK);
    }

}
