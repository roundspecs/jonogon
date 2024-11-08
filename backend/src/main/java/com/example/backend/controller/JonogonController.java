package com.example.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.backend.entity.Jonogon;
import com.example.backend.service.JonogonService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/jonogon")
public class JonogonController {
    @Autowired
    private JonogonService jonogonService;

    // @Autowired
    // private InitiativeService initiativeService;

    @PostMapping
    public ResponseEntity<Jonogon> save(@RequestBody Jonogon jonogon) {
        return new ResponseEntity<>(jonogonService.save(jonogon), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jonogon> findById(@PathVariable Long id) {
        return new ResponseEntity<>(jonogonService.findById(id), HttpStatus.OK);
    }

    @GetMapping("/all")
    public ResponseEntity<List<Jonogon>> getAll() {
        return new ResponseEntity<>(jonogonService.findAll(), HttpStatus.OK);
    }

    // @GetMapping("{id}/initiativesTaken")
    // public ResponseEntity<List<Initiative>> initiativesTaken(@PathVariable Long
    // id) {
    // return new ResponseEntity<>(jonogonService.initiativesTaken(id),
    // HttpStatus.OK);// Complete this method
    // }

}
